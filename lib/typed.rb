require_relative 'exceptions'
require_relative 'before_and_after'

class TypedConditionError < ValidationError
  def initialize(msg="typed")
    super
  end
end

class Module
	def typed(params_map, return_type)
		#before method verify parameters types
		pre {	params_map.each do |param_name, param_type|
					raise TypedConditionError unless self.send(param_name).is_a?(param_type)
				end }
		#after method verify return type
		post { |result| raise TypedConditionError unless result.is_a? return_type }
	end
end
