require 'spec_helper'

describe Project do
  describe 'callbacks' do
    describe '#include_areas_of_product' do
      it 'includes areas of product before validation' do     
        subject = Factory.build(:project)
        subject.product_id = Factory(:product, area_ids: [Factory(:area, name: 'Area2').id]).id
        area_ids_before = subject.area_ids
        subject.save!
        subject.area_ids.should == area_ids_before + subject.product.area_ids
      end
    end
  end
end