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
  { title: 'Тест по книгам 1', category: categories[0], author: admin },
  { title: 'Тест по книгам 2', level: 1, category: categories[0], author: admin },
  { title: 'Тест по фильмам 1', level: 1, category: categories[1], author: admin },
  { title: 'Тест по играм 1', level: 2, category: categories[2], author: admin },
  { title: 'Тест по играм 2', level: 2, category: categories[2], author: admin }
])
questions = Question.create!([
  { text: 'Вопрос 1 к тесту по книгам 2', test: tests[1] },
  { text: 'Вопрос 1 к тесту по фильмам 1', test: tests[2] },
  { text: 'Вопрос 2 к тесту по фильмам 1', test: tests[2] },
  { text: 'Вопрос 1 к тесту по играм 1', test: tests[3] },
  { text: 'Вопрос 1 к тесту по играм 2', test: tests[4] }
])
Answer.create!([
  { correct: true, text: 'Ответ 1', question: questions[0] },
  { correct: true, text: 'Ответ 2', question: questions[1] },
  { text: 'Ответ 3', question: questions[2] },
  { text: 'Ответ 4', question: questions[3] }
])
ViewedTest.create!([
  { user: user, test: tests[0] },
  { user: user, test: tests[1] },
  { user: user, test: tests[2] },
  { user: user, test: tests[3] },
  { user: user, test: tests[4] }
])
