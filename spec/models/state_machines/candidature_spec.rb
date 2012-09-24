require 'spec_helper'

class I18n::Backend::Simple
  def public_translations
    translations
  end
end

describe Candidature do
  describe 'validations' do
    it 'considers the vacancy limit on accept transition' do
      subject = Factory(:candidature, state: 'accepted')
      second_candidature = Factory.build(:candidature, vacancy_id: subject.vacancy_id, state: 'new')
      second_candidature.accept
      second_candidature.errors.messages[:state].length.should == 1
    end
  end
end