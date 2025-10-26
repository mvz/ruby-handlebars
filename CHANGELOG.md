# Changelog

This is the changelog for mvz-ruby-handlebars

## 0.0.13 (2024-10-26)

* Support Ruby 3.2 through 3.4, dropping support for Ruby 3.0 and 3.1
  ([#40] and [#43] by [mvz])
* Remove large dynamic object constants `Handlebars::Handlebars::PARSER` and
  `Handlebars::Handlebars::TRANSFORM` ([#42] by [mvz])

[#40]: https://github.com/mvz/ruby-handlebars/pull/40
[#42]: https://github.com/mvz/ruby-handlebars/pull/42
[#43]: https://github.com/mvz/ruby-handlebars/pull/43

## 0.0.12 (2024-05-18)

* Support Ruby 3.0 through 3.3, dropping support for 2.6 and 2.7
  ([#25] and [#30] by [mvz])
* Pull in upstream master. See below for the included changes ([#32] by [mvz])
* Handle single open-close curly pair ([#34] by [mvz])
* Speed up template content detection ([#35] by [mvz])
* Speed up opening and closing curly recognition ([#36] by [mvz])

[mvz]: https://github.com/mvz
[#25]: https://github.com/mvz/ruby-handlebars/pull/25
[#30]: https://github.com/mvz/ruby-handlebars/pull/30
[#32]: https://github.com/mvz/ruby-handlebars/pull/32
[#34]: https://github.com/mvz/ruby-handlebars/pull/34
[#35]: https://github.com/mvz/ruby-handlebars/pull/35
[#36]: https://github.com/mvz/ruby-handlebars/pull/36

### [ruby-handlebars 0.4.1] (2022/06/01)

 - bump dependencies
 - move CI to GitHub actions

The remaining changes from this release were already included in mvz-ruby-handlebars 0.0.10

## 0.0.11 (2022-01-21)

* Drop support for Ruby 2.4 and 2.5
* Add support for Ruby 3.1

## 0.0.10 (2021-08-31)

* Pull in upstream master. See below for included changes
* Make helpers with only optional arguments work in replacement form

### from ruby-handlebars, released in [ruby-handlebars 0.4.1]

 - use separate context for each template evaluation ([#33](https://github.com/SmartBear/ruby-handlebars/pull/33) [@mvz])
 - added `with`helper ([#28](https://github.com/SmartBear/ruby-handlebars/pull/28) [@creature])
 - Faster parsing ([#26](https://github.com/SmartBear/ruby-handlebars/pull/26) - [@mvz])

[ruby-handlebars 0.4.1]: https://github.com/smartbear/ruby-handlebars/compare/v0.4.0...v0.4.1

## 0.0.9 (2021-01-04)

* Pull in upstream master. See below for included changes
* Prefer variable over helper when processing a replacement if the helper has
  the wrong arity

### [ruby-handlebars 0.4.0] (2019/10/22)

 - Allow slash character in partial names ([#18](https://github.com/SmartBear/ruby-handlebars/pull/18) - [@d316])
 - Add parameters for partials ([#19](https://github.com/SmartBear/ruby-handlebars/pull/19) [#20](https://github.com/SmartBear/ruby-handlebars/pull/20) - [@d316])

### [ruby-handlebars 0.3.0] (2019/10/11)

 - Support helpers with "as" notation (`{{each items as |item|}}`)

### [ruby-handlebars 0.2.1] (2019/8/30)

 - allow "else" word as being part of a path (eg: {{ my.something.else }} is okay)

### [ruby-handlebars 0.2.0] (2019/8/30)

 - allow dash in identifiers ([#15](https://github.com/SmartBear/ruby-handlebars/pull/15) - [@stewartmckee])
 - add "unless" helper
 - add "helperMissing" helper, called when a helper is missing
 - "else" keyword is now handled by the parser directly

### [ruby-handlebars 0.1.1] (2019/6/26)

 - with_temporary_context returns the result produced by the block

### [ruby-handlebars 0.1.0] (2019/6/26)

 - add 'with_temporary_context' in context to define temporary variables
 - enable @index, @first and @last variables in "each" helper ([#10](https://github.com/SmartBear/ruby-handlebars/pull/10) - [@schuetzm])
 - allow specifying escaper when using double curly braces
 - allow using helper calls as arguments ([#11](https://github.com/SmartBear/ruby-handlebars/pull/11) - [@schuetzm])
 - escape trice-braces replacements ([#9](https://github.com/SmartBear/ruby-handlebars/pull/9) - [@schuetzm])
 - allow non-hash data ([#8](https://github.com/SmartBear/ruby-handlebars/pull/8) - [@mvz])
 - allow single curly braces in content ([#7](https://github.com/SmartBear/ruby-handlebars/pull/7) - [@mvz])
 - allow empty literal string arguments ([pr6]https://github.com/SmartBear/ruby-handlebars/pull/6) - [@mvz])

<!-- Contributors lists -->
[@stewartmckee]:  https://github.com/stewartmckee
[@schuetzm]:      https://github.com/schuetzm
[@mvz]:           https://github.com/mvz
[@d316]:          https://github.com/d316
[@creature]:      https://github.com/creature

<!-- Releases diffs -->
[ruby-handlebars 0.4.0]: https://github.com/smartbear/ruby-handlebars/compare/v0.3.0...v0.4.0
[ruby-handlebars 0.3.0]: https://github.com/smartbear/ruby-handlebars/compare/v0.2.1...v0.3.0
[ruby-handlebars 0.2.1]: https://github.com/smartbear/ruby-handlebars/compare/v0.2.0...v0.2.1
[ruby-handlebars 0.2.0]: https://github.com/smartbear/ruby-handlebars/compare/v0.1.1...v0.2.0
[ruby-handlebars 0.1.1]: https://github.com/smartbear/ruby-handlebars/compare/v0.1.0...v0.1.1
[ruby-handlebars 0.1.0]: https://github.com/smartbear/ruby-handlebars/compare/v0.0.6...v0.1.0

## 0.0.8 (2020-11-27)

* Update dependencies

## 0.0.7 (2019-05-13)

* Set up forked gem mvz-ruby-handlebars
* Several improvements
