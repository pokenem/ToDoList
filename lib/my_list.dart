int nextID = 14;

List<TileData> tasks = [
  TileData(
    note: 'Найти кошка-жена',
    rlvc: 2,
    isDone: false,
    id: 0,
  ),
  TileData(
    note: 'Съесть чашка риса',
    rlvc: 1,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 1,
  ),
  TileData(
    note: 'ААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА',
    rlvc: 1,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 1,
  ),
  TileData(
    note: 'Купить баскетбольный мяч',
    rlvc: 0,
    isDone: true,
    id: 2,
  ),
  TileData(
    note: 'Съесть пиццу',
    rlvc: 2,
    isDone: false,
    id: 3,
  ),
  TileData(
    note: 'Прыгнуть 2 раза',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 4,
  ),
  TileData(
    note: 'Папить кул-кола',
    rlvc: 0,
    isDone: true,
    id: 5,
  ),
  TileData(
    note: 'Сходить покушать в макдональдс',
    rlvc: 0,
    isDone: false,
    id: 6,
  ),
  TileData(
    note: 'Отобрать семки у голубей',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: true,
    id: 7,
  ),
  TileData(
    note: 'Дружить с Дорой',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 8,
  ),
  TileData(
    note: 'Послушать маму',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 9,
  ),
  TileData(
    note: 'Мимо жизнь проходит, всю радость утая\n'
        'Финансы и карьера преобладают у тебя\n'
        'Деньги и достаток, в болоте ты давно\n'
        'Привык, что ********* даёт тебе тепло\n'
        'На очень жирной тачке по встречке ты летишь\n'
        'В мечтах ты - король мира. Ты над людьми паришь\n'
        'В твоём кругу нет песни и нет совсем друзей\n'
        'Нет доблести и чести среди финансовых полей\n'
        'Брей быстрей ирокез себе снова и будет веселей\n'
        'Пей бодрей жизнь как йогурт, не будь скупой как тень\n'
        'Может быть почистить душу без тоски\n'
        'Разбей свою машину, встряхни свои мозги\n'
        'Потанцуй ты голым на офисном столе\n'
        'Обкурись планом, как в школе в сентябре\n'
        'Купи спортивный велик и быстро погоняй\n'
        'Или в настольный теннис с азартом поиграй\n'
        'Познакомься с леди, найди свою любовь\n'
        'Потрать на неё деньги, почисти свою кровь\n'
        'Брей быстрей ирокез себе снова и будет веселей\n'
        'Пей бодрей жизнь как йогурт, не будь скупой как тень\n'
        'Брей быстрей ирокез себе снова и будет веселей\n'
        'Пей бодрей жизнь как йогурт, не будь скупой как тень',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 10,
  ),
  TileData(
    note: 'Купить палочки Кузя',
    rlvc: 0,
    isDone: false,
    id: 11,
  ),
  TileData(
    note: 'Отобрать ашкуди у собаки',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 12,
  ),
  TileData(
    note: 'Сломать теннисную ракетку',
    rlvc: 0,
    date: DateTime(2022, 6, 11),
    isDone: false,
    id: 13,
  ),
];

class TileData {
  String? note;
  int? rlvc;
  DateTime? date;
  bool? isDone;
  int? id;

  TileData({
    this.note,
    this.rlvc,
    this.date,
    this.isDone,
    this.id,
  });
}
