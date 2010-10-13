module ComposerHelper
  def link_to_composer(composer)
     link_to(composer.whole_name,
             :controller => "composer",
             :action     => "show",
             :id         => composer.id)
   end
end
