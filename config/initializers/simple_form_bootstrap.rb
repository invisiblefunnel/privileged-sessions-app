# **This is a modified version of what SimpleForm generates**

# CREDIT: https://gist.github.com/clyfe/6304508
#         https://gist.github.com/exAspArk/7151072

# FYI we don't 'form-control' class on all input types - checkboxes for example.
# Otherwise we could use:
#   config.input_class  = 'form-control'
[
  SimpleForm::Inputs::CollectionSelectInput,
  SimpleForm::Inputs::DateTimeInput,
  SimpleForm::Inputs::FileInput,
  SimpleForm::Inputs::GroupedCollectionSelectInput,
  SimpleForm::Inputs::NumericInput,
  SimpleForm::Inputs::PasswordInput,
  SimpleForm::Inputs::RangeInput,
  SimpleForm::Inputs::StringInput,
  SimpleForm::Inputs::TextInput
].each do |klass|
  klass.class_eval do
    def input_html_classes
      super.push('form-control')
    end
  end
end

SimpleForm.setup do |config|
  config.boolean_style = :nested
  
  config.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error',
      defaults: { input_html: { class: 'default_class' } } do |b|
    
    b.use :html5
    
    b.use :min_max
    b.use :maxlength
    b.use :placeholder
    b.optional :pattern
    b.optional :readonly
    
    b.use :label_input
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  config.wrappers :prepend, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com/)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap3
  config.button_class = 'btn'
end
