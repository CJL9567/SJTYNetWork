//
//  JWT.h
//  Pods
//
//  Created by sjty on 2026/5/19.
//


// Coding
#import "JWTCoding.h"
#import "JWTCoding+ResultTypes.h"
#import "JWTCoding+VersionOne.h"
#import "JWTCoding+VersionTwo.h"
#import "JWTCoding+VersionThree.h"

// Algorithms
#import "JWTAlgorithm.h"
#import "JWTRSAlgorithm.h"
#import "JWTAlgorithmFactory.h"
#import "JWTAlgorithmNone.h"
#import "JWTAlgorithmHSBase.h"
#import "JWTAlgorithmRSBase.h"
#import "JWTAlgorithmESBase.h"
#import "JWTAlgorithmAsymmetricBase.h"

// Holders
#import "JWTAlgorithmDataHolder.h"
#import "JWTAlgorithmDataHolderChain.h"

// Claims
#import "JWTClaimsSet.h"
#import "JWTClaim.h"
#import "JWTClaimsSetSerializer.h"
#import "JWTClaimsSetVerifier.h"

// New Claims
#import "JWTClaimsSetsProtocols.h"
#import "JWTClaimBase.h"
#import "JWTClaimVariations.h"
#import "JWTClaimSerializerBase.h"
#import "JWTClaimSerializerVariations.h"
#import "JWTClaimVerifierBase.h"
#import "JWTClaimVerifierVariations.h"
#import "JWTClaimsSetBase.h"
#import "JWTClaimsSetSerializerBase.h"
#import "JWTClaimsSetVerifierBase.h"
#import "JWTClaimsProviderBase.h"
#import "JWTClaimsSetCoordinatorBase.h"
#import "JWTClaimsSetDSLBase.h"

// Supplement
#import "JWTDeprecations.h"
#import "JWTBase64Coder.h"
#import "JWTErrorDescription.h"

// Crypto
#import "JWTCryptoKey.h"
#import "JWTCryptoKeyExtractor.h"
#import "JWTCryptoSecurity.h"
#import "JWTCryptoSecurity+ErrorHandling.h"
#import "JWTCryptoSecurity+ExternalRepresentation.h"
#import "JWTCryptoSecurity+Extraction.h"

// Fluent ( Objective-C exclusive ).
#if DEPLOYMENT_RUNTIME_SWIFT
#else
#import "JWTBuilder+FluentStyle.h"
#import "JWTCodingBuilder+FluentStyle.h"
#import "JWTAlgorithmDataHolder+FluentStyle.h"
#import "JWTCryptoKeyExtractor+FluentStyle.h"
#endif
