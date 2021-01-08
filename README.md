# Как читать писать и преобразовывать юникод

Необходимые условия работы с юникодом в perl.

Проверено под win7x64sp1 на Strawberry Perl 5.32.0.0.

В общем-то, всё есть в разделах **perluni\***. Большую часть информации
можно найти в разделе [perlunicode](https://perldoc.perl.org/perlunicode).
Но, чтобы как-то упорядочить свои представления о юникоде, мне пришлось
потратить несколько часов на вдумчивое чтение раздела
[perluniintro](https://perldoc.perl.org/perluniintro).

## Модуль utf8

`use [utf8](https://perldoc.perl.org/utf8);`

Способ сказать перлу, что исходный файл программы имеет формат UTF-8.

## Feature unicode\_strings

`use feature '[unicode_strings](https://perldoc.perl.org/feature#The-&#x27;unicode_strings&#x27;-feature)';`

Это рекомендованная опция для всех операций с юникодом.

## Ввод/вывод

`open my $in, '<:utf8', 'test.txt';`

Но для операций записи надёжнее использовать `:encoding(UTF-8)`. См.
[perlunifaq](https://perldoc.perl.org/perlunifaq#What-is-the-difference-between-:encoding-and-:utf8?)

Чтобы избежать сообщений "[wide character](https://perldoc.perl.org/perlunifaq#What-is-a-%22wide-character%22?)"
`binmode STDOUT, ":encoding(UTF-8)";`. В нашем случае — `:encoding(CP866)`.
