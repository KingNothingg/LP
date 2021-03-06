# Реферат
## по курсу "Логическое программирование"

### студент: Тарпанов Д.А.

## Логическое программирование при создании современных информационных систем 

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*

#### Введение
Честно говоря, когда я впервые прочитал тему своего реферата, я понял, что ничего не понял. Что вообще такое информационная система, тем более современная? Как логическое программирование может использоваться для создания каких-либо систем в принципе? Время шло, сдавались лабораторные, читались лекции, в моей голове начало накапливаться какое-то понимание. Наконец, изучив материалы по темам и приступив к написанию реферата, я готов углубиться в данную тему.

#### Понятие информационной системы
Итак, для начала стоит ответить на мой первый вопрос: что же такое информационная система? Изучив первую страницу гугла, я выяснил, что понятие информационной системы, в зависимости от контекста, интерпретируется по-разному. Исходя из этого, логичным решением будет определить информационную систему по её компонентам. Основными компонентами информационной системы считаются данные вместе с аппаратным и программным обеспечением. Также, некоторые более широкие трактовки включают компоненты, такие как персонал и организационное обеспечение. Получается, что информационные системы, определенные таким образом, существуют почти везде и покрывают огромные области человеческой жизни. Примером может служить множество систем, начиная от небольшой кофейни (программное обеспечение с некоторым набором данных присутствует в любом современном кассовом аппарате) и заканчивая компаниями-гигантами (которые, собственно говоря, без этих систем существовать не могут). Из этого можно сделать вывод, что информационные системы используются повсеместно и занимают очень важную роль, о которой я сейчас расскажу.

#### Функции информационных систем
Как было отмечено ранее, информационные системы необходимы для существования всего привычного нам мира. Для доказательства данного утверждения необходимо рассмотреть функции, которые выполняют информационные системы. Главная задача информационных систем состоит в хранении и обработке каких-либо данных. Дело в том, что этих данных, как правило, очень много (например, в 2014 году, компания Google заявила, что хранит на своих серверах около 15 эксабайт данных), и обработка, использующая человеческие ресурсы, не представляется возможной, так как запросы к таким данным, зачастую, можно сравнить с просьбой посчитать количество букв 'а' в какой-нибудь книге. А если учесть, что такие запросы поступают почти ежесекундно и всегда требуют моментального ответа, то можно понять, что автоматизация просто жизненно необходима. 
Стоит подробно остановиться на хранении данных. Так как этот реферат является частью задания курсовой работы по логическому программированию, будем рассматривать способ хранения в виде баз данных, исключив классическое представление в виде документов и подобных вещей. Для начала, определим понятие базы данных. Как и в случае с информационными системами, определения разнятся от автора к автору, поэтому приведу самое простое и понятное. База данных -- набор строго структурированных материалов, хранящихся в ЭВМ. Её особенностью является структурированность, так как любая база данных неразрывно связана с какой-либо программой, осуществляющей её обработку. Если данные будут хранится в каком-то хаотичном виде, написание обработчика значительно затрудняется, или даже становится невозможным. Еще одним важным свойством базы данных является возможность её модификации, то есть возможность добавлять, удалять и менять данные, хранящиеся в ней. Все эти действия выполняет обработчик, который, при интеграции с базой данных, образует понятие системы управления базами данных. 
Итого, что мы имеем на данный момент: есть некоторая сущность, называемая информационной системой, которая хранит и обрабатывает данные с помощью систем управления базами данных для удовлетворения информационных потребностей её пользователей. До текущего момента мы говорили о базах данных, их обработчиках и функциях с точки зрения пользователя-теоретика. Теперь же настало время понять, как вообще создавать эти информационные системы и причем тут логическое программирование.

#### Логическое программирование
Итак, перед описанием логического программирования в информационных системах стоит рассказать что вообще такое логическое программирование. Логическое программирование – парадигма программирования, основанная на теории и аппарате математической логики с использованием математических принципов и резолюций. Центральным понятием в логическом программировании является отношение. Программа представляет собой совокупность определений отношений между объектами (в терминах условий или ограничений) и цели (запроса). Процесс выполнения программы трактуется как процесс общей значимости логической формулы, построенной из программы по правилам, установленным семантикой используемого языка. Результат вычисления является побочным продуктом этого процесса. В реляционном программировании нужно только специфицировать факты, на которых алгоритм основывается, а не определять последовательность шагов, которые требуется выполнить. Это свидетельствует о декларативности языка логического программирования. Она метко выражена в формуле Р. Ковальского: «алгоритм = логика + управление». Самым распространенным языком логического программирования, пожалуй, является Prolog, он насчитывает сотни тысяч пользователей. Также существуют такие языки, как Planner («первопроходец» логического программирования) и произошедшие от него QA-4, Popler, Conniver и QLISP. От языка Prolog также произошли Mercury, Visual Prolog, Oz и Fril. Так большая часть нашего курса была посвящена языку Prolog, то будем рассматривать логическое программирование на его примере.

