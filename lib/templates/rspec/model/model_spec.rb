require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe <%= class_name %>, type: :model do
  context 'associations' do
    <%- attributes.each do |attribute| -%>
      <%- if attribute.reference? -%>
    it { is_expected.to belong_to(:<%= attribute.name %>) }
      <%- end -%>
    <%- end -%>
  end

  context 'model validations' do
  end

  context 'table fields' do
    <%- attributes.each do |attribute| -%>
      <%- if attribute.reference? -%>
    it { is_expected.to have_db_column(:<%= attribute.name %>_id).of_type(:integer) }
      <%- else -%>
    it { is_expected.to have_db_column(:<%= attribute.name %>).of_type(:<%= attribute.type %>) }
      <%- end -%>
    <%- end -%>
  end

  context 'table indexes' do
    <%- attributes.each do |attribute| -%>
      <%- if attribute.reference? -%>
    it { is_expected.to have_db_index(:<%= attribute.name %>_id) }
      <%- end -%>
    <%- end -%>
  end

  context 'factories' do
    it { expect(build(:<%= class_name.to_s.underscore %>)).to be_valid }
    it { expect(build(:invalid_<%= class_name.to_s.underscore %>)).to_not be_valid }
  end
end
<% end -%>
