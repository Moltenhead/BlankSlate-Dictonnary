ACCENTS_LIST = %w[é è ê ë à â ô î ï û ç].freeze
CHAR_LIST = [
  ('a'..'Z'),
  ('A'..'Z'),
  ACCENTS_LIST,
  ACCENTS_LIST.map(&:upcase),
  ' ',
  %w[_ - ' "],
].flatten.freeze

def rand_str
  rand(32).times.map { CHAR_LIST.sample }.join
end

def rand_int
  rand(8**8)
end

def rand_float
  rand(0.0..(8**8).to_f)
end

def rand_bool
  [true, false].sample
end

def rand_of_type type
  case type
  when :string
    rand_str
  when :integer
    rand_int
  when :float
    rand_float
  when :boolean
    rand_blood
  when :strings
    rand(32).times.map { rand_str }
  when :integers
    rand(32).times.map { rand_int }
  when :floats
    rand(32).times.map { rand_float }
  when :booleans
    rand(32).times.map { rand_bool }
  end
end

def json
  JSON.parse(response.body, symbolize_names: true)
end