#### Prolog
Prolog (Programming in Logic, в оригинале: programmation en logique) был разработан в Марселе в начале 70-х Аленом Колмероэ. В основу языка легла процедурная интерпретация логических выражений Хорна (т.е., как именно можно машинно выполнить) утверждений вида:
```
a :- b, c, d,...,z.
```
Что может быть прочитано как: "если условия b, c, d, ..., z — выполнены, тогда и "a" должно быть верно. И, упрощенно говоря, может быть переписано в виде логического следования, так как запятые, по сути, означают логическую конъюнкцию, а знак :- означет следование. Не останавливаясь на синтаксисе, рассмотрим механизмы языка Prolog.
Основными и очень мощными механизмами языка Prolog являются унификация и откат (он же backtracking). Унификацией называют процесс сопоставления вопроса с фактами и правилами базы знаний. Рассмотрим пример: 
```prolog
somePredicate(1, 2).
```
В базе есть один предикат, который задаёт условную пару ключ-значение. Вызовем этот предикат следующим образом:
```prolog
?- somePredicate(X, Y).
X = 1,
Y = 2.
```
При подобном вызове происходит процесс унификации: Для Пролога вопрос есть цель, которую необходимо достичь. Пролог берет вопроc somePredicate(X,Y) и начинает последовательно сверху-вниз сравнивать его с фактами и правилами базы знаний. Там где обнаруживается предикат с таким же идентификатором как и у вопроса и с таким же количеством аргументов происходит сопоставление. В данном случае в базе знаний есть только один факт и нет никаких правил. Если в вопросе аргументы ничем не означены (то есть X и Y свободные переменные), то значения из найденного факта присваиваиваются соответствующим переменным.
Теперь рассмотрим механизм отката (далее будем называть его бэктрекингом). Бэктрекинг -- перебор с возвратами, который организуется Прологом автоматически при попытке унифицировать цель. Каждый раз, когда Пролог встречается с ситуацией наличия альтернативного варианта унификации, то он оставляет для себя информацию для последующего возврата. Просматривает основной вариант и затем уже возвращается к организованной ранее точке возврата. Таких точек может быть несколько и в каждой из них может быть целый ряд альтернативных вариантов. Добавим еще один предикат к прошлому примеру:
```prolog
somePredicate(1, 2).
somePredicate(1, 3).
somePredicate(2, 3).
```
Теперь в базе два предиката, и в случае запроса
```prolog
?- somePredicate(X, Y).
X = 1,
Y = 2 ;
X = 1,
Y = 3 ;
X = 2,
Y = 3.
```
получим три пары значений. Механизм бэктрекинга в данном примере сработал следующим образом: Пролог начал процесс унификации, проходя по фактам сверху-вниз, остановился на первом же предикате и успешно сопоставил X значение 1. После этого, Пролог сопоставляет Y значение 2 и откатывается назад, так как для X = 1 есть два решения. После отката происходит сопоставление Y = 3 и еще один откат. Наконец, обрабатывая последний предикат, получаем X = 2 и Y = 3.  Таким образом, в процессе бэктрекинга, в Прологе образуется условное дерево решений. В случае наличия альтернативного варианта унификации происходит разветвление, и Пролог обходит все получившееся дерево.
Рассмотрев эти механизмы, можно перейти к главной теме.

#### Prolog и информационные системы
Итак, нас интересует вопрос: как можно использовать логическое программирование (на примере Пролога) при создании информационных систем? Если задуматься, то можно понять, что некоторые работы нашего курса Логического программирования так или иначе являлись примитивными информационными системами. Возьмем самый очевидный пример - обработчик генеалогического дерева из курсовой работы. Генеалогическое дерево было представлено фактами родства вида mother(X, Y) и father(X, Y). Эти факты вместе образуют некую базу данных, для которой также написан условный обработчик, отвечающий на запросы о родстве. Однако, полноценной информационной системой это не является. Дело в том, что модификация базы данных возможна лишь вручную, что противоречит факту автоматизации работы информационных систем в целом. Теперь отдалимся от этого конкретного примера и подумаем, почему язык программирования Prolog хорош для создания информационных систем.
Первым, и, наверное, самым очевидным фактом является наличие механизмов унификации и бэктрекинга, которые были описаны выше. Дело в том, что Пролог единственный (или один из немногих) язык, который целиком стоит на этих механизмах. Из-за этого, обработка базы данных становиться сильно проще. Вторым преимуществом Пролога является изначальная поддержка работы с базами данных. Она реализована через множество полезных предикатов. Примером могут служить предикаты assert и retract. Оба этих предиката направленны на динамическое (sic!) изменение базы данных, то есть добавление и удаление фактов из базы. Над этими предикатами есть множество надстроек. Например, в SWI-Prolog'e существуют предикаты assertz, asserta, первый из которых добавляет факт в конец базы (на самом деле точно так же как и assert), а второй в начало. Также, существует предикат retractall, который позволяет удалить все факты, унифицируемые с заданным термом. Также, в Прологе существует механизм мемоизации (tabling) -- сохранения уже вычисленных значений в некую таблицу для ускорения работы программы при возможных повторяющихся запросах.
Стоит отметить, что при работе с большими базами данных Пролог может проявить себя не так хорошо, как императивные собратья. Дело в том, что дерево решений требует какого-то места в памяти и может разрастаться до гигантских размеров, что приведет к увеличению времени работы программы, и, вполне возможно, переполнению стека памяти. Для борьбы с этим есть два оператора: cut и fail. Оператор cut (отсечение) ограничивает поиск решений, запрещая поиск других решений, для целей, которые были вычислены к моменту выполнения оператора. Проще говоря, он запрещает переход к другим правилам текущего предиката и откат внутри текущего правила к коду, расположенному до отсечения. Оператор fail же инициализирует неуспешное решение, тем самым инициализируя возврат. Эти операторы очень неплохо сокращают перебор, тем самым улучшая эффективность программы как по времени, так и по памяти. Стоит упомянуть принципы построения программ, позволяющие оптимизировать процесс выполнения:

