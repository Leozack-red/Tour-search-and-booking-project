# frozen_string_literal: true

module ApplicationHelper
  FIRST_SENTENCE_REGEX = /^.*?[.?!](?=\s+(?:$|\p{P}*\p{Lu}))*/.freeze

  def first_sentence(text)
    FIRST_SENTENCE_REGEX.match(text).to_s unless text.nil?
  end
end
