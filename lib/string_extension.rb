# encoding: utf-8

class StringExtension
  def self.downcase(str)
    str.downcase.tr('ÅÄÖ', 'åäö')
  end

  def self.upcase(str)
    str.upcase.tr('åäö', 'ÅÄÖ')
  end

  def self.capitalize(str)
    s = str.capitalize
    s[0, 1] = StringExtension.upcase(s[0, 1])
    s
  end

  def self.underscore(str)
    StringExtension.downcase(
      str.gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      .gsub(/([a-z\d])([A-Z])/,'\1_\2')
      .tr("-", "_")
      .tr(" ", "_")
      .downcase
    )
    .tr('åäö', 'aao')
  end
end
