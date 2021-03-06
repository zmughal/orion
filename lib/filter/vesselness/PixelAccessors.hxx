/*=========================================================================

  Program:   Insight Segmentation & Registration Toolkit
  Module:    $RCSfile: PixelAccessors.hxx,v $
  Language:  C++
  Date:      $Date: 2005/06/13 13:48:10 $
  Version:   $Revision: 1.1 $

  Copyright (c) 2002 Insight Consortium. All rights reserved.
  See ITKCopyright.txt or http://www.itk.org/HTML/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notices for more information.

=========================================================================*/
#ifndef __PixelAccessors_h
#define __PixelAccessors_h

// Eigenvalue pixel accessor to access vector of eigen value pixels
// as individual images
template< class TPixel >
class EigenValueAccessor
{
public:
  typedef TPixel                     InternalType;
  typedef float                      ExternalType;

  inline ExternalType Get( const InternalType & input ) const
    {
      return static_cast<ExternalType>( input[m_EigenIdx] );
    }

  void SetEigenIdx( unsigned int i )
    {
    this->m_EigenIdx = i;
    }

private:
  unsigned int m_EigenIdx;
};


// Functor to get trace of the hessian matrix (laplacian of the image )
namespace Functor {

template< typename TInput, typename TOutput >
class HessianToLaplacianFunction
{
public:
  typedef typename TInput::RealValueType  RealValueType;
  HessianToLaplacianFunction() {}
  ~HessianToLaplacianFunction() {}

  inline TOutput operator()( const TInput & x ) const
    {
    return static_cast< TOutput >( x(0,0) + x(1,1) + x(2,2) );
    }
};

}

#endif
