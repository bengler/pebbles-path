require 'pebbles-path/positions'

describe Pebbles::Path::Positions do
  subject { Pebbles::Path::Positions }

  let(:full_path) do
    {
      :label_0 => "a",
      :label_1 => "b",
      :label_2 => "c",
      :label_3 => "d",
      :label_4 => "e",
      :label_5 => "f",
      :label_6 => "g",
      :label_7 => "h",
      :label_8 => "i",
      :label_9 => "j",
    }
  end

  describe "#to_conditions" do

    it 'return {} for nil path' do
      subject.to_conditions(nil).should eq({})
    end

    it 'return {} for *' do
      subject.to_conditions('*').should eq({})
    end

    specify do
      subject.to_conditions("a.b.c.d.e.f.g.h.i.j").should eq(full_path)
    end

    specify do
      subject.to_conditions("a.b.c").should eq({:label_0=>"a", :label_1=>"b", :label_2=>"c", :label_3=>nil})
    end

    specify do
      subject.to_conditions("a.b.*").should eq({:label_0=>"a", :label_1=>"b"})
    end

    specify do
      subject.to_conditions("a.^b.c").should eq({:label_0=>"a", :label_1=>["b", nil], :label_2=>["c", nil], :label_3=>nil})
    end

    specify do
      subject.to_conditions("a.b|c.d").should eq({:label_0=>"a", :label_1=>["b", "c"], :label_2=>"d", :label_3=>nil})
    end

  end

end
