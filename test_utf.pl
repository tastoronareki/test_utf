#!perl
use strict;
use warnings;
use autodie;

=encoding utf8

=for comment Чтобы создать README.md для github, выполните следующую команду:
perl -MPod::Markdown::Github -e "Pod::Markdown::Github->filter('test_utf.pl')" > README.md


=head1 Как читать писать и преобразовывать юникод

Необходимые условия работы с юникодом в perl.

Проверено под win7x64sp1 на Strawberry Perl 5.32.0.0.

В общем-то, всё есть в разделах B<perluni*>. Большую часть информации
можно найти в разделе L<perlunicode|https://perldoc.perl.org/perlunicode>.
Но, чтобы как-то упорядочить свои представления о юникоде, мне пришлось
потратить несколько часов на вдумчивое чтение раздела
L<perluniintro|https://perldoc.perl.org/perluniintro>.


=head2 Модуль utf8

C<use utf8;>

См. L<utf8|https://perldoc.perl.org/utf8>.

Способ сказать перлу, что исходный файл программы имеет формат UTF-8.

=head2 Feature unicode_strings

C<use feature 'unicode_strings';>

См. L<unicode_strings|https://perldoc.perl.org/feature#The-'unicode_strings'-feature>


Это рекомендованная опция для всех операций с юникодом.

=head2 Ввод/вывод

C<open my $in, '<:utf8', 'test.txt';>

Но для операций записи надёжнее использовать C<:encoding(UTF-8)>. См.
L<perlunifaq|https://perldoc.perl.org/perlunifaq#What-is-the-difference-between-:encoding-and-:utf8?>


Чтобы избежать сообщений "L<wide character|https://perldoc.perl.org/perlunifaq#What-is-a-%22wide-character%22?>"
C<binmode STDOUT, ":encoding(UTF-8)";>. В нашем случае E<mdash> C<:encoding(CP866)>.

=cut

#use feature 'unicode_strings';
use utf8;
binmode STDOUT, ":encoding(CP866)";
my $ln = 0;
unless (-e 'test.txt') {
	open my $in, '>:utf8', 'test.txt';
	print $in <<TESTDATA;
Вася
и Валя
здесь были!
TESTDATA
	close $in
}
open my $in, '<:utf8', 'test.txt';
open my $out, '>:utf8', 'test2.txt';
for (<$in>) {
	$ln++ or print $out "Ку-ку\n";
	s/(Ва\wя)/_$1_/;
	print $out "$ln\t$_";

}
print "Результат записан в test2.txt\n";

