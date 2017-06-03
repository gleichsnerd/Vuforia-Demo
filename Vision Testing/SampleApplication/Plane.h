//
//  Plane.h
//  Vision Testing
//
//  Created by Adam Gleichsner on 12/21/14.
//  Copyright (c) 2014 Lufthouse, Inc. All rights reserved.
//

#
#ifndef _LH_PLANE_OBJECT_H_
#define _LH_PLANE_OBJECT_H_


#define NUM_PLANE_OBJECT_VERTEX 4
#define NUM_PLANE_OBJECT_INDEX 6

static const float planeVerticesDeprecated[] =
{
    -300.0f, -382.5f, 0.0f, //bottom-left corner
    300.0f, -382.5f, 0.0f, //bottom-right corner
    300.0f, 382.5f, 0.0f, //top-right corner
    -300.0f, 382.5f, 0.0f //top-left corner
};
static const float planeTexCoords[] =
{
    0.0, 0.0,
    1.0, 0.0,
    1.0, 1.0,
    0.0, 1.0
};
static const float planeNormals[] =
{
    0.0f, 0.0f, 1.0f, //normal at bottom-left corner
    0.0f, 0.0f, 1.0f, //normal at bottom-right corner
    0.0f, 0.0f, 1.0f, //normal at top-right corner
    0.0f, 0.0f, 1.0f  //normal at top-left corner
};
static const unsigned short planeIndices[] =
{
    0, 1, 2, // triangle 1
    2, 3, 0 // triangle 2
};


#endif