•	Более простые предложения ставить в начало определений предикатов, также нерекурсивные предложения помещать перед рекурсивными.

•	Как можно раньше проверять в телах правил условия, распознавая неуспешные ветви доказательства.

•	Ставить первыми в телах правил предикаты с наибольшим количеством известных и вычисленных переменных. Такой прием позволяет уменьшить время, затрачиваемое на сопоставление и перебор.

•	Рекомендуется использовать больше переменных, чем предикатов и определяющих их предложений. Этот прием сокращает время просмотра программы при поиске применимого предложения.

•	Полезно обращать внимание на порядок аргументов предикатов.

•	Не следует забывать о наличии в языке предиката not, который в ряде случаев повышает затраты на поиск решения, поэтому рекомендуется ограничивать использование данного предиката.

Итого: Пролог обладает большими возможностями при создании информационных систем, особенно если программа написана оптимально. Но используется ли он на практике?

#### SQL и Prolog
В наше время SQL является одним из самых популярных языков для создания информационных систем. SQL и Prolog имеют ряд схожих черт:

• Декларативность.

• Руководствование логикой.

• Хранение, выражение и использование отношений (логических отношений в Prolog).

• Они могут как хранить, так и выражать сложные логические условия.

• Они оба имеют факты (данные в SQL) и могут делать выводы из этих фактов.

• У них обоих есть запросы.

• Они оба являются Тьюринг-полными.

Так в чем же их различия? Хотя они действуют в одних и тех же концептуальных областях, их фокусы находятся в совершенно разных направлениях. В терминах Prolog, SQL -- это прежде всего механизм фактов и отношений, тогда как Пролог -- это прежде всего механизм правил и вывода. Каждый из них может делать другое, в ограниченной степени, но это становится все более трудным с даже небольшим увеличением сложности. Например, можно сделать вывод в SQL, но он почти полностью ручной по своей природе и совсем не похож на автоматический прямой вывод в Прологе. Основное различие в том, что в Прологе хоть и можное хранить данные в виде фактов, но он вовсе не предназначен для хранения, извлечения, проецирования и сокращения триллионов строк с тысячами одновременных пользователей, чем, в свою очередь, занимается SQL.

#### Заключение
Наступил момент, когда необходимо подвести итоги. Пока я писал этот реферат, меня посещали разные мысли, и одной из них был вопрос: а про то ли я вообще пишу? Я достаточно сильно углубился в представление информационной системы как какой-то системы управления базами данных, и сейчас хотел бы сказать пару слов про информационные системы немного другого характера. Не всегда необходимо хранить и обрабатывать "триллионы строк с тысячами одновременных пользователей", ведь, по сути, информационная система может быть заниматься обработкой сложных, но небольших данных. Например, анализировать состояние пациента по данным, получаемым из устройств контроля и поддержки жизнидеятельности. Или искать возможные залежи полезных ископаемых по результатам исследований почвы. В целом, такие задачи гораздо сложнее в решении, так как факты больше не представляются в каком то элементарном виде, что приводит к некоторому обесцениванию полезных механизмов языков логического программирования.
Хочется рассказать про выводы, которые я сделал лично для себя. Во первых, тема моего реферата заставила меня задуматься о невероятной сложности и значимости информационных систем вокруг нас. Если вернутся в прошлое, лет так на 300 назад, то все информационные системы того времени были реализованы только лишь через человеческий труд. Таким образом, сообщение из России в условную Америку шло бы невообразимо долго, при том что в наше время все произошло бы за какие-то миллисекунды. Вроде настолько очевидный и привычный факт, что никогда о нем в серьез и не задумываешься. Также, я понял, что на самом-то деле, что у Пролога огромный инструментарий, который мы не особо затрагивали на лекциях. Во время написания работы я просмотрел много примеров с непривычными мне конструкциями и новыми предикатами. В целом, я считаю, что реферат для меня оказался полезным, так как до этого про информационные системы я ничего толком-то и не знал.

#### Список литературы
1. https://ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0
2. https://sites.google.com/site/upravlenieznaniami/intellektualnye-informacionnye-sistemy-v-upravlenii-znaniami
3. https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D0%B7%D0%B0_%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85
4. https://habr.com/ru/sandbox/40327/
5. http://proprolog.narod.ru/razd_bt.htm
