# singleton-ruby-class
A singleton class, implemented to act as a parent for singleton classes in my projects

##### Preventing Derivatives
in this class I have tried to make sure derivatives can't implement their own class methods; new, and allocate, also the same applies for the instance methods; clone and dup.

It should be sufficient for almost any singleton pattern usage, but I believe its still not thread safe.

