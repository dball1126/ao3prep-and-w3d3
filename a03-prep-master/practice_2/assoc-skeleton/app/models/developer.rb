# == Schema Information
#
# Table name: developers
#
#  id                :integer          not null, primary key
#  student_pod_id    :integer
#  student_circle_id :integer
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Developer < ApplicationRecord

    belongs_to :circle,
        primary_key: :id,
        foreign_key: :student_circle_id,
        class_name: :Circle
    
    def final_project
    end
end
