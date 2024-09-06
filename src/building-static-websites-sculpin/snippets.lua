local fmt = require("luasnip.extras.fmt").fmt
local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node

ls.add_snippets("twig", {
  s(
    "sortdate",
    fmt(
      [[
      {{% set speakersAndDates = [] %}}

      {{% for speaker in speakers %}}
        {{% set talksForSpeaker = talks|default([])|filter(talk =>> talk.speaker == speaker.name) %}}

        {{% set mostRecentTalk = talksForSpeaker|first %}}

        {{% set speakersAndDates = speakersAndDates|merge([{{
          date: mostRecentTalk.date,
          speaker,
        }}]) %}}
      {{% endfor %}}

      {{% set sortedSpeakers = speakersAndDates|sort((a, b) => b.date <=> a.date) %}}

      {{% for speaker in sortedSpeakers|column('speaker') %}}
      ]],
      {}
    )
  ),

  s("sortname", { t "{% for speaker in site.speakers|sort((a, b) => a.name <=> b.name) %}" }),

  s(
    "speakerpage",
    fmt(
      [[
      {{% block content_wrapper %}}
        <h1 class="text-3xl font-bold text-center md:text-left">{{{{ page.name }}}}</h1>

        <div class="mt-6">
          <img
            alt="Photo of {{{{ page.name }}}}"
            class="object-cover flex-shrink-0 rounded-full shadow-lg size-40"
            src="{{{{ page.imageUrl }}}}"
          />
        </div>

        <div class="mt-10">
          <em>{{{{ block('content') }}}}</em>
        </div>
      {{% endblock %}}
      ]],
      {}
    )
  ),

  s(
    "speaker",
    fmt(
      [[
        <div>
          <a href="#" class="flex flex-col-reverse gap-3 items-center group">
            <div class="text-center">
              <p class="text-base group-hover:underline">{{{{ speaker.name }}}}</p>
            </div>

            <div>
              <img
                alt="Photo of {{{{ speaker.name }}}}"
                class="object-cover flex-shrink-0 rounded-full shadow-lg size-20 lg:size-32 xl:size-24"
                src="{{{{ speaker.imageUrl }}}}" /> </div>
          </a>
        </div>
      ]],
      {}
    )
  ),

  s(
    "speakers",
    fmt(
      [[
      <section>
        <h2 class="text-3xl font-bold text-center">Speakers</h2>

        <div class="mt-8">
          <div class="grid grid-cols-2 gap-10 px-4 mx-auto max-w-sm md:grid-cols-3 md:max-w-md lg:grid-cols-4 lg:gap-8 lg:max-w-full xl:grid-cols-6">
            {{% for speaker in site.speakers %}}

            {{% endfor %}}
          </div>
        </div>
      </section>
      ]],
      {}
    )
  ),
})

ls.add_snippets("yaml", {
  s(
    "talks",
    fmt(
      [[
      talks:
        - title: Building Static Websites with PHP and Sculpin
          speaker: Oliver Davies
          date: 2024-02-14
        - title: 'FPGA^2: An open-source FPGA'
          speaker: Robin Hodson
          date: 2024-02-14
        - title: Introducing Domain Driven Design
          speaker: Rob Allen
          date: 2024-01-10
        - title: Building Better TUIs (with PHP)
          speaker: Dan Leech
          date: 2023-11-08
        - title: Thoughts on Ubiquitous Language
          speaker: Rob Allen
          date: 2023-11-08
        - title: Testing Legacy
          speaker: Mike Karthauser
          date: 2023-11-08
        - title: Building "Build Configs"
          speaker: Oliver Davies
          date: 2023-11-08
        - title: Terraform from a dev’s perspective
          speaker: Nigel Dunn
          date: 2023-10-11
        - title: What is TDD and why should I care?
          speaker: Naomi Gotts
          date: 2023-07-12
        - title: Go for PHP
          speaker: Dan Leech
          date: 2023-02-08
        - title: What's new in PHP 8.*
          speaker: Derick Rethans
          date: 2023-02-11
        - title: Behaviour Driven Development (BDD) in Practice
          speaker: Ciaran McNulty
          date: 2022-09-14
      ]],
      {}
    )
  ),
})
