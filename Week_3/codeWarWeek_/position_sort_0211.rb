# frozen_string_literal: true

def job_position
  {
    'tonggiamdoc' => 0,
    'giamdoc' => 1,
    'truongphong' => 2,
    'nhanvienvp' => 3,
    'nhanviensale' => 4
  }
end

def check_position(position)
  return -1 if position.empty? 

  hash_position = position.map do |value|
    sorted(value)
  end
  sorted_hash_position = hash_position.sort_by { |hash| hash[:sum] }

  sorted_hash_position.map { |hash| hash.reject { |key| key == :sum } }
end

def sorted(value)
  sorted_positions = value[:positions].sort_by { |pos| job_position[pos] }
  sum = sorted_positions.map { |value_position| job_position[value_position] }.sum
  { id: value[:id], positions: sorted_positions, sum: sum }
end

