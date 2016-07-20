module ApplicationHelper
  
  def units_of_measure
    [['Each', 'EA'], ['Pound', 'LB'], ['Net Ton', 'NT'], ['Short Ton', 'ST'], ['Gross Ton', 'GT'], ['Kilogram', 'KG'], ['Hundred Weight', 'CW'], ['Metric Ton', 'MT'], ['Load', 'LD']]
  end
  
  def units_of_measure_hash
    Hash[units_of_measure]
  end
  
end