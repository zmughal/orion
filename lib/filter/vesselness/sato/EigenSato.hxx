
//Here goes the header for the Sato Function
// This is start of the header guard.  ADD_H can be any unique name.  By convention, we use the name of the header file.
#ifndef EIGENSATO_H
#define EIGENSATO_H

#include "itkImage.h"
#include "itkCastImageFilter.h"
#include "itkCurvatureFlowImageFilter.h"

#include "itkGradientMagnitudeRecursiveGaussianImageFilter.h"
#include "itkHessianRecursiveGaussianImageFilter.h"
#include "itkImageAdaptor.h"
#include "PixelAccessors.hxx"
#include "itkSymmetricEigenAnalysisImageFilter.h"
#include "itkCastImageFilter.h"

#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

#include "FilterCommon.hxx"

// This is the content of the .h file, which is where the declarations go
OutputImageArrayType ComputeSato( const InternalImageType::Pointer inputVolume, float sigma ); // function prototype for add.h -- don't forget the semicolon!

// This is the end of the header guard
#endif
