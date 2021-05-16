# frozen_string_literal: true

category_list = [
  { title: 'Книги' },
  { title: 'Фильмы' },
  { title: 'Игры' },
  { title: 'Аниме' }
]
user_list = [
  { name: 'admin' },
  { name: 'Аким' },
  { name: 'Сина' },
  { name: 'Роза' },
  { name: 'Мария' }
]
test_list = [
  { title: 'Классическая литература', level: 3, category_id: 'Книги', author_id: 'Сина' },
  { title: 'Современная литература', level: 2, category_id: 'Книги', author_id: 'Роза' },
  { title: 'Викторина по фильму "Властелин Колец"', level: 1, category_id: 'Фильмы', author_id: 'Мария' },
  { title: 'Вселенная "World of Warcraft"', level: 2, category_id: 'Игры', author_id: 'Мария' },
  { title: 'История серии "The Legend of Zelda"', level: 2, category_id: 'Игры', author_id: 'Аким' }
]
question_list = [
  { text: 'Вопрос 1', test_id: 'Викторина по фильму "Властелин Колец"' },
  { text: 'Вопрос 2', test_id: 'Вселенная "World of Warcraft"' },
  { text: 'Вопрос 3', test_id: 'История серии "The Legend of Zelda"' },
  { text: 'Вопрос 4', test_id: 'История серии "The Legend of Zelda"' }
]
answer_list = [
  { correct: true, text: 'Ответ 1', question_id: 'Вопрос 1' },
  { correct: true, text: 'Ответ 2', question_id: 'Вопрос 2' },
  { correct: false, text: 'Ответ 3', question_id: 'Вопрос 3' },
  { correct: true, text: 'Ответ 4', question_id: 'Вопрос 4' }
]

categories = Category.create(category_list)
users = User.create(user_list)
test_list.each do |test|
  test[:category_id] = categories.find { |category| category.title == test[:category_id] }.id
  test[:author_id] = users.find { |user| user.name == test[:author_id] }.id
end
tests = Test.create(test_list)
question_list.each do |question|
  question[:test_id] = tests.find { |test| test.title == question[:test_id] }.id
end
questions = Question.create(question_list)
answer_list.each do |answer|
  answer[:question_id] = questions.find { |question| question.text == answer[:question_id] }.id
end
Answer.create(answer_list)
