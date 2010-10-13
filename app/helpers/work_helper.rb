module WorkHelper
  def link_to_work(work)
    link_to(work.nice_title,
               :controller => "work",
               :action     => "show",
               :id         => work.id)
  end
end
