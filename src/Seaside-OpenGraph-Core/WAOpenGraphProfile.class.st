"
profile:first_name - string - A name normally given to an individual by a parent or self-chosen.
profile:last_name - string - A name inherited from a family or marriage and by which the individual is commonly known.
profile:username - string - A short unique string to identify them.
profile:gender - enum(male, female) - Their gender.
"
Class {
	#name : #WAOpenGraphProfile,
	#superclass : #WAOpenGraphType,
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #accessing }
WAOpenGraphProfile >> firstName: aString [
	
	self extraAt: 'first_name' put: aString
]

{ #category : #accessing }
WAOpenGraphProfile >> gender: aString [
	"NOTE: aString must be either 'male' or 'female'."
	
	self extraAt: 'gender' put: aString
]

{ #category : #accessing }
WAOpenGraphProfile >> lastName: aString [
	
	self extraAt: 'last_name' put: aString
]

{ #category : #accessing }
WAOpenGraphProfile >> username: aString [
	
	self extraAt: 'username' put: aString
]
