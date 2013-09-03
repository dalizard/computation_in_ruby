class NFADesign < Struct.new :start_state, :accept_states, :rulebook
  def to_nfa(current_states = Set[start_state])
    NFA.new current_states, accept_states, rulebook
  end

  def accepts? string
    to_nfa.tap { |nfa| nfa.read_string string }.accepting?
  end
end
