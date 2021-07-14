Class {
	#name : #WAOpenGraphImage,
	#superclass : #WAOpenGraphProperty,
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #extras }
WAOpenGraphImage >> alt: aString [

	self extraAt: 'alt' put: aString
]

{ #category : #extras }
WAOpenGraphImage >> height: anInteger [ 

	self extraAt: 'height' put: anInteger
]

{ #category : #initialization }
WAOpenGraphImage >> propertyName [

	^ 'image'
]

{ #category : #extras }
WAOpenGraphImage >> secureUrl: aString [

	self extraAt: 'secure_url' put: aString
]

{ #category : #initialization }
WAOpenGraphImage >> url: aString [

	self extraAt: 'url' put: aString
]

{ #category : #extras }
WAOpenGraphImage >> width: anInteger [

	self extraAt: 'width' put: anInteger
]
