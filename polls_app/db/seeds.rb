# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  Response.destroy_all
  AnswerChoice.destroy_all

  hagrid = User.create!(username: 'Rubeus Hagrid')
  harry = User.create!(username: 'Harry Potter')
  hermione = User.create!(username: 'Hermione Granger')
  dumbledore = User.create!(username: "Albus Dumbledore")


  poll1 = Poll.create!(author_id: hagrid.id, title: "aA Poll")

  poll2 = Poll.create!(author_id: harry.id, title: "UCB Poll")

  poll3 = Poll.create!(author_id: hermione.id, title: "SF Poll")
  poll4 = Poll.create!(author_id: dumbledore.id, title: "CT Poll")
  poll5 = Poll.create!(author_id: hermione.id, title: "SJ Poll")



  question1 = Question.create!(poll_id: poll1.id, body: "Do you like aA?")

  question2 = Question.create!(poll_id: poll2.id, body: "UCB or Stanford?")

  question3 = Question.create!(poll_id: poll3.id, body: "Why are there so many hobos?")
  question4 = Question.create!(poll_id: poll4.id, body: "Do you like chinese food?")
  question5 = Question.create!(poll_id: poll5.id, body: "What is your dream salary?")




    answer1 = AnswerChoice.create!(question_id: question1.id, answer_body: "yes")

    answer2 = AnswerChoice.create!(question_id: question1.id, answer_body: 'no')

    answer3 = AnswerChoice.create!(question_id: question2.id, answer_body: 'UCB')
    answer4 = AnswerChoice.create!(question_id: question2.id, answer_body: 'Stanford')
    answer5 = AnswerChoice.create!(question_id: question3.id, answer_body: 'I do not know')

    answer6 = AnswerChoice.create!(question_id: question3.id, answer_body: 'People are too many here.')
    answer7 = AnswerChoice.create!(question_id: question4.id, answer_body: 'Yes')
    answer8 = AnswerChoice.create!(question_id: question4.id, answer_body: 'No')
    answer9 = AnswerChoice.create!(question_id: question5.id, answer_body: '100000000000000')
    answer10 = AnswerChoice.create!(question_id: question5.id, answer_body: '1')



  response1 = Response.create!(user_id: dumbledore.id, answer_choice_id: answer1.id)

  response2 = Response.create!(user_id: harry.id, answer_choice_id: answer2.id)

  response3 = Response.create!(user_id: hagrid.id, answer_choice_id: answer3.id)
  response4 = Response.create!(user_id: hermione.id, answer_choice_id: answer4.id)
  response5 = Response.create!(user_id: harry.id, answer_choice_id: answer5.id)

  response6 = Response.create!(user_id: hagrid.id, answer_choice_id: answer6.id)
  response7 = Response.create!(user_id: hermione.id, answer_choice_id: answer7.id)
  response8 = Response.create!(user_id: hagrid.id, answer_choice_id: answer8.id)
  response9 = Response.create!(user_id: harry.id, answer_choice_id: answer9.id)
  response10 = Response.create!(user_id: dumbledore.id, answer_choice_id: answer10.id)
  response11 = Response.create!(user_id: dumbledore.id, answer_choice_id: answer10.id)



end
