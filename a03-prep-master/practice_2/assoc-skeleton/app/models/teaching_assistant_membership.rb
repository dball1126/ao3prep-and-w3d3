# == Schema Information
#
# Table name: teaching_assistant_memberships
#
#  id                    :integer          not null, primary key
#  teaching_assistant_id :integer          not null
#  pod_id                :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class TeachingAssistantMembership < ApplicationRecord


    has_many :pods,
        primary_key: :id,
        foreign_key: :student_circle_id,
        class_name: :developers
end
