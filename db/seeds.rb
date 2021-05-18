# frozen_string_literal: true

categories = Category.create!([
  { title: 'Книги' },
  { title: 'Фильмы' },
  { title: 'Игры' },
  { title: 'Аниме' }
])
users = User.create!([
  { name: 'admin' },
  { name: 'Сина' },
  { name: 'Роза' },
  { name: 'Мария' }
])
tests = Test.create!([
  { title: 'Тест по книгам 1', category_id: categories[0].id, author_id: users[1].id },
  { title: 'Тест по книгам 2', level: 1, category_id: categories[0].id, author_id: users[2].id },
  { title: 'Тест по фильмам 1', level: 1, category_id: categories[1].id, author_id: users[2].id },
  { title: 'Тест по играм 1', level: 2, category_id: categories[2].id, author_id: users[3].id },
  { title: 'Тест по играм 2', level: 2, category_id: categories[2].id, author_id: users[3].id }
])
questions = Question.create!([
  { text: 'Вопрос 1 к тесту по книгам 2', test_id: tests[1].id },
  { text: 'Вопрос 1 к тесту по фильмам 1', test_id: tests[2].id },
  { text: 'Вопрос 2 к тесту по фильмам 1', test_id: tests[2].id },
  { text: 'Вопрос 1 к тесту по играм 1', test_id: tests[3].id },
  { text: 'Вопрос 1 к тесту по играм 2', test_id: tests[4].id }
])
Answer.create!([
  { correct: true, text: 'Ответ 1', question_id: questions[0].id },
  { correct: true, text: 'Ответ 2', question_id: questions[1].id },
  { text: 'Ответ 3', question_id: questions[2].id },
  { text: 'Ответ 4', question_id: questions[3].id }
])
ViewedTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[0].id, test_id: tests[3].id },
  { user_id: users[0].id, test_id: tests[4].id },
  { user_id: users[1].id, test_id: tests[0].id }
])
