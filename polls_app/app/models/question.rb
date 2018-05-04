# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  validates :body, presence: true

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :responses,
  through: :answer_choices,
  source: :responses

  def results
    responses = self.responses
    empty_hash = Hash.new(0)
    responses.each do |response|
      empty_hash[response.answer_choice.answer_body] += 1
    end
    empty_hash
  end

  def results_better
    responses = self.answer_choices
    .select('answer_choices.answer_body, COUNT(responses.id) AS num_responses')
    .left_outer_joins(:responses)
    .group('answer_choices.id')
    responses.reduce({}) do |results, ac|
      results[ac.answer_body] = ac.num_responses
      results
    end
  end

end
