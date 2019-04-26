# == Schema Information
#
# Table name: final_projects
#
#  id            :integer          not null, primary key
#  student_id    :integer          not null
#  supervisor_id :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FinalProject < ApplicationRecord

    belongs_to :student,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Developer
    
    belongs_to :supervisor,
        primary_key: :id,
        foreign_key: :supervisor_id,
        class_name: :TeachingAssistantMembership

    has_many :technology_memberships,
        primary_key: :id,
        foreign_key: :technology_id,
        class_name: :TechnologyMembership
end
