# frozen_string_literal: true

test_one_input = <<~TEST_INPUT
  xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
TEST_INPUT

test_two_input = <<~TEST_TWO_INPUT
  xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
TEST_TWO_INPUT

part_one_regex = /mul\((\d+),(\d+)\)/
part_two_regex = /(do\(\))|(don't\(\))|mul\((\d+),(\d+)\)/

def part_one(input, regex)
  captures = input.scan(regex)
  # p captures
  result = captures.map do |capture|
    capture[0].to_i * capture[1].to_i
  end
  result.sum
end

def part_two(input, regex)
  valid = true
  results = []
  captures = input.scan(regex)
  captures.each do |capture|
    valid = true if capture[0]
    valid = false if capture[1]
    results << capture[2].to_i * capture[3].to_i if valid
  end
  results.sum
end

p "#{part_one(test_one_input, part_one_regex)} should be 161"
# p "#{part_one(DATA.read, part_one_regex)} should be 185797128"

p "#{part_two(test_two_input, part_two_regex)} should be 48"
p part_two(DATA.read, part_two_regex)


__END__
(who()where()''~[how()'&do()why()$;mul(323,598)&/-'}{&-/<do(), '~>[?-mul(933,97)how()?from();}{+mul(864,562):#<*$>mul(63,747)what()mul(514,101){]$where())~>do(){:mul(53,731)mul(899,858)~~[select()(~mul(402,353)?^&!,who()what()-when()mul(4,41)-&mul(505,942)how()*/%select(667,826);mul(233,284)(&mul(484,956) #/mul(243,698)[;')how()'<%+[mul(153,970)!when()^{^;mul(176,383)@$$~[select(901,794)mul(322,492)from(183,121),-mul(212,356)who();)where()select()#do()>!who()!mul(138,847)&select()mul(128,454)select()what()(&<-mul(650,981) #when(636,522)(who()'-{?mul(149,431);/ !$}<#<!mul(806,218)when():mul(669,489)!@,) select()+mul(596,973)!@}mul(990,349)-]{,'mul(684,303)-[*mul(358,267)(mul(819,988)+;$}who()-[mul(67,603)< -!$%$who()?mul(753,49)[^who()>@mul(15,553)[[>;%mul(389,307)'mul(864,97)#[$why(),<>mul(322,599) ^mul(109,985)who()<from()from()?<?'mul(894,431)select(397,204)why()}mul(540,913)*?what()?~select()mul(411,407)/^how()-'select()mul(590,166) <how()mul(664,994)from()#^ *mul(384,184)][$^mul(113,201){$)*;{mul(634,407)who()@ how()why()(from()from(65,876)^mul(649,20)>when()<why()!~/who(),mul(586,611)mul(797,330)^&mul(409,692)@@from()]<select(){do()['who()who()&]mul(414,374)~from(){}what()>mul(763,870){from(905,178);$/mul(980,975)$why()@don't()#why()#from()from()when(){mul(436,3)[^]/*what()!!mul(300,322)where()!select()*(~why()mul(845,313),[:mul(937,973)how()^when()mul(552,183);from()/ &from()>'!mul(773,549)/where()~<?mul(869,838)%where()[%#&mul(835,525);?$<[], mul(69,159)what()>from(277,235)'mul(43,275)#>#[?-mul(110,899)~where()when())mul(976,743)%& mul(373,511)what(){{$)?}!mul(565,194)from()%#mul(47,349)(select()%when()&mul(263,392)-#,{+ *(mul(382,243)@:?+&-#%when()from()don't()where()what()(+from()- }where()mul(904,460)@how(768,761)}-why():<what()mul(312,552)@why()/-where()? >^mul(450,724)~mul(570,970)+-+/when():mul(203,363)why()[%%@mul(803,322)how()#who(),mul(368,46)select()what()#^*>from()from()+do()^(:)]+mul(585,478)^*:[mul(4,668);&select()'(mul(931,511);:mul(356,478)[mul(933,523)}';when()mul(616,605)why()$]{{select()how()~mul(869,274)mul(15,936)how()/:}mul(297,842)#}%~,select()$@(!mul(961,553)when()why(40,621)>mul(35,851),?+*mul(574,127)when()select()}who()from()/from()mul(107,604)<~@)mul(911,877who()?(when()!mul(496,778)select()when()select()&<mul(980,829)*<,>!$:,}+mul(278,194)%))who()when()*why()#+mul;when()??what()select() -%how()what()mul(873,684)where();where(741,393)+}?!'}mul(684,81)what()what()how()who()from()/<{>mul(286,481),<^mul(788,53)mul(561;)mul(376,887)+]-(when()[who();mul(205,369)!how(425,691)do(){}when() {mul(260,802)],*where()^why()how(){don't()where()}#?*), mul(670,405)^how()where()]mul(645,220)who();< > +select()how()+mul(763,932)+mul(141,632)+'}how(),@#from()'from()mul(211,161)mul(272,971)[@,>mul(340,784)-#why()&:@mul(343,209)when()#/]&mul(408,205)#!,,@;{>}@don't()mul(682,891)^:(>mul(234@when()} don't()) mul(322,500)~>when()*mul(826,896)$!^+->>what()don't()~&select()mul(127,828):,!^!%where(168,484)<~mul(709,801))@*{mul(148,549);from(649,310)+~what():why():?mul(62,198)mul(133,316)select()mul(580,623)who()who();<;[who(388,191)!{mul(819,559)/[mul(572,562)))@,mul(148,103)who(),select()(mul(669,636)-{mul(493,60)))&#^mul(766,322]*mul(290,960)mul(962,649)mul(209,105)
mul(759,17why()&'!](%-mul(389,889),select(){/mul(907,972)why()&(<mul(778,477)-:from()*+@^mul(876,124)#}!what():what(){<mul(633,946)from()when()*]mul(61,166):*!select()select()mul(385,972))[*-<select()][do()/{select()what()mul(572,800)+%>#what()select()+!when()mul(379,398)'-{?mul(275,735)>why()(]%)select()+mul(811,330),%who()#mul(27,53)mul(810,378))how()[don't()^$'*mul(714,951)[>where()}:}%)mul(741,834~][<mul(515,311)[;)where()&-$when()!mul(943,268)>*% where()}&when()mul(84?mul(204,282)*,]+@^+%what()what()mul(442,73from()@select()}?when()~select()do()from()-}:where(){$* {mul(436,174)where(209,751)mul(576,189)[^when()what()why()don't()@when()%<$?mul(49,842)>who()from()-:$mul(309,375)-who() <+#+/when(225,777)mul(298,362)^~how()what()]&^;<mul(333,974)mul(760,603))<mul(547,974)#}}#}%mul(939,522)>&;^mul(573,219)[:/mul(714,428)}%mul(534who()@}}]:~'how()('mul(985,19)>( do()%what()&mul(17,24)when()),>from()do()@%!mul(967,50)why()}from()~who()<where()mul(619,399)-+mul(926,910)!mul(790,450)%what()mul(652,66))*~,)@%*'<do():#{/>/;!:mul(330,386)>why();]*<%[{from(285,989)mul(746,507),)where(131,831)'>select()!'who()mul(936,547)mul(698,306),mul(810,111)'[[when()mul(859,814when()(,^:$when()*^@*mul(639,6)()%mul(530,398)from()?'+]what()%mul(565~mul(664,297)][{where()$<'mul(521,918)<~'']?do();how()?[;,! who()^mul(993,640)-$;how():from()mul(555,779)where():?mul(802,307)/}&;@where(),],$mul(428,846)mul(914,333))%$?from()mul(132,678)*when(843,580)mul(360,826)*/when()% what();'mul(726,716)+select()'#~},when(587,50)select(871,597){mul(204,647)(from():{*-]$where()>mul(347,78)'@why()why(990,935)mul(708,962)(:^#what(),)+mul(946,615))>>$how()do()<<&mul(27,707){)&what()mul(734,74)+>'mul(889,356)+{why()why()&why()mul(875,327)[ $who();]#&!@mul(887,395)how()/<select(),~}'>mul(445,826)mul(325,137)why()$#&[+:mul(61,520)~when()]/from(682,457)^;&~,mul(909,277)mul(155,72)what()@<([?#do()&}why():who()mul(636,58)where())[<who()mul(963,11)?!what()what()} ~]mul(675,549)~%{)>@who(487,170)?mul(195,909)how()#;where()why()-)&[/mul(682,842)!(+}+^<<;mul(303,732)mul(709,34)@' (when()~mul(32,411)@don't()what()select()mul(765,345)mul(124,69)mul(68,95)/mul(967,749)do()who()where()who(){:why(430,451)(*when()where()mul(719,917)**)#mul(77,946),when()mul(273,971)#[what():+>why()]mul(583,407)<%from()mul(360,886)who())where(465,475)mul(398,130)#when()where()?where(),#~;mul(647,114*]who()-'*%!from()do()~';?(?$?mul(750,896)'^!how()+'!:/mul(95,159)who()>from(){;how()<mul(749,897)-'^mul(415,582)from()[(where()mul(568,507);~)why()) -mul(850,931)!where()why()~@<!{why()do() ^~%why()mul(909,10)!select(),!-}why()who()mul(654,569)'+mul(416,33)!+how() why()mul(384,73)(#why()where(){&mul(601,75)mul(186,890)-),mul(441,730)from()$+-mul(781,347)[{*from(),mul(412,933)how()]%$:><&,!mul(623,492)+?::from()who(){mul(915,36)#what()mul(855,275)mul(546,43)%%!&from()mul(256,937)^%how()where()+#mul(720,847)who()>mul(530,714))]~<mulwhen(127,51)#/#what()mul(442,992)mul(199,836)~(mul(133,954)#;@~ /:mul(807,810)-<!select()mul(967,241)'^mul(931,561)~;+$how(208,930)how()[(mul(536,241)$mul(161,306~!)$mul(823,497)[*:>what()#when()who()where(353,953)mul(948,731)} ?]~&don't())where()when()where()who():%,?-mul(348,179)why()where()^'/mul(858,210)^$what()!+mul(169,479)};from(106,826)/who()mul(44,593how(382,624)>)-'+#mul(822,120)when(509,411)]why()@from()@~/$do()mul(135,70)?select(){don't()]~mul(339,843)mul(89,314)*[-from()do()){>%^#mul(961,883)
#-}*mul(204,272)^@':%>]'/mul(399,973)from()!,>>mul(183,122):?#<({+ )mul(489,296^/where()$how(949,670)where()^}/mul(509,262)&!why()when()mul(42,399)]@how();(mulselect()why()~[*!mul(530,643),#$mul(798,926)select()%/:]'from() ?select()mul(777,171)@how()'when(849,184)do()'-'''mul(609,27)how()^&<mul(294,233)/;who(292,498)-:;mul(46,352)who()*'!what()?where()~?mul(678,93)' who()where()mul(918&:/{mul(778,76)mul(992,739)who()< select();mul(233,391)when(){%-[(when()mul(622,255)select(){@#($;$>mul(663,547)}where(891,558)mul;*select(){~$!mul(679,190);<~mul(95,93)where()>mul(347,816)}'[from()+mul(69,7)@,-;^what()mul(679,759)mul(985,484)mul(374,224)+^<}mul(356,351)*(?why()'how()why()when()]>mulwhen() select()!-who() mul(386,988)#%]{ {~mul(403,987)select()<from()^$;how()!mul(934,779)from()from()[ who()why(41,259)why()mul(986'}]>from()where()[+/mul(534,4)'from()who()mul(845,463)^~^who())]!:&from()mul(396,175)mul(797,149),mul(373,499)~/mul(908,215)when()who()$-what()where() ![from(874,415)mul(735,220)%from()?;*<mul(420,264)-;*:?mul(648,648)from()[} +when()mul(484,535)-)from()how()select()[^mul(827,744)*[,:%$mul(318,590)!mul(72,338)}from(332,828)+<@>select()who():'mul(958,295)?from(){[how()}mul(577,440*]mul(248,108)/{mul(845,24) what(708,623)&,mul(962,333):-{mul(228,773) @;'mul(65,412){],]}where()mul(695from()}:mul(802,950)?}&mul(903,520)]select()}@mul(819,46)')who(290,48)}]!+}mul(175,633)from()[-+/select()]#from()mul(502,869)who()who(){who()[$*$mul(625,448)where()&!where() &mul(640,501),&when(322,255){who()mul(393,184)%*(#from()where()mul(855,937)@;(+mul(658,584)+what():'$$mul(510,392)what();%mul(972,965)][*mul(199,39)mul(258,651)#where()when()$mul(629,994)]+&[where(747,799))<?(mul(243,235)~>mul(927,670)$# !{*who()mul(925,133);don't()*mul(430,770))}when()!;mul(691,631)+mul(78,556)]~+{where())mul(119,527)*{>where()mul(108,678)'select()!:$*>mul(178,527)do()&^mul(958,626)-&$[}?mul(51,760)mul(24,628)!mul(193@^{who():^';?'mul(494,429)&who()@;[(from()~mul(556,60)/^[{mul(448,594)+from()/why()mul(133,200)^when()~select()*,how()mul(874,680)'from()>~when()when()>mul(993,110,%!{*</mul(296,249))how()$<*{%^mul(499,678)why()+?]where()+mul(960,503)-$mul(837,497)}#when()when()-[from()]mul(137!*from()?;{,#-[mul(865,181)who(688,662)~?>mul(964,213)[mul(740,725)*}! <mul(842,760)!~{mul(595,90),%^]don't()+from()+(!>-'mul(681,471)$don't()who())< ?*<when() $mul(116,694)who()mul(334,892)select(){mul(692,393)%!?~%select()when(628,495))why()mul(109,158)*how()mul(601,487)how()<mul(18,993)mul(176,256)what()why()select()+?%mul(613,499)what()don't()@~mul(383,802)<!mul(265,451)^,( mul(556,577)'select(486,637)+<select()mul(194,935)how(),]%mul(183,304)%?mul(896,216)who();*why()^]who()$'-mul(482,857)>-^^+*#'%mul(354,482)//;select()why()^select()?how()%mul(717,506)from()from()where()mul(729,432)],> ]@mul(817,878)(mul(25,684),select()?mul(9,290)select()~//from()mul(597,993)>:%]}who()<]&[mul(463,497)'(}don't()what()@&+!select(323,684)%how()mul(530when()'why()mul(595,825)&?why()mul(419,41)how()don't()-(mul(682,595)%,;{&:^%-what()don't()^ *@{how()+what()mul(69,125)*?!?'!why(),<mul(824,838-mul(799,561);@*from()mul(723,945),%[@#,~from(){mul(246,930)$mul>]what()where()<]mul(38,337) (mul(920,421)who() what()&*]{mul(228,619)where()#?'%^>who()mul(500,245)
{!;';'~)$^#!/usr/bin/perl<@what()&where()-[!]mul(215,331):!^~!&mul(740,257)how(283,279)#mul(86,887)>how(){[([mul(229,645)/+:don't()'(select()how()-{>$mul(319,757)what()^mul(438,563)$where(){select()mul(176,746)] ]%mul(291,179)mul(720,898)}{~;what()]do()[when()/@,)<mul(909,994)/<^{# why()!/don't()?why()mul(502,478)><why()]where()%,/ @mul(576,319)**)'%;*mul(434,53)#%%<:~*@'}mul(122,740)*?from()/#)who()select(11,207)'mul(198,192)(when()})+;[from()mul(228,554)/{]$^mul(707,718)what()@ @//'<mul(697,798)<mul(751,203)$*>:select()!mul(356,326)>?'mul(655,327);,#why()':[ mul(782,645)[:)what()??%mul(328,999)@^ (@>^%from()mul(765,647(,'/mul(523,130)where()why()%where()~why();where()who()mul(536,374)from()mul(240,454)!]how(122,192)from()#)how()/why(572,858)!don't()[mul(626,865)*!$,from()},-mul;:what()mul(926,728) '>}who()^%mul(971,826)<when()what()who()where()select()((;}mul(782,632)-mul(555,891)why(493,334)why(){how()mul(497,236);who()when()mul(224,527)select()@'how()select()mul(983,17))<from()>{(>mul(414,666)}&?&<--<-/mul(869,9)who(706,345)when(211,297)[what()><why(52,346)select()~mul(407,710)how()%{why()*):mul(428,443)#@]mul>'-(){how()?]{select()mul(514,69)mul(926,807)when()who()+[don't(),}$where()%##(mul(628,758))from()?mul(269,430)mul(489,967)when()mul(171,814)+ &when()mulfrom()#]((^{mul(104,614)how()&why()^+who()why())(&mul(843,643)>)(;[when(888,120)how(463,116)mul(519,821)<,(why()$when()who(623,832)mul(26,559)]:why()?/]-;{?do() why()-mul(759,848)*who()why()}*where()mul(358,256)who(250,854)don't();<mul(234,96);@select()mul(232,858)select()who()mul(260,692)[what(307,353)+^what()mul(770,421)who(); *#&{*who(307,583)mul(781,961)]'%where()<*}?-(mul(812,383)'%>#?-~what()how()mul(188,539)what()why()(:how()how()when()(~,mul(10,118):!where()select(){-mul(851,170)+why()[why()-$(from(287,301)mul(53,873)+(&];)![mul(654,539)~how()why()why()who()&>mul(802,188)#}mul(286,24)#-~+~]who()'mul(281,726)why()#{![+when()mul(105,845)+@select()mul(932,93)-:;/';, mul(820,402)select();where()mul(282,739)%what()who()!{%why();:who()mul(37,507)[) &$who()mul(398,244)where()]]<^,*why()from()mul(703,450)?$ mul(568,998)[/mul(241,361)[*>,}%do()what()how()mul(539,814))+^what()@what()!mul(484,815)</&#why()-mul(886,584)>'select(875,43)don't();{]*]^;who()mul(798,636):~>mul(398,278&mul(468,474)(}@;~mul&%[who()@mul(118,538)!$@who()how()*what()what(),<mul(67,428)mul(510,176)mul(803,856)mul(161,602))mul(158,587)mul(360,238)~':,mul(478,5)&*+-}where()*mul(804,17)!@how()$</*%@mul(286,874) #:>why()^*+why()mul(156,58)[^from():)#<<how()mul(268,300)-how()%?#{mul(674,761)]!don't())>?<{mul(47,431)   ,>'mul(131,665)who()how()what(){@mul(888,835)who(593,10)'%how()select(357,595)mul(793,894)+select()(mul(289,300)mul(668,408)}+[,mul(404,186):+~}^mul(580,609)who()(:((+mul(664,287){from()<{mul(627,661) select()mul(961,352))why()from()how()mul(652,317)$<select()how():mul(351,933)why()what()<do()mul(70how()where()!-mul(760,394)/(%mul(346,151)]when()(;what()mul(912,435):when()^when()what()select()'how()mul(701,360)}^$mul(312,786)&! ^select()mul(468,133)]!<what(726,322)]#!)why()>mul(423[%where()(!</mul(38,161)~&+'&why()!~*mul(495,220)>[[]]/@mul(613,935)%:[ &<where()}(mulwhen()where()how()mul(340,241)mul(630,76)&why()+%{@!])mul(146,728)! ;${^{from()mul(58,368)@?select() %,!)mul(682,975)# )how()^?%mul(703,165)'from()when()from()^mul(140,504)~from()'select()what()when()[%{mul(44,577)(>?where()<select(27,140),mul(741,451) ~how()why()how()$select()@!mul(812,268)
*where()select()!+! '@mul(279,497)?when()mul(261,969)select()&!&mul(361,865):~<}!&mul(215,665)&:%from()'mul(412!%-@$:)mul(93,869)&how()when()/+! don't()/why()[';/how(698,147)mul(187,610)+]]!}when()mul(727,817)who()?mul(876,423)what():@{mul(772,859)>why()[:{mul(473,246):[what()^mul(673,250)mul(674,621), ,} ;>when(){-mul(934,227)where())#where()~mul(535!~!how()]how()^mul(16,678)-%?why()what()*-do()}#mul(407,518)?<>'@)&,mul(935,102)+select()@>{>>>~)mul(810,478)mul(13,154)>-]from()@when()mul(359,474)who()<?&+do()what()}mul(463,300);%who(20,992)/where()*where()%(mul(307,632){what()@:}!;-%mul(262,328)/?)don't()select()&%<mul(945,418)/](~why()]}mul(844,771),%mul(66,907)mul(634,936)'+don't()mul(667,574)where() ]@+where()mul(797,682)from()!*&:mul(828,603))mul(428,801)^what()@>-who(311,794)mul(595,571)mul(10,255)what()<who()mul+#mul(786,784)-^?how()how()&don't()/}mul(353,33)]?mul(188>+${select()who()%'!mul(767,38)[mulhow()~{mul(101,378)')where()}!from()!%mul(81,12) what()+what()::select()mul(851,679):#}~&>who()when()/'mul(341,606)when(){)^who()from()select()mul(462when()]^{what()%{!why()don't()why()^@$mul(480,740)mul(327,864)$why()@&,*how()!{mul(359,622)%#+~*where())##%mul(957,284)[]who()}/,)mul(646,738)mul(588'&~&what()#!~mul(901,808)mul(751,892){>*;,why()how()mul(588,670)when() $from()${!#<mul(904,960)mul(268,822)select(865,281)^what()when(870,4)+!mul(283,416)[~how()]@when()%#from(116,591)mul(903,643)how(544,123)select()what()mul(131,766)where();<(}^%'>don't()(select()^&where()mul(430,59)@~why()mul(880,187)how()&!'what()where()how()mul(496,275)+who(){/$!mul(571,229<*!*>mul(843,816)who();what()<#@->'&mul(578,292)/ why()mul(585,157)select()}@>/(when()mul!^who()mul(660,711)><}why()when()mul(392,7)what()$who()how(156,813)'mul(512,78)select()from()*,;mul(139,554)why()!;}&}$from()mul(534,318)(##:]*)what()how()mul(981,987)#select()when(914,450)!:/'mul(664from()^from()?'-mul(287,512)>;?~how()> #mul(763,19)}:mul(875,396)/(-from() !:why()mul(830,397#mul(143,615)mul(565,22)~what()+mul(443,374)how()mul(396,99))who()do()mul(613,198)*,who()]?{(#mul(681,692)(@:[<#;]mul(353,806)mul(416,977)&from();/don't()why(),,&mul(844,896)$how()%:#:(+>who()mul(929,260) %+'when(),~*+mul(549,134)why()[why())!;)when()(from()mul(306,154)'where()what()mul(781,501)['when()why())where()&[select()-mul(256,37)mul(764,192);mul(204,633)mul(980,29)]$mul(85,142why(88,3)~mul(297,384)>mul(445,165):}who(){(: mul(790,74)$?)where(361,397)^what()$$mul(932,137)mul(283,441)$$where()&^~mul(419,42)/$$mul(95,704)what()from()^mul(686,803):from()?what()$mul(657,560)~mul(394,381)why();-+&}where()<}!mul(320,912))+# &,#mul(22,374)^[';!^mul(295,509)who():from()-*mul(844,745)*}$when()where();&^mul(157,945)~how()^/?(mul(98,104)mul(883,360)}from()where(456,72)$???who()[]mul(869,340)from()@/$({@who()'mul(30,429)what();':,:,'select()mul(444,351),mul(568,344))]where()[@)'*!-mul(268,329)who()don't()]select()(select() what()&{'mul(190,17)*mul(795,718)who()^@+;+mul(748,907)>]who());<mul(812,750)(what(307,854)?,mul(559,132)$?/}what()!who()]]mul(64,576)&*{((?mul(514,113)!;do():(select()/ ]mul(884,458):who()[*^[how(458,26)'mul(874,485)^%where()^&*>}&mul(645,937){,/how(47,395) mul(826,39)how()}where(791,937)<^{@)mul(286,200)}who()how()&from()'what()$select()!mul(615,866)<where()@mul(41,606)/from()}@$where()? 'mul(135,4)from()>) why()(/why(901,882)[:mul(815,919)why()mul(713,155)
 mul(267,443)&select()#/$ )mulwhy(834,619)mul(468,369):mul(360<what()>when(248,679)*when()]don't()(what()<+^{mul(84,136)!mul(865,460)mul(63,689)}who()/!**%/mul#?(,,!when()mul(321,194),?/$who()why(264,50)*-mul(424,308)(/[%~$who()!*?mul(870,366)-;+*^*mul(629,804from(485,259)what(691,680)why() {what())mul(182,814)who()who()mul(45,447)*,from()(+&?$select()*mul(592,101)why()};mul(716] how()when()&%select(393,368)when()*+^mul(360,598),*%~]mul(483,209)}*!@mul(124,485)why()'select()!from()$];mul(827,797)!who()&mul(750,119)mul(266,461)<#+(?{[don't()}what()where()+mul(668,848(*!how()%how()>mul(537,81)-<mul(621,554)!{;(,/)%mul>@don't()why()+mul(290,311)'>/! mul(886,782)}>]~);>?mul(800,965){mul(124,560)[mul(54,352)what()!when()what()'-$] mul(485,906)mul(532,777)*mul(899,963)!^> +where(733,202)where())mul(42,658)don't()>what() who()mul(672,366)%-~*who()select()why(654,545)why()<?mul(148,482)what()(@^mul(204,539)!']!^}mul(316,20)?@$&select(168,13)[:<&mulwhen()'mul(346,412)!<,@mul(421,140)%):;when(333,927)what()mul(662,233+)who()-mul(813,444)(what()(who()]mul(257,562)who()from()?who()#? don't()[why(),*mul(135,871)}from()}{!mul(422,420)*!;^@?why()when(53,628)mul(707,263)$-do()what()^+''~!mul(331,55)select()mul(41,984)who()what()mul(732,731)who()select())mul(96,453)mul(45,369),mul(403,541)what()from()mul(958,966}&&[&)#where()#mul(826,845)do()select()mul(276,52)@'&where(37,727)when()!why(){'mul(16,709)from()&mul(169,255)what()!when()}}{from()<mul(516,193)+mul(809,866))}~^:+who()'mul(802,497)mul(353,83)when()mul(753,747)what()-mul(990,592)mul(47,486)@}where()mul(52,937)what(321,510)mul(75,204)[from()(mul(990,863)&{who(857,87)mul(619,79)when()when()^/mul(829,598)?}/$when()/?}how()(mul(551,424)mul(566,613)-mul(881,853)why()$mul(443,62))what()<(when()]'@from()@mul(681,681),mul(41,909)!why()&^?/mul(901,496)[,when()(~{mul(110,732)?'@when()what()mul(340,118))$^mul(548,352)&[?don't()from()<*!'mul(342,834)what()how()@where()@'from()(when(495,987)mul(626,782)<,/?#-%when()'*mul(155,802)how()&!@)+where()!#{mul(617,775){;mul(761,780)^:~]']>mul(393,810)[:[>?mul(581,64)where(){,&'@what()(?;mul(783,54)who()#:mul(554,807)+%&{[^ )^mul(239,651)select(145,543)(>don't()select() $*?who()who()&/]mul(228,402)#*[?when(628,409)what()!where():mul(595,910);,!-&mul(801,570)who()(when()@select()+~mul(357,370),$select()$,$select()!from(703,372)mul(408,165)mul(929,252)}how()#*what()/mul(115,155)what()mul(64,981)what()mul(162,300)# where()do()*from()'}%),how(309,961)$mul(332,232)/ 'from()>@};$]don't()(?:?*what()^#+mul(51,30)mul(79,533)how()select()}?mul(330,382)from(287,801)>/how()~mul(326,971)mul(623,476)+ ',select(632,537)}why(663,480)mul(987,320)[what()mul(626,139)mul(71,973)?)from()<mul(806,627);*$mul(500,493)what()$select();*[mul(420,687)$+#who(),why()(*do()/#/what()mul(479,27)([%where():;*]mul(842,516)!don't()mul(911,520)don't():mul(20,813)#mul(302,928)-where()when()how()'!when()[select()mul(126,179)?]what()#!where()~#!what()mul(817,663);where())~>*{what() mul(999,806)-from()^{mul(153,622)#do()>why()where(10,408),}{#>%mul(995,509)(mul(728,572)#~(;mul(530,132)*:% select()]mul(499,982)><@when()mul(348,550)mul(362,709))$}mul(520,895) where()-mul(950,23)$%%when())>','mul(328,120)+#mul(934,621){from(63,306)  :}mul(402,983)where()*select();*select()<mul(483,759)'(
