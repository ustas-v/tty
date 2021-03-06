# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Shell, '.error' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:color)  { Pastel.new(enabled: true) }

  subject(:shell) { TTY::Shell.new(input, output) }

  before { allow(Pastel).to receive(:new).and_return(color) }

  after { output.rewind }

  it 'displays one message' do
    shell.error "Nothing is fine!"
    expect(output.string).to eql "\e[31mNothing is fine!\e[0m\n"
  end

  it 'displays many messages' do
    shell.error "Nothing is fine!", "All is broken!"
    expect(output.string).to eql "\e[31mNothing is fine!\e[0m\n\e[31mAll is broken!\e[0m\n"
  end

  it 'displays message with option' do
    shell.error "Nothing is fine!", :newline => false
    expect(output.string).to eql "\e[31mNothing is fine!\e[0m"
  end
end # error
