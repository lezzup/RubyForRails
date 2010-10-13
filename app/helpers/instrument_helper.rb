module InstrumentHelper
  def link_to_instrument(instrument)
      link_to instrument.name,
           :controller => "instrument",
           :action     => "show",
           :id         => instrument.id
    end
end
