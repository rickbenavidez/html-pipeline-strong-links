require 'spec_helper'

describe HTML::Pipeline::StrongLinks do
  subject { HTML::Pipeline::StrongLinksFilter }
  let(:good_html) { '<a href="https://blog.leanstack.com/">LEANSTACK</a>' }
  let(:bad_html) { '<a href="javascript:void(0);">Bad Stuff</a>' }

  it 'has a version number' do
    expect(HTML::Pipeline::StrongLinks::VERSION).not_to be nil
  end

  context "good links" do
    it "updates links" do
      expect(subject.to_html(good_html).to_s).to eq('<a href="https://blog.leanstack.com/" rel="noopener noreferrer" target="_blank" data-turbo="false">LEANSTACK</a>')
    end
  end

  context "bad links" do
    it "should strip the anchor tag completely" do
      expect(subject.to_html(bad_html)).to eq('Bad Stuff')
    end
  end
end
