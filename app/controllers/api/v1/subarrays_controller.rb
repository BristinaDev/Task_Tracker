class Api::V1::SubarraysController < ApplicationController
	skip_before_action :verify_authenticity_token

	def max_sum
		input_array = params[:array]

		if input_array.nil? || !input_array.is_a?(Array)
			render json: { error: 'Please provide an array of integers.' }, status: :unprocessable_entity
			return
		end

		arr_result = find_max_subarray(input_array.map(&:to_i))
		render json: { subarray: arr_result }
  end

	private
  def find_max_subarray(nums)
    return [] if nums.empty?

    max_sum = nums[0]
    current_sum = nums[0]
    start_index = 0
    end_index = 0
    current_start_index = 0

    (1...nums.length).each do |i|
      if nums[i] > current_sum + nums[i]
        current_sum = nums[i]
        current_start_index = i
      else
        current_sum += nums[i]
      end

      if current_sum > max_sum
        max_sum = current_sum
        start_index = current_start_index
        end_index = i
      end
    end

    nums[start_index..end_index]
  end
end