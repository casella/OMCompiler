/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-CurrentYear, Linköping University,
 * Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3
 * AND THIS OSMC PUBLIC LICENSE (OSMC-PL).
 * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES RECIPIENT'S
 * ACCEPTANCE OF THE OSMC PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Linköping University, either from the above address,
 * from the URLs: http://www.ida.liu.se/projects/OpenModelica or
 * http://www.openmodelica.org, and in the OpenModelica distribution.
 * GNU version 3 is obtained from: http://www.gnu.org/copyleft/gpl.html.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */


/*

 Mahder.Gebremedhin@liu.se  2012-08-23

*/

// package ParModelica

parallel function oclGetWorkDim
  output Integer dim;
  external "builtin";
end oclGetWorkDim;

parallel function oclGetGlobalSize
  input Integer dim;
  output Integer size;
  external "builtin";
end oclGetGlobalSize;

parallel function oclGetGlobalId
  input Integer dim;
  output Integer id;
  external "builtin";
end oclGetGlobalId;

parallel function oclGetLocalSize
  input Integer dim;
  output Integer size;
  external "builtin";
end oclGetLocalSize;

parallel function oclGetLocalId
  input Integer dim;
  output Integer id;
  external "builtin";
end oclGetLocalId;

parallel function oclGetNumGroups
  input Integer dim;
  output Integer num;
  external "builtin";
end oclGetNumGroups;

parallel function oclGetGroupId
  input Integer dim;
  output Integer id;
  external "builtin";
end oclGetGroupId;

parallel function oclGlobalBarrier
  external "builtin";
end oclGlobalBarrier;

function oclSetNumThreadsOnlyGlobal
  input Integer num_threads;
  external "builtin";
end oclSetNumThreadsOnlyGlobal;

function oclSetNumThreadsGlobalLocal
  input Integer global_num_threads;
  input Integer local_num_threads;
  external "builtin";
end oclSetNumThreadsGlobalLocal;

function oclSetNumThreadsGlobalLocal1D
  input Integer[1] global_num_threads;
  input Integer[1] local_num_threads;
  external "builtin";
end oclSetNumThreadsGlobalLocal1D;

function oclSetNumThreadsGlobalLocal2D
  input Integer[2] global_num_threads;
  input Integer[2] local_num_threads;
  external "builtin";
end oclSetNumThreadsGlobalLocal2D;

function oclSetNumThreadsGlobalLocal3D
  input Integer[3] global_num_threads;
  input Integer[3] local_num_threads;
  external "builtin";
end oclSetNumThreadsGlobalLocal3D;

function oclSetNumThreadsGlobalLocalError
  input Integer[:] global_num_threads;
  input Integer[:] local_num_threads;
  external "builtin";
end oclSetNumThreadsGlobalLocalError;

function oclSetNumThreads = $overload(
  oclSetNumThreadsOnlyGlobal,
  oclSetNumThreadsGlobalLocal1D,
  oclSetNumThreadsGlobalLocal2D,
  oclSetNumThreadsGlobalLocal3D
  );




encapsulated package OpenCL

  function matrixMult
    parglobal input Integer A[:,:];
    parglobal input Integer B[:,:];
    parglobal output Integer C[:,:];
    external "builtin";
  end matrixMult;

  function matrixTranspose
    parglobal input Integer A[:,:];
    parglobal output Integer B[:,:];
    external "builtin";
  end matrixTranspose;

end OpenCL;

// end ParModelica;
