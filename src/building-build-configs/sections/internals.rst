.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

Build Configs internals

.. raw:: pdf

   PageBreak standardPage

.. code-block::

   src/
       Action/
           CreateFinalConfigurationData.php
           CreateListOfFilesToGenerate.php
           GenerateConfigurationFiles.php
           ValidateConfigurationData.php
       Command/
           GenerateCommand.php
           InitCommand.php
       DataTransferObject/
           ConfigDto.php
           TemplateFile.php
       Enum/
           Language.php
           ProjectType.php
           WebServer.php

.. code-block:: php
   :linenos:
   :startinline: true

   protected function configure(): void
       $this
           ->addOption(
               name: 'config-file',
               shortcut: ['c'],
               mode: InputOption::VALUE_REQUIRED,
               description: 'The path to the project\'s build.yaml file',
               default: 'build.yaml',
           )
           ->addOption(
               name: 'output-dir',
               shortcut: ['o'],
               mode: InputOption::VALUE_REQUIRED,
               description: 'The directory to create files in',
               default: '.',
           );
   }

.. code-block:: php
   :linenos:
   :startinline: true

   protected function execute(InputInterface $input, OutputInterface $output): int
   {
      $io = new SymfonyStyle($input, $output);

      $configFile = $input->getOption(name: 'config-file');
      $outputDir = $input->getOption(name: 'output-dir');
   }

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:
   :startinline: true

   protected function execute(InputInterface $input, OutputInterface $output): int
   {
      // ...

      $pipelines = [
          new CreateFinalConfigurationData(),
 
          new ValidateConfigurationData(),
 
          new CreateListOfFilesToGenerate(),
 
          new GenerateConfigurationFiles(
              $this->filesystem,
              $this->twig,
              $outputDir,
          ),
      ];
    }

.. code-block:: php
   :linenos:
   :startinline: true

   protected function execute(InputInterface $input, OutputInterface $output): int
   {
       // ...

       /**
        * @var Collection<int,TemplateFile> $generatedFiles
        * @var ConfigDto $configurationData
        */
       [$configurationData, $generatedFiles] = (new Pipeline())
           ->send($configFile)
           ->through($pipelines)
           ->thenReturn();

       $io->info("Building configuration for {$configurationData->name}.");

       $io->write('Generated files:');
       $io->listing(static::getListOfFiles(filesToGenerate: $generatedFiles)->toArray());

       return Command::SUCCESS;
   }

.. code-block:: php
   :linenos:
   :startinline: true

   // CreateFinalConfigurationData.php

   public function handle(string $configFile, \Closure $next) {
   {
       $configurationData = Yaml::parseFile(filename: $configFile);

       $configurationData = array_replace_recursive(
           Yaml::parseFile(filename: __DIR__ . '/../../resources/build.defaults.yaml'),
           $configurationData,
       );

       // ...

       return $next($configurationData);
   }

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:
   :startinline: true

   // ValidateConfigurationData.php

   public function handle(array $configurationData, \Closure $next)
   {
       // Convert the input to a configuration data object.
       $normalizer = new ObjectNormalizer(null, new CamelCaseToSnakeCaseNameConverter());
       $serializer = new Serializer([$normalizer], [new JsonEncoder()]);

       $configurationDataDto = $serializer->deserialize(
           json_encode($configurationData),
           ConfigDto::class,
           'json',
       );

       // ...
   }

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:
   :startinline: true

   // ValidateConfigurationData.php

   public function handle(array $configurationData, \Closure $next)
   {
       // ...

       $validator = Validation::createValidatorBuilder()
           ->enableAnnotationMapping()
           ->getValidator();
       $violations = $validator->validate($configurationDataDto);

       if (0 < $violations->count()) {
           throw new \RuntimeException('Configuration is invalid.');
       }

       return $next([$configurationData, $configurationDataDto]);
   }

.. code-block:: php
   :linenos:
   :startinline: true

   // ConfigDto.php

   #[Assert\Collection(
        allowExtraFields: false,
        fields: ['docroot' => new Assert\Choice([null, 'web', 'docroot'])],
    )]
    public array $drupal;

    #[Assert\Collection([
        'ignore' => new Assert\Optional([
            new Assert\All([
                new Assert\Type('string'),
            ]),
        ]),
    ])]
    public array $git;

    #[Assert\Choice(choices: ['javascript', 'php', 'typescript'])]
    public string $language;

    #[Assert\NotBlank]
    #[Assert\Type('string')]
    public string $name;

    #[Assert\Type('string')]
    public string $projectRoot;

    #[Assert\Choice(choices: [
        'drupal',
        'fractal',
        'php-library',
        'symfony',
   ])]
   public string $type;

.. code-block:: php
   :startinline: true
   :linenos:

   // CreateListOfFilesToGenerate.php

   public function handle(array $configurationDataAndDto, \Closure $next)
   {
       /**
         * @var ConfigDto $configDto,
         * @var array<string,mixed> $configurationData
         */
        [$configurationData, $configDto] = $configurationDataAndDto;

        /** @var Collection<int, TemplateFile> */
        $filesToGenerate = collect();

        // ...
   }

.. code-block:: php
   :startinline: true
   :linenos:

   // CreateListOfFilesToGenerate.php

   public function handle(array $configurationDataAndDto, \Closure $next)
   {
       // ...

       if (!isset($configDto->php['phpunit']) || $configDto->php['phpunit'] !== false) {

           $filesToGenerate->push(
               new TemplateFile(
                   data: 'drupal/phpunit.xml.dist',
                   name: 'phpunit.xml.dist',
               )
           );
       }

       // ...

       return $next([$configurationData, $configDto, $filesToGenerate]);
   }

.. code-block:: php
   :linenos:
   :startinline: true

   // GenerateConfigurationFiles.php

   public function handle(array $filesToGenerateAndConfigurationData, \Closure $next)
   {
       // ...

       $filesToGenerate->each(function(TemplateFile $templateFile) use ($configurationData): void {
           if ($templateFile->path !== null) {
               if (!$this->filesystem->exists($templateFile->path)) {
                   $this->filesystem->mkdir("{$this->outputDir}/{$templateFile->path}");
               }
           }

           $sourceFile = "{$templateFile->data}.twig";

           $outputFile = collect([$this->outputDir, $templateFile->path, $templateFile->name])
               ->filter()->implode('/');

           $this->filesystem->dumpFile($outputFile, $this->twig->render($sourceFile, $configurationData));
       });

       return $next([$configurationDataDto, $filesToGenerate]);
   }

