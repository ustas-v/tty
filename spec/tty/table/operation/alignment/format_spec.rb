# encoding: utf-8

require 'spec_helper'

describe TTY::Table::Operation::Alignment, '#new' do
  let(:object) { described_class.new alignment }
  let(:field) { "aaaa"}
  let(:space) { '' }
  let(:column_width) { 8 }

  subject { object.format field, column_width, space }

  shared_examples_for 'lower column width' do
    let(:column_width) { 2 }

    it { is_expected.to eql(field) }
  end

  context 'left aligend' do
    let(:alignment) { :left }

    it { is_expected.to eq(field + '    ') }

    it_should_behave_like 'lower column width'
  end

  context 'center aligned' do
    let(:alignment) { :center }

    it { is_expected.to eql('  ' + field + '  ') }

    it_should_behave_like 'lower column width'
  end

  context 'right aligned' do
    let(:alignment) { :right }

    it_should_behave_like 'lower column width'
  end

  context 'with space' do
    let(:alignment) { :center }
    let(:space) { ' '}

    it { is_expected.to  eql('  ' + field + '   ') }
  end
end
