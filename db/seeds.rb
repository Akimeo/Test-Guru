# frozen_string_literal: true

categories = Category.create!([
  { title: 'Книги' },
  { title: 'Фильмы' },
  { title: 'Игры' },
  { title: 'Аниме' }
])
users = User.create!([
  { name: 'admin', email: 'admin@email.com', password_digest: User.password_digest('admin') },
  { name: 'Сина', email: 'aot1@paradis.isle', password_digest: User.password_digest('password') },
  { name: 'Роза', email: 'aot2@paradis.isle', password_digest: User.password_digest('qwerty') },
  { name: 'Мария', email: 'aot3@paradis.isle', password_digest: User.password_digest('123456') }
])
tests = Test.create!([
  { title: 'Тест по книгам 1', category: categories[0], author: users[1] },
  { title: 'Тест по книгам 2', level: 1, category: categories[0], author: users[2] },
  { title: 'Тест по фильмам 1', level: 1, category: categories[1], author: users[2] },
  { title: 'Тест по играм 1', level: 2, category: categories[2], author: users[3] },
  { title: 'Тест по играм 2', level: 2, category: categories[2], author: users[3] }
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
  { user: users[0], test: tests[0] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[2] },
  { user: users[0], test: tests[3] },
  { user: users[0], test: tests[4] },
  { user: users[1], test: tests[0] }
])
