# frozen_string_literal: true

categories = Category.create!([
  { title: 'Книги' },
  { title: 'Фильмы' },
  { title: 'Игры' },
  { title: 'Аниме' }
])
admin = Admin.new(
  email: 'admin@mail.com',
  password: 'password',
  first_name: 'Akim',
  last_name: 'Parinov'
)
admin.skip_confirmation!
admin.save!
user = User.new(
  email: 'user@mail.com',
  password: 'password',
  first_name: 'Nefir',
  last_name: 'Hasenuf'
)
user.skip_confirmation!
user.save!
tests = Test.create!([
  { title: 'Тест по книгам 1', level: 0, category: categories[0], author: admin },
  { title: 'Тест по книгам 2', level: 1, category: categories[0], author: admin },
  { title: 'Тест по фильмам 1', level: 0, category: categories[1], author: admin },
  { title: 'Тест по играм 1', level: 2, category: categories[2], author: admin },
  { title: 'Тест по играм 2', level: 2, category: categories[2], author: admin }
])
questions = Question.create!([
  { text: 'Вопрос 1 к тесту по книгам 1', test: tests[0] },
  { text: 'Вопрос 1 к тесту по книгам 2', test: tests[1] },
  { text: 'Вопрос 1 к тесту по фильмам 1', test: tests[2] },
  { text: 'Вопрос 2 к тесту по фильмам 1', test: tests[2] },
  { text: 'Вопрос 1 к тесту по играм 1', test: tests[3] },
  { text: 'Вопрос 1 к тесту по играм 2', test: tests[4] }
])
Answer.create!([
  { correct: true, text: 'Правильный ответ', question: questions[0] },
  { correct: true, text: 'Правильный ответ', question: questions[1] },
  { correct: true, text: 'Правильный ответ', question: questions[2] },
  { correct: true, text: 'Правильный ответ', question: questions[3] },
  { correct: true, text: 'Правильный ответ', question: questions[4] },
  { correct: true, text: 'Правильный ответ', question: questions[5] },
  { text: 'Неправильный ответ', question: questions[0] },
  { text: 'Неправильный ответ', question: questions[1] },
  { text: 'Неправильный ответ', question: questions[2] },
  { text: 'Неправильный ответ', question: questions[3] },
  { text: 'Неправильный ответ', question: questions[4] },
  { text: 'Неправильный ответ', question: questions[5] }
])

Badge.create!([
  { title: 'Первопроходец', image_name: 'award.png', rule: 0,
    description: 'Награда за прохождение теста с первой попытки' },
  { title: 'Full Combo', image_name: 'medal.png', rule: 1,
    description: 'Награда за прохождение теста на 100%' },
  { title: 'Bad Comedian', image_name: 'cup.png', rule: 2, rule_value: '2',
    description: 'Награда за прохождение всех тестов категории Фильмы' },
  { title: 'Easy Peasy', image_name: 'nice.png', rule: 3, rule_value: '0',
    description: 'Награда за прохождение всех тестов уровня easy' }
])
