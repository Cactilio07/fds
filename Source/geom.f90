
!  +++++++++++++++++++++++ COMPLEX_GEOMETRY ++++++++++++++++++++++++++


! Routines related to unstructured geometry and computational geometry engine.
!
! MKL Solver, defined in makefile:
#ifdef WITH_MKL
!!! #include "mkl_pardiso.f90"
#define __MKL_PARDISO_F90
MODULE MKL_PARDISO_PRIVATE
  TYPE MKL_PARDISO_HANDLE; INTEGER(KIND=8) DUMMY; END TYPE
  INTEGER, PARAMETER :: PARDISO_OOC_FILE_NAME = 1
END MODULE MKL_PARDISO_PRIVATE
MODULE MKL_PARDISO
  USE MKL_PARDISO_PRIVATE
  INTERFACE PARDISO
     SUBROUTINE PARDISO_D( PT, MAXFCT, MNUM, MTYPE, PHASE, N, A, IA, JA, PERM, NRHS, IPARM, MSGLVL, B, X, ERROR )
       USE MKL_PARDISO_PRIVATE
       TYPE(MKL_PARDISO_HANDLE), INTENT(INOUT) :: PT(*)
       INTEGER,          INTENT(IN)    :: MAXFCT
       INTEGER,          INTENT(IN)    :: MNUM
       INTEGER,          INTENT(IN)    :: MTYPE
       INTEGER,          INTENT(IN)    :: PHASE
       INTEGER,          INTENT(IN)    :: N
       INTEGER,          INTENT(IN)    :: IA(*)
       INTEGER,          INTENT(IN)    :: JA(*)
       INTEGER,          INTENT(INOUT) :: PERM(*)
       INTEGER,          INTENT(IN)    :: NRHS
       INTEGER,          INTENT(INOUT) :: IPARM(*)
       INTEGER,          INTENT(IN)    :: MSGLVL
       INTEGER,          INTENT(OUT)   :: ERROR
       REAL(KIND=8),     INTENT(IN)    :: A(*)
       REAL(KIND=8),     INTENT(INOUT) :: B(*)
       REAL(KIND=8),     INTENT(OUT)   :: X(*)
     END SUBROUTINE PARDISO_D

     SUBROUTINE PARDISO_S( PT, MAXFCT, MNUM, MTYPE, PHASE, N, A, IA, JA, PERM, NRHS, IPARM, MSGLVL, B, X, ERROR )
       USE MKL_PARDISO_PRIVATE
       TYPE(MKL_PARDISO_HANDLE), INTENT(INOUT) :: PT(*)
       INTEGER,          INTENT(IN)    :: MAXFCT
       INTEGER,          INTENT(IN)    :: MNUM
       INTEGER,          INTENT(IN)    :: MTYPE
       INTEGER,          INTENT(IN)    :: PHASE
       INTEGER,          INTENT(IN)    :: N
       INTEGER,          INTENT(IN)    :: IA(*)
       INTEGER,          INTENT(IN)    :: JA(*)
       INTEGER,          INTENT(INOUT) :: PERM(*)
       INTEGER,          INTENT(IN)    :: NRHS
       INTEGER,          INTENT(INOUT) :: IPARM(*)
       INTEGER,          INTENT(IN)    :: MSGLVL
       INTEGER,          INTENT(OUT)   :: ERROR
       REAL(KIND=4),     INTENT(IN)    :: A(*)
       REAL(KIND=4),     INTENT(INOUT) :: B(*)
       REAL(KIND=4),     INTENT(OUT)   :: X(*)
     END SUBROUTINE PARDISO_S

     SUBROUTINE PARDISO_D_2D( PT, MAXFCT, MNUM, MTYPE, PHASE, N, A, IA, JA, PERM, NRHS, IPARM, MSGLVL, B, X, ERROR )
       USE MKL_PARDISO_PRIVATE
       TYPE(MKL_PARDISO_HANDLE), INTENT(INOUT) :: PT(*)
       INTEGER,          INTENT(IN)    :: MAXFCT
       INTEGER,          INTENT(IN)    :: MNUM
       INTEGER,          INTENT(IN)    :: MTYPE
       INTEGER,          INTENT(IN)    :: PHASE
       INTEGER,          INTENT(IN)    :: N
       INTEGER,          INTENT(IN)    :: IA(*)
       INTEGER,          INTENT(IN)    :: JA(*)
       INTEGER,          INTENT(INOUT) :: PERM(*)
       INTEGER,          INTENT(IN)    :: NRHS
       INTEGER,          INTENT(INOUT) :: IPARM(*)
       INTEGER,          INTENT(IN)    :: MSGLVL
       INTEGER,          INTENT(OUT)   :: ERROR
       REAL(KIND=8),     INTENT(IN)    :: A(*)
       REAL(KIND=8),     INTENT(INOUT) :: B(N,*)
       REAL(KIND=8),     INTENT(OUT)   :: X(N,*)
     END SUBROUTINE PARDISO_D_2D

     SUBROUTINE PARDISO_S_2D( PT, MAXFCT, MNUM, MTYPE, PHASE, N, A, IA, JA, PERM, NRHS, IPARM, MSGLVL, B, X, ERROR )
       USE MKL_PARDISO_PRIVATE
       TYPE(MKL_PARDISO_HANDLE), INTENT(INOUT) :: PT(*)
       INTEGER,          INTENT(IN)    :: MAXFCT
       INTEGER,          INTENT(IN)    :: MNUM
       INTEGER,          INTENT(IN)    :: MTYPE
       INTEGER,          INTENT(IN)    :: PHASE
       INTEGER,          INTENT(IN)    :: N
       INTEGER,          INTENT(IN)    :: IA(*)
       INTEGER,          INTENT(IN)    :: JA(*)
       INTEGER,          INTENT(INOUT) :: PERM(*)
       INTEGER,          INTENT(IN)    :: NRHS
       INTEGER,          INTENT(INOUT) :: IPARM(*)
       INTEGER,          INTENT(IN)    :: MSGLVL
       INTEGER,          INTENT(OUT)   :: ERROR
       REAL(KIND=4),     INTENT(IN)    :: A(*)
       REAL(KIND=4),     INTENT(INOUT) :: B(N,*)
       REAL(KIND=4),     INTENT(OUT)   :: X(N,*)
     END SUBROUTINE PARDISO_S_2D
  END INTERFACE
END MODULE MKL_PARDISO

!!! #include "mkl_cluster_sparse_solver.f90"
#define __MKL_CLUSTER_SPARSE_SOLVER_F90
MODULE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
  TYPE MKL_CLUSTER_SPARSE_SOLVER_HANDLE; INTEGER(KIND=8) DUMMY; END TYPE
END MODULE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
MODULE MKL_CLUSTER_SPARSE_SOLVER
  USE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
  INTERFACE CLUSTER_SPARSE_SOLVER
  SUBROUTINE CLUSTER_SPARSE_SOLVER_D(PT,MAXFCT,MNUM,MTYPE,PHASE,N,A,IA,JA,PERM,NRHS,IPARM,MSGLVL,B,X,COMM,ERROR)
    USE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
    USE MPI_F08
    TYPE(MKL_CLUSTER_SPARSE_SOLVER_HANDLE), INTENT(INOUT) :: PT(*)
    INTEGER,          INTENT(IN)    :: MAXFCT
    INTEGER,          INTENT(IN)    :: MNUM
    INTEGER,          INTENT(IN)    :: MTYPE
    INTEGER,          INTENT(IN)    :: PHASE
    INTEGER,          INTENT(IN)    :: N
    INTEGER,          INTENT(IN)    :: IA(*)
    INTEGER,          INTENT(IN)    :: JA(*)
    INTEGER,          INTENT(IN)    :: PERM(*)
    INTEGER,          INTENT(IN)    :: NRHS
    INTEGER,          INTENT(INOUT) :: IPARM(*)
    INTEGER,          INTENT(IN)    :: MSGLVL
    INTEGER,          INTENT(OUT)   :: ERROR
    REAL(KIND=8),     INTENT(IN)    :: A(*)
    REAL(KIND=8),     INTENT(INOUT) :: B(*)
    REAL(KIND=8),     INTENT(OUT)   :: X(*)
    TYPE (MPI_COMM),  INTENT(IN)    :: COMM
  END SUBROUTINE CLUSTER_SPARSE_SOLVER_D

  SUBROUTINE CLUSTER_SPARSE_SOLVER_S(PT,MAXFCT,MNUM,MTYPE,PHASE,N,A,IA,JA,PERM,NRHS,IPARM,MSGLVL,B,X,COMM,ERROR)
    USE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
    USE MPI_F08
    TYPE(MKL_CLUSTER_SPARSE_SOLVER_HANDLE), INTENT(INOUT) :: PT(*)
    INTEGER,          INTENT(IN)    :: MAXFCT
    INTEGER,          INTENT(IN)    :: MNUM
    INTEGER,          INTENT(IN)    :: MTYPE
    INTEGER,          INTENT(IN)    :: PHASE
    INTEGER,          INTENT(IN)    :: N
    INTEGER,          INTENT(IN)    :: IA(*)
    INTEGER,          INTENT(IN)    :: JA(*)
    INTEGER,          INTENT(IN)    :: PERM(*)
    INTEGER,          INTENT(IN)    :: NRHS
    INTEGER,          INTENT(INOUT) :: IPARM(*)
    INTEGER,          INTENT(IN)    :: MSGLVL
    INTEGER,          INTENT(OUT)   :: ERROR
    REAL(KIND=4),     INTENT(IN)    :: A(*)
    REAL(KIND=4),     INTENT(INOUT) :: B(*)
    REAL(KIND=4),     INTENT(OUT)   :: X(*)
    TYPE (MPI_COMM),  INTENT(IN)    :: COMM
  END SUBROUTINE CLUSTER_SPARSE_SOLVER_S

  SUBROUTINE CLUSTER_SPARSE_SOLVER_D_2D(PT,MAXFCT,MNUM,MTYPE,PHASE,N,A,IA,JA,PERM,NRHS,IPARM,MSGLVL,B,X,COMM,ERROR)
    USE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
    USE MPI_F08
    TYPE(MKL_CLUSTER_SPARSE_SOLVER_HANDLE), INTENT(INOUT) :: PT(*)
    INTEGER,          INTENT(IN)    :: MAXFCT
    INTEGER,          INTENT(IN)    :: MNUM
    INTEGER,          INTENT(IN)    :: MTYPE
    INTEGER,          INTENT(IN)    :: PHASE
    INTEGER,          INTENT(IN)    :: N
    INTEGER,          INTENT(IN)    :: IA(*)
    INTEGER,          INTENT(IN)    :: JA(*)
    INTEGER,          INTENT(IN)    :: PERM(*)
    INTEGER,          INTENT(IN)    :: NRHS
    INTEGER,          INTENT(INOUT) :: IPARM(*)
    INTEGER,          INTENT(IN)    :: MSGLVL
    INTEGER,          INTENT(OUT)   :: ERROR
    REAL(KIND=8),     INTENT(IN)    :: A(*)
    REAL(KIND=8),     INTENT(INOUT) :: B(N,*)
    REAL(KIND=8),     INTENT(OUT)   :: X(N,*)
    TYPE (MPI_COMM),  INTENT(IN)    :: COMM
  END SUBROUTINE CLUSTER_SPARSE_SOLVER_D_2D

  SUBROUTINE CLUSTER_SPARSE_SOLVER_S_2D(PT,MAXFCT,MNUM,MTYPE,PHASE,N,A,IA,JA,PERM,NRHS,IPARM,MSGLVL,B,X,COMM,ERROR)
    USE MKL_CLUSTER_SPARSE_SOLVER_PRIVATE
    USE MPI_F08
    TYPE(MKL_CLUSTER_SPARSE_SOLVER_HANDLE), INTENT(INOUT) :: PT(*)
    INTEGER,          INTENT(IN)    :: MAXFCT
    INTEGER,          INTENT(IN)    :: MNUM
    INTEGER,          INTENT(IN)    :: MTYPE
    INTEGER,          INTENT(IN)    :: PHASE
    INTEGER,          INTENT(IN)    :: N
    INTEGER,          INTENT(IN)    :: IA(*)
    INTEGER,          INTENT(IN)    :: JA(*)
    INTEGER,          INTENT(IN)    :: PERM(*)
    INTEGER,          INTENT(IN)    :: NRHS
    INTEGER,          INTENT(INOUT) :: IPARM(*)
    INTEGER,          INTENT(IN)    :: MSGLVL
    INTEGER,          INTENT(OUT)   :: ERROR
    REAL(KIND=4),     INTENT(IN)    :: A(*)
    REAL(KIND=4),     INTENT(INOUT) :: B(N,*)
    REAL(KIND=4),     INTENT(OUT)   :: X(N,*)
    TYPE (MPI_COMM),  INTENT(IN)    :: COMM
  END SUBROUTINE CLUSTER_SPARSE_SOLVER_S_2D

  END INTERFACE
END MODULE MKL_CLUSTER_SPARSE_SOLVER
#endif /* WITH_MKL */

MODULE COMPLEX_GEOMETRY

USE PRECISION_PARAMETERS
USE GLOBAL_CONSTANTS
USE MESH_VARIABLES
USE MESH_POINTERS
USE COMP_FUNCTIONS, ONLY: CHECKREAD,CHECK_XB,GET_FILE_NUMBER,SHUTDOWN,CURRENT_TIME
USE MEMORY_FUNCTIONS, ONLY: ChkMemErr
USE MPI_F08

#ifdef WITH_MKL
 USE MKL_CLUSTER_SPARSE_SOLVER
#endif /* WITH_MKL */

IMPLICIT NONE (TYPE,EXTERNAL)
CHARACTER(2*MESSAGE_LENGTH) :: MESSAGE

!! ---------------------------------------------------------------------------------
! Debug Parameter:
LOGICAL, PARAMETER :: DEBUG_SET_CUTCELLS = .FALSE.
INTEGER :: LU_DB_SETCC

! DIV_RESCALE_FLG : 0 Rescale divergence and velocity.
!                   1 Make cut-cell volume and cut-face areas Cartesian ones.
INTEGER, PARAMETER :: DIV_RESCALE_FLG = 0

!! ---------------------------------------------------------------------------------
! Start Variable declaration for CC_IBM:
! Local constants used on routines:
! INTEGER, PARAMETER :: QB = SELECTED_REAL_KIND(33,4931)  !< Precision of "Sixteen Byte" reals
! LOGICAL, PARAMETER :: DO_QUAD_PRECISION_CUTCELLS = .FALSE.
REAL(EB), SAVE :: GEOMEPS=1.E-12_EB
REAL(EB), SAVE :: LOOSEPS=1.E-6_EB
REAL(EB), PARAMETER :: GEOMQUALITYFCT=1000._EB ! Factor for GEOMs quality check
REAL(EB), PARAMETER :: GEOFCT=10._EB

INTEGER,  SAVE :: NGUARD= 6        ! Layers of guard-cells.
INTEGER,  SAVE ::CCGUARD= 6 - 2    ! Layers of guard cut-cells.
INTEGER,  PARAMETER :: FCELL = 1   ! Right face index.

! Media definition parameters:
INTEGER,  PARAMETER :: IBM_INBOUNDCC = -3
INTEGER,  PARAMETER :: IBM_INBOUNDCF = -2
INTEGER,  PARAMETER :: IBM_GASPHASE  = -1
INTEGER,  PARAMETER :: IBM_CUTCFE    =  0
INTEGER,  PARAMETER :: IBM_SOLID     =  1
INTEGER,  PARAMETER :: IBM_INBOUNDARY=  2
INTEGER,  PARAMETER :: IBM_UNDEFINED =-11

! Intersection type definition parameters:
INTEGER,  PARAMETER :: IBM_GG =  1 ! Gas - Gas intersection.
INTEGER,  PARAMETER :: IBM_SS =  3 ! Solid - Solid intersection.
INTEGER,  PARAMETER :: IBM_GS = -1 ! Gas to Solid intersection (as coordinate xi increases).
INTEGER,  PARAMETER :: IBM_SG =  5 ! Solid to Gas intersection (as coordinate xi increases).
INTEGER,  PARAMETER :: IBM_SGG= IBM_GG ! Single point GG intersection. Might not be needed.

! Constants used to identify variables on Eulerian grid arrays:
! Vertex centered variables:
INTEGER,  PARAMETER :: IBM_VGSC   = 1 ! Type of vertex media, IBM_GASPHASE or IBM_SOLID.
INTEGER,  PARAMETER :: IBM_NVVARS = 1 ! Number of vertex variables in MESHES(N)%IBM_VERTVAR.

! Cartesian Edge centered variables:
INTEGER,  PARAMETER :: IBM_EGSC   = 1 ! Edge media type: IBM_GASPHASE, IBM_SOLID or IBM_CUTCFE.
INTEGER,  PARAMETER :: IBM_IDCE   = 2 ! MESHES(N)%CUT_EDGE data struct entry index location.
INTEGER,  PARAMETER :: IBM_ECRS   = 3 ! MESHES(N)%EDGE_CROSS data struct entry index location.
INTEGER,  PARAMETER :: IBM_NEVARS = 3 ! Number of edge variables in MESHES(N)%ECVAR.

! Cartesian Face centered variables:
INTEGER,  PARAMETER :: IBM_FGSC   = 1 ! Face media type: IBM_GASPHASE, IBM_SOLID or IBM_CUTCFE.
!INTEGER, PARAMETER :: IBM_IDCE   = 2 ! MESHES(N)%CUT_EDGE data struct entry index location,
                                      ! IBM_INBOUNDCF type.
INTEGER,  PARAMETER :: IBM_IDCF   = 3 ! MESHES(N)%CUT_FACE data struct entry index location,
                                      ! IBM_INBOUNDCF type cut-faces.
INTEGER,  PARAMETER :: IBM_FFNF   = 4 ! Flag that defines if face is to be IB forced or not.
INTEGER,  PARAMETER :: IBM_IDRA   = 5 ! Integer ICF that defines RAD_FACE(ICF) position for radiation FVM.
INTEGER,  PARAMETER :: IBM_NFVARS = 5 ! Number of face variables in MESHES(N)%FCVAR.

! Cartesian Cell centered variables:
INTEGER,  PARAMETER :: IBM_CGSC   = 1 ! Face media type: IBM_GASPHASE, IBM_SOLID or IBM_CUTCFE.
!INTEGER, PARAMETER :: IBM_IDCE   = 2 ! MESHES(N)%CUT_EDGE data struct entry index location,
                                      ! cut edges in Cartesian cell.
!INTEGER, PARAMETER :: IBM_IDCF   = 3 ! MESHES(N)%CUT_FACE data struct entry index location,
                                      ! IBM_INBOUNDARY type cut-faces (and CFACEs) in Cartesian cell.
INTEGER,  PARAMETER :: IBM_IDCC   = 4 ! MESHES(N)%CUT_CELL data struct entry index location,
                                      ! cut-cells in Cartesian cell.
INTEGER,  PARAMETER :: IBM_UNKZ   = 5 ! Scalar indexing.
INTEGER,  PARAMETER :: IBM_UNKH   = 6 ! Pressure indexing.
INTEGER,  PARAMETER :: IBM_NCVARS = 6 ! Number of cell variables in MESHES(N)%CCVAR.

! Cut-faces types in FACE_LIST of CUT_CELL:
INTEGER, PARAMETER :: IBM_FTYPE_RGGAS = 0 ! This face of a cut-cell is a regular GASPHASE face.
INTEGER, PARAMETER :: IBM_FTYPE_CFGAS = 1 ! A GASPHASE cut-face or cell.
INTEGER, PARAMETER :: IBM_FTYPE_CFINB = 2 ! An INBOUNDARY cut-face.
INTEGER, PARAMETER :: IBM_FTYPE_SVERT = 3 ! A SOLID Vertex.
! Extra tagging parameters, for RESTRICT_EP:
INTEGER, PARAMETER :: IBM_FTYPE_RCGAS = 4 ! A Face between a regular cell and a cut-cell.
INTEGER, PARAMETER :: IBM_FTYPE_CCGAS = 5 ! A regular gas cut-cell.
INTEGER, PARAMETER :: IBM_ETYPE_SCINB =12
INTEGER, PARAMETER :: IBM_ETYPE_RCGAS =14 ! A regular edge next to a cut-face and a regular gasphase face.
INTEGER, PARAMETER :: IBM_ETYPE_EP    =15 ! External edge for Stress extrapolation in one Cartesian plane.

! Local integers:
INTEGER, SAVE :: IBM_NEDGECROSS, IBM_NCUTEDGE, IBM_NCUTFACE, IBM_NCUTCELL
INTEGER, SAVE :: ILO_CELL,IHI_CELL,JLO_CELL,JHI_CELL,KLO_CELL,KHI_CELL
INTEGER, SAVE :: ILO_FACE,IHI_FACE,JLO_FACE,JHI_FACE,KLO_FACE,KHI_FACE
INTEGER, SAVE :: NXB, NYB, NZB

INTEGER, PARAMETER :: NODS_WSEL = 3 ! Three nodes per wet surface element (i.e. surface triangle).

INTEGER, PARAMETER :: EDGS_WSEL = 3 ! Three edges per wet surface element.

INTEGER, PARAMETER :: NODS_VLEL = 4 ! Nodes of volume element (tetrahedra).

INTEGER, PARAMETER :: LINSEARCH_LIMIT = 13  ! LINSEARCH_LIMIT-1 is the maximum size of array for linear search O(n). If
                                            ! Array larger -> binary search O(log(n)).

! Auxiliary variables:
TYPE(IBM_EDGECROSS_TYPE), ALLOCATABLE, DIMENSION(:) :: EDGE_CROSS_AUX
TYPE(IBM_CUTEDGE_TYPE),   ALLOCATABLE, DIMENSION(:) :: CUT_EDGE_AUX
TYPE(IBM_CUTFACE_TYPE),   ALLOCATABLE, DIMENSION(:) :: CUT_FACE_AUX
TYPE(IBM_CUTCELL_TYPE),   ALLOCATABLE, DIMENSION(:) :: CUT_CELL_AUX

! Intersection Body-plane data structure:
TYPE BODINT_PLANE_TYPE
   INTEGER :: NNODS     ! Number of intersection vertices.
   INTEGER :: NSGLS     ! Number of single point intersection elements.
   INTEGER :: NSEGS     ! Number of intersection segments.
   INTEGER :: NTRIS     ! Number of in-plane intersections triangles.
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: XYZ  ! (1:NNODS,IAXIS:KAXIS) vertex coordinates.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: SGLS ! (1:NSGLS,NOD1) connectivity list for single node elements.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: SEGS ! (1:NSEGS,NOD1:NOD2) connectivity list for segments.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: TRIS ! (1:NTRIS,NOD1:NOD3) connectivity list for triangle elements.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: INDSEG ! Wet surface triangles associated with intersection segments.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: INDTRI ! Wet surface triangles associated with intersection triangles.
   LOGICAL,  ALLOCATABLE, DIMENSION(:)   :: X2ALIGNED ! For segments.
   LOGICAL,  ALLOCATABLE, DIMENSION(:)   :: X3ALIGNED ! For segments.
   INTEGER,  ALLOCATABLE, DIMENSION(:)   :: NBCROSS   ! Number of crossings per segment with x2,x3 grid lines.
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: SVAR   ! Intersections with gridlines for SEGS.
   INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: SEGTYPE   ! Type of SEG based on the media it separates.
   REAL(EB), ALLOCATABLE, DIMENSION(:)   :: X1NVEC    ! Sign of in-plane triangles normal vectors resp to x1 dir.
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:):: AINV     ! Inverse transformation matrix for in-plane triangles.
   INTEGER,  ALLOCATABLE, DIMENSION(:)   :: NOD_PERM  ! Permutation array for nodes in ascending order, s.t.
                                                      ! XYZ(X2AXIS,NOD_PERM(I-1)) <= XYZ(X2AXIS,NOD_PERM(I)), etc.
   TYPE(TBAXIS_TYPE) :: TBAXIS(IAXIS:KAXIS)
   REAL(EB) :: BOX(LOW_IND:HIGH_IND,IAXIS:KAXIS)
END TYPE BODINT_PLANE_TYPE

INTEGER, SAVE :: IBM_MAX_NNODS, IBM_MAX_NSGLS, IBM_MAX_NSEGS, IBM_MAX_NTRIS,       &
                 IBM_DELTA_NBCROSS=20 !,IBM_MAX_NBCROSS=0,IBM_MAX_NBCROSS_OLD

TYPE(BODINT_PLANE_TYPE) :: BODINT_PLANE, BODINT_PLANE2

REAL(EB), PARAMETER :: GAMMA_MULT = 1._EB
INTEGER,  PARAMETER :: DELTA_TBIN = 200, DELTA_SEGBIN = 50

LOGICAL, SAVE, ALLOCATABLE, DIMENSION(:,:,:) :: CELLRT
LOGICAL, SAVE, ALLOCATABLE, DIMENSION(:,:)   :: FACERT
REAL(EB) :: MAX_LEDGE, X3LO_RT, X3HI_RT


! Wet surface edges intersection with Cartesian cells data structure:
TYPE BODINT_CELL_EDGE_TYPE
   INTEGER :: NWCROSS=0                        ! Number of intersections with Cartesian grid planes.
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: SVAR ! Intersection with grid planes defined by local coord s.
END TYPE BODINT_CELL_EDGE_TYPE

! Allocatable real arrays
! Grid position containers:
REAL(EB), SAVE, TARGET, ALLOCATABLE, DIMENSION(:) :: XFACE,YFACE,ZFACE,XCELL,YCELL,ZCELL, &
          DXFACE,DYFACE,DZFACE,DXCELL,DYCELL,DZCELL,X1FACE,X2FACE,X3FACE,  &
          X2CELL,X3CELL,DX1FACE,DX2FACE,DX3FACE,DX2CELL,DX3CELL ! X1CELL,DX1CELL not used.

! x2 Intersection data containers:
INTEGER,  SAVE :: IBM_N_CRS
INTEGER,  PARAMETER :: DELTA_CROSS_X2 = 512
INTEGER,       SAVE :: IBM_MAXCROSS_X2= 512
REAL(EB), ALLOCATABLE, DIMENSION(:)  :: IBM_SVAR_CRS
INTEGER,  ALLOCATABLE, DIMENSION(:)  :: IBM_IS_CRS,IBM_SEG_CRS,IBM_BDNUM_CRS,IBM_BDNUM_CRS_AUX
INTEGER,  ALLOCATABLE, DIMENSION(:,:):: IBM_IS_CRS2
REAL(EB), ALLOCATABLE, DIMENSION(:,:):: IBM_SEG_TAN
INTEGER :: X1NOC, X2NOC, X3NOC
INTEGER, PARAMETER :: MAX_CELL_POLYLINES =100

REAL(EB):: VAL_TESTX_LOW,VAL_TESTX_HIGH,VAL_TESTY_LOW,VAL_TESTY_HIGH,VAL_TESTZ_LOW,VAL_TESTZ_HIGH

! Matrix vector building variables:
LOGICAL, SAVE :: CC_MATVEC_DEFINED=.FALSE.

! Here H variables, case of solver from geom:
! Everything related to GLMAT_FROM_GEOM will be erased when GLMAT from pres.f90 is
! complete.
INTEGER, ALLOCATABLE, DIMENSION(:) :: NUNKH_LOC, NUNKH_TOT, UNKH_IND
INTEGER :: NUNKH_LOCAL, NUNKH_TOTAL, NM_START

INTEGER, PARAMETER :: NNZ_ROW_H = 10 ! 7 point stencil + 3
                                     ! (buffer in case of unstructured grid).

INTEGER, ALLOCATABLE, TARGET, DIMENSION(:)   :: NNZ_D_MAT_H
REAL(EB),ALLOCATABLE, TARGET, DIMENSION(:,:) :: D_MAT_H
INTEGER, ALLOCATABLE, TARGET, DIMENSION(:,:) :: JD_MAT_H

INTEGER :: TOT_NNZ_H
INTEGER, ALLOCATABLE, DIMENSION(:)   :: IA_H, JA_H
REAL(EB),ALLOCATABLE, DIMENSION(:)   :: A_H

LOGICAL :: H_MATRIX_INDEFINITE

LOGICAL :: CALL_FOR_GLMAT = .FALSE. ! Flag to avoid MESH_CC_EXCHANGE(5) whithin GLMAT calls in PRESSURE_ITERATION_SCHEME.
LOGICAL :: CALL_FROM_GLMAT_SETUP = .FALSE. ! Flag to avoid MESH_CC_EXCHANGE(3) when exchaging UNK numbers in GLMAT setup.

! Soln and RHS containers:
REAL(EB), ALLOCATABLE, TARGET, DIMENSION(:) :: F_H
REAL(EB), ALLOCATABLE, TARGET, DIMENSION(:) :: X_H

! Internal solver memory pointer:
! PARDISO
! TYPE(MKL_PARDISO_HANDLE), ALLOCATABLE :: PT_H(:)
#ifdef WITH_MKL
 TYPE(MKL_CLUSTER_SPARSE_SOLVER_HANDLE), ALLOCATABLE :: PT_H(:)
#else
 INTEGER, ALLOCATABLE :: PT_H(:)
#endif /* WITH_MKL */
INTEGER, ALLOCATABLE :: IPARM( : ) ! SOLVER Control Parameters array, defined in GET_HLU_3D

! Communication variables:

INTEGER :: N_REQ11=0, N_REQ12=0, N_REQ13=0
TYPE (MPI_REQUEST), SAVE, ALLOCATABLE, DIMENSION(:) :: REQ11, REQ12, REQ13

! Timings variables:
LOGICAL, SAVE :: WRITE_SET_CUTCELLS_TIMINGS = .FALSE.
INTEGER, PARAMETER :: N_SET_CUTCELLS_3D_CALLS = 10

INTEGER, PARAMETER :: SET_CUTCELLS_TIME_INDEX                 =  0
INTEGER, PARAMETER :: GET_BODINT_PLANE_TIME_INDEX             =  1
INTEGER, PARAMETER :: GET_X2_INTERSECTIONS_TIME_INDEX         =  2
INTEGER, PARAMETER :: GET_X2_VERTVAR_TIME_INDEX               =  3
INTEGER, PARAMETER :: GET_CARTEDGE_CUTEDGES_TIME_INDEX        =  4
INTEGER, PARAMETER :: GET_BODX2X3_INTERSECTIONS_TIME_INDEX    =  5
INTEGER, PARAMETER :: GET_CARTFACE_CUTEDGES_TIME_INDEX        =  6
INTEGER, PARAMETER :: GET_CARTCELL_CUTEDGES_TIME_INDEX        =  7
INTEGER, PARAMETER :: GET_CARTFACE_CUTFACES_TIME_INDEX        =  8
INTEGER, PARAMETER :: GET_CARTCELL_CUTFACES_TIME_INDEX        =  9
INTEGER, PARAMETER :: GET_CARTCELL_CUTCELLS_TIME_INDEX        = 10
INTEGER, PARAMETER :: CCIBM_SET_DATA_TIME_INDEX               = 11
INTEGER, PARAMETER :: INIT_CUTCELL_DATA_TIME_INDEX            = 12
INTEGER, PARAMETER :: CCCOMPUTE_RADIATION_TIME_INDEX          = 13
INTEGER, PARAMETER :: CCREGION_DENSITY_TIME_INDEX             = 14
INTEGER, PARAMETER :: CCIBM_VELOCITY_FLUX_TIME_INDEX          = 15
INTEGER, PARAMETER :: CCREGION_COMPUTE_VISCOSITY_TIME_INDEX   = 16
INTEGER, PARAMETER :: CCIBM_INTERP_FACE_VEL_TIME_INDEX        = 17
INTEGER, PARAMETER :: CCREGION_DIVERGENCE_PART_1_TIME_INDEX   = 18
INTEGER, PARAMETER :: CCIBM_END_STEP_TIME_INDEX               = 19
INTEGER, PARAMETER :: CCIBM_TARGET_VELOCITY_TIME_INDEX        = 20
INTEGER, PARAMETER :: CCIBM_NO_FLUX_TIME_INDEX                = 21
INTEGER, PARAMETER :: CCIBM_COMPUTE_VELOCITY_ERROR_TIME_INDEX = 22
INTEGER, PARAMETER :: MESH_CC_EXCHANGE_TIME_INDEX             = 23

REAL(EB), SAVE :: T_CC_USED(SET_CUTCELLS_TIME_INDEX:MESH_CC_EXCHANGE_TIME_INDEX) = 0._EB

INTEGER, SAVE :: N_CUTCELLS_PROC=0, N_INB_CUTFACES_PROC=0, N_REG_CUTFACES_PROC=0

! Local arrays allocation variables:
INTEGER, PARAMETER :: DELTA_VERT = 24
INTEGER, PARAMETER :: DELTA_EDGE = 24
INTEGER, PARAMETER :: DELTA_FACE = 24
INTEGER, PARAMETER :: DELTA_CELL = 5

! Global cut-edge, face, cell allocation variables:
INTEGER, PARAMETER :: GLOBAL_DELTA_CELL = 100
INTEGER, PARAMETER :: GLOBAL_DELTA_EDGE = 3*GLOBAL_DELTA_CELL
INTEGER, PARAMETER :: GLOBAL_DELTA_FACE = 3*GLOBAL_DELTA_CELL

! Wall model volume interpolation variables:

! Velocity interpolation stencil threshold. Interpolation stencils will be defined if distance
! from body to face centroid is greater than DIST_THRES of the minimum local cell size.
REAL(EB), PARAMETER :: DIST_THRES = 0.0001_EB

INTEGER, PARAMETER :: INDEX_UNDEFINED = -1000
INTEGER, SAVE :: INT_N_EXT_PTS = 1 ! Default is one external point in normal probe.
INTEGER, PARAMETER :: MAX_INTERP_POINTS_VOL_LIN = 8 ! 8 stencil points for trilinear interpolation.
INTEGER, PARAMETER :: MAX_INTERP_POINTS_VOL_QUAD=27 !27 stencil points for quadratic interpolation.
INTEGER, SAVE :: MAX_INTERP_POINTS = MAX_INTERP_POINTS_VOL_LIN ! Default linear interpolation.
INTEGER, SAVE :: DELTA_INT = 1*MAX_DIM*MAX_INTERP_POINTS_VOL_LIN ! The 1 is for INT_N_EXT_PTS
INTEGER, SAVE :: N_INT_CVARS, N_INT_CCVARS
INTEGER, PARAMETER :: INT_VEL_IND=1, INT_VELS_IND=2, INT_FV_IND=3, INT_DHDX_IND=4, INT_DPDX_IND=6, N_INT_FVARS=4
INTEGER, PARAMETER :: INT_MU_IND=1, INT_H_IND=2, INT_RHO_IND=3, INT_TMP_IND=4, INT_RSUM_IND=5, INT_MUDNS_IND=6, INT_P_IND=7
INTEGER, PARAMETER :: INT_RHO0_IND=1, INT_WCEN_IND=3
INTEGER, SAVE :: NQT2C = INT_P_IND+2   ! The +2 is because we pass RHO0, WCEN.

LOGICAL, SAVE :: CC_CART_VOLAREA = .FALSE.

! End Variable declaration for CC_IBM.
!! ---------------------------------------------------------------------------------

! GET_CUTCELLS_VERBOSE variables:
INTEGER :: LU_SETCC=99

PRIVATE
PUBLIC :: BLOCK_IBM_SOLID_EXTWALLCELLS,GEOFCT,CALL_FOR_GLMAT,CALL_FROM_GLMAT_SETUP,CCGUARD,CC_MATVEC_DEFINED,GEOMEPS,&
          CC_CART_VOLAREA,DELTA_INT,DELTA_VERT,DEBUG_WAIT,DIST_THRES,DIV_RESCALE_FLG,&
          GET_CARTCELL_CUTCELLS_TIME_INDEX,GET_CFACE_INDEX,GETU,GETGRAD, GET_GEOM_INDEX,GET_TRNF_INDEX,&
          INTERSECT_CONE_AABB,INTERSECT_CYLINDER_AABB,INTERSECT_OBB_AABB,INTERSECT_SPHERE_AABB, &
          POINT_IN_CFACE,RANDOM_CFACE_XYZ,&
          READ_GEOM,READ_TRNF,ROTATION_MATRIX, &
          WRITE_GEOM,WRITE_GEOM_ALL, &
          FCELL,IBM_SOLID,IBM_VGSC,IBM_CGSC,IBM_FGSC,IBM_IDCF,IBM_UNKZ,IBM_GASPHASE,IBM_CUTCFE,IBM_FFNF,IBM_FTYPE_CFGAS, &
          IBM_FTYPE_CFINB,IBM_FTYPE_RGGAS,IBM_IDCC,IBM_IDRA,IBM_IDCE,IBM_INBOUNDARY,IBM_UNDEFINED, &
          IBM_NCVARS, IBM_UNKH, INDEX_UNDEFINED, INIT_CFACE_CELL, NUNKH_LOC, INT_N_EXT_PTS, &
          INT_P_IND, INT_TMP_IND, INT_VEL_IND, INT_RHO_IND, INT_H_IND, INT_RSUM_IND, INT_MU_IND, INT_MUDNS_IND, INT_RHO0_IND, &
          INT_FV_IND, INT_DHDX_IND, INT_WCEN_IND, INT_VELS_IND, IBM_ETYPE_EP, IBM_ETYPE_SCINB, IBM_FTYPE_SVERT, IBM_ETYPE_RCGAS, &
          IBM_FTYPE_RCGAS, IBM_FTYPE_CCGAS,GET_REGULAR_CUTCELL_EDGES_BC,GET_SOLID_CUTCELL_EDGES_BC,&
          LOOSEPS,LU_SETCC,MAX_INTERP_POINTS,&
          MESH_CC_EXCHANGE_TIME_INDEX,CCCOMPUTE_RADIATION_TIME_INDEX,CCREGION_DENSITY_TIME_INDEX,&
          CCIBM_SET_DATA_TIME_INDEX,INIT_CUTCELL_DATA_TIME_INDEX,&
          CCIBM_VELOCITY_FLUX_TIME_INDEX,CCREGION_COMPUTE_VISCOSITY_TIME_INDEX,CCIBM_INTERP_FACE_VEL_TIME_INDEX,&
          CCREGION_DIVERGENCE_PART_1_TIME_INDEX,CCIBM_END_STEP_TIME_INDEX,CCIBM_TARGET_VELOCITY_TIME_INDEX,&
          CCIBM_NO_FLUX_TIME_INDEX,CCIBM_COMPUTE_VELOCITY_ERROR_TIME_INDEX,&
          NQT2C,N_CUTCELLS_PROC,NGUARD,N_INB_CUTFACES_PROC,N_INT_CVARS,N_INT_CCVARS,N_REG_CUTFACES_PROC,&
          N_INT_FVARS,N_SET_CUTCELLS_3D_CALLS,NUNKH_TOT,UNKH_IND,NUNKH_LOCAL,NUNKH_TOTAL, NM_START, &
          N_REQ11,N_REQ12, N_REQ13,REQ11, REQ12, REQ13, &
          NNZ_ROW_H, TOT_NNZ_H, NNZ_D_MAT_H, D_MAT_H, JD_MAT_H, IA_H,       &
          JA_H, A_H, H_MATRIX_INDEFINITE, F_H, X_H, PT_H, IPARM, POINT_IN_POLYGON,SEARCH_OTHER_MESHES_FACE,&
          SET_CUTCELLS_TIME_INDEX,SET_CUTCELLS_3D,TRIANGULATE,TRILINEAR, VALID_TRIANGLE, &
          VAL_TESTX_LOW,VAL_TESTX_HIGH,VAL_TESTY_LOW,VAL_TESTY_HIGH,VAL_TESTZ_LOW,VAL_TESTZ_HIGH, &
          T_CC_USED, WRITE_SET_CUTCELLS_TIMINGS, &
          MAKE_UNIQUE_VERT_ARRAY, AVERAGE_FACE_VALUES

CONTAINS

! ----------------------------------- GET_CFACE_INDEX -------------------------------

SUBROUTINE GET_CFACE_INDEX(NM,I,J,K,XPT,YPT,ZPT,ICF)

INTEGER, INTENT(IN) :: NM,I,J,K
REAL(EB),INTENT(IN) :: XPT,YPT,ZPT
INTEGER, INTENT(OUT):: ICF

! Local Variables:
INTEGER, PARAMETER :: DELTA_IJK = 1
INTEGER :: ILO, IHI, JLO, JHI, KLO, KHI, II, JJ, KK, ICF2, JCF
REAL(EB):: DIST, DIST_CLOSE
LOGICAL :: CFACE_FOUND

ICF = 0
IF(.NOT.ALLOCATED(MESHES(NM)%CCVAR)) RETURN ! Case of NO GEOMs, return and give an error.


ILO = MAX(I-DELTA_IJK,1)
IHI = MIN(I+DELTA_IJK,MESHES(NM)%IBAR)

JLO = MAX(J-DELTA_IJK,1)
JHI = MIN(J+DELTA_IJK,MESHES(NM)%JBAR)

KLO = MAX(K-DELTA_IJK,1)
KHI = MIN(K+DELTA_IJK,MESHES(NM)%KBAR)

CFACE_FOUND = .FALSE.
DO KK=KLO,KHI
   DO JJ=JLO,JHI
      DO II=ILO,IHI
         ICF2 = MESHES(NM)%CCVAR(II,JJ,KK,IBM_IDCF)
         IF (ICF2 <= 0) CYCLE
         DO JCF=1,MESHES(NM)%CUT_FACE(ICF2)%NFACE
            DIST = SQRT( (XPT-MESHES(NM)%CUT_FACE(ICF2)%XYZCEN(IAXIS,JCF))**2._EB + &
                         (YPT-MESHES(NM)%CUT_FACE(ICF2)%XYZCEN(JAXIS,JCF))**2._EB + &
                         (ZPT-MESHES(NM)%CUT_FACE(ICF2)%XYZCEN(KAXIS,JCF))**2._EB )
            IF (.NOT.CFACE_FOUND) THEN
               ICF         = MESHES(NM)%CUT_FACE(ICF2)%CFACE_INDEX(JCF)
               DIST_CLOSE  = DIST
               CFACE_FOUND = .TRUE.
            ELSE
               IF (DIST > DIST_CLOSE) CYCLE
               ICF         = MESHES(NM)%CUT_FACE(ICF2)%CFACE_INDEX(JCF)
               DIST_CLOSE  = DIST
            ENDIF
         ENDDO
      ENDDO
   ENDDO
ENDDO
! WRITE(LU_ERR,*) 'Found device location=',I,J,K,ICF,CFACE(ICF)%X,CFACE(ICF)%Y,CFACE(ICF)%Z

RETURN
END SUBROUTINE GET_CFACE_INDEX


! --------------------------------- RANDOM_CFACE_XYZ -------------------------------

SUBROUTINE RANDOM_CFACE_XYZ(CFA,CFA_X,CFA_Y,CFA_Z)

TYPE(CFACE_TYPE), INTENT(IN) :: CFA
REAL(EB), INTENT(OUT) :: CFA_X,CFA_Y,CFA_Z

! Local Variables:
INTEGER :: IND1, IND2, ITRI, N_TRI, INOD_2, INOD_3
REAL(EB):: RN, RN_I, E1, E2, E3, V12(IAXIS:KAXIS), V13(IAXIS:KAXIS)

IND1 = CFA%CUT_FACE_IND1
IND2 = CFA%CUT_FACE_IND2

! Number of triangles that will cover the boundary cut-face convex polygon is same as NVERT for the cut-face:
N_TRI= CUT_FACE(IND1)%CFELEM(1,IND2)

! First pick randomly one triangle weighting by area:
CALL RANDOM_NUMBER(RN)
RN_I  = 0._EB
CFTRI_LOOP : DO ITRI=1,N_TRI
   ! Compute triangle Area:
   ! INOD_1 is polygon centroid, CFA%X, CFA%Y, CFA%Z
   ! VERTEX locations:
   ! Vertex 2 and 3 of triangle in local CFELEM indexing
   INOD_2 = ITRI
   INOD_3 = 1; IF (ITRI /= N_TRI) INOD_3 = ITRI+1
   ! Vertex 2 and 3 of traingle in XYZVERT indexing
   INOD_2 = CUT_FACE(IND1)%CFELEM(1+INOD_2,IND2)
   INOD_3 = CUT_FACE(IND1)%CFELEM(1+INOD_3,IND2)

   ! Compute triangles Area / AreaTOT for CFACE polygon:
   V12(IAXIS:KAXIS) = (/ CUT_FACE(IND1)%XYZVERT(IAXIS,INOD_2)-CFA%X, &
                         CUT_FACE(IND1)%XYZVERT(JAXIS,INOD_2)-CFA%Y, &
                         CUT_FACE(IND1)%XYZVERT(KAXIS,INOD_2)-CFA%Z /)
   V13(IAXIS:KAXIS) = (/ CUT_FACE(IND1)%XYZVERT(IAXIS,INOD_3)-CFA%X, &
                         CUT_FACE(IND1)%XYZVERT(JAXIS,INOD_3)-CFA%Y, &
                         CUT_FACE(IND1)%XYZVERT(KAXIS,INOD_3)-CFA%Z /)

   RN_I = RN_I + 0.5_EB/CFA%AREA * SQRT( (V12(JAXIS)*V13(KAXIS)-V12(KAXIS)*V13(JAXIS))**2 + &
                                         (V12(KAXIS)*V13(IAXIS)-V12(IAXIS)*V13(KAXIS))**2 + &
                                         (V12(IAXIS)*V13(JAXIS)-V12(JAXIS)*V13(IAXIS))**2 )
   IF (RN_I > RN) EXIT CFTRI_LOOP
ENDDO CFTRI_LOOP

! Randomly define natural coordinates for the triangle:
CALL RANDOM_NUMBER(E2)
CALL RANDOM_NUMBER(E3)
E3 = (1._EB-E2)*E3
E1 = 1._EB-E2-E3

! Compute physical coordinates of point:
CFA_X = E1*CFA%X + E2*CUT_FACE(IND1)%XYZVERT(IAXIS,INOD_2) + E3*CUT_FACE(IND1)%XYZVERT(IAXIS,INOD_3)
CFA_Y = E1*CFA%Y + E2*CUT_FACE(IND1)%XYZVERT(JAXIS,INOD_2) + E3*CUT_FACE(IND1)%XYZVERT(JAXIS,INOD_3)
CFA_Z = E1*CFA%Z + E2*CUT_FACE(IND1)%XYZVERT(KAXIS,INOD_2) + E3*CUT_FACE(IND1)%XYZVERT(KAXIS,INOD_3)

RETURN
END SUBROUTINE RANDOM_CFACE_XYZ


! ----------------------------- GET_CARTCELL_CFACE_LIST ----------------------------

! SUBROUTINE GET_CARTCELL_CFACE_LIST(I,J,K,ICF_START,NCFACE)
!
! ! Provides CFACE indexes for Cartesian cell I,J,K.
! ! IF NCFACE > 0, indexes range from ICF_START+1 to ICF_START+NCFACE.
!
! INTEGER, INTENT(IN) :: I,J,K
! INTEGER, INTENT(OUT):: ICF_START,NCFACE
!
! ! Local variables:
! INTEGER :: ICF
!
! ICF_START = IBM_UNDEFINED
! NCFACE    = 0
! IF( CCVAR(I,J,K,IBM_CGSC) == IBM_CUTCFE )THEN
!    ICF=CCVAR(I,J,K,IBM_IDCF)
!    IF (ICF==0) RETURN
!    IF (CUT_FACE(ICF)%NFACE==0) RETURN
!    NCFACE   = CUT_FACE(ICF)%NFACE
!    ICF_START= CUT_FACE(ICF)%CFACE_INDEX(1) - 1
! ENDIF
!
! RETURN
! END SUBROUTINE GET_CARTCELL_CFACE_LIST


! ------------------------- SEARCH_OTHER_MESHES_FACE ---------------------------------------------

SUBROUTINE SEARCH_OTHER_MESHES_FACE(NM,AXIS,XX,YY,ZZ,NOM,IIO,JJO,KKO)

! Given the point (XX,YY,ZZ), determine which other mesh it intersects and what its indices are.

INTEGER, INTENT(IN) :: NM,AXIS
REAL(EB), INTENT(IN) :: XX,YY,ZZ
REAL(EB) :: XI,YJ,ZK,SGN
INTEGER, INTENT(OUT) :: NOM,IIO,JJO,KKO
TYPE (MESH_TYPE), POINTER :: M2=>NULL()

IIO = 0
JJO = 0
KKO = 0
NOM = 0

SELECT CASE(AXIS)
CASE(IAXIS)
   OTHER_MESH_LOOP_X: DO NOM=1,NMESHES
      M2=>MESHES(NOM)
      IF (XX>=M2%XS .AND. XX<=M2%XF .AND.  YY>=M2%YS .AND. YY<=M2%YF .AND. ZZ>=M2%ZS .AND. ZZ<=M2%ZF) THEN
         IF (.NOT.ALLOCATED(M2%X)) THEN
            WRITE(LU_ERR,*) 'Interpolation point=',AXIS,XX,YY,ZZ,', for mesh NM=',NM,&
            ', with other mesh NOM=',NOM,'. NOM has non allocated X,Y,Z arrays.'
            RETURN
         ENDIF
         DO IIO=0,M2%IBAR
            SGN=SIGN(1._EB,XX-M2%X(IIO))
            IF((SGN >  0._EB) .AND. (ABS(XX-M2%X(IIO)) <= M2%DX(IIO+1)/2._EB)) EXIT
            IF((SGN <  0._EB) .AND. (ABS(XX-M2%X(IIO)) <  M2%DX(IIO  )/2._EB)) EXIT
         ENDDO
         IF (IIO > M2%IBAR) IIO = M2%IBAR ! Dial back.
         YJ  = MAX( 1._EB , MIN( REAL(M2%JBAR,EB)+ALMOST_ONE_EB , M2%CELLSJ(FLOOR((YY-M2%YS)*M2%RDYINT)) + 1._EB ) )
         ZK  = MAX( 1._EB , MIN( REAL(M2%KBAR,EB)+ALMOST_ONE_EB , M2%CELLSK(FLOOR((ZZ-M2%ZS)*M2%RDZINT)) + 1._EB ) )
         JJO = FLOOR(YJ)
         KKO = FLOOR(ZK)
         RETURN
      ENDIF
   ENDDO OTHER_MESH_LOOP_X
CASE(JAXIS)
   OTHER_MESH_LOOP_Y: DO NOM=1,NMESHES
      M2=>MESHES(NOM)
      IF (XX>=M2%XS .AND. XX<=M2%XF .AND.  YY>=M2%YS .AND. YY<=M2%YF .AND. ZZ>=M2%ZS .AND. ZZ<=M2%ZF) THEN
         IF (.NOT.ALLOCATED(M2%Y)) THEN
            WRITE(LU_ERR,*) 'Interpolation point=',AXIS,XX,YY,ZZ,', for mesh NM=',NM,&
            ', with other mesh NOM=',NOM,'. NOM has non allocated X,Y,Z arrays.'
            RETURN
         ENDIF
         DO JJO=0,M2%JBAR
            SGN=SIGN(1._EB,YY-M2%Y(JJO))
            IF((SGN >  0._EB) .AND. (ABS(YY-M2%Y(JJO)) <= M2%DY(JJO+1)/2._EB)) EXIT
            IF((SGN <  0._EB) .AND. (ABS(YY-M2%Y(JJO))  > M2%DY(JJO  )/2._EB)) EXIT
         ENDDO
         IF (JJO > M2%JBAR) JJO = M2%JBAR ! Dial back.
         XI  = MAX( 1._EB , MIN( REAL(M2%IBAR,EB)+ALMOST_ONE_EB , M2%CELLSI(FLOOR((XX-M2%XS)*M2%RDXINT)) + 1._EB ) )
         ZK  = MAX( 1._EB , MIN( REAL(M2%KBAR,EB)+ALMOST_ONE_EB , M2%CELLSK(FLOOR((ZZ-M2%ZS)*M2%RDZINT)) + 1._EB ) )
         IIO = FLOOR(XI)
         KKO = FLOOR(ZK)
         RETURN
      ENDIF
   ENDDO OTHER_MESH_LOOP_Y
CASE(KAXIS)
   OTHER_MESH_LOOP_Z: DO NOM=1,NMESHES
      M2=>MESHES(NOM)
      IF (XX>=M2%XS .AND. XX<=M2%XF .AND.  YY>=M2%YS .AND. YY<=M2%YF .AND. ZZ>=M2%ZS .AND. ZZ<=M2%ZF) THEN
         IF (.NOT.ALLOCATED(M2%Z)) THEN
            WRITE(LU_ERR,*) 'Interpolation point=',AXIS,XX,YY,ZZ,', for mesh NM=',NM,&
            ', with other mesh NOM=',NOM,'. NOM has non allocated X,Y,Z arrays.'
            RETURN
         ENDIF
         DO KKO=0,M2%KBAR
            SGN=SIGN(1._EB,ZZ-M2%Z(KKO))
            IF((SGN >  0._EB) .AND. (ABS(ZZ-M2%Z(KKO)) <= M2%DZ(KKO+1)/2._EB)) EXIT
            IF((SGN <  0._EB) .AND. (ABS(ZZ-M2%Z(KKO))  > M2%DZ(KKO  )/2._EB)) EXIT
         ENDDO
         IF (KKO > M2%KBAR) KKO = M2%KBAR ! Dial back.
         XI  = MAX( 1._EB , MIN( REAL(M2%IBAR,EB)+ALMOST_ONE_EB , M2%CELLSI(FLOOR((XX-M2%XS)*M2%RDXINT)) + 1._EB ) )
         YJ  = MAX( 1._EB , MIN( REAL(M2%JBAR,EB)+ALMOST_ONE_EB , M2%CELLSJ(FLOOR((YY-M2%YS)*M2%RDYINT)) + 1._EB ) )
         IIO = FLOOR(XI)
         JJO = FLOOR(YJ)
         RETURN
      ENDIF
   ENDDO OTHER_MESH_LOOP_Z
END SELECT

IIO = 0
JJO = 0
KKO = 0
NOM = 0

END SUBROUTINE SEARCH_OTHER_MESHES_FACE


! ---------------------- POINT_IN_POLYGON --------------------------------

SUBROUTINE POINT_IN_POLYGON(PT,CFELEM_SIZE,CFELEM,NVERT,IAXLOC,JAXLOC,XYZVERT,IN_POLY,IS_CONVEX,I_SGN,ATEST)

! Here PT(IAXIS:JAXIS) is the point position in polygon planes, polygon local coordinates.
! CFELEM_SIZE : Size of CFELEM vector:
! CFELEM : CFELEM(1) = NVFACE Number of vertices in this poly.
!          CFELEM(2:NVFACE+1) = Vertex indexes to XY. The position NVFACE+1 is the last point in the poly.
! NVERT: Size of XYZ array.
! IAXLOC, JAXLOC : Positions of X,Y local coordinates in XYZVERT
! XYZVERT(IAXLOC,1:NVERT), XYZVERT(JAXLOC,1:NVERT) : X,Y coordinate of points, s.t poligon is defined by
! XYZVERT(IAXLOC,CFELEM(2:NVFACE+1)),XYZVERT(JAXLOC,CFELEM(2:NVFACE+1)).
! IN_POLY : Logical that states if point is in polygon (boundaries included).
! I_SGN : Circulation sign for poly, is +ve counterclockwise, if -ve clockwise.
! ATEST : Area of the Polygon, MUST BE provided if polygon is not convex.

REAL(EB), INTENT(IN) :: PT(IAXIS:JAXIS)
INTEGER,  INTENT(IN) :: CFELEM_SIZE,CFELEM(1:CFELEM_SIZE),NVERT,IAXLOC,JAXLOC
REAL(EB), INTENT(IN) :: XYZVERT(MAX_DIM,1:NVERT)
LOGICAL,  INTENT(OUT):: IN_POLY
LOGICAL,  OPTIONAL, INTENT(IN) :: IS_CONVEX
REAL(EB), OPTIONAL, INTENT(IN) :: I_SGN,ATEST

! Local Vars:
LOGICAL :: CONVEX_POLY
REAL(EB):: ISGN, NSEG(IAXIS:JAXIS), AREAI, V1(IAXIS:JAXIS), V2(IAXIS:JAXIS)
INTEGER :: IP, NVFACE

NVFACE = CFELEM(1)

! By default polygon is assumed regular and polygon running counterclockwise:
CONVEX_POLY = .FALSE.; IF (PRESENT(IS_CONVEX)) CONVEX_POLY = IS_CONVEX
ISGN        = 1._EB;   IF (PRESENT(I_SGN))     ISGN = SIGN(1._EB,I_SGN)
CONVEX_IF : IF (.NOT.CONVEX_POLY) THEN ! Regular Polygon.
   IN_POLY=.FALSE.
   AREAI = 0._EB
   DO IP=2,NVFACE
      V1(IAXIS:JAXIS) = (/ XYZVERT(IAXLOC,CFELEM(IP  ))-PT(IAXIS), XYZVERT(JAXLOC,CFELEM(IP  ))-PT(JAXIS) /)
      V2(IAXIS:JAXIS) = (/ XYZVERT(IAXLOC,CFELEM(IP+1))-PT(IAXIS), XYZVERT(JAXLOC,CFELEM(IP+1))-PT(JAXIS) /)
      AREAI = AREAI + ABS(V1(IAXIS)*V2(JAXIS)-V1(JAXIS)*V2(IAXIS))  ! NORM(CROSS(V1,V2));
   ENDDO
   ! Last seg: IP = NVFACE+1 from previous loop.
   V1(IAXIS:JAXIS) = (/ XYZVERT(IAXLOC,CFELEM(IP  ))-PT(IAXIS), XYZVERT(JAXLOC,CFELEM(IP  ))-PT(JAXIS) /)
   V2(IAXIS:JAXIS) = (/ XYZVERT(IAXLOC,CFELEM(2   ))-PT(IAXIS), XYZVERT(JAXLOC,CFELEM(2   ))-PT(JAXIS) /)
   AREAI = (AREAI + ABS(V1(IAXIS)*V2(JAXIS)-V1(JAXIS)*V2(IAXIS))) / 2._EB
   IF ( ABS(AREAI-ATEST) < GEOMEPS ) IN_POLY = .TRUE. ! Threshold here needs to be a sufficiently large number less than ATEST.
ELSE CONVEX_IF ! Convex polygon.
   DO IP=2,NVFACE
      NSEG(IAXIS:JAXIS) = ISGN * (/ XYZVERT(JAXLOC,CFELEM(IP+1))-XYZVERT(JAXLOC,CFELEM(IP)), &
                                  -(XYZVERT(IAXLOC,CFELEM(IP+1))-XYZVERT(IAXLOC,CFELEM(IP))) /)
      IF ( DOT_PRODUCT(NSEG,(/ PT(IAXIS)-XYZVERT(IAXLOC,CFELEM(IP)), PT(JAXIS)-XYZVERT(JAXLOC,CFELEM(IP)) /))>TWO_EPSILON_EB ) THEN
         IN_POLY=.FALSE.
         RETURN
      ENDIF
   ENDDO
   ! Last Point: IP = NVFACE+1 from previous loop.
   NSEG(IAXIS:JAXIS) = ISGN * (/ XYZVERT(JAXLOC,CFELEM(2))-XYZVERT(JAXLOC,CFELEM(IP)), &
                               -(XYZVERT(IAXLOC,CFELEM(2))-XYZVERT(IAXLOC,CFELEM(IP))) /)
   IF ( DOT_PRODUCT(NSEG,(/ PT(IAXIS)-XYZVERT(IAXLOC,CFELEM(IP)), PT(JAXIS)-XYZVERT(JAXLOC,CFELEM(IP)) /)) > TWO_EPSILON_EB ) THEN
      IN_POLY=.FALSE.
      RETURN
   ENDIF
   IN_POLY=.TRUE.
ENDIF CONVEX_IF

RETURN

END SUBROUTINE POINT_IN_POLYGON


! --------------------------- POINT_IN_CFACE ------------------------------------

SUBROUTINE POINT_IN_CFACE(NM,XP,YP,ZP,CFACE_INDEX,IN_CFACE)

REAL(EB), INTENT(IN) :: XP,YP,ZP
INTEGER, INTENT(IN)  :: NM,CFACE_INDEX
LOGICAL, INTENT(OUT) :: IN_CFACE

! Local Variables
INTEGER :: INBFC,INBFC_LOC,VERT_CUTFACE,NVERT,X1AXIS,X2AXIS,X3AXIS
REAL(EB), POINTER, DIMENSION(:) :: NVEC=>NULL()
INTEGER, ALLOCATABLE, DIMENSION(:) :: CFELEM
REAL(EB):: ANVEC(MAX_DIM),P0(MAX_DIM),A,B,C,D,PROJ_COEFF,XYZ_P(MAX_DIM),PTCEN(IAXIS:JAXIS),I_SGN !,ATEST

INBFC     = CFACE(CFACE_INDEX)%CUT_FACE_IND1
INBFC_LOC = CFACE(CFACE_INDEX)%CUT_FACE_IND2

! Normal, max normal component, define plane X2AXIS,X3AXIS to do search:
VERT_CUTFACE = SIZE(MESHES(NM)%CUT_FACE(INBFC)%CFELEM, DIM=1); ALLOCATE(CFELEM(1:VERT_CUTFACE))
CFELEM(1:VERT_CUTFACE)  = MESHES(NM)%CUT_FACE(INBFC)%CFELEM(1:VERT_CUTFACE,INBFC_LOC)
NVEC(IAXIS:KAXIS) => CFACE(CFACE_INDEX)%NVEC(IAXIS:KAXIS)

! Plane equation for INBOUNDARY cut-face plane:
! Location of first point in cf polygon is P0:
P0(IAXIS:KAXIS) = MESHES(NM)%CUT_FACE(INBFC)%XYZVERT(IAXIS:KAXIS,CFELEM(2))
A = NVEC(IAXIS)
B = NVEC(JAXIS)
C = NVEC(KAXIS)
D = -(A*P0(IAXIS) + B*P0(JAXIS) + C*P0(KAXIS))
! Project XP,YP,ZP point into plane of cf polygon:
PROJ_COEFF = (A*XP+B*YP+C*ZP) + D ! /dot(n,n) = 1
XYZ_P(IAXIS:KAXIS) = (/XP,YP,ZP/) - PROJ_COEFF*NVEC(IAXIS:KAXIS)

! Which Cartesian plane we project to?
ANVEC(IAXIS) = ABS(NVEC(IAXIS)); ANVEC(JAXIS) = ABS(NVEC(JAXIS)); ANVEC(KAXIS) = ABS(NVEC(KAXIS))
IF ( MAX(ANVEC(IAXIS),MAX(ANVEC(JAXIS),ANVEC(KAXIS))) == ANVEC(IAXIS) ) THEN
   X1AXIS = IAXIS; X2AXIS = JAXIS; X3AXIS = KAXIS
ELSEIF ( MAX(ANVEC(IAXIS),MAX(ANVEC(JAXIS),ANVEC(KAXIS))) == ANVEC(JAXIS) ) THEN
   X1AXIS = JAXIS; X2AXIS = KAXIS; X3AXIS = IAXIS
ELSE
   X1AXIS = KAXIS; X2AXIS = IAXIS; X3AXIS = JAXIS
ENDIF
PTCEN(IAXIS:JAXIS) = XYZ_P( (/ X2AXIS, X3AXIS /) )

NVERT = SIZE(MESHES(NM)%CUT_FACE(INBFC)%XYZVERT,DIM=2)
I_SGN = SIGN(1._EB,NVEC(X1AXIS))
CALL POINT_IN_POLYGON(PTCEN,VERT_CUTFACE,CFELEM,NVERT,X2AXIS,X3AXIS,&
                      MESHES(NM)%CUT_FACE(INBFC)%XYZVERT,IN_CFACE,IS_CONVEX=.TRUE.,I_SGN=I_SGN)

! ATEST = MESHES(NM)%CUT_FACE(INBFC)%AREA(INBFC_LOC)*ANVEC(X1AXIS)
! CALL POINT_IN_POLYGON(PTCEN,VERT_CUTFACE,CFELEM,NVERT,X2AXIS,X3AXIS,&
!                       MESHES(NM)%CUT_FACE(INBFC)%XYZVERT,IN_CFACE,ATEST=ATEST)

DEALLOCATE(CFELEM)

RETURN
END SUBROUTINE POINT_IN_CFACE


! ---------------------------- SET_CUTCELLS_3D -------------------------------------

SUBROUTINE SET_CUTCELLS_3D
USE MPI_F08
USE TRAN, ONLY : TRANS

! Local indexes:
INTEGER :: ILO,IHI,JLO,JHI,KLO,KHI
INTEGER :: I,J,K,KK
INTEGER :: X1AXIS, X2AXIS, X3AXIS
INTEGER :: XIAXIS, XJAXIS, XKAXIS
INTEGER :: X2LO, X2HI, X3LO, X3HI
INTEGER :: X2LO_CELL, X2HI_CELL, X3LO_CELL, X3HI_CELL
INTEGER :: ISTR, IEND, JSTR, JEND, KSTR, KEND
INTEGER :: NM, NOM

! Miscellaneous:
REAL(EB), DIMENSION(MAX_DIM) :: PLNORMAL
INTEGER,  DIMENSION(MAX_DIM) :: INDX1
REAL(EB) :: X1PLN, X3RAY
LOGICAL :: TRI_ONPLANE_ONLY, RAYTRACE_X2_ONLY
LOGICAL, SAVE :: FIRST_CALL = .TRUE.
INTEGER :: NCUTFACE_IAXIS, NCUTFACE_JAXIS, NCUTFACE_KAXIS, ICE1, ICF1, NFACE, IERR, &
           NCUTEDGE_IBCC, NCUTEDGE_IBCF
REAL(EB):: CF_AREA_IAXIS=0._EB, CF_AREA_JAXIS=0._EB, CF_AREA_KAXIS=0._EB, &
           CF_INXAREA_IAXIS=0._EB,CF_INXAREA_JAXIS=0._EB,CF_INXAREA_KAXIS=0._EB, &
           CF_INXSQAREA_IAXIS=0._EB,CF_INXSQAREA_JAXIS=0._EB,CF_INXSQAREA_KAXIS=0._EB, &
           CF_JNYSQAREA_IAXIS=0._EB,CF_JNYSQAREA_JAXIS=0._EB,CF_JNYSQAREA_KAXIS=0._EB, &
           CF_KNZSQAREA_IAXIS=0._EB,CF_KNZSQAREA_JAXIS=0._EB,CF_KNZSQAREA_KAXIS=0._EB
REAL(EB):: SLEN_GEOM, AREA_GEOM, VOLUME_GEOM, SLEN_IBCC, SLEN, DV(MAX_DIM), XYZCEN_GEOM(MAX_DIM), &
           DM_XYZCEN(MAX_DIM), CCGP_XYZCEN(MAX_DIM), DM_XYZCEN_AUX(MAX_DIM), CCGP_XYZCEN_AUX(MAX_DIM)
INTEGER :: SEG(NOD1:NOD2), NEDGE, IEDGE, IFACE, IG

INTEGER :: NCUTFACE_INB, ICC1, ICC2, NCELL, IGC
REAL(EB):: CF_AREA_INB=0._EB, CF_INXAREA_INB=0._EB, CF_INXSQAREA_INB=0._EB, &
           CF_JNYSQAREA_INB=0._EB, CF_KNZSQAREA_INB=0._EB, CF_AREA_INB_AUX=0._EB
REAL(EB):: CC_VOLUME_INB=0._EB, DM_VOLUME=0._EB, GP_VOLUME=0._EB, &
           CC_VOLUME_INB_AUX=0._EB, DM_VOLUME_AUX=0._EB, GP_VOLUME_AUX=0._EB
INTEGER, DIMENSION(5) ::  MIN_CC_IJK_ICCJCC, MAX_CC_IJK_ICCJCC
REAL(EB):: MIN_CC_VOL, MAX_CC_VOL

LOGICAL, ALLOCATABLE, DIMENSION(:) :: CC_COMPUTE_MESH, CC_COMPUTE_MESH_AUX

REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: GEOM_ZMAX_AUX

REAL(EB) :: TNOW

LOGICAL :: WRITE_CFACE_STATS = .FALSE.

INTEGER, SAVE :: CALL_COUNT = 0

! GET_CUTCELL_VERBOSE variables:
INTEGER :: IPROC, NMESH_CC, NMESH_CC_AUX, TAG
TYPE (MPI_STATUS) :: MPISTATUS
CHARACTER(MESSAGE_LENGTH) :: VERBOSE_FILE, VERBOSE_FILE_AUX
CHARACTER(1), DIMENSION(3), PARAMETER :: AXSTR(1:3) = (/ 'X', 'Y', 'Z' /)
REAL(EB) :: CPUTIME, CPUTIME_START, CPUTIME_MESH, CPUTIME_START_MESH
INTEGER :: MIN_FACES_PER_CUTCELL, MAX_FACES_PER_CUTCELL, MEAN_FACES_PER_CUTCELL, SUM_FACE, SUM_CCELL
TYPE(CFACE_TYPE), POINTER :: CFA
REAL(EB), ALLOCATABLE, DIMENSION(:) :: GEOM_AREA_SURF
INTEGER,  ALLOCATABLE, DIMENSION(:) :: GEOM_SURF
INTEGER :: ICF, SURF_INDEX

LOGICAL :: SNAP_TO_GRID
LOGICAL, SAVE :: FIRST_CALL_ARG=.TRUE., FIRST_CALL_ARG2=.TRUE.

REAL(EB):: VERT_AUX(IAXIS:KAXIS)
INTEGER :: ING,INOD,IWSEL,IEL,FACE_AUX(NOD1:NOD3),VOL_AUX(NOD1:NOD4),N_SPCELLCF_TOT,N_SPCELL_TOT
CHARACTER(100) :: FILENAME

IF (MY_RANK==0 .AND. GET_CUTCELLS_VERBOSE) THEN
   WRITE(LU_ERR,*) ' '
   WRITE(LU_ERR,*) 'SET_CUTCELLS_3D : Cut-Cell computation in VERBOSE mode, 4 tasks to perform:'
ENDIF

! Reset variables:
IBM_NEDGECROSS = 0
IBM_NCUTEDGE   = 0
IBM_NCUTFACE   = 0
IBM_NCUTCELL   = 0

IF (FIRST_CALL) THEN

   ! Get geometry triangle bins in Cartesian directions:
   CALL GET_GEOM_TRIBIN

   ! Initialize GEOMETRY fields used by CC_IBM:
   CALL IBM_INIT_GEOM
   IF (STOP_STATUS==SETUP_STOP) RETURN
   FIRST_CALL = .FALSE.

ENDIF

TNOW=CURRENT_TIME()

DEBUG_SET_CUTCELLS_COND : IF (DEBUG_SET_CUTCELLS) THEN
   ! Write meshes file:
   WRITE(FILENAME,'(A,A)') TRIM(CHID),'_meshes.dat'
   OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
   WRITE(33,'(I8)') NMESHES
   MESH_LOOP : DO NM=1,NMESHES

      IF (PROCESS(NM)/=MY_RANK) CYCLE

      ! Mesh sizes:
      NXB=MESHES(NM)%IBAR
      NYB=MESHES(NM)%JBAR
      NZB=MESHES(NM)%KBAR

      WRITE(33,'(4I8,6F24.16)') NM,NXB,NYB,NZB,MESHES(NM)%X(0),MESHES(NM)%X(NXB),&
                                               MESHES(NM)%Y(0),MESHES(NM)%Y(NYB),&
                                               MESHES(NM)%Z(0),MESHES(NM)%Z(NZB)
      DO I=0,NXB
         WRITE(33,'(4F24.16)') MESHES(NM)%X(I),MESHES(NM)%XC(I),MESHES(NM)%DXN(I),MESHES(NM)%DX(I)
      ENDDO
      DO J=0,NYB
         WRITE(33,'(4F24.16)') MESHES(NM)%Y(J),MESHES(NM)%YC(J),MESHES(NM)%DYN(J),MESHES(NM)%DY(J)
      ENDDO
      DO K=0,NZB
         WRITE(33,'(4F24.16)') MESHES(NM)%Z(K),MESHES(NM)%ZC(K),MESHES(NM)%DZN(K),MESHES(NM)%DZ(K)
      ENDDO

   ENDDO MESH_LOOP
   CLOSE(33)

   ! Write geometry files:
   WRITE(FILENAME,'(A,A)') TRIM(CHID),'_num_geometries.dat'
   OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
   WRITE(33,'(I6,4F24.16)') N_GEOMETRY, GEOMEPS
   CLOSE(33)
   GEOM_LOOP : DO ING=1,N_GEOMETRY

      ! Write Vertices:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_verts.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO INOD=1,GEOMETRY(ING)%N_VERTS
         VERT_AUX(IAXIS:KAXIS) = GEOMETRY(ING)%VERTS(MAX_DIM*(INOD-1)+1:MAX_DIM*INOD)
         WRITE(33,'(3F24.16)') VERT_AUX(IAXIS:KAXIS)
      ENDDO
      CLOSE(33)

      ! Write faces:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_faces.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO IWSEL=1,GEOMETRY(ING)%N_FACES
         FACE_AUX(NOD1:NOD3)=GEOMETRY(ING)%FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)
         WRITE(33,'(4I10)') FACE_AUX(NOD1:NOD3),GEOMETRY(ING)%SURFS(IWSEL)
      ENDDO
      CLOSE(33)

      ! Write Volumes:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_volus.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO IEL=1,GEOMETRY(ING)%N_VOLUS
         VOL_AUX(NOD1:NOD4)=GEOMETRY(ING)%VOLUS(NODS_VLEL*(IEL-1)+1:NODS_VLEL*IEL)
         WRITE(33,'(4I10)') VOL_AUX(NOD1:NOD4)
      ENDDO
      CLOSE(33)

      ! Write Edges:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_edges.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO IEL=1,GEOMETRY(ING)%N_EDGES
         WRITE(33,'(2I10)') GEOMETRY(ING)%EDGES(NOD1:NOD2,IEL)
      ENDDO
      CLOSE(33)

      ! Write FACE_EDGES:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_fcedg.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO IEL=1,GEOMETRY(ING)%N_FACES
         WRITE(33,'(3I10)') GEOMETRY(ING)%FACE_EDGES(NOD1:NOD3,IEL)
      ENDDO
      CLOSE(33)

      ! Write EDGE_FACES:
      WRITE(FILENAME,'(A,A,I4.4,A)') TRIM(CHID),'_geometry_',ING,'_edfac.dat'
      OPEN(UNIT=33, file=TRIM(FILENAME), status='unknown')
      DO IEL=1,GEOMETRY(ING)%N_EDGES
         WRITE(33,'(5I10)') GEOMETRY(ING)%EDGE_FACES(NOD1:NOD4+1,IEL)
      ENDDO
      CLOSE(33)

   ENDDO GEOM_LOOP
ENDIF DEBUG_SET_CUTCELLS_COND

! Select MESHES assigned to processor and OMESHES of these. Cut-cells will be computed for all of them. Done in GET_GEOM_TRIBIN

IF (GET_CUTCELLS_VERBOSE) THEN
   NMESH_CC=0
   DO NOM=1,NMESHES
      IF(CC_COMPUTE_MESH(NOM)) NMESH_CC = NMESH_CC + 1
   ENDDO
   ! MY_RANK = 0 writes first:
   IF (MY_RANK==0) THEN
      ! Open file to write SET_CUTCELLS_3D progress:
      WRITE(VERBOSE_FILE,'(A,A,I0,A)') TRIM(CHID),'_cutcell_',MY_RANK,'.log'
      OPEN(UNIT=LU_SETCC,FILE=TRIM(VERBOSE_FILE),STATUS='UNKNOWN')
      WRITE(LU_ERR,*) ' '
      WRITE(LU_ERR,*) '2. Generate Cut-cells in Meshes :'
      WRITE(LU_ERR,'(A,I4,A,I4,A,A,A)',advance="no") ' Process MY_RANK=',MY_RANK,', will process M=',NMESH_CC, &
                                                     ' meshes in file ',TRIM(VERBOSE_FILE),'.'
      WRITE(LU_SETCC,*) ' '
      WRITE(LU_SETCC,*) '2. Generate Cut-cells in Meshes :'
      WRITE(LU_SETCC,'(A,I4,A,I4,A)',advance="no") ' Process MY_RANK=',MY_RANK,', will process M=',NMESH_CC,' meshes.'
      WRITE(LU_ERR,'(A)',advance="no") ' Meshes to Process : '
      WRITE(LU_SETCC,'(A)',advance="no") ' Meshes to Process : '
      NMESH_CC_AUX = 0
      DO NOM=1,NMESHES
         IF(CC_COMPUTE_MESH(NOM)) THEN
            NMESH_CC_AUX = NMESH_CC_AUX + 1
            IF(NMESH_CC_AUX < NMESH_CC) THEN
               WRITE(LU_ERR,'(I4.4,A)',advance="no") NOM,', '
               WRITE(LU_SETCC,'(I4.4,A)',advance="no") NOM,', '
            ELSE
               WRITE(LU_ERR,'(I4.4,A)') NOM,'.'
               WRITE(LU_SETCC,'(I4.4,A)') NOM,'.'
            ENDIF
         ENDIF
      ENDDO
   ENDIF
   IF (N_MPI_PROCESSES > 1) THEN
      IF (MY_RANK==0) ALLOCATE(CC_COMPUTE_MESH_AUX(1:NMESHES))
      ! Now rest of processes pass their mesh info to process 0:
      DO IPROC=1,N_MPI_PROCESSES-1
         TAG = 0
         IF (MY_RANK==IPROC) THEN ! Send CC_COMPUTE_MESH array.
            TAG=IPROC
            CALL MPI_SEND(CC_COMPUTE_MESH(1),NMESHES,MPI_LOGICAL,0,TAG,MPI_COMM_WORLD,IERR)
            ! Open file to write SET_CUTCELLS_3D progress:
            WRITE(VERBOSE_FILE,'(A,A,I0,A)') TRIM(CHID),'_cutcell_',MY_RANK,'.log'
            OPEN(UNIT=LU_SETCC,FILE=TRIM(VERBOSE_FILE),STATUS='UNKNOWN')
            WRITE(LU_SETCC,*) ' '
            WRITE(LU_SETCC,*) '2. Generate Cut-cells in Meshes :'
            WRITE(LU_SETCC,'(A,I4,A,I4,A)',advance="no") ' Process MY_RANK=',IPROC,', will process M=',NMESH_CC,' meshes.'
            WRITE(LU_SETCC,'(A)',advance="no") ' Meshes to Process :'
            NMESH_CC_AUX = 0
            DO NOM=1,NMESHES
               IF(CC_COMPUTE_MESH(NOM)) THEN
                  NMESH_CC_AUX = NMESH_CC_AUX + 1
                  IF ( NMESH_CC_AUX < NMESH_CC ) THEN
                     WRITE(LU_SETCC,'(I4.4,A)',advance="no") NOM,', '
                  ELSE
                     WRITE(LU_SETCC,'(I4.4,A)') NOM,'.'
                  ENDIF
               ENDIF
            ENDDO
         ELSEIF (MY_RANK==0) THEN ! Receive CC_COMPUTE_MESH array and write.
            TAG=IPROC
            CALL MPI_RECV(CC_COMPUTE_MESH_AUX(1),NMESHES,MPI_LOGICAL,IPROC,TAG,MPI_COMM_WORLD,MPISTATUS,IERR)
            ! Write to LU_ERR:
            NMESH_CC=0
            DO NOM=1,NMESHES
               IF(CC_COMPUTE_MESH_AUX(NOM)) NMESH_CC = NMESH_CC + 1
            ENDDO
            WRITE(VERBOSE_FILE_AUX,'(A,A,I0,A)') TRIM(CHID),'_cutcell_',IPROC,'.log'
            WRITE(LU_ERR,'(A,I4,A,I4,A,A,A)',advance="no") ' Process MY_RANK=',IPROC,', will process M=',NMESH_CC, &
                                                           ' meshes in file ',TRIM(VERBOSE_FILE_AUX),'.'
            WRITE(LU_ERR,'(A)',advance="no") ' Meshes to Process : '
            NMESH_CC_AUX = 0
            DO NOM=1,NMESHES
               IF(CC_COMPUTE_MESH_AUX(NOM)) THEN
                  NMESH_CC_AUX = NMESH_CC_AUX + 1
                  IF ( NMESH_CC_AUX < NMESH_CC ) THEN
                     WRITE(LU_ERR,'(I4.4,A)',advance="no") NOM,', '
                  ELSE
                     WRITE(LU_ERR,'(I4.4,A)') NOM,'.'
                  ENDIF
               ENDIF
            ENDDO
         ENDIF
         CALL MPI_BARRIER(MPI_COMM_WORLD, IERR)
      ENDDO
      IF (MY_RANK==0) DEALLOCATE(CC_COMPUTE_MESH_AUX)
   ENDIF
   CALL CPU_TIME(CPUTIME_START_MESH)
ENDIF


! Test if all geometries are SNAP_TO_GRID boxes:
SNAP_TO_GRID = .TRUE.
DO IG=1,N_GEOMETRY
   IF (GEOMETRY(IG)%SNAP_TO_GRID) CYCLE
   SNAP_TO_GRID = .FALSE.
ENDDO

! Allocate BODINT_PLANE for plane intersections on X1AXIS loop:
IF (.NOT.SNAP_TO_GRID) THEN
   CALL ALLOC_BODINT_PLANE(BODINT_PLANE,FIRST_CALL_ARG)   ! To be used in SET_CUTCELLS_3D, GET_CARTCELL_CUTFACES.
   CALL ALLOC_BODINT_PLANE(BODINT_PLANE2,FIRST_CALL_ARG2) ! To be used in GET_IS_SOLID_3D.
ENDIF

! Allocate Intersection variables:
ALLOCATE(IBM_SVAR_CRS(IBM_MAXCROSS_X2),IBM_IS_CRS(IBM_MAXCROSS_X2),IBM_SEG_CRS(IBM_MAXCROSS_X2))
ALLOCATE(IBM_BDNUM_CRS(0:IBM_MAXCROSS_X2),IBM_BDNUM_CRS_AUX(0:IBM_MAXCROSS_X2))
ALLOCATE(IBM_IS_CRS2(LOW_IND:HIGH_IND+1,IBM_MAXCROSS_X2),IBM_SEG_TAN(IAXIS:JAXIS,IBM_MAXCROSS_X2))

! Main Loop over Meshes:
MAIN_MESH_LOOP : DO NM=1,NMESHES

   IF (.NOT.CC_COMPUTE_MESH(NM)) CYCLE ! Only MESHES assigned to processor and OMESHES of these.
   IF (PERIODIC_TEST==105 .AND. PROCESS(NM)/=MY_RANK) CYCLE ! Don't do OMESHES for PERIODIC_TEST==105

   CALL POINT_TO_MESH(NM)

   ! Mesh sizes:
   NXB=IBAR
   NYB=JBAR
   NZB=KBAR

   ! X direction bounds:
   ILO_FACE = 0                    ! Low mesh boundary face index.
   IHI_FACE = IBAR                 ! High mesh boundary face index.
   ILO_CELL = ILO_FACE + FCELL     ! First internal cell index. See notes.
   IHI_CELL = IHI_FACE + FCELL - 1 ! Last internal cell index.
   ISTR     = ILO_FACE - NGUARD    ! Allocation start x arrays.
   IEND     = IHI_FACE + NGUARD    ! Allocation end x arrays.

   ! Y direction bounds:
   JLO_FACE = 0                    ! Low mesh boundary face index.
   JHI_FACE = JBAR                 ! High mesh boundary face index.
   JLO_CELL = JLO_FACE + FCELL     ! First internal cell index. See notes.
   JHI_CELL = JHI_FACE + FCELL - 1 ! Last internal cell index.
   JSTR     = JLO_FACE - NGUARD    ! Allocation start y arrays.
   JEND     = JHI_FACE + NGUARD    ! Allocation end y arrays.

   ! Z direction bounds:
   KLO_FACE = 0                    ! Low mesh boundary face index.
   KHI_FACE = KBAR                 ! High mesh boundary face index.
   KLO_CELL = KLO_FACE + FCELL     ! First internal cell index. See notes.
   KHI_CELL = KHI_FACE + FCELL - 1 ! Last internal cell index.
   KSTR     = KLO_FACE - NGUARD    ! Allocation start z arrays.
   KEND     = KHI_FACE + NGUARD    ! Allocation end z arrays.

   ! Define grid arrays for this mesh:
   ! Populate position and cell size arrays: Uniform grid implementation.
   ! X direction:
   ALLOCATE(DXCELL(ISTR:IEND)); DXCELL(ILO_CELL-1:IHI_CELL+1) = DX(ILO_CELL-1:IHI_CELL+1)
   DO IGC=2,NGUARD
      DXCELL(ILO_CELL-IGC)=DXCELL(ILO_CELL-IGC+1)
      DXCELL(IHI_CELL+IGC)=DXCELL(IHI_CELL+IGC-1)
   ENDDO
   ALLOCATE(DXFACE(ISTR:IEND)); DXFACE(ILO_FACE:IHI_FACE)= DXN(ILO_FACE:IHI_FACE)
   DO IGC=1,NGUARD
      DXFACE(ILO_FACE-IGC)=DXFACE(ILO_FACE-IGC+1)
      DXFACE(IHI_FACE+IGC)=DXFACE(ILO_FACE+IGC-1)
   ENDDO
   ALLOCATE(XCELL(ISTR:IEND));  XCELL = 1._EB/GEOMEPS ! Initialize huge.
   XCELL(ILO_CELL-1:IHI_CELL+1) = XC(ILO_CELL-1:IHI_CELL+1)
   DO IGC=2,NGUARD
      XCELL(ILO_CELL-IGC)=XCELL(ILO_CELL-IGC+1)-DXFACE(ILO_FACE-IGC+1)
      XCELL(IHI_CELL+IGC)=XCELL(IHI_CELL+IGC-1)+DXFACE(IHI_FACE+IGC-1)
   ENDDO
   ALLOCATE(XFACE(ISTR:IEND));  XFACE = 1._EB/GEOMEPS ! Initialize huge.
   XFACE(ILO_FACE:IHI_FACE) = X(ILO_FACE:IHI_FACE)
   DO IGC=1,NGUARD
      XFACE(ILO_FACE-IGC)=XFACE(ILO_FACE-IGC+1)-DXCELL(ILO_CELL-IGC)
      XFACE(IHI_FACE+IGC)=XFACE(IHI_FACE+IGC-1)+DXCELL(IHI_CELL+IGC)
   ENDDO

   ! Y direction:
   ALLOCATE(DYCELL(JSTR:JEND)); DYCELL(JLO_CELL-1:JHI_CELL+1)= DY(JLO_CELL-1:JHI_CELL+1)
   DO IGC=2,NGUARD
      DYCELL(JLO_CELL-IGC)=DYCELL(JLO_CELL-IGC+1)
      DYCELL(JHI_CELL+IGC)=DYCELL(JHI_CELL+IGC-1)
   ENDDO
   ALLOCATE(DYFACE(JSTR:JEND)); DYFACE(JLO_FACE:JHI_FACE)= DYN(JLO_FACE:JHI_FACE)
   DO IGC=1,NGUARD
      DYFACE(JLO_FACE-IGC)=DYFACE(JLO_FACE-IGC+1)
      DYFACE(JHI_FACE+IGC)=DYFACE(JHI_FACE+IGC-1)
   ENDDO
   ALLOCATE(YCELL(JSTR:JEND));  YCELL = 1._EB/GEOMEPS ! Initialize huge.
   YCELL(JLO_CELL-1:JHI_CELL+1) = YC(JLO_CELL-1:JHI_CELL+1)
   DO IGC=2,NGUARD
      YCELL(JLO_CELL-IGC)=YCELL(JLO_CELL-IGC+1)-DYFACE(JLO_FACE-IGC+1)
      YCELL(JHI_CELL+IGC)=YCELL(JHI_CELL+IGC-1)+DYFACE(JHI_FACE+IGC-1)
   ENDDO
   ALLOCATE(YFACE(JSTR:JEND));  YFACE = 1._EB/GEOMEPS ! Initialize huge.
   YFACE(JLO_FACE:JHI_FACE) = Y(JLO_FACE:JHI_FACE)
   DO IGC=1,NGUARD
      YFACE(JLO_FACE-IGC)=YFACE(JLO_FACE-IGC+1)-DYCELL(JLO_CELL-IGC)
      YFACE(JHI_FACE+IGC)=YFACE(JHI_FACE+IGC-1)+DYCELL(JHI_CELL+IGC)
   ENDDO

   ! Z direction:
   ALLOCATE(DZCELL(KSTR:KEND)); DZCELL(KLO_CELL-1:KHI_CELL+1)= DZ(KLO_CELL-1:KHI_CELL+1)
   DO IGC=2,NGUARD
      DZCELL(KLO_CELL-IGC)=DZCELL(KLO_CELL-IGC+1)
      DZCELL(KHI_CELL+IGC)=DZCELL(KHI_CELL+IGC-1)
   ENDDO
   ALLOCATE(DZFACE(KSTR:KEND)); DZFACE(KLO_FACE:KHI_FACE)= DZN(KLO_FACE:KHI_FACE)
   DO IGC=1,NGUARD
      DZFACE(KLO_FACE-IGC)=DZFACE(KLO_FACE-IGC+1)
      DZFACE(KHI_FACE+IGC)=DZFACE(KHI_FACE+IGC-1)
   ENDDO
   ALLOCATE(ZCELL(KSTR:KEND));  ZCELL = 1._EB/GEOMEPS ! Initialize huge.
   ZCELL(KLO_CELL-1:KHI_CELL+1) = ZC(KLO_CELL-1:KHI_CELL+1)
   DO IGC=2,NGUARD
      ZCELL(KLO_CELL-IGC)=ZCELL(KLO_CELL-IGC+1)-DZFACE(KLO_FACE-IGC+1)
      ZCELL(KHI_CELL+IGC)=ZCELL(KHI_CELL+IGC-1)+DZFACE(KHI_FACE+IGC-1)
   ENDDO
   ALLOCATE(ZFACE(KSTR:KEND));  ZFACE = 1._EB/GEOMEPS ! Initialize huge.
   ZFACE(KLO_FACE:KHI_FACE) = Z(KLO_FACE:KHI_FACE)
   DO IGC=1,NGUARD
      ZFACE(KLO_FACE-IGC)=ZFACE(KLO_FACE-IGC+1)-DZCELL(KLO_CELL-IGC)
      ZFACE(KHI_FACE+IGC)=ZFACE(KHI_FACE+IGC-1)+DZCELL(KHI_CELL+IGC)
   ENDDO

   ! Initialize CC_IBM arrays for mesh NM:
   ! Vertices:
   IF (.NOT. ALLOCATED(MESHES(NM)%VERTVAR)) &
      ALLOCATE(MESHES(NM)%VERTVAR(ISTR:IEND,JSTR:JEND,KSTR:KEND,IBM_NVVARS))
   MESHES(NM)%VERTVAR = 0
   MESHES(NM)%VERTVAR(:,:,:,IBM_VGSC) = IBM_GASPHASE

   ! Cartesian Edges:
   IF (.NOT. ALLOCATED(MESHES(NM)%ECVAR)) &
      ALLOCATE(MESHES(NM)%ECVAR(ISTR:IEND,JSTR:JEND,KSTR:KEND,IBM_NEVARS,MAX_DIM))
   MESHES(NM)%ECVAR = 0
   MESHES(NM)%ECVAR(:,:,:,IBM_EGSC,:) = IBM_GASPHASE

   ! Cartesian Faces:
   IF (.NOT. ALLOCATED(MESHES(NM)%FCVAR)) &
      ALLOCATE(MESHES(NM)%FCVAR(ISTR:IEND,JSTR:JEND,KSTR:KEND,IBM_NFVARS,MAX_DIM))
   MESHES(NM)%FCVAR = 0
   MESHES(NM)%FCVAR(:,:,:,IBM_FGSC,:) = IBM_GASPHASE

   ! Cartesian cells:
   IF (.NOT. ALLOCATED(MESHES(NM)%CCVAR)) &
      ALLOCATE(MESHES(NM)%CCVAR(ISTR:IEND,JSTR:JEND,KSTR:KEND,IBM_NCVARS))
   MESHES(NM)%CCVAR = 0
   MESHES(NM)%CCVAR(:,:,:,IBM_CGSC) = IBM_GASPHASE

   ! When TERRAIN_CASE = TRUE, allocate GEOM_ZMAX for the mesh:
   IF (TERRAIN_CASE) THEN
      ALLOCATE(GEOM_ZMAX_AUX(ISTR:IEND,JSTR:JEND)); GEOM_ZMAX_AUX = -1._EB/GEOMEPS
   ENDIF

   ! Write Mesh number allocation if GET_CUTCELLS_VERBOSE:
   IF(GET_CUTCELLS_VERBOSE) THEN
      WRITE(LU_SETCC,'(A)') ' '
      WRITE(LU_SETCC,'(A,I5,A,I10)') ' Processing Mesh : ',NM
      IF(MY_RANK==0) THEN
         WRITE(LU_ERR,'(A)') ' '
         WRITE(LU_ERR,'(A,I5,A,I10)') ' Processing Mesh : ',NM
      ENDIF
   ENDIF

   ! Here we have to allocate the size of MESHES(NM)%EDGE_CROSS:
   MESHES(NM)%N_EDGE_CROSS = 0 ! Reset EDCROSS counter for mesh NM.
   IF (ALLOCATED(MESHES(NM)%EDGE_CROSS)) DEALLOCATE(MESHES(NM)%EDGE_CROSS)
   ALLOCATE( MESHES(NM)%EDGE_CROSS( GLOBAL_DELTA_EDGE ) )

   ! Here we have to allocate the size of MESHES(NM)%CUT_EDGE:
   MESHES(NM)%N_CUTEDGE_MESH = 0   ! Reset CUTEDGE counter for mesh NM.
   IF (ALLOCATED(MESHES(NM)%CUT_EDGE)) DEALLOCATE(MESHES(NM)%CUT_EDGE)
   ALLOCATE( MESHES(NM)%CUT_EDGE( GLOBAL_DELTA_EDGE ) )

   ! Here we have to allocate the size of MESHES(NM)%CUT_FACE:
   MESHES(NM)%N_CUTFACE_MESH     = 0   ! Reset CUTFACE counter for mesh NM.
   MESHES(NM)%N_BBCUTFACE_MESH   = 0; MESHES(NM)%N_GCCUTFACE_MESH = 0
   IF (ALLOCATED(MESHES(NM)%CUT_FACE)) DEALLOCATE(MESHES(NM)%CUT_FACE)
   ALLOCATE( MESHES(NM)%CUT_FACE( GLOBAL_DELTA_FACE ) )

   ! Here we have to allocate the size of MESHES(NM)%CUT_CELL:
   MESHES(NM)%N_CUTCELL_MESH     = 0   ! Reset CUTCELL counter for mesh NM.
   MESHES(NM)%N_GCCUTCELL_MESH   = 0
   IF (ALLOCATED(MESHES(NM)%CUT_CELL)) DEALLOCATE(MESHES(NM)%CUT_CELL)
   ALLOCATE( MESHES(NM)%CUT_CELL( GLOBAL_DELTA_CELL ) )

   ! Allocate array for special cells containing geometry intersections:
   ALLOCATE(CELLRT(ISTR:IEND,JSTR:JEND,KSTR:KEND)); CELLRT(:,:,:)=.FALSE.

   SNAP_IF : IF(SNAP_TO_GRID) THEN

      CALL GET_REGULAR_CUTCELLS_BOX

   ELSE
   ! Do Loop for different x1 planes:
   X1AXIS_LOOP : DO X1AXIS=IAXIS,KAXIS

      SELECT CASE(X1AXIS)
       CASE(IAXIS)

          PLNORMAL = (/ 1._EB, 0._EB, 0._EB/)
          ILO = ILO_FACE-CCGUARD;  IHI = IHI_FACE+CCGUARD
          JLO = JLO_FACE;  JHI = JLO_FACE
          KLO = KLO_FACE;  KHI = KLO_FACE

          ! x2, x3 axes parameters:
          X2AXIS = JAXIS; X2LO = JLO_FACE-CCGUARD; X2HI = JHI_FACE+CCGUARD
          X3AXIS = KAXIS; X3LO = KLO_FACE-CCGUARD; X3HI = KHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = IAXIS; XJAXIS = JAXIS; XKAXIS = KAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(ISTR:IEND),DX1FACE(ISTR:IEND))
          X1FACE = XFACE; DX1FACE = DXFACE
          ALLOCATE(X2FACE(JSTR:JEND),DX2FACE(JSTR:JEND))
          X2FACE = YFACE; DX2FACE = DYFACE
          ALLOCATE(X3FACE(KSTR:KEND),DX3FACE(KSTR:KEND))
          X3FACE = ZFACE; DX3FACE = DZFACE

          ! x2 cell center parameters:
          X2LO_CELL = JLO_CELL-CCGUARD; X2HI_CELL = JHI_CELL+CCGUARD
          ALLOCATE(X2CELL(JSTR:JEND),DX2CELL(JSTR:JEND))
          X2CELL = YCELL; DX2CELL = DYCELL

          ! x3 cell center parameters:
          X3LO_CELL = KLO_CELL-CCGUARD; X3HI_CELL = KHI_CELL+CCGUARD
          ALLOCATE(X3CELL(KSTR:KEND),DX3CELL(KSTR:KEND))
          X3CELL = ZCELL; DX3CELL = DZCELL

       CASE(JAXIS)

          PLNORMAL = (/ 0._EB, 1._EB, 0._EB/)
          ILO = ILO_FACE;  IHI = ILO_FACE
          JLO = JLO_FACE-CCGUARD;  JHI = JHI_FACE+CCGUARD
          KLO = KLO_FACE;  KHI = KLO_FACE

          ! x2, x3 axes parameters:
          X2AXIS = KAXIS; X2LO = KLO_FACE-CCGUARD; X2HI = KHI_FACE+CCGUARD
          X3AXIS = IAXIS; X3LO = ILO_FACE-CCGUARD; X3HI = IHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = KAXIS; XJAXIS = IAXIS; XKAXIS = JAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(JSTR:JEND),DX1FACE(JSTR:JEND))
          X1FACE = YFACE; DX1FACE = DYFACE
          ALLOCATE(X2FACE(KSTR:KEND),DX2FACE(KSTR:KEND))
          X2FACE = ZFACE; DX2FACE = DZFACE
          ALLOCATE(X3FACE(ISTR:IEND),DX3FACE(ISTR:IEND))
          X3FACE = XFACE; DX3FACE = DXFACE

          ! x2 cell center parameters:
          X2LO_CELL = KLO_CELL-CCGUARD; X2HI_CELL = KHI_CELL+CCGUARD
          ALLOCATE(X2CELL(KSTR:KEND),DX2CELL(KSTR:KEND))
          X2CELL = ZCELL; DX2CELL = DZCELL

          ! x3 cell center parameters:
          X3LO_CELL = ILO_CELL-CCGUARD; X3HI_CELL = IHI_CELL+CCGUARD
          ALLOCATE(X3CELL(ISTR:IEND),DX3CELL(ISTR:IEND))
          X3CELL = XCELL; DX3CELL = DXCELL

       CASE(KAXIS)

          PLNORMAL = (/ 0._EB, 0._EB, 1._EB/)
          ILO = ILO_FACE;  IHI = ILO_FACE
          JLO = JLO_FACE;  JHI = JLO_FACE
          KLO = KLO_FACE-CCGUARD;  KHI = KHI_FACE+CCGUARD

          ! x2, x3 axes parameters:
          X2AXIS = IAXIS; X2LO = ILO_FACE-CCGUARD; X2HI = IHI_FACE+CCGUARD
          X3AXIS = JAXIS; X3LO = JLO_FACE-CCGUARD; X3HI = JHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = JAXIS; XJAXIS = KAXIS; XKAXIS = IAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(KSTR:KEND),DX1FACE(KSTR:KEND))
          X1FACE = ZFACE; DX1FACE = DZFACE
          ALLOCATE(X2FACE(ISTR:IEND),DX2FACE(ISTR:IEND))
          X2FACE = XFACE; DX2FACE = DXFACE
          ALLOCATE(X3FACE(JSTR:JEND),DX3FACE(JSTR:JEND))
          X3FACE = YFACE; DX3FACE = DYFACE

          ! x2 cell center parameters:
          X2LO_CELL = ILO_CELL-CCGUARD; X2HI_CELL = IHI_CELL+CCGUARD
          ALLOCATE(X2CELL(ISTR:IEND),DX2CELL(ISTR:IEND))
          X2CELL = XCELL; DX2CELL = DXCELL

          ! x3 cell center parameters:
          X3LO_CELL = JLO_CELL-CCGUARD; X3HI_CELL = JHI_CELL+CCGUARD
          ALLOCATE(X3CELL(JSTR:JEND),DX3CELL(JSTR:JEND))
          X3CELL = YCELL; DX3CELL = DYCELL

      END SELECT

      ! Variable that states if raytracing is necessary to define segments
      ! status in a cartesian face.
      ALLOCATE(FACERT(X2LO_CELL:X2HI_CELL,X3LO_CELL:X3HI_CELL));

      ! Stretched grid vars:
      X1NOC=TRANS(NM)%NOC(X1AXIS)
      X2NOC=TRANS(NM)%NOC(X2AXIS)
      X3NOC=TRANS(NM)%NOC(X3AXIS)

      IF(GET_CUTCELLS_VERBOSE) THEN
         CALL CPU_TIME(CPUTIME_START)
         IF(X1AXIS < KAXIS) THEN
         WRITE(LU_SETCC,'(A,A,A,3I2,A)') ' Computing GEOMs-grid planes intersections for planes in ', &
         AXSTR(X1AXIS),' direction, local axes X1, X2, X3:',X1AXIS,X2AXIS,X3AXIS,' ..'
         IF (MY_RANK==0) THEN
         WRITE(LU_ERR,'(A,A,A,3I2,A)') ' Computing GEOMs-grid planes intersections for planes in ', &
         AXSTR(X1AXIS),' direction, local axes X1, X2, X3:',X1AXIS,X2AXIS,X3AXIS,' ..'
         ENDIF
         ELSE
         WRITE(LU_SETCC,'(A,A,A,3I2,A)',advance="no") ' Computing GEOMs-grid planes intersections for planes in ', &
         AXSTR(X1AXIS),' direction, local axes X1, X2, X3:',X1AXIS,X2AXIS,X3AXIS,' ..'
         IF (MY_RANK==0) THEN
         WRITE(LU_ERR,'(A,A,A,3I2,A)',advance="no") ' Computing GEOMs-grid planes intersections for planes in ', &
         AXSTR(X1AXIS),' direction, local axes X1, X2, X3:',X1AXIS,X2AXIS,X3AXIS,' ..'
         ENDIF
         ENDIF
      ENDIF

      ! Loop Coordinate Planes:
      DO K=KLO,KHI
         DO J=JLO,JHI
            DO I=ILO,IHI

               ! Which Plane?
               INDX1(IAXIS:KAXIS) = (/ I, J, K /)
               X1PLN = X1FACE(INDX1(X1AXIS))

               ! Get intersection of body on plane defined by X1PLN, normal to X1AXIS:
               TRI_ONPLANE_ONLY =.FALSE.
               RAYTRACE_X2_ONLY =.FALSE.
               FACERT(:,:)      =.FALSE.
               CALL GET_BODINT_PLANE(X1AXIS,X1PLN,INDX1(X1AXIS),PLNORMAL,X2AXIS,X3AXIS,&
                                     X2LO,X2HI,X3LO,X3HI,X2FACE,X3FACE,X2LO_CELL,&
                                     X2HI_CELL,X3LO_CELL,X3HI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE)

               ! Test that there is an intersection:
               IF ((BODINT_PLANE%NSGLS+BODINT_PLANE%NSEGS+BODINT_PLANE%NTRIS) == 0) CYCLE

               ! Drop if node locations outside block plane area:
               IF ((X2FACE(X2LO)-MAXVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))) > GEOMEPS) CYCLE
               IF ((MINVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))-X2FACE(X2HI)) > GEOMEPS) CYCLE
               IF ((X3FACE(X3LO)-MAXVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))) > GEOMEPS) CYCLE
               IF ((MINVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))-X3FACE(X3HI)) > GEOMEPS) CYCLE

               ! IF (GET_CUTCELLS_VERBOSE) THEN
               !    WRITE(LU_SETCC,'(I2,A,F14.8,A,3I8)') X1AXIS,', position :',X1PLN, &
               !    '; Single Points, Segments, Triangles :', BODINT_PLANE%NSGLS,BODINT_PLANE%NSEGS,BODINT_PLANE%NTRIS
               !    IF (MY_RANK==0) &
               !    WRITE(LU_ERR  ,'(I2,A,F14.8,A,3I8)') X1AXIS,', position :',X1PLN, &
               !    '; Single Points, Segments, Triangles :',  BODINT_PLANE%NSGLS,BODINT_PLANE%NSEGS,BODINT_PLANE%NTRIS
               ! ENDIF

               ! For plane normal to X1AXIS, shoot rays along X2AXIS on all X3AXIS gridline
               ! locations, get intersection data: Loop x3 axis locations
               DO KK=X3LO,X3HI

                  ! x3 location of ray along x2, on the x2-x3 plane:
                  X3RAY = X3FACE(KK)

                  ! Intersections along x2 for X3RAY x3 location:
                  CALL GET_X2_INTERSECTIONS(X1AXIS,X2AXIS,X3AXIS,X3RAY,X1PLN)
                  IF (STOP_STATUS==SETUP_STOP) RETURN

                  ! Drop x2 ray if all intersections are outside of the MESH block domain:
                  IF (IBM_N_CRS > 0) THEN
                     IF ((X2FACE(X2LO)-IBM_SVAR_CRS(IBM_N_CRS)) > GEOMEPS) THEN
                        CYCLE
                     ELSEIF (IBM_SVAR_CRS(1)-X2FACE(X2HI) > GEOMEPS) THEN
                        CYCLE
                     ENDIF
                  ENDIF

                  ! Highest Z crossing for I,J=KK,INDX1(X1AXIS) location, clip at ZF+DZ(KBAR):
                  IF(TERRAIN_CASE .AND. X2AXIS==KAXIS .AND. IBM_N_CRS>0) &
                  GEOM_ZMAX_AUX(KK,INDX1(X1AXIS)) = MIN(X2FACE(KBP1),IBM_SVAR_CRS(IBM_N_CRS))

                  ! Now for this ray, set vertex types in MESHES(NM)%VERTVAR(:,:,:,IBM_VGSC):
                  CALL GET_X2_VERTVAR(X1AXIS,X2LO,X2HI,NM,I,KK)

                  ! Now define Crossings on Cartesian Edges and Body segments:
                  ! Cartesian cut-edges:
                  CALL GET_CARTEDGE_CUTEDGES(X1AXIS,X2AXIS,X3AXIS,XIAXIS,XJAXIS,XKAXIS, &
                                             NM,X2LO_CELL,X2HI_CELL,INDX1,KK)

                  ! Set segment crossings:
                  ! This data is defined by plane, add to current:
                  ! - BODINT_PLANE : Data structure with information for crossings on
                  !                      body segments.
                  !                   % NBCROSS(1:NSEGS)        = Number of crossings
                  !                                               on the segment.
                  !                   % SVAR(1:NBCROSS,1:NSEGS) = distance from node 1
                  !                                               along the segment.
                  CALL GET_BODX2_INTERSECTIONS(X2AXIS,X3AXIS,X3RAY)

               ENDDO ! KK - x3 gridlines.

               ! Now for segments not aligned with x3, define
               ! intersections with grid line vertices:
               CALL GET_BODX3_INTERSECTIONS(X2AXIS,X3AXIS,X2LO,X2HI)

               ! After these loops all segments should contain points from Node1,
               ! cross 1, cross 2, ..., Node2, in ascending sbod order.
               ! Time to generate the body IBM_INBOUNDARY edges on faces and add
               ! to MESHES(NM)%CUT_EDGE:
               CALL GET_CARTFACE_CUTEDGES(X1AXIS,X2AXIS,X3AXIS,                   &
                                          XIAXIS,XJAXIS,XKAXIS,NM,                &
                                          X2LO,X2HI,X3LO,X3HI,X2LO_CELL,X2HI_CELL,&
                                          X3LO_CELL,X3HI_CELL,INDX1,X1PLN)

            ENDDO ! I index
         ENDDO ! J index
      ENDDO ! K index

      ! Deallocate local plane arrays:
      DEALLOCATE(X1FACE,X2FACE,X3FACE,X2CELL,X3CELL)
      DEALLOCATE(DX1FACE,DX2FACE,DX3FACE,DX2CELL,DX3CELL)
      DEALLOCATE(FACERT)

   ENDDO X1AXIS_LOOP

   IF(GET_CUTCELLS_VERBOSE) THEN
      CALL CPU_TIME(CPUTIME)
      WRITE(LU_SETCC,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,' sec.'
      IF (MY_RANK==0) WRITE(LU_ERR  ,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,' sec.'
   ENDIF

   ! Now Define the INBOUNDARY cut-edge inside Cartesian cells:
   CALL GET_CARTCELL_CUTEDGES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND)

   ! 1. Cartesian GASPHASE cut-faces:
   ! Loops for IAXIS, JAXIS, KAXIS faces: For FCVAR i,j,k, axis
   ! - Define Cartesian Boundary Edges indexes.
   ! - From ECVAR(i,j,k,IDCE,axis) figure out Entries in CUT_EDGE (GASPHASE segs).
   ! - From FCVAR(i,j,k,IDCE,axis) figure out entries in CUT_EDGE (INBOUNDCF segs).
   ! - Reorder Edges, figure out if there are disjoint areas present.
   ! - Load into CUT_FACE <=> FCVAR(i,j,k,IDCF,axis).
   CALL GET_CARTFACE_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,.TRUE.)

   ! 2. INBOUNDARY cut-faces:
   CALL GET_CARTCELL_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,.TRUE.)

   ! Guard-cell Cartesian GASPHASE and INBOUNDARY cut-faces:
   CALL GET_CARTFACE_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,.FALSE.)
   CALL GET_CARTCELL_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,.FALSE.)

   ! Finally: Definition of cut-cells:
   CELLRT = .FALSE.
   MESHES(NM)%N_SPCELL_CF = MESHES(NM)%N_SPCELL
   CALL GET_CARTCELL_CUTCELLS(NM)

   ENDIF SNAP_IF

   ! Case of terrain, populate GEOM_ZMAX:
   IF (TERRAIN_CASE) THEN
      IF(ALLOCATED(MESHES(NM)%GEOM_ZMAX)) DEALLOCATE(MESHES(NM)%GEOM_ZMAX)
      ALLOCATE(MESHES(NM)%GEOM_ZMAX(0:IBAR,0:JBAR))
      DO J=0,JBAR
         DO I=0,IBAR
            ! Clip at ZS-DZ(1):
            MESHES(NM)%GEOM_ZMAX(I,J) = MAX(ZFACE(-1),GEOM_ZMAX_AUX(I,J))
         ENDDO
      ENDDO
      DEALLOCATE(GEOM_ZMAX_AUX)
   ENDIF

   ! Deallocate arrays:
   ! Face centered positions and cell sizes:
   IF (ALLOCATED(XFACE)) DEALLOCATE(XFACE)
   IF (ALLOCATED(YFACE)) DEALLOCATE(YFACE)
   IF (ALLOCATED(ZFACE)) DEALLOCATE(ZFACE)
   IF (ALLOCATED(DXFACE)) DEALLOCATE(DXFACE)
   IF (ALLOCATED(DYFACE)) DEALLOCATE(DYFACE)
   IF (ALLOCATED(DZFACE)) DEALLOCATE(DZFACE)

   ! Cell centered positions and cell sizes:
   IF (ALLOCATED(XCELL)) DEALLOCATE(XCELL)
   IF (ALLOCATED(YCELL)) DEALLOCATE(YCELL)
   IF (ALLOCATED(ZCELL)) DEALLOCATE(ZCELL)
   IF (ALLOCATED(DXCELL)) DEALLOCATE(DXCELL)
   IF (ALLOCATED(DYCELL)) DEALLOCATE(DYCELL)
   IF (ALLOCATED(DZCELL)) DEALLOCATE(DZCELL)

   IF (ALLOCATED(CELLRT)) DEALLOCATE(CELLRT)

   IF (GET_CUTCELLS_VERBOSE) THEN
      IF(MESHES(NM)%N_CUTCELL_MESH > 0) THEN
         MIN_FACES_PER_CUTCELL = 1000000 !HUGE(MIN_FACES_PER_CUTCELL)
         MAX_FACES_PER_CUTCELL = 0
         MEAN_FACES_PER_CUTCELL= 0
         SUM_FACE = 0
         SUM_CCELL= 0
         DO ICC1=1,MESHES(NM)%N_CUTCELL_MESH
            SUM_CCELL = SUM_CCELL + MESHES(NM)%CUT_CELL(ICC1)%NCELL
            DO ICC2=1,MESHES(NM)%CUT_CELL(ICC1)%NCELL
               MAX_FACES_PER_CUTCELL = MAX(MAX_FACES_PER_CUTCELL,MESHES(NM)%CUT_CELL(ICC1)%CCELEM(1,ICC2))
               MIN_FACES_PER_CUTCELL = MIN(MIN_FACES_PER_CUTCELL,MESHES(NM)%CUT_CELL(ICC1)%CCELEM(1,ICC2))
               SUM_FACE = SUM_FACE + MESHES(NM)%CUT_CELL(ICC1)%CCELEM(1,ICC2)
            ENDDO
         ENDDO
         MEAN_FACES_PER_CUTCELL = SUM_FACE / SUM_CCELL
         ! Write to file:
         WRITE(LU_SETCC,'(A,3I8)') ' Min, Max, Mean Faces per cut-cell in mesh : ',&
         MIN_FACES_PER_CUTCELL, MAX_FACES_PER_CUTCELL, MEAN_FACES_PER_CUTCELL
         IF (MEAN_FACES_PER_CUTCELL > 30) THEN
            WRITE(LU_SETCC,'(A,A)') ' NOTE : GEOMETRY triangulation is EXTREMELY fine for FDS Cartesian mesh.',&
                                    ' This might make the calculation unnecessarily expensive.'
         ELSEIF (MEAN_FACES_PER_CUTCELL > 15) THEN
            WRITE(LU_SETCC,'(A,A)') ' NOTE : GEOMETRY triangulation is fine for FDS Cartesian mesh.',&
                                    ' This might make the calculation unnecessarily expensive.'
         ENDIF
         ! Write to ERR file:
         IF (MY_RANK==0) THEN
            WRITE(LU_ERR,'(A,3I8)') ' Min, Max, Mean Faces per cut-cell in mesh : ',&
            MIN_FACES_PER_CUTCELL, MAX_FACES_PER_CUTCELL, MEAN_FACES_PER_CUTCELL
            IF (MEAN_FACES_PER_CUTCELL > 30) THEN
               WRITE(LU_ERR,'(A,A)') ' NOTE : GEOMETRY triangulation is EXTREMELY fine for FDS Cartesian mesh.',&
                                     ' This might make the calculation unnecessarily expensive.'
            ELSEIF (MEAN_FACES_PER_CUTCELL > 15) THEN
               WRITE(LU_ERR,'(A,A)') ' NOTE : GEOMETRY triangulation is fine for FDS Cartesian mesh.',&
                                     ' This might make the calculation unnecessarily expensive.'
            ENDIF
         ENDIF
      ENDIF
      WRITE(LU_SETCC,'(A,I8,A)') ' Processing mesh : ',NM,' finished.'
      WRITE(LU_SETCC,'(A)') ' '
      IF (MY_RANK==0) THEN
         WRITE(LU_ERR  ,'(A,I8,A)') ' Processing mesh : ',NM,' finished.'
         WRITE(LU_ERR  ,'(A)') ' '
      ENDIF
   ENDIF

   ! Here we have to deallocate if no geometric entities were defined:
   ! EDGE_CROSS is deallocated:
   !IF (MESHES(NM)%N_EDGE_CROSS == 0) THEN
   IF (ALLOCATED(MESHES(NM)%EDGE_CROSS)) DEALLOCATE(MESHES(NM)%EDGE_CROSS)
   !ENDIF
   IF (MESHES(NM)%N_CUTEDGE_MESH == 0 .OR. PROCESS(NM)/=MY_RANK) THEN
      IF (ALLOCATED(MESHES(NM)%CUT_EDGE)) DEALLOCATE(MESHES(NM)%CUT_EDGE)
   ENDIF
   IF (MESHES(NM)%N_CUTFACE_MESH+MESHES(NM)%N_BBCUTFACE_MESH+MESHES(NM)%N_GCCUTFACE_MESH == 0) THEN
      IF (ALLOCATED(MESHES(NM)%CUT_FACE)) DEALLOCATE(MESHES(NM)%CUT_FACE)
   ENDIF
   IF(MESHES(NM)%N_CUTCELL_MESH+MESHES(NM)%N_GCCUTCELL_MESH == 0) THEN
      IF (ALLOCATED(MESHES(NM)%CUT_CELL)) DEALLOCATE(MESHES(NM)%CUT_CELL)
   ENDIF

   ! Sanity tests on cut-faces, cut-cells:
   IF (DEBUG_SET_CUTCELLS) THEN
      CUTFACE_TEST_LOOP : DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
         NFACE  = MESHES(NM)%CUT_FACE(ICF)%NFACE
         I      = MESHES(NM)%CUT_FACE(ICF)%IJK(IAXIS)
         J      = MESHES(NM)%CUT_FACE(ICF)%IJK(JAXIS)
         K      = MESHES(NM)%CUT_FACE(ICF)%IJK(KAXIS)
         X1AXIS = MESHES(NM)%CUT_FACE(ICF)%IJK(KAXIS+1)
         DO I=1,NFACE
            IF(MESHES(NM)%CUT_FACE(ICF)%AREA(I)<TWO_EPSILON_EB) THEN
            WRITE(LU_ERR,*) 'ZERO AREA=',MESHES(NM)%CUT_FACE(ICF)%STATUS,ICF,I,NFACE,MESHES(NM)%CUT_FACE(ICF)%AREA(I)
            WRITE(LU_ERR,*) 'CFELEM   =',MESHES(NM)%CUT_FACE(ICF)%CFELEM(1:MESHES(NM)%CUT_FACE(ICF)%CFELEM(1,I)+1,I)
            DO J=1,MESHES(NM)%CUT_FACE(ICF)%CFELEM(1,I)
            WRITE(LU_ERR,*) J,'=',MESHES(NM)%CUT_FACE(ICF)%XYZVERT(IAXIS:KAXIS,MESHES(NM)%CUT_FACE(ICF)%CFELEM(J+1,I))
            ENDDO
            ENDIF
         ENDDO
      ENDDO CUTFACE_TEST_LOOP
      CUTCELL_TEST_LOOP : DO ICF=1,MESHES(NM)%N_CUTCELL_MESH
         NCELL  = MESHES(NM)%CUT_CELL(ICF)%NCELL
         DO I=1,NCELL
            IF(MESHES(NM)%CUT_CELL(ICF)%VOLUME(I)<TWO_EPSILON_EB) THEN
            WRITE(LU_ERR,*) 'ZERO VOLU=',ICF,I,NCELL,MESHES(NM)%CUT_CELL(ICF)%VOLUME(I)
            WRITE(LU_ERR,*) 'CCELEM   =',MESHES(NM)%CUT_CELL(ICF)%CCELEM(1:MESHES(NM)%CUT_CELL(ICF)%CCELEM(1,I)+1,I)
            ENDIF
         ENDDO
      ENDDO CUTCELL_TEST_LOOP
   ENDIF

   IF(CC_CART_VOLAREA) CALL CC_SET_CARTESIAN_VOLAREA(NM)

   ! Deallocate Gasphase cut-faces and cut-cells inside Connecting meshes:
   IF (PROCESS(NM)/=MY_RANK) THEN
      CALL DEALLOCATE_CUTCF_CONN_MESH(NM)
   ENDIF

ENDDO MAIN_MESH_LOOP

CALL DEALLOCATE_BODINT_PLANE(BODINT_PLANE)
CALL DEALLOCATE_BODINT_PLANE(BODINT_PLANE2)

! Deallocate Intersection variables:
DEALLOCATE(IBM_SVAR_CRS,IBM_IS_CRS,IBM_SEG_CRS,IBM_BDNUM_CRS,IBM_BDNUM_CRS_AUX,IBM_IS_CRS2,IBM_SEG_TAN)

! Add to SET_CUTCELLS_3D loop time:
T_CC_USED(SET_CUTCELLS_TIME_INDEX) = T_CC_USED(SET_CUTCELLS_TIME_INDEX) + CURRENT_TIME() - TNOW

IF(GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_MESH)
   WRITE(LU_SETCC,'(A,F8.3,A)') ' Time taken to process meshes : ',CPUTIME_MESH-CPUTIME_START_MESH,', sec.'
   WRITE(LU_SETCC,'(A)') ' '
   IF (MY_RANK==0) THEN
      WRITE(LU_ERR  ,'(A,F8.3,A)') ' Time taken to process meshes : ',CPUTIME_MESH-CPUTIME_START_MESH,', sec.'
      WRITE(LU_ERR,'(A)') ' '
   ENDIF
ENDIF

! Fill Guardcells for CCVAR IBM_CGSC and CUT_CELL for meshes assigned to MPI process:
CALL SET_GC_CUTCELLS_3D

! Allocate and define entries for solid side CFACES:
IF(PERIODIC_TEST/=105) CALL GET_INBCUTFACES_TO_CFACE

IF(ALLOCATED(CC_COMPUTE_MESH)) DEALLOCATE(CC_COMPUTE_MESH)

IF(GET_CUTCELLS_VERBOSE) THEN
   WRITE(LU_SETCC,'(A)') ' SET_CUTCELLS_3D : Cut-cell definition finished.'
   WRITE(LU_SETCC,'(A)') ' '
   IF (MY_RANK==0) THEN
      WRITE(LU_ERR  ,'(A)') ' SET_CUTCELLS_3D : Cut-cell definition finished.'
      WRITE(LU_ERR  ,'(A)') ' '
   ENDIF
ENDIF

! Write out:
! Increase SET_CUTCELLS_3D call counter by 1:
CALL_COUNT = CALL_COUNT + 1
IF(PERIODIC_TEST==105) THEN
   CALL MPI_BARRIER(MPI_COMM_WORLD, IERR)
   IF(CALL_COUNT > 1) RETURN
ENDIF

! Loop over geometry:
CCVERBOSE_COND : IF(GET_CUTCELLS_VERBOSE) THEN
   SLEN_GEOM = 0._EB; AREA_GEOM = 0._EB; VOLUME_GEOM = 0._EB; XYZCEN_GEOM(IAXIS:KAXIS) = 0._EB
   DO IG=1,N_GEOMETRY
      ! Add length of wet surface edges:
      DO IEDGE=1,GEOMETRY(IG)%N_EDGES
         SEG(NOD1:NOD2)  = GEOMETRY(IG)%EDGES(NOD1:NOD2,IEDGE)
         DV(IAXIS:KAXIS) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD2)-1)+1:MAX_DIM*SEG(NOD2)) - &
                           GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD1)-1)+1:MAX_DIM*SEG(NOD1))
         SLEN = SQRT( DV(IAXIS)**2._EB + DV(JAXIS)**2._EB + DV(KAXIS)**2._EB )
         SLEN_GEOM = SLEN_GEOM + SLEN
      ENDDO
      ! Add to wet surface Areas:
      AREA_GEOM = AREA_GEOM + GEOMETRY(IG)%GEOM_AREA
      ! Add to GEOMETRY volume:
      VOLUME_GEOM = VOLUME_GEOM + GEOMETRY(IG)%GEOM_VOLUME
      ! Add to XYZCEN for geometries:
      XYZCEN_GEOM(IAXIS:KAXIS)= XYZCEN_GEOM(IAXIS:KAXIS) + GEOMETRY(IG)%GEOM_VOLUME * GEOMETRY(IG)%GEOM_XYZCEN(IAXIS:KAXIS)
   ENDDO
   IF(N_GEOMETRY > 0) XYZCEN_GEOM(IAXIS:KAXIS)=XYZCEN_GEOM(IAXIS:KAXIS)/VOLUME_GEOM

   ! Loop over meshes:
   NCUTFACE_INB = 0
   CF_AREA_INB=0._EB
   CC_VOLUME_INB=0._EB
   GP_VOLUME=0._EB
   DM_XYZCEN(IAXIS:KAXIS) = 0._EB
   CCGP_XYZCEN(IAXIS:KAXIS) = 0._EB
   TESTS_MESH_LOOP_1 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
      CALL POINT_TO_MESH(NM)
      DO ICF1 = 1,MESHES(NM)%N_CUTFACE_MESH
        IF (CUT_FACE(ICF1)%STATUS == IBM_INBOUNDARY) THEN
           NFACE = CUT_FACE(ICF1)%NFACE
           CF_AREA_INB = CF_AREA_INB + SUM(CUT_FACE(ICF1)%AREA(1:NFACE))
        ENDIF
      ENDDO
      DO ICC1 = 1,MESHES(NM)%N_CUTCELL_MESH
         NCELL = CUT_CELL(ICC1)%NCELL
         DO ICC2=1,NCELL
            CCGP_XYZCEN(IAXIS:KAXIS) = CCGP_XYZCEN(IAXIS:KAXIS) + CUT_CELL(ICC1)%VOLUME(ICC2) * &
                                                                  CUT_CELL(ICC1)%XYZCEN(IAXIS:KAXIS,ICC2)
            IF (CUT_CELL(ICC1)%VOLUME(ICC2)<TWO_EPSILON_EB) &
                WRITE(LU_SETCC,"(A,3I0,A,E11.4)") "NM, Cut-cell=",NM,ICC1,ICC2,", Volume=",CUT_CELL(ICC1)%VOLUME(ICC2)
         ENDDO
         CC_VOLUME_INB = CC_VOLUME_INB + SUM(CUT_CELL(ICC1)%VOLUME(1:NCELL))
      ENDDO
      ! Regular gasphase cells:
      DO K=1,KBAR
         DO J=1,JBAR
            DO I=1,IBAR
               IF ( CCVAR(I,J,K,IBM_CGSC) == IBM_GASPHASE) THEN
                 SLEN = DX(I)*DY(J)*DZ(K)
                 GP_VOLUME = GP_VOLUME + SLEN
                 CCGP_XYZCEN(IAXIS) = CCGP_XYZCEN(IAXIS) + SLEN * XC(I)
                 CCGP_XYZCEN(JAXIS) = CCGP_XYZCEN(JAXIS) + SLEN * YC(J)
                 CCGP_XYZCEN(KAXIS) = CCGP_XYZCEN(KAXIS) + SLEN * ZC(K)
               ENDIF
            ENDDO
         ENDDO
      ENDDO
      ! Domain volume:
      SLEN = (XF-XS)*(YF-YS)*(ZF-ZS)
      DM_VOLUME = DM_VOLUME + SLEN
      ! Domain Centroid:
      DM_XYZCEN(IAXIS) = DM_XYZCEN(IAXIS) + SLEN * 0.5_EB*(XF+XS)
      DM_XYZCEN(JAXIS) = DM_XYZCEN(JAXIS) + SLEN * 0.5_EB*(YF+YS)
      DM_XYZCEN(KAXIS) = DM_XYZCEN(KAXIS) + SLEN * 0.5_EB*(ZF+ZS)
   ENDDO TESTS_MESH_LOOP_1

   ! Allreduce areas:
   IF (N_MPI_PROCESSES > 1) THEN
      CF_AREA_INB_AUX = CF_AREA_INB
      CALL MPI_ALLREDUCE(CF_AREA_INB_AUX, CF_AREA_INB, 1, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)
   ENDIF

   IF (MY_RANK == 0) THEN
      WRITE(LU_ERR,"(/A)") ' Computational Geometry: Sanity tests for cut-cell region'
      WRITE(LU_ERR,"(A,E11.4,A,E11.4,A,E11.4)") &
      ' GEOM Surf  Area=',AREA_GEOM,', InBoundary Cut-faces Area=',CF_AREA_INB, &
      ', Relative Difference=',(AREA_GEOM-CF_AREA_INB)/(AREA_GEOM+TWO_EPSILON_EB)
      WRITE(LU_SETCC,"(/A)") ' Computational Geometry: Sanity tests for cut-cell region'
      WRITE(LU_SETCC,"(A,E11.4,A,E11.4,A,E11.4)") &
      ' GEOM Surf  Area=',AREA_GEOM,', InBoundary Cut-faces Area=',CF_AREA_INB, &
      ', Relative Difference=',(AREA_GEOM-CF_AREA_INB)/(AREA_GEOM+TWO_EPSILON_EB)
   ENDIF

   ! Allreduce Cut-cell, GASPHASE volumes:
   IF (N_MPI_PROCESSES > 1) THEN
      CC_VOLUME_INB_AUX = CC_VOLUME_INB
      CALL MPI_ALLREDUCE(CC_VOLUME_INB_AUX, CC_VOLUME_INB, 1, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)

      GP_VOLUME_AUX = GP_VOLUME
      CALL MPI_ALLREDUCE(GP_VOLUME_AUX, GP_VOLUME, 1, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)

      DM_VOLUME_AUX = DM_VOLUME
      CALL MPI_ALLREDUCE(DM_VOLUME_AUX, DM_VOLUME, 1, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)

      CCGP_XYZCEN_AUX(IAXIS:KAXIS) = CCGP_XYZCEN(IAXIS:KAXIS)
      CALL MPI_ALLREDUCE(CCGP_XYZCEN_AUX, CCGP_XYZCEN, 3, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)

      DM_XYZCEN_AUX(IAXIS:KAXIS) = DM_XYZCEN(IAXIS:KAXIS)
      CALL MPI_ALLREDUCE(DM_XYZCEN_AUX, DM_XYZCEN, 3, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)
   ENDIF
   CCGP_XYZCEN(IAXIS:KAXIS) = CCGP_XYZCEN(IAXIS:KAXIS) / (CC_VOLUME_INB+GP_VOLUME+TWO_EPSILON_EB)
   DM_XYZCEN(IAXIS:KAXIS)   = DM_XYZCEN(IAXIS:KAXIS)   / (DM_VOLUME+TWO_EPSILON_EB)

   IF (MY_RANK == 0) THEN
      WRITE(LU_ERR,"(A,E11.4,A,E11.4,A,E11.4)") &
      ' GEOM Gas Volume=',DM_VOLUME-VOLUME_GEOM,', Cut/Regl Gas cells Volume=',GP_VOLUME+CC_VOLUME_INB, &
      ', Relative Difference=',((DM_VOLUME-VOLUME_GEOM)-(GP_VOLUME+CC_VOLUME_INB))/(DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
      WRITE(LU_SETCC,"(A,E11.4,A,E11.4,A,E11.4)") &
      ' GEOM Gas Volume=',DM_VOLUME-VOLUME_GEOM,', Cut/Regl Gas cells Volume=',GP_VOLUME+CC_VOLUME_INB, &
      ', Relative Difference=',((DM_VOLUME-VOLUME_GEOM)-(GP_VOLUME+CC_VOLUME_INB))/(DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
      WRITE(LU_ERR,"(A,3E12.4)") &
      ' GEOM Centroid               =',XYZCEN_GEOM(IAXIS:KAXIS)
      WRITE(LU_ERR,"(A,3E12.4)") &
      ' DOMAIN-GEOM Centroid        =',(DM_XYZCEN(IAXIS:KAXIS)*DM_VOLUME - XYZCEN_GEOM(IAXIS:KAXIS)*VOLUME_GEOM) / &
      (DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
      WRITE(LU_ERR,"(A,3E12.4)") &
      ' Cut/Regl Gas cells Centroid =',CCGP_XYZCEN(IAXIS:KAXIS)
      WRITE(LU_ERR,"(A,3E12.4)") &
      ' Centroid Relative Difference=',CCGP_XYZCEN(IAXIS:KAXIS)-&
      (DM_XYZCEN(IAXIS:KAXIS)*DM_VOLUME - XYZCEN_GEOM(IAXIS:KAXIS)*VOLUME_GEOM) / &
      (DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
      WRITE(LU_SETCC,"(A,3E12.4)") &
      ' GEOM Centroid               =',XYZCEN_GEOM(IAXIS:KAXIS)
      WRITE(LU_SETCC,"(A,3E12.4)") &
      ' DOMAIN-GEOM Centroid        =',(DM_XYZCEN(IAXIS:KAXIS)*DM_VOLUME - XYZCEN_GEOM(IAXIS:KAXIS)*VOLUME_GEOM) / &
      (DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
      WRITE(LU_SETCC,"(A,3E12.4)") &
      ' Cut/Regl Gas cells Centroid =',CCGP_XYZCEN(IAXIS:KAXIS)
      WRITE(LU_SETCC,"(A,3E12.4)") &
      ' Centroid Relative Difference=',CCGP_XYZCEN(IAXIS:KAXIS)-&
      (DM_XYZCEN(IAXIS:KAXIS)*DM_VOLUME - XYZCEN_GEOM(IAXIS:KAXIS)*VOLUME_GEOM) / &
      (DM_VOLUME-VOLUME_GEOM+TWO_EPSILON_EB)
   ENDIF

   ! Write out the GEOM Area per SURF_ID:
   ALLOCATE(GEOM_AREA_SURF(0:N_SURF)); GEOM_AREA_SURF=0._EB
   ALLOCATE(GEOM_SURF(0:N_SURF)); GEOM_SURF=0
   SURF_MESH_LOOP : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
      CALL POINT_TO_MESH(NM)
      DO ICF=1,N_CFACE_CELLS
         CFA=>CFACE(ICF)
         GEOM_AREA_SURF(CFA%SURF_INDEX) = GEOM_AREA_SURF(CFA%SURF_INDEX) + CFA%AREA
         GEOM_SURF(CFA%SURF_INDEX)      = 1
      ENDDO
   ENDDO SURF_MESH_LOOP
   CALL MPI_ALLREDUCE(MPI_IN_PLACE, GEOM_AREA_SURF, N_SURF+1, MPI_DOUBLE_PRECISION, MPI_SUM, MPI_COMM_WORLD, IERR)
   CALL MPI_ALLREDUCE(MPI_IN_PLACE, GEOM_SURF,      N_SURF+1, MPI_INTEGER,          MPI_SUM, MPI_COMM_WORLD, IERR)
   IF (MY_RANK==0) THEN
      DO SURF_INDEX=0,N_SURF
         IF (GEOM_SURF(SURF_INDEX)>0) &
         WRITE(LU_ERR,"(A,1E14.6)") ' SURF_ID = '//TRIM(SURFACE(SURF_INDEX)%ID)//', Area : ',GEOM_AREA_SURF(SURF_INDEX)
         WRITE(LU_SETCC,"(A,1E14.6)")' SURF_ID = '//TRIM(SURFACE(SURF_INDEX)%ID)//', Area : ',GEOM_AREA_SURF(SURF_INDEX)
      ENDDO
   ENDIF
   DEALLOCATE(GEOM_AREA_SURF, GEOM_SURF)

   ! Write out special cells info:
   N_SPCELLCF_TOT=0; N_SPCELL_TOT=0
   DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
      N_SPCELLCF_TOT = N_SPCELLCF_TOT + MESHES(NM)%N_SPCELL_CF
      N_SPCELL_TOT   = N_SPCELL_TOT   + MESHES(NM)%N_SPCELL
      WRITE(LU_SETCC,"(A,3I8)") 'MESH, Number of Special Cells CF, Total=',NM,MESHES(NM)%N_SPCELL_CF,MESHES(NM)%N_SPCELL
      DO ICC1=1,MESHES(NM)%N_SPCELL
         WRITE(LU_SETCC,"(A,2I8,A,3I8)") 'NM,CELL IJK=',NM,ICC1,':',MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,ICC1)
      ENDDO
   ENDDO
   CALL MPI_ALLREDUCE(MPI_IN_PLACE, N_SPCELLCF_TOT,    1, MPI_INTEGER,          MPI_SUM, MPI_COMM_WORLD, IERR)
   CALL MPI_ALLREDUCE(MPI_IN_PLACE, N_SPCELL_TOT,      1, MPI_INTEGER,          MPI_SUM, MPI_COMM_WORLD, IERR)
   IF (MY_RANK==0) WRITE(LU_ERR,"(A,2I8)") 'Total Number of Special Cells CF, Total=',N_SPCELLCF_TOT,N_SPCELL_TOT

   ! Write out more detailed stats:
   WRITE_CFACE_STATS_COND : IF (WRITE_CFACE_STATS) THEN
      ! Loop over meshes:
      TESTS_MESH_LOOP_2 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
         CALL POINT_TO_MESH(NM)
         NCUTEDGE_IBCC = 0; SLEN_IBCC = 0._EB
         NCUTEDGE_IBCF = 0
         ! Number of CUT_EDGE for this mesh:
         IF(ALLOCATED(MESHES(NM)%CUT_EDGE)) THEN
            DO ICE1 = 1,MESHES(NM)%N_CUTEDGE_MESH
               SELECT CASE(MESHES(NM)%CUT_EDGE(ICE1)%STATUS)
               CASE(IBM_INBOUNDCC)
                  NEDGE = MESHES(NM)%CUT_EDGE(ICE1)%NEDGE
                  NCUTEDGE_IBCC = NCUTEDGE_IBCC + NEDGE
                  DO IEDGE=1,NEDGE
                     SEG(NOD1:NOD2)  = MESHES(NM)%CUT_EDGE(ICE1)%CEELEM(NOD1:NOD2,IEDGE)
                     DV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(ICE1)%XYZVERT(IAXIS:KAXIS,SEG(NOD2)) - &
                                       MESHES(NM)%CUT_EDGE(ICE1)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                     SLEN = SQRT( DV(IAXIS)**2._EB + DV(JAXIS)**2._EB + DV(KAXIS)**2._EB )
                     SLEN_IBCC = SLEN_IBCC + SLEN
                  ENDDO
               CASE(IBM_INBOUNDCF)
                  SELECT CASE(MESHES(NM)%CUT_EDGE(ICE1)%IJK(4))
                       CASE(IAXIS)
                           IF(MESHES(NM)%CUT_EDGE(ICE1)%IJK(IAXIS) == IBAR) CYCLE
                       CASE(JAXIS)
                           IF(MESHES(NM)%CUT_EDGE(ICE1)%IJK(JAXIS) == JBAR) CYCLE
                       CASE(KAXIS)
                           IF(MESHES(NM)%CUT_EDGE(ICE1)%IJK(KAXIS) == KBAR) CYCLE
                  END SELECT
                  NCUTEDGE_IBCF = NCUTEDGE_IBCF + MESHES(NM)%CUT_EDGE(ICE1)%NEDGE
               END SELECT
            ENDDO
         ENDIF

         WRITE(LU_SETCC,*) ' '
         WRITE(LU_SETCC,*) 'MESH=',NM
         WRITE(LU_SETCC,*) 'CUTEDGE=',PROCESS(NM),NM,MESHES(NM)%N_CUTEDGE_MESH,MESHES(NM)%N_EDGE_CROSS
         !WRITE(LU_SETCC,*) 'NCUTEDGE_IBCF =',NCUTEDGE_IBCF
         !WRITE(LU_SETCC,*) 'NCUTEDGE_IBCC =',NCUTEDGE_IBCC, ', SLEN_IBCC =',SLEN_IBCC,', SLEN_GEOM =',SLEN_GEOM

         NCUTFACE_IAXIS = 0
         NCUTFACE_JAXIS = 0
         NCUTFACE_KAXIS = 0
         CF_AREA_IAXIS=0._EB;      CF_AREA_JAXIS=0._EB;      CF_AREA_KAXIS=0._EB
         CF_INXAREA_IAXIS=0._EB;   CF_INXAREA_JAXIS=0._EB;   CF_INXAREA_KAXIS=0._EB
         CF_INXSQAREA_IAXIS=0._EB; CF_INXSQAREA_JAXIS=0._EB; CF_INXSQAREA_KAXIS=0._EB
         CF_JNYSQAREA_IAXIS=0._EB; CF_JNYSQAREA_JAXIS=0._EB; CF_JNYSQAREA_KAXIS=0._EB
         CF_KNZSQAREA_IAXIS=0._EB; CF_KNZSQAREA_JAXIS=0._EB; CF_KNZSQAREA_KAXIS=0._EB
         NCUTFACE_INB = 0
         CF_AREA_INB=0._EB; CF_INXAREA_INB=0._EB;
         CF_INXSQAREA_INB=0._EB; CF_JNYSQAREA_INB=0._EB; CF_KNZSQAREA_INB=0._EB
         DO ICF1 = 1,MESHES(NM)%N_CUTFACE_MESH
           IF (CUT_FACE(ICF1)%STATUS == IBM_GASPHASE) THEN
              NFACE = CUT_FACE(ICF1)%NFACE
              X1AXIS= CUT_FACE(ICF1)%IJK(MAX_DIM+1)
              SELECT CASE(X1AXIS)
                 CASE(IAXIS)
                    NCUTFACE_IAXIS = NCUTFACE_IAXIS + NFACE
                    CF_AREA_IAXIS = CF_AREA_IAXIS + SUM(CUT_FACE(ICF1)%AREA(1:NFACE))
                    CF_INXAREA_IAXIS = CF_INXAREA_IAXIS + SUM(CUT_FACE(ICF1)%INXAREA(1:NFACE))
                    CF_INXSQAREA_IAXIS=CF_INXSQAREA_IAXIS+SUM(CUT_FACE(ICF1)%INXSQAREA(1:NFACE))
                    CF_JNYSQAREA_IAXIS=CF_JNYSQAREA_IAXIS+SUM(CUT_FACE(ICF1)%JNYSQAREA(1:NFACE))
                    CF_KNZSQAREA_IAXIS=CF_KNZSQAREA_IAXIS+SUM(CUT_FACE(ICF1)%KNZSQAREA(1:NFACE))
                 CASE(JAXIS)
                    NCUTFACE_JAXIS = NCUTFACE_JAXIS + NFACE
                    CF_AREA_JAXIS = CF_AREA_JAXIS + SUM(CUT_FACE(ICF1)%AREA(1:NFACE))
                    CF_INXAREA_JAXIS = CF_INXAREA_JAXIS + SUM(CUT_FACE(ICF1)%INXAREA(1:NFACE))
                    CF_INXSQAREA_JAXIS=CF_INXSQAREA_JAXIS+SUM(CUT_FACE(ICF1)%INXSQAREA(1:NFACE))
                    CF_JNYSQAREA_JAXIS=CF_JNYSQAREA_JAXIS+SUM(CUT_FACE(ICF1)%JNYSQAREA(1:NFACE))
                    CF_KNZSQAREA_JAXIS=CF_KNZSQAREA_JAXIS+SUM(CUT_FACE(ICF1)%KNZSQAREA(1:NFACE))
                 CASE(KAXIS)
                    NCUTFACE_KAXIS = NCUTFACE_KAXIS + NFACE
                    CF_AREA_KAXIS = CF_AREA_KAXIS + SUM(CUT_FACE(ICF1)%AREA(1:NFACE))
                    CF_INXAREA_KAXIS = CF_INXAREA_KAXIS + SUM(CUT_FACE(ICF1)%INXAREA(1:NFACE))
                    CF_INXSQAREA_KAXIS=CF_INXSQAREA_KAXIS+SUM(CUT_FACE(ICF1)%INXSQAREA(1:NFACE))
                    CF_JNYSQAREA_KAXIS=CF_JNYSQAREA_KAXIS+SUM(CUT_FACE(ICF1)%JNYSQAREA(1:NFACE))
                    CF_KNZSQAREA_KAXIS=CF_KNZSQAREA_KAXIS+SUM(CUT_FACE(ICF1)%KNZSQAREA(1:NFACE))
              END SELECT
           ELSE ! IBM_INBOUNDARY..
              NFACE = CUT_FACE(ICF1)%NFACE
              CF_AREA_INB = CF_AREA_INB + SUM(CUT_FACE(ICF1)%AREA(1:NFACE))
              CF_INXAREA_INB = CF_INXAREA_INB + SUM(CUT_FACE(ICF1)%INXAREA(1:NFACE))
              CF_INXSQAREA_INB=CF_INXSQAREA_INB+SUM(CUT_FACE(ICF1)%INXSQAREA(1:NFACE))
              CF_JNYSQAREA_INB=CF_JNYSQAREA_INB+SUM(CUT_FACE(ICF1)%JNYSQAREA(1:NFACE))
              CF_KNZSQAREA_INB=CF_KNZSQAREA_INB+SUM(CUT_FACE(ICF1)%KNZSQAREA(1:NFACE))
           ENDIF
         ENDDO
         !WRITE(LU_SETCC,*) ' '
         WRITE(LU_SETCC,*) 'CUTFACE=',PROCESS(NM),NM,MESHES(NM)%N_CUTFACE_MESH
         WRITE(LU_SETCC,*) 'CUTFACE X Y Z=',NCUTFACE_IAXIS,NCUTFACE_JAXIS,NCUTFACE_KAXIS
         !WRITE(LU_SETCC,*) 'CF_AREA X Y Z=',CF_AREA_IAXIS,CF_AREA_JAXIS,CF_AREA_KAXIS
         !WRITE(LU_SETCC,*) 'CF_INXAREA X Y Z=',CF_INXAREA_IAXIS,CF_INXAREA_JAXIS,CF_INXAREA_KAXIS
         !WRITE(LU_SETCC,*) 'CF_INXSQAREA X Y Z=',CF_INXSQAREA_IAXIS,CF_INXSQAREA_JAXIS,CF_INXSQAREA_KAXIS
         !WRITE(LU_SETCC,*) 'CF_JNYSQAREA X Y Z=',CF_JNYSQAREA_IAXIS,CF_JNYSQAREA_JAXIS,CF_JNYSQAREA_KAXIS
         !WRITE(LU_SETCC,*) 'CF_KNZSQAREA X Y Z=',CF_KNZSQAREA_IAXIS,CF_KNZSQAREA_JAXIS,CF_KNZSQAREA_KAXIS
         !WRITE(LU_SETCC,*) ' '
         WRITE(LU_SETCC,*) 'CUTFACE INB=',NCUTFACE_INB
         !WRITE(LU_SETCC,*) 'CF_AREA, CF_INXAREA INB=',CF_AREA_INB,CF_INXAREA_INB
         !WRITE(LU_SETCC,*) 'CF_INXSQAREA INB =',CF_INXSQAREA_INB,CF_JNYSQAREA_INB,CF_KNZSQAREA_INB

         ! Cut-cells:
         MIN_CC_IJK_ICCJCC(1:5) = 0
         MAX_CC_IJK_ICCJCC(1:5) = 0
         MIN_CC_VOL = 1.E20_EB
         MAX_CC_VOL =-1.E20_EB
         DO ICC1=1,MESHES(NM)%N_CUTCELL_MESH
            DO ICC2=1,CUT_CELL(ICC1)%NCELL
               IF(CUT_CELL(ICC1)%VOLUME(ICC2) < MIN_CC_VOL) THEN
                  MIN_CC_VOL = CUT_CELL(ICC1)%VOLUME(ICC2)
                  MIN_CC_IJK_ICCJCC(1:5) = (/ CUT_CELL(ICC1)%IJK(1:3), ICC1, ICC2  /)
               ENDIF
               IF(CUT_CELL(ICC1)%VOLUME(ICC2) > MAX_CC_VOL) THEN
                  MAX_CC_VOL = CUT_CELL(ICC1)%VOLUME(ICC2)
                  MAX_CC_IJK_ICCJCC(1:5) = (/ CUT_CELL(ICC1)%IJK(1:3), ICC1, ICC2  /)
               ENDIF
            ENDDO
         ENDDO
         WRITE(LU_SETCC,*) ' '
         WRITE(LU_SETCC,*) 'CUTCELL=',PROCESS(NM),NM,MESHES(NM)%N_CUTCELL_MESH
         WRITE(LU_SETCC,*) 'MIN VOL=',MIN_CC_IJK_ICCJCC(1:5),MIN_CC_VOL
         WRITE(LU_SETCC,*) 'MAX VOL=',MAX_CC_IJK_ICCJCC(1:5),MAX_CC_VOL

      ENDDO TESTS_MESH_LOOP_2
   ENDIF WRITE_CFACE_STATS_COND
ENDIF CCVERBOSE_COND

RETURN

CONTAINS


SUBROUTINE CC_SET_CARTESIAN_VOLAREA(NM)

INTEGER, INTENT(IN) :: NM

! Local Vars:
INTEGER :: ICF,JCF,ICC,JCC
REAL(EB):: AREA_CF_T,FCT,AREA_CRT,VOL_CC_T

CUTFACE_LOOP : DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
  NFACE  = MESHES(NM)%CUT_FACE(ICF)%NFACE
  I      = MESHES(NM)%CUT_FACE(ICF)%IJK(IAXIS)
  J      = MESHES(NM)%CUT_FACE(ICF)%IJK(JAXIS)
  K      = MESHES(NM)%CUT_FACE(ICF)%IJK(KAXIS)
  X1AXIS = MESHES(NM)%CUT_FACE(ICF)%IJK(KAXIS+1)
  AREA_CF_T = SUM(MESHES(NM)%CUT_FACE(ICF)%AREA(1:NFACE))+TWO_EPSILON_EB
  DO JCF=1,NFACE
     FCT = MESHES(NM)%CUT_FACE(ICF)%AREA(JCF)/AREA_CF_T
     SELECT CASE(X1AXIS)
     CASE(IAXIS); AREA_CRT = MESHES(NM)%DY(J)*MESHES(NM)%DZ(K)
     CASE(JAXIS); AREA_CRT = MESHES(NM)%DX(I)*MESHES(NM)%DZ(K)
     CASE(KAXIS); AREA_CRT = MESHES(NM)%DX(I)*MESHES(NM)%DY(J)
     END SELECT
     MESHES(NM)%CUT_FACE(ICF)%AREA(JCF) = FCT*AREA_CRT
  ENDDO
ENDDO CUTFACE_LOOP

CUTCELL_LOOP : DO ICC=1,MESHES(NM)%N_CUTCELL_MESH
   I      = MESHES(NM)%CUT_CELL(ICC)%IJK(IAXIS)
   J      = MESHES(NM)%CUT_CELL(ICC)%IJK(JAXIS)
   K      = MESHES(NM)%CUT_CELL(ICC)%IJK(KAXIS)
   NCELL  = MESHES(NM)%CUT_CELL(ICC)%NCELL
   VOL_CC_T = SUM(MESHES(NM)%CUT_CELL(ICC)%VOLUME(1:NCELL))+TWO_EPSILON_EB
   DO JCC=1,NCELL
      FCT = MESHES(NM)%CUT_CELL(ICC)%VOLUME(JCC)/VOL_CC_T
      MESHES(NM)%CUT_CELL(ICC)%VOLUME(JCC) = FCT*MESHES(NM)%DX(I)*MESHES(NM)%DY(J)*MESHES(NM)%DZ(K)
   ENDDO
ENDDO CUTCELL_LOOP

RETURN
END SUBROUTINE CC_SET_CARTESIAN_VOLAREA

! ---------------------- GET_REGULAR_CUTCELLS_BOX ------------------------------

SUBROUTINE GET_REGULAR_CUTCELLS_BOX


! Local Variables:
INTEGER, ALLOCATABLE, DIMENSION(:,:,:)   :: GEOMCELL
INTEGER, ALLOCATABLE, DIMENSION(:,:,:,:) :: GEOMFACE
INTEGER :: IBNDINT,INTGC_FLG,BNDINT_LOW,BNDINT_HIGH,II,JJ,KK,X1LO,X1HI,X2LO,X2HI,X3LO,X3HI,INDXI(IAXIS:KAXIS)
INTEGER :: INDI,INDJ,INDK,INDI1,INDJ1,INDK1,INDI2,INDJ2,INDK2,INDI3,INDJ3,INDK3,INDI4,INDJ4,INDK4
INTEGER :: INDXI1(IAXIS:KAXIS),INDXI2(IAXIS:KAXIS),INDXI3(IAXIS:KAXIS),INDXI4(IAXIS:KAXIS)
INTEGER :: NVERT,NFACE,NVERTFACE,NCUTFACE,NCUTCELL,FSID_XYZ(LOW_IND:HIGH_IND,IAXIS:KAXIS),CFELEM(1:NOD4+1,6),&
           IDCF_XYZ(LOW_IND:HIGH_IND,IAXIS:KAXIS)
INTEGER :: LOHI,IWSEL,I1,I2,I3,IBOD(6),ITRI(6),FACE_LIST(1:IBM_NPARAM_CCFACE,1:6),CEI_AXIS(LOW_IND:HIGH_IND),&
           CEI,SIDE,NCFACE_CUTCELL,NFACE_CELL
REAL(EB):: DIST, DIST2, VOL(1)
REAL(EB):: XYZLC(IAXIS:KAXIS),XYZVERT(IAXIS:KAXIS,NOD1:NOD4+20),AREA(6),XYZCEN(IAXIS:KAXIS,6),XCEN(IAXIS:KAXIS)
REAL(EB):: INXAREA(IAXIS:KAXIS,1:6)=0._EB,INXSQAREA(IAXIS:KAXIS,1:6)=0._EB
LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:,:) :: IJK_COUNTED
LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:)   :: IJK_COUNTED2,IJK_COUNT


! Allocate Face - Geom numbering and Cell - Geom numbering arrays
ALLOCATE(GEOMFACE(ISTR:IEND,JSTR:JEND,KSTR:KEND,MAX_DIM)); GEOMFACE = IBM_GASPHASE
ALLOCATE(GEOMCELL(ISTR:IEND,JSTR:JEND,KSTR:KEND));         GEOMCELL = IBM_GASPHASE

! First tag cells: NM is set and we have all the mesh info in MESHES(NM)
DO K=KLO_CELL-NGUARD,KHI_CELL+NGUARD
   DO J=JLO_CELL-NGUARD,JHI_CELL+NGUARD
      DO I=ILO_CELL-NGUARD,IHI_CELL+NGUARD
         DO IG=1,N_GEOMETRY
            IF(XCELL(I) < GEOMETRY(IG)%XB(1)) CYCLE
            IF(XCELL(I) > GEOMETRY(IG)%XB(2)) CYCLE
            IF(YCELL(J) < GEOMETRY(IG)%XB(3)) CYCLE
            IF(YCELL(J) > GEOMETRY(IG)%XB(4)) CYCLE
            IF(ZCELL(K) < GEOMETRY(IG)%XB(5)) CYCLE
            IF(ZCELL(K) > GEOMETRY(IG)%XB(6)) CYCLE
            GEOMCELL(I,J,K) = IG
            MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) = IBM_SOLID
            EXIT
         ENDDO
      ENDDO
   ENDDO
ENDDO

! Now Tag cut-cells: The -2, +2 is to be able to define cut-face types below on boundary of GC cut-cells.
DO K=KLO_CELL-NGUARD+1,KHI_CELL+NGUARD-1
   DO J=JLO_CELL-NGUARD+1,JHI_CELL+NGUARD-1
      DO I=ILO_CELL-NGUARD+1,IHI_CELL+NGUARD-1
         IF(MESHES(NM)%CCVAR(I,J,K,IBM_CGSC)==IBM_SOLID) THEN
            ! Set all vertices to Solid:
            MESHES(NM)%VERTVAR(I-1,J  ,K  ,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I-1,J-1,K  ,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I-1,J-1,K-1,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I-1,J  ,K-1,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I  ,J  ,K  ,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I  ,J-1,K  ,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I  ,J-1,K-1,IBM_VGSC) = IBM_SOLID
            MESHES(NM)%VERTVAR(I  ,J  ,K-1,IBM_VGSC) = IBM_SOLID
            CYCLE
         ENDIF
         IF(ANY(MESHES(NM)%CCVAR(I-1:I+1,J-1:J+1,K-1:K+1,IBM_CGSC) == IBM_SOLID)) &
         MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) = IBM_CUTCFE
      ENDDO
   ENDDO
ENDDO

! Then tag faces:
! X Faces:
DO K=KLO_CELL-CCGUARD,KHI_CELL+CCGUARD
   DO J=JLO_CELL-CCGUARD,JHI_CELL+CCGUARD
      DO I=ILO_FACE-CCGUARD,IHI_FACE+CCGUARD
         ! Drop if any of the two cells is Regular gasphase, means face is regular gasphase:
         IF(ANY(MESHES(NM)%CCVAR(I:I+1,J,K,IBM_CGSC) == IBM_GASPHASE)) CYCLE

         ! Now test if all are Solid set FCVAR to IBM_SOLID, GEOMFACE to low side SOLID value of GEOMCELL:
         IF(ALL(MESHES(NM)%CCVAR(I:I+1,J,K,IBM_CGSC) == IBM_SOLID)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,IAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,IAXIS) = GEOMCELL(I,J,K)
            CYCLE
         ENDIF

         ! Now Gasphase cut-faces: All CCVAR == CUTCFE
         IF(ALL(MESHES(NM)%CCVAR(I:I+1,J,K,IBM_CGSC) == IBM_CUTCFE)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,IAXIS) = IBM_CUTCFE
            ! GEOMFACE(I,J,K,IAXIS) stays IBM_GASPHASE
            CYCLE
         ENDIF

         ! Finally one cut-cell and one solid: Set FCVAR to solid, keep in GEOMFACE GEOM number:
         IF (GEOMCELL(I,J,K)*GEOMCELL(I+1,J,K) < 0) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,IAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,IAXIS) = MAXVAL(GEOMCELL(I:I+1,J,K)) ! This is because one is ==IBM_GASPHASE==-1
            CYCLE
         ENDIF
      ENDDO
   ENDDO
ENDDO

! Y Faces:
DO K=KLO_CELL-CCGUARD,KHI_CELL+CCGUARD
   DO J=JLO_FACE-CCGUARD,JHI_FACE+CCGUARD
      DO I=ILO_CELL-CCGUARD,IHI_CELL+CCGUARD
         ! Drop if any of the two cells is Regular gasphase, means face is regular gasphase:
         IF(ANY(MESHES(NM)%CCVAR(I,J:J+1,K,IBM_CGSC) == IBM_GASPHASE)) CYCLE

         ! Now test if all are Solid set FCVAR to IBM_SOLID, GEOMFACE to low side SOLID value of GEOMCELL:
         IF(ALL(MESHES(NM)%CCVAR(I,J:J+1,K,IBM_CGSC) == IBM_SOLID)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,JAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,JAXIS) = GEOMCELL(I,J,K)
            CYCLE
         ENDIF

         ! Now Gasphase cut-faces: All CCVAR == CUTCFE
         IF(ALL(MESHES(NM)%CCVAR(I,J:J+1,K,IBM_CGSC) == IBM_CUTCFE)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,JAXIS) = IBM_CUTCFE
            ! GEOMFACE(I,J,K,JAXIS) stays IBM_GASPHASE
            CYCLE
         ENDIF

         ! Finally one cut-cell and one solid: Set FCVAR to solid, keep in GEOMFACE GEOM number:
         IF (GEOMCELL(I,J,K)*GEOMCELL(I,J+1,K) < 0) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,JAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,JAXIS) = MAXVAL(GEOMCELL(I,J:J+1,K)) ! This is because one is ==IBM_GASPHASE==-1
            CYCLE
         ENDIF
      ENDDO
   ENDDO
ENDDO

! Z Faces:
DO K=KLO_FACE-CCGUARD,KHI_FACE+CCGUARD
   DO J=JLO_CELL-CCGUARD,JHI_CELL+CCGUARD
      DO I=ILO_CELL-CCGUARD,IHI_CELL+CCGUARD
         ! Drop if any of the two cells is Regular gasphase, means face is regular gasphase:
         IF(ANY(MESHES(NM)%CCVAR(I,J,K:K+1,IBM_CGSC) == IBM_GASPHASE)) CYCLE

         ! Now test if all are Solid set FCVAR to IBM_SOLID, GEOMFACE to low side SOLID value of GEOMCELL:
         IF(ALL(MESHES(NM)%CCVAR(I,J,K:K+1,IBM_CGSC) == IBM_SOLID)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,KAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,KAXIS) = GEOMCELL(I,J,K)
            CYCLE
         ENDIF

         ! Now Gasphase cut-faces: All CCVAR == CUTCFE
         IF(ALL(MESHES(NM)%CCVAR(I,J,K:K+1,IBM_CGSC) == IBM_CUTCFE)) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,KAXIS) = IBM_CUTCFE
            ! GEOMFACE(I,J,K,KAXIS) stays IBM_GASPHASE
            CYCLE
         ENDIF

         ! Finally one cut-cell and one solid: Set FCVAR to solid, keep in GEOMFACE GEOM number:
         IF (GEOMCELL(I,J,K)*GEOMCELL(I,J,K+1) < 0) THEN
            MESHES(NM)%FCVAR(I,J,K,IBM_FGSC,KAXIS) = IBM_SOLID
            GEOMFACE(I,J,K,KAXIS) = MAXVAL(GEOMCELL(I,J,K:K+1)) ! This is because one is ==IBM_GASPHASE==-1
            CYCLE
         ENDIF
      ENDDO
   ENDDO
ENDDO


! Now define Gasphase and boundary cut-faces: 1 Boundary, 2 internal, 3 guard cell faces:
INTGC_FLG_LOOP : DO INTGC_FLG=LOW_IND,HIGH_IND

   ! GASPHASE cut-faces:
   NVERT = 4; NFACE = 1; NVERTFACE = 5
   IF (INTGC_FLG==LOW_IND) THEN
   ALLOCATE( IJK_COUNTED(ISTR:IEND,JSTR:JEND,KSTR:KEND,IAXIS:KAXIS) ); IJK_COUNTED=.FALSE.
   BNDINT_LOW = 1; BNDINT_HIGH = 3
   ELSE
   BNDINT_LOW = 4; BNDINT_HIGH = 4
   ENDIF

   IBNDINT_LOOP : DO IBNDINT=BNDINT_LOW,BNDINT_HIGH ! 1,2 refers to block boundary faces, 3 to internal faces,
                                                    ! 4 guard-cell faces.

      ! When switching to internal faces, copy number of external faces already computed.
      IF (IBNDINT == 3) MESHES(NM)%N_BBCUTFACE_MESH = MESHES(NM)%N_CUTFACE_MESH

      X1AXIS_LOOP : DO X1AXIS=IAXIS,KAXIS
         SELECT CASE(X1AXIS)
         CASE(IAXIS)
            X2AXIS = JAXIS; X3AXIS = KAXIS
            ! IAXIS gasphase cut-faces:
            JLO = JLO_CELL; JHI = JHI_CELL
            KLO = KLO_CELL; KHI = KHI_CELL
            SELECT CASE(IBNDINT)
            CASE(1)
               ILO = ILO_FACE; IHI = ILO_FACE
            CASE(2)
               ILO = IHI_FACE; IHI = IHI_FACE
            CASE(3)
               ILO = ILO_FACE+1; IHI = IHI_FACE-1
            CASE(4)
               ILO = ILO_FACE-CCGUARD; IHI= IHI_FACE+CCGUARD
               JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
               KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
            END SELECT
            ! location in I,J,K od x2,x2,x3 axes:
            XIAXIS = IAXIS; XJAXIS = JAXIS; XKAXIS = KAXIS
            ! Local indexing in x1, x2, x3:
            X1LO = ILO; X1HI = IHI
            X2LO = JLO; X2HI = JHI
            X3LO = KLO; X3HI = KHI
            ! Face coordinates in x1,x2,x3 axes:
            ALLOCATE(X1FACE(ISTR:IEND)); X1FACE = XFACE
            ALLOCATE(X2FACE(JSTR:JEND)); X2FACE = YFACE
            ALLOCATE(X3FACE(KSTR:KEND)); X3FACE = ZFACE

         CASE(JAXIS)
            X2AXIS = KAXIS; X3AXIS = IAXIS
            ! JAXIS gasphase cut-faces:
            ILO = ILO_CELL; IHI = IHI_CELL
            KLO = KLO_CELL; KHI = KHI_CELL
            SELECT CASE(IBNDINT)
            CASE(1)
               JLO = JLO_FACE; JHI = JLO_FACE
            CASE(2)
               JLO = JHI_FACE; JHI = JHI_FACE
            CASE(3)
               JLO = JLO_FACE+1; JHI = JHI_FACE-1
            CASE(4)
               JLO = JLO_FACE-CCGUARD; JHI = JHI_FACE+CCGUARD
               ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
               KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
            END SELECT
            ! location in I,J,K od x2,x2,x3 axes:
            XIAXIS = KAXIS; XJAXIS = IAXIS; XKAXIS = JAXIS
            ! Local indexing in x1, x2, x3:
            X1LO = JLO; X1HI = JHI
            X2LO = KLO; X2HI = KHI
            X3LO = ILO; X3HI = IHI
            ! Face coordinates in x1,x2,x3 axes:
            ALLOCATE(X1FACE(JSTR:JEND)); X1FACE = YFACE
            ALLOCATE(X2FACE(KSTR:KEND)); X2FACE = ZFACE
            ALLOCATE(X3FACE(ISTR:IEND)); X3FACE = XFACE

         CASE(KAXIS)
            X2AXIS = IAXIS; X3AXIS = JAXIS
            ! KAXIS gasphase cut-faces:
            ILO = ILO_CELL; IHI = IHI_CELL
            JLO = JLO_CELL; JHI = JHI_CELL
            SELECT CASE(IBNDINT)
            CASE(1)
               KLO = KLO_FACE; KHI = KLO_FACE
            CASE(2)
               KLO = KHI_FACE; KHI = KHI_FACE
            CASE(3)
               KLO = KLO_FACE+1; KHI = KHI_FACE-1
            CASE(4)
               KLO = KLO_FACE-CCGUARD; KHI = KHI_FACE+CCGUARD
               ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
               JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
            END SELECT
            ! location in I,J,K od x2,x2,x3 axes:
            XIAXIS = JAXIS; XJAXIS = KAXIS; XKAXIS = IAXIS
            ! Local indexing in x1, x2, x3:
            X1LO = KLO; X1HI = KHI
            X2LO = ILO; X2HI = IHI
            X3LO = JLO; X3HI = JHI
            ! Face coordinates in x1,x2,x3 axes:
            ALLOCATE(X1FACE(KSTR:KEND)); X1FACE = ZFACE
            ALLOCATE(X2FACE(ISTR:IEND)); X2FACE = XFACE
            ALLOCATE(X3FACE(JSTR:JEND)); X3FACE = YFACE

         END SELECT

         ! Loop on Cartesian faces, local x1, x2, x3 indexes:
         DO II=X1LO,X1HI
            DO KK=X3LO,X3HI
               DO JJ=X2LO,X2HI
                  ! Face indexes:
                  INDXI(IAXIS:KAXIS) = (/ II, JJ, KK /) ! Local x1,x2,x3
                  INDI = INDXI(XIAXIS)
                  INDJ = INDXI(XJAXIS)
                  INDK = INDXI(XKAXIS)
                  ! Drop if not CUTCFE:
                  IF( IJK_COUNTED(INDI,INDJ,INDK,X1AXIS) ) CYCLE; IJK_COUNTED(INDI,INDJ,INDK,X1AXIS)=.TRUE.
                  IF(MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) /= IBM_CUTCFE) CYCLE


                  ! Vertex at index II,JJ-1,KK-1:
                  INDXI1(IAXIS:KAXIS) = (/ II, JJ-1, KK-1 /) ! Local x1,x2,x3
                  INDI1 = INDXI1(XIAXIS)
                  INDJ1 = INDXI1(XJAXIS)
                  INDK1 = INDXI1(XKAXIS)
                  ! Vertex at index II,JJ,KK-1:
                  INDXI2(IAXIS:KAXIS) = (/ II, JJ, KK-1 /) ! Local x1,x2,x3
                  INDI2 = INDXI2(XIAXIS)
                  INDJ2 = INDXI2(XJAXIS)
                  INDK2 = INDXI2(XKAXIS)
                  ! Vertex at index II,JJ,KK:
                  INDXI3(IAXIS:KAXIS) = (/ II, JJ, KK /) ! Local x1,x2,x3
                  INDI3 = INDXI3(XIAXIS)
                  INDJ3 = INDXI3(XJAXIS)
                  INDK3 = INDXI3(XKAXIS)
                  ! Vertex at index II,JJ-1,KK:
                  INDXI4(IAXIS:KAXIS) = (/ II, JJ-1, KK /) ! Local x1,x2,x3
                  INDI4 = INDXI4(XIAXIS)
                  INDJ4 = INDXI4(XJAXIS)
                  INDK4 = INDXI4(XKAXIS)

                  ! First, normal direction in x1 direction.
                  ! For this face: XYZVERT, CFELEM, AREA, XYZCEN, INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
                  ! Vert 1:
                  XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI1(IAXIS)), X2FACE(INDXI1(JAXIS)), X3FACE(INDXI1(KAXIS)) /)
                  XYZVERT(IAXIS:KAXIS,NOD1) = (/ XYZLC(XIAXIS), XYZLC(XJAXIS), XYZLC(XKAXIS) /)
                  ! Vert 2:
                  XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI2(IAXIS)), X2FACE(INDXI2(JAXIS)), X3FACE(INDXI2(KAXIS)) /)
                  XYZVERT(IAXIS:KAXIS,NOD2) = (/ XYZLC(XIAXIS), XYZLC(XJAXIS), XYZLC(XKAXIS) /)
                  ! Vert 3:
                  XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI3(IAXIS)), X2FACE(INDXI3(JAXIS)), X3FACE(INDXI3(KAXIS)) /)
                  XYZVERT(IAXIS:KAXIS,NOD3) = (/ XYZLC(XIAXIS), XYZLC(XJAXIS), XYZLC(XKAXIS) /)
                  ! Vert 4:
                  XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI4(IAXIS)), X2FACE(INDXI4(JAXIS)), X3FACE(INDXI4(KAXIS)) /)
                  XYZVERT(IAXIS:KAXIS,NOD4) = (/ XYZLC(XIAXIS), XYZLC(XJAXIS), XYZLC(XKAXIS) /)

                  CFELEM(1:5,1) = (/ 4, NOD1, NOD2, NOD3, NOD4 /)

                  ! Area:
                  AREA(1) = (X2FACE(INDXI2(JAXIS))-X2FACE(INDXI1(JAXIS)))*(X3FACE(INDXI4(KAXIS))-X3FACE(INDXI1(KAXIS)))

                  ! XYZCEN in Local Coords:
                  XYZCEN(IAXIS:KAXIS,1)= (/ X1FACE(II), 0.5_EB*(X2FACE(INDXI2(JAXIS))+X2FACE(INDXI1(JAXIS))), &
                                                        0.5_EB*(X3FACE(INDXI4(KAXIS))+X3FACE(INDXI1(KAXIS))) /)

                  ! INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
                  INXAREA(IAXIS,1)   = 1._EB * X1FACE(II) * AREA(1)
                  ! dot(e1,nc)*int(x1^2)dA, where x=x1face(ii) constant and nc=e1:
                  INXSQAREA(IAXIS,1) = 1._EB * X1FACE(II)**2._EB * AREA(1)

                  ! This is a new cut-face, allocate space:
                  NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
                  IF (INTGC_FLG==LOW_IND) THEN
                     MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
                  ELSE
                     MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
                  ENDIF
                  MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCF,X1AXIS) = NCUTFACE

                  CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

                  MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
                  MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
                  MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ INDI, INDJ, INDK, X1AXIS /)
                  MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_GASPHASE
                  CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERTFACE)
                  MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1:NVERT) = XYZVERT(IAXIS:KAXIS,1:NVERT)

                  ! Connectivity:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERTFACE,NFACE) = CFELEM(1:NVERTFACE,1)
                  ! Geom Properties:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE) = AREA(1)
                  MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NFACE) = XYZCEN( (/ XIAXIS, XJAXIS, XKAXIS /) ,1)

                  ! Fields for cut-cell volume/centroid computation:
                  ! dot(i,nc)*int(x)dA, where nc=j => dot(i,nc)=0:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NFACE)   =   INXAREA(XIAXIS,1)
                  ! dot(i,nc)*int(x^2)dA, where nc=j => dot(i,nc)=0:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NFACE) = INXSQAREA(XIAXIS,1)
                  ! dot(j,nc)*int(y^2)dA, where y=yface(J) constant nc=j:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NFACE) = INXSQAREA(XJAXIS,1)
                  ! dot(k,nc)*int(z^2)dA, where nc=j => dot(k,nc)=0:
                  MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NFACE) = INXSQAREA(XKAXIS,1)

               ENDDO
            ENDDO
         ENDDO
         DEALLOCATE(X1FACE,X2FACE,X3FACE)
      ENDDO X1AXIS_LOOP
   ENDDO IBNDINT_LOOP

   IF(INTGC_FLG==HIGH_IND) DEALLOCATE( IJK_COUNTED )

   ! INBOUNDARY cut-faces:
   IF (INTGC_FLG==LOW_IND) THEN
      ALLOCATE( IJK_COUNTED2(ISTR:IEND,JSTR:JEND,KSTR:KEND) ); IJK_COUNTED2=.FALSE.
      ILO = ILO_CELL; IHI = IHI_CELL
      JLO = JLO_CELL; JHI = JHI_CELL
      KLO = KLO_CELL; KHI = KHI_CELL
   ELSE
      ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
      JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
      KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD
   ENDIF

   ! Loop on Cartesian cells:
   DO K=KLO,KHI
      DO J=JLO,JHI
         DO I=ILO,IHI

            IF ( MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) /= IBM_CUTCFE ) CYCLE

            IF(IJK_COUNTED2(I,J,K)) CYCLE; IJK_COUNTED2(I,J,K)=.TRUE.

            ! Face type of bounding Cartesian faces:
            FSID_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_FGSC,IAXIS)
            FSID_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_FGSC,IAXIS)
            FSID_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_FGSC,JAXIS)
            FSID_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_FGSC,JAXIS)
            FSID_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_FGSC,KAXIS)
            FSID_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_FGSC,KAXIS)

            IF ( ALL(FSID_XYZ(LOW_IND:HIGH_IND,IAXIS:KAXIS) /= IBM_SOLID) ) CYCLE

            NVERT = 0; NFACE = 0
            INXAREA   = 0._EB
            INXSQAREA = 0._EB
            ! XYZVERT, CFELEM, AREA, XYZCEN, INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
            X1AXIS_LOOP2 : DO X1AXIS=IAXIS,KAXIS
               LOHI_DO : DO LOHI=LOW_IND,HIGH_IND
                  IF (FSID_XYZ(LOHI,X1AXIS) /= IBM_SOLID) CYCLE
                  NFACE = NFACE + 1
                  SELECT CASE(X1AXIS)
                  CASE(IAXIS)

                     ! Vertices:
                     XYZVERT(IAXIS:KAXIS,NVERT+1) = (/ XFACE(I-2+LOHI), YFACE(J-1), ZFACE(K-1) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+2) = (/ XFACE(I-2+LOHI), YFACE(J  ), ZFACE(K-1) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+3) = (/ XFACE(I-2+LOHI), YFACE(J  ), ZFACE(K  ) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+4) = (/ XFACE(I-2+LOHI), YFACE(J-1), ZFACE(K  ) /)
                     IF(LOHI==LOW_IND)THEN
                         CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+2, NVERT+3, NVERT+4 /)
                     ELSE
                         CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+4, NVERT+3, NVERT+2 /)
                     ENDIF
                     ! Area:
                     AREA(NFACE) = (YFACE(J  )-YFACE(J-1))*(ZFACE(K  )-ZFACE(K-1))
                     ! XYZCEN:
                     XYZCEN(IAXIS:KAXIS,NFACE) = (/ XFACE(I-2+LOHI), 0.5_EB*(YFACE(J  )+YFACE(J-1)), &
                                                                     0.5_EB*(ZFACE(K  )+ZFACE(K-1)) /)
                     ! INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
                     INXAREA(IAXIS,NFACE)   = 1._EB * XFACE(I-2+LOHI) * AREA(NFACE)
                     ! dot(e1,nc)*int(x1^2)dA, where x=x1face(ii) constant and nc=e1:
                     INXSQAREA(IAXIS,NFACE) = 1._EB * XFACE(I-2+LOHI)**2._EB * AREA(NFACE)

                     ! Define IBOD and ITRI:
                     IBOD(NFACE) = GEOMFACE(I-2+LOHI,J,K,X1AXIS)
                  CASE(JAXIS)

                     ! Vertices:
                     XYZVERT(IAXIS:KAXIS,NVERT+1) = (/ XFACE(I-1), YFACE(J-2+LOHI), ZFACE(K-1) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+2) = (/ XFACE(I-1), YFACE(J-2+LOHI), ZFACE(K  ) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+3) = (/ XFACE(I  ), YFACE(J-2+LOHI), ZFACE(K  ) /)
                     XYZVERT(IAXIS:KAXIS,NVERT+4) = (/ XFACE(I  ), YFACE(J-2+LOHI), ZFACE(K-1) /)
                     IF(LOHI==LOW_IND)THEN
                         CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+2, NVERT+3, NVERT+4 /)
                     ELSE
                         CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+4, NVERT+3, NVERT+2 /)
                     ENDIF
                     ! Area:
                     AREA(NFACE) = (XFACE(I  )-XFACE(I-1))*(ZFACE(K  )-ZFACE(K-1))
                     ! XYZCEN:
                     XYZCEN(IAXIS:KAXIS,NFACE) = (/ 0.5_EB*(XFACE(I  )+XFACE(I-1)), YFACE(J-2+LOHI),  &
                                                    0.5_EB*(ZFACE(K  )+ZFACE(K-1)) /)
                     ! INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
                     INXAREA(JAXIS,NFACE)   = 1._EB * YFACE(J-2+LOHI) * AREA(NFACE)
                     ! dot(e1,nc)*int(x1^2)dA, where x=x1face(ii) constant and nc=e1:
                     INXSQAREA(JAXIS,NFACE) = 1._EB * YFACE(J-2+LOHI)**2._EB * AREA(NFACE)

                     ! Define IBOD and ITRI:
                     IBOD(NFACE) = GEOMFACE(I,J-2+LOHI,K,X1AXIS)
                  CASE(KAXIS)

                    ! Vertices:
                    XYZVERT(IAXIS:KAXIS,NVERT+1) = (/ XFACE(I-1), YFACE(J-1), ZFACE(K-2+LOHI) /)
                    XYZVERT(IAXIS:KAXIS,NVERT+2) = (/ XFACE(I  ), YFACE(J-1), ZFACE(K-2+LOHI) /)
                    XYZVERT(IAXIS:KAXIS,NVERT+3) = (/ XFACE(I  ), YFACE(J  ), ZFACE(K-2+LOHI) /)
                    XYZVERT(IAXIS:KAXIS,NVERT+4) = (/ XFACE(I-1), YFACE(J  ), ZFACE(K-2+LOHI) /)
                    IF(LOHI==LOW_IND)THEN
                        CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+2, NVERT+3, NVERT+4 /)
                    ELSE
                        CFELEM(1:5,NFACE) = (/ 4, NVERT+1, NVERT+4, NVERT+3, NVERT+2 /)
                    ENDIF
                    ! Area:
                    AREA(NFACE) = (XFACE(I  )-XFACE(I-1))*(YFACE(J  )-YFACE(J-1))
                    ! XYZCEN:
                    XYZCEN(IAXIS:KAXIS,NFACE) = (/ 0.5_EB*(XFACE(I  )+XFACE(I-1)), 0.5_EB*(YFACE(J  )+YFACE(J-1)), &
                                                   ZFACE(K-2+LOHI) /)
                    ! INXAREA, INXQAREA,JNYSQAREA,KNZSQAREA:
                    INXAREA(KAXIS,NFACE)   = 1._EB * ZFACE(K-2+LOHI) * AREA(NFACE)
                    ! dot(e1,nc)*int(x1^2)dA, where x=x1face(ii) constant and nc=e1:
                    INXSQAREA(KAXIS,NFACE) = 1._EB * ZFACE(K-2+LOHI)**2._EB * AREA(NFACE)

                    ! Define IBOD and ITRI:
                    IBOD(NFACE) = GEOMFACE(I,J,K-2+LOHI,X1AXIS)
                  END SELECT

                  ! With IBOD and cut-face XYZCEN defined, find closest triangle:
                  DIST        = 1.E20_EB
                  ITRI(NFACE) = 1
                  DO IWSEL=1,GEOMETRY(IBOD(NFACE))%N_FACES
                     I1   = GEOMETRY(IBOD(NFACE))%FACES(3*IWSEL-2)
                     I2   = GEOMETRY(IBOD(NFACE))%FACES(3*IWSEL-1)
                     I3   = GEOMETRY(IBOD(NFACE))%FACES(3*IWSEL  )
                     XCEN(IAXIS:KAXIS) = 1._EB/3._EB * ( GEOMETRY(IBOD(NFACE))%VERTS(3*(I1-1)+IAXIS:3*(I1-1)+KAXIS)+ &
                                                         GEOMETRY(IBOD(NFACE))%VERTS(3*(I2-1)+IAXIS:3*(I2-1)+KAXIS)+ &
                                                         GEOMETRY(IBOD(NFACE))%VERTS(3*(I3-1)+IAXIS:3*(I3-1)+KAXIS) )
                     ! Drop Triangles not on the face:
                     IF (ABS(XYZCEN(X1AXIS,NFACE)-XCEN(X1AXIS)) > GEOMEPS) CYCLE
                     DIST2 = NORM2(XYZCEN(IAXIS:KAXIS,NFACE)-XCEN(IAXIS:KAXIS))
                     IF (DIST > DIST2) THEN
                        DIST        = DIST2
                        ITRI(NFACE) = IWSEL
                     ENDIF
                  ENDDO

                  NVERT = NVERT + 4

               ENDDO LOHI_DO
            ENDDO X1AXIS_LOOP2


            ! This is a cut-face, allocate space:
            NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
            IF (INTGC_FLG==LOW_IND) THEN
               MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
            ELSE
               MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
            ENDIF
            MESHES(NM)%CCVAR(I,J,K,IBM_IDCF) = NCUTFACE

            CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

            MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
            MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
            MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, 0 /) ! No axis = 0
            MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_INBOUNDARY
            CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERTFACE)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1:NVERT) = XYZVERT(IAXIS:KAXIS,1:NVERT)
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:5,1:NFACE)          = CFELEM(1:5,1:NFACE)


            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(1:NFACE) = AREA(1:NFACE)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,1:NFACE) = XYZCEN(IAXIS:KAXIS,1:NFACE)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(1:NFACE)   = INXAREA(IAXIS,1:NFACE)
            ! dot(i,nc)*int(x^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(1:NFACE) = INXSQAREA(IAXIS,NFACE)
            ! dot(j,nc)*int(y^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(1:NFACE) = INXSQAREA(JAXIS,NFACE)
            ! dot(k,nc)*int(z^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(1:NFACE) = INXSQAREA(KAXIS,NFACE)

            ! Define Body-triangle reference:
            MESHES(NM)%CUT_FACE(NCUTFACE)%BODTRI(1,1:NFACE)= IBOD(1:NFACE)
            MESHES(NM)%CUT_FACE(NCUTFACE)%BODTRI(2,1:NFACE)= ITRI(1:NFACE)

            ! Assign surf-index: Depending on GEOMETRY:
            DO IFACE=1,NFACE
               MESHES(NM)%CUT_FACE(NCUTFACE)%SURF_INDEX(IFACE) = GEOMETRY(IBOD(IFACE))%SURFS(ITRI(IFACE))
            ENDDO

         ENDDO
      ENDDO
   ENDDO

   IF(INTGC_FLG==HIGH_IND) DEALLOCATE( IJK_COUNTED2 )

ENDDO INTGC_FLG_LOOP


! Finally Build cut-cells:
NCFACE_CUTCELL = 7; NFACE_CELL = 6; NCELL = 1
INTGC_FLG_LOOP2 : DO INTGC_FLG=LOW_IND,HIGH_IND    ! 1 refers to blocks internal cells, 2 refers to block guard cells.

   SELECT CASE(INTGC_FLG)
   CASE(LOW_IND)
      ALLOCATE(IJK_COUNT(ILO_CELL-NGUARD:IHI_CELL+NGUARD,JLO_CELL-NGUARD:JHI_CELL+NGUARD, &
                         KLO_CELL-NGUARD:KHI_CELL+NGUARD))
      IJK_COUNT = .FALSE.
      ILO = ILO_CELL; IHI = IHI_CELL
      JLO = JLO_CELL; JHI = JHI_CELL
      KLO = KLO_CELL; KHI = KHI_CELL
   CASE(HIGH_IND)
      ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
      JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
      KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD
   END SELECT

   ! Loop on Cartesian cells, define cut cells and solid cells IBM_CGSC:
   DO K=KLO,KHI
      DO J=JLO,JHI
         DO I=ILO,IHI

            IF( MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) /= IBM_CUTCFE ) CYCLE

            IF( IJK_COUNT(I,J,K) ) CYCLE; IJK_COUNT(I,J,K) = .TRUE.

            ! Start with Cartesian Faces:
            ! Face type of bounding Cartesian faces:
            FSID_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_FGSC,IAXIS)
            FSID_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_FGSC,IAXIS)
            FSID_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_FGSC,JAXIS)
            FSID_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_FGSC,JAXIS)
            FSID_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_FGSC,KAXIS)
            FSID_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_FGSC,KAXIS)

            ! Cut-face number of bounding Cartesian faces:
            IDCF_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_IDCF,IAXIS)
            IDCF_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_IDCF,IAXIS)
            IDCF_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_IDCF,JAXIS)
            IDCF_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_IDCF,JAXIS)
            IDCF_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_IDCF,KAXIS)
            IDCF_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_IDCF,KAXIS)

            NFACE_CELL = 0

            X1AXIS_LOOP3 : DO X1AXIS=IAXIS,KAXIS
               CEI_AXIS(LOW_IND:HIGH_IND) = IDCF_XYZ(LOW_IND:HIGH_IND,X1AXIS)
               DO SIDE=LOW_IND,HIGH_IND
                  ! Low High face:
                  IF ( FSID_XYZ(SIDE,X1AXIS) == IBM_GASPHASE ) THEN
                     ! Regular Face, build 4 vertices + face:
                     NFACE_CELL = NFACE_CELL + 1
                     FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_RGGAS, SIDE, X1AXIS, 0, 0 /)
                     ! IBM_FTYPE_RGGAS=0, regular face.
                  ELSEIF (FSID_XYZ(SIDE,X1AXIS) == IBM_CUTCFE ) THEN
                     ! GasPhase CUT_FACE, add all cut-faces on these Cartesian cell + nodes
                     CEI = CEI_AXIS(SIDE)
                     DO ICF=1,MESHES(NM)%CUT_FACE(CEI)%NFACE
                        NFACE_CELL = NFACE_CELL + 1
                        FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_CFGAS, SIDE, X1AXIS, CEI, ICF /)
                        ! IBM_FTYPE_CFGAS=1
                     ENDDO
                  ENDIF
               ENDDO
            ENDDO X1AXIS_LOOP3

            ! Now add INBOUNDARY faces of the cell:
            CEI = MESHES(NM)%CCVAR(I,J,K,IBM_IDCF)
            IF ( CEI > 0 ) THEN
               DO ICF=1,MESHES(NM)%CUT_FACE(CEI)%NFACE
                  NFACE_CELL = NFACE_CELL + 1
                  FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_CFINB, 0, 0, CEI, ICF /)
                  ! IBM_FTYPE_CFINB in Cart-cell.
               ENDDO
            ENDIF

            VOL(1) = DXCELL(I)*DYCELL(J)*DZCELL(K)
            XYZCEN(IAXIS:KAXIS,1) = (/ XCELL(I), YCELL(J), ZCELL(K) /)

            ! Load into CUT_CELL data structure
            NCUTCELL = MESHES(NM)%N_CUTCELL_MESH + MESHES(NM)%N_GCCUTCELL_MESH + 1
            IF (INTGC_FLG==LOW_IND) THEN
               MESHES(NM)%N_CUTCELL_MESH   = NCUTCELL
            ELSE
               MESHES(NM)%N_GCCUTCELL_MESH = MESHES(NM)%N_GCCUTCELL_MESH + 1
            ENDIF
            MESHES(NM)%CCVAR(I,J,K,IBM_IDCC)            = NCUTCELL

            ! Resize array MESHES(NM)%CUT_CELL if necessary:
            CALL CUT_CELL_ARRAY_REALLOC(NM,NCUTCELL)

            ! Add cut-cell NCUTCELL entry:
            MESHES(NM)%CUT_CELL(NCUTCELL)%IJK(IAXIS:KAXIS) = (/ I, J, K /)
            MESHES(NM)%CUT_CELL(NCUTCELL)%NCELL     = NCELL
            MESHES(NM)%CUT_CELL(NCUTCELL)%NFACE_CELL= NFACE_CELL
            CALL NEW_CELL_ALLOC(NM,NCUTCELL,NCELL,NFACE_CELL,NCFACE_CUTCELL)
            MESHES(NM)%CUT_CELL(NCUTCELL)%CCELEM(1:NCFACE_CUTCELL,1) = (/ 6, 1, 2, 3, 4, 5, 6 /)
            MESHES(NM)%CUT_CELL(NCUTCELL)%FACE_LIST(1:IBM_NPARAM_CCFACE,1:NFACE_CELL) = &
            FACE_LIST(1:IBM_NPARAM_CCFACE,1:NFACE_CELL)
            MESHES(NM)%CUT_CELL(NCUTCELL)%VOLUME(1:NCELL)                  = VOL(1:NCELL)
            MESHES(NM)%CUT_CELL(NCUTCELL)%XYZCEN(IAXIS:KAXIS,1:NCELL)      = XYZCEN(IAXIS:KAXIS,1:NCELL)

         ENDDO
      ENDDO
   ENDDO

   IF(INTGC_FLG==HIGH_IND) DEALLOCATE( IJK_COUNT )

ENDDO INTGC_FLG_LOOP2


DEALLOCATE(GEOMFACE,GEOMCELL)

END SUBROUTINE GET_REGULAR_CUTCELLS_BOX


! --------------------- DEALLOCATE_CUTCELLS_CONN_MESH --------------------------

SUBROUTINE DEALLOCATE_CUTCF_CONN_MESH(NM)

INTEGER, INTENT(IN) :: NM

INTEGER :: ICC, ICF, I, J, K, DO_BNCF=1

! Cut-cells and GASPHASE cut-faces:
DO K=-CCGUARD,MESHES(NM)%KBAR+CCGUARD
   IF(K>-1 .AND. K<2) CYCLE
   IF(K>MESHES(NM)%KBAR-1 .AND. K<MESHES(NM)%KBAR+2) CYCLE
   DO J=-CCGUARD,MESHES(NM)%JBAR+CCGUARD
      IF(J>-1 .AND. J<2) CYCLE
      IF(J>MESHES(NM)%JBAR-1 .AND. J<MESHES(NM)%JBAR+2) CYCLE
      DO I=-CCGUARD,MESHES(NM)%IBAR+CCGUARD
         IF(I>-1 .AND. I<2) CYCLE
         IF(I>MESHES(NM)%IBAR-1 .AND. I<MESHES(NM)%IBAR+2) CYCLE
         ! First cut-cells:
         ICC = MESHES(NM)%CCVAR(I,J,K,IBM_IDCC)
         IF (ICC>0) CALL CELL_DEALLOC(NM,ICC) ! Deallocate this CUT_CELL array container:
         ! IAXIS cut-face:
         ICF = MESHES(NM)%FCVAR(I,J,K,IBM_IDCF,IAXIS)
         IF (ICF>0) CALL FACE_DEALLOC(NM,ICF)
         ! JAXIS cut-face:
         ICF = MESHES(NM)%FCVAR(I,J,K,IBM_IDCF,JAXIS)
         IF (ICF>0) CALL FACE_DEALLOC(NM,ICF)
         ! KAXIS cut-face:
         ICF = MESHES(NM)%FCVAR(I,J,K,IBM_IDCF,KAXIS)
         IF (ICF>0) CALL FACE_DEALLOC(NM,ICF)
      ENDDO
   ENDDO
ENDDO
! INBOUNDARY cut-faces:
DO K=-CCGUARD,MESHES(NM)%KBAR+CCGUARD
   DO J=-CCGUARD,MESHES(NM)%JBAR+CCGUARD
      DO I=-CCGUARD,MESHES(NM)%IBAR+CCGUARD
         ICF = MESHES(NM)%CCVAR(I,J,K,IBM_IDCF)
         IF (ICF>0) CALL FACE_DEALLOC(NM,ICF,DO_BNCF) ! Deallocate this CUT_FACE array fields, except NFACE, XYZCEN.
      ENDDO
   ENDDO
ENDDO
IF(ALLOCATED(MESHES(NM)%VERTVAR)) DEALLOCATE(MESHES(NM)%VERTVAR)
IF(ALLOCATED(MESHES(NM)%ECVAR)) DEALLOCATE(MESHES(NM)%ECVAR)
RETURN
END SUBROUTINE DEALLOCATE_CUTCF_CONN_MESH


! ----------------------- DEALLOCATE_BODINT_PLANE ------------------------------

SUBROUTINE DEALLOCATE_BODINT_PLANE(BODINT_PLANE)

TYPE(BODINT_PLANE_TYPE), INTENT(INOUT) :: BODINT_PLANE

IF ( ALLOCATED(BODINT_PLANE%XYZ)  )      DEALLOCATE(BODINT_PLANE%XYZ)
IF ( ALLOCATED(BODINT_PLANE%SGLS) )      DEALLOCATE(BODINT_PLANE%SGLS)
IF ( ALLOCATED(BODINT_PLANE%SEGS) )      DEALLOCATE(BODINT_PLANE%SEGS)
IF ( ALLOCATED(BODINT_PLANE%TRIS) )      DEALLOCATE(BODINT_PLANE%TRIS)
IF ( ALLOCATED(BODINT_PLANE%INDSEG) )    DEALLOCATE(BODINT_PLANE%INDSEG)
IF ( ALLOCATED(BODINT_PLANE%INDTRI) )    DEALLOCATE(BODINT_PLANE%INDTRI)
IF ( ALLOCATED(BODINT_PLANE%X2ALIGNED) ) DEALLOCATE(BODINT_PLANE%X2ALIGNED)
IF ( ALLOCATED(BODINT_PLANE%X3ALIGNED) ) DEALLOCATE(BODINT_PLANE%X3ALIGNED)
IF ( ALLOCATED(BODINT_PLANE%SEGTYPE) )   DEALLOCATE(BODINT_PLANE%SEGTYPE)
IF ( ALLOCATED(BODINT_PLANE%NOD_PERM) )  DEALLOCATE(BODINT_PLANE%NOD_PERM)
IF ( ALLOCATED(BODINT_PLANE%NBCROSS) )   DEALLOCATE(BODINT_PLANE%NBCROSS)
IF ( ALLOCATED(BODINT_PLANE%SVAR) )      DEALLOCATE(BODINT_PLANE%SVAR)
IF ( ALLOCATED(BODINT_PLANE%X1NVEC) )    DEALLOCATE(BODINT_PLANE%X1NVEC)
IF ( ALLOCATED(BODINT_PLANE%AINV) )      DEALLOCATE(BODINT_PLANE%AINV)
IF ( ALLOCATED(BODINT_PLANE%TBAXIS(IAXIS)%TRIBIN) ) DEALLOCATE(BODINT_PLANE%TBAXIS(IAXIS)%TRIBIN)
IF ( ALLOCATED(BODINT_PLANE%TBAXIS(JAXIS)%TRIBIN) ) DEALLOCATE(BODINT_PLANE%TBAXIS(JAXIS)%TRIBIN)
IF ( ALLOCATED(BODINT_PLANE%TBAXIS(KAXIS)%TRIBIN) ) DEALLOCATE(BODINT_PLANE%TBAXIS(KAXIS)%TRIBIN)

RETURN
END SUBROUTINE DEALLOCATE_BODINT_PLANE

! ---------------------- GET_INBCUTFACES_TO_CFACE --------------------------------

SUBROUTINE GET_INBCUTFACES_TO_CFACE

! Local Variables:
INTEGER :: ICF, CFACE_INDEX_LOCAL, SURF_INDEX
INTEGER, PARAMETER, DIMENSION(3,3) :: ADD_MAT = RESHAPE( (/1,0,0,0,1,0,0,0,1 /), (/3,3/))
INTEGER :: IADD,JADD,KADD,FTY_LO,FTY_HI,ICR_LO,ICR_HI,N_RAD_CFACE,IVENT
REAL(EB):: X1LO, X1HI, ADDMAT(IAXIS:KAXIS,LOW_IND:HIGH_IND)

INTEGER, PARAMETER :: RAD_GOTO_GASPHASE       = 1
INTEGER, PARAMETER :: RAD_USE_CCVOLUS         = 2
INTEGER, PARAMETER :: RAD_USE_AVGCFACES_CEN   = 3
INTEGER, PARAMETER :: RAD_CFACE_SNAPTO_METHOD = RAD_USE_CCVOLUS

LOGICAL :: GAS_VOL_RATIO_FLAG,LOHI_X1_FLAG
INTEGER :: ICC, JCC
REAL(EB):: AREAT,CC_VOL,X1AREA

! GET_CUTCELLS_VERBOSE variables:
INTEGER, ALLOCATABLE, DIMENSION(:) :: NCFACE_BY_MESH

TYPE(VENTS_TYPE), POINTER :: VT

IF(GET_CUTCELLS_VERBOSE) CALL CPU_TIME(CPUTIME_START)

ALLOCATE(NCFACE_BY_MESH(1:NMESHES)); NCFACE_BY_MESH(1:NMESHES) = 0
MESH_LOOP_0 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)
   DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
      IF(CUT_FACE(ICF)%STATUS /= IBM_INBOUNDARY) CYCLE
      I = CUT_FACE(ICF)%IJK(IAXIS)
      J = CUT_FACE(ICF)%IJK(JAXIS)
      K = CUT_FACE(ICF)%IJK(KAXIS)
      ! Don't count cut-cells inside an OBST:
      IF (SOLID(CELL_INDEX(I,J,K))) CYCLE
      DO IFACE=1,CUT_FACE(ICF)%NFACE
         NCFACE_BY_MESH(NM) = NCFACE_BY_MESH(NM) + 1
      ENDDO
   ENDDO
ENDDO MESH_LOOP_0

IF(GET_CUTCELLS_VERBOSE) THEN
   CALL MPI_ALLREDUCE(MPI_IN_PLACE,NCFACE_BY_MESH(1),NMESHES,MPI_INTEGER,MPI_SUM,MPI_COMM_WORLD,IERR)
   WRITE(LU_SETCC,'(A,I10)',advance='no') ' 4. Generating CFACES from INBOUNDARY cut-faces, N_CFACE_CELLS=', &
                             SUM(NCFACE_BY_MESH(LOWER_MESH_INDEX:UPPER_MESH_INDEX))
   IF (MY_RANK==0) THEN
      WRITE(LU_ERR  ,'(A,I10)') ' Total number of CFACES in all processes=', &
                                SUM(NCFACE_BY_MESH(1:NMESHES))
      WRITE(LU_ERR  ,'(A,I10)',advance='no') &
      ' 4. Process 0 Generating CFACES from INBOUNDARY cut-faces, N_CFACE_CELLS=', &
                                SUM(NCFACE_BY_MESH(LOWER_MESH_INDEX:UPPER_MESH_INDEX))
   ENDIF
ENDIF

! First mesh Loop, Allocate storage for CFACES, CFACE geometric info:
MESH_LOOP_1 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)

   ! ALLOCATE to zero size, size is dynamically increased in ALLOCATE_STORAGE:
   IF(ALLOCATED(MESHES(NM)%CFACE)) DEALLOCATE(MESHES(NM)%CFACE)
   MESHES(NM)%N_CFACE_CELLS_DIM = NCFACE_BY_MESH(NM)
   ALLOCATE(MESHES(NM)%CFACE(0:MESHES(NM)%N_CFACE_CELLS_DIM))
   ! Deallocate CFACEs storage array for this mesh, if necessary.
   IF(ALLOCATED(MESHES(NM)%CFACE_STORAGE)) DEALLOCATE(MESHES(NM)%CFACE_STORAGE)
   ALLOCATE(MESHES(NM)%CFACE_STORAGE(0:N_SURF))

   ALLOCATE(MESHES(NM)%FACE_WORK1(MESHES(NM)%N_CFACE_CELLS_DIM))
   ALLOCATE(MESHES(NM)%FACE_WORK2(MESHES(NM)%N_CFACE_CELLS_DIM))
   ALLOCATE(MESHES(NM)%FACE_WORK3(MESHES(NM)%N_CFACE_CELLS_DIM))

   ! Define pointers among IBM_INBOUNDARY CUT_FACE and CFACE:
   CFACE_INDEX_LOCAL = 0
   DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
      IF(CUT_FACE(ICF)%STATUS /= IBM_INBOUNDARY) CYCLE
      I = CUT_FACE(ICF)%IJK(IAXIS)
      J = CUT_FACE(ICF)%IJK(JAXIS)
      K = CUT_FACE(ICF)%IJK(KAXIS)
      ! Don't count cut-cells inside an OBST:
      IF (SOLID(CELL_INDEX(I,J,K))) CYCLE
      DO IFACE=1,CUT_FACE(ICF)%NFACE
         ! Option, we'll see if it is required: Cycle Areas less than GEOMEPS^2, insignificantly small.
         ! IF(CUT_FACE(ICF)%AREA(IFACE) < GEOMEPS*GEOMEPS) CYCLE
         CFACE_INDEX_LOCAL = CFACE_INDEX_LOCAL + 1
         ! Index in CFACE for cut-face in (ICF,IFACE) of CUT_FACE.
         CUT_FACE(ICF)%CFACE_INDEX(IFACE) = CFACE_INDEX_LOCAL
         SURF_INDEX = CUT_FACE(ICF)%SURF_INDEX(IFACE)
         CALL INIT_CFACE_CELL(NM,ICF,IFACE,CFACE_INDEX_LOCAL,SURF_INDEX,INTEGER_ONE)
      ENDDO
   ENDDO
   MESHES(NM)%N_CFACE_CELLS = CFACE_INDEX_LOCAL
ENDDO MESH_LOOP_1

! Second loop, apply VENTS to change SURF_ID associated with CFACEs:
MESH_LOOP_2 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)

   ! Currently : Modify CFACE SURF_INDEX with VENT information: This needs more development.
   VENT_LOOP : DO IVENT=1,MESHES(NM)%N_VENT
      VT => VENTS(IVENT)
      IF(.NOT.VT%GEOM) CYCLE VENT_LOOP ! Do not apply vent to Geometries.

      ! This test is a simplified test for VENTS changing the CFACE SURF_ID to VENT SURF_ID for all CFACEs whose
      ! centroid locations lay within the frame of the IOR grid aligned VENT:
      ADDMAT = 0._EB;
      SELECT CASE(ABS(VT%IOR))
      CASE(IAXIS)
         ADDMAT(IAXIS,LOW_IND)  = -(XF_MAX-XS_MIN) ! -DX(VT%I1) Set normal size to 2 times domain size.
         ADDMAT(IAXIS,HIGH_IND) =  (XF_MAX-XS_MIN) !  DX(VT%I2) XF_MAX, etc. defined in cons.f90.
      CASE(JAXIS)
         ADDMAT(JAXIS,LOW_IND)  = -(YF_MAX-YS_MIN) ! -DY(VT%J1)
         ADDMAT(JAXIS,HIGH_IND) =  (YF_MAX-YS_MIN) !  DY(VT%J2)
      CASE(KAXIS)
         ADDMAT(KAXIS,LOW_IND)  = -(ZF_MAX-ZS_MIN) ! -DZ(VT%K1)
         ADDMAT(KAXIS,HIGH_IND) =  (ZF_MAX-ZS_MIN) !  DZ(VT%K2)
      END SELECT
      ! CFACE Loop to modify SURF_INDEX:
      CFACE_LOOP_2 : DO CFACE_INDEX_LOCAL=1,N_CFACE_CELLS
         IF(CFACE(CFACE_INDEX_LOCAL)%X < X(VT%I1)+ADDMAT(IAXIS,LOW_IND )) CYCLE CFACE_LOOP_2
         IF(CFACE(CFACE_INDEX_LOCAL)%X > X(VT%I2)+ADDMAT(IAXIS,HIGH_IND)) CYCLE CFACE_LOOP_2
         IF(CFACE(CFACE_INDEX_LOCAL)%Y < Y(VT%J1)+ADDMAT(JAXIS,LOW_IND )) CYCLE CFACE_LOOP_2
         IF(CFACE(CFACE_INDEX_LOCAL)%Y > Y(VT%J2)+ADDMAT(JAXIS,HIGH_IND)) CYCLE CFACE_LOOP_2
         IF(CFACE(CFACE_INDEX_LOCAL)%Z < Z(VT%K1)+ADDMAT(KAXIS,LOW_IND )) CYCLE CFACE_LOOP_2
         IF(CFACE(CFACE_INDEX_LOCAL)%Z > Z(VT%K2)+ADDMAT(KAXIS,HIGH_IND)) CYCLE CFACE_LOOP_2
         CFACE(CFACE_INDEX_LOCAL)%SURF_INDEX = VT%SURF_INDEX
      ENDDO CFACE_LOOP_2
   ENDDO VENT_LOOP
ENDDO MESH_LOOP_2
! - At this pont all final values of SURF_INDEX have been given to CFACEs.

! Third loop, 1. Compute final FDS area integrals by SURF_ID and GEOM.
!             2. Compute input areas by SURF_ID and GEOM. First sum over GEOM FACES SURF_IDs,
!                then VENTS input surfaces are assigned to corresponding GEOMs and SURF_IDs if present (VENTs take precedence).
MESH_LOOP_3 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)

   ! To DO.

ENDDO MESH_LOOP_3
! Sum FDS and INPUT areas per SURF_ID and GEOM (all reduce sum):
! To DO.

! Fourth Loop: Assign AREA_ADJUST for CFACEs, and assign BC info to CFACEs:
MESH_LOOP_4 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)

   ! BCs related information:
   CFACE_LOOP_4 : DO CFACE_INDEX_LOCAL=1,N_CFACE_CELLS
      ICF        = CFACE(CFACE_INDEX_LOCAL)%CUT_FACE_IND1
      IFACE      = CFACE(CFACE_INDEX_LOCAL)%CUT_FACE_IND2
      SURF_INDEX = CFACE(CFACE_INDEX_LOCAL)%SURF_INDEX
      CALL INIT_CFACE_CELL(NM,ICF,IFACE,CFACE_INDEX_LOCAL,SURF_INDEX,INTEGER_TWO)
   ENDDO CFACE_LOOP_4

ENDDO MESH_LOOP_4

! This last loop is to define the Radiation CFACEs:
! Now add IBM_CFST, IBM_NCFC vars to CCVAR:
MESH_LOOP_5 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX

   CALL POINT_TO_MESH(NM)

   ! Count size of RAD_CFACE for this mesh:
   N_RAD_CFACE = 0
   DO X1AXIS=IAXIS,KAXIS
      IADD=ADD_MAT(X1AXIS,IAXIS); ILO=1-IADD
      JADD=ADD_MAT(X1AXIS,JAXIS); JLO=1-JADD
      KADD=ADD_MAT(X1AXIS,KAXIS); KLO=1-KADD
      DO K=KLO,KBAR
         DO J=JLO,JBAR
            DO I=ILO,IBAR
               IF(CCVAR(I,J,K,IBM_CGSC)==IBM_SOLID    .AND. CCVAR(I+IADD,J+JADD,K+KADD,IBM_CGSC)==IBM_SOLID   ) CYCLE
               IF(CCVAR(I,J,K,IBM_CGSC)==IBM_GASPHASE .AND. CCVAR(I+IADD,J+JADD,K+KADD,IBM_CGSC)==IBM_GASPHASE) CYCLE
               N_RAD_CFACE = N_RAD_CFACE + 1
               FCVAR(I,J,K,IBM_IDRA,X1AXIS) = N_RAD_CFACE
            ENDDO
         ENDDO
      ENDDO
   ENDDO

   ! Allocate RAD_CFACE for this matrix:
   MESHES(NM)%N_RAD_CFACE_CELLS_DIM = N_RAD_CFACE
   IF(ALLOCATED(MESHES(NM)%RAD_CFACE)) DEALLOCATE(MESHES(NM)%RAD_CFACE)
   ALLOCATE(MESHES(NM)%RAD_CFACE(0:N_RAD_CFACE)) ! RAD_FACE(0) is used to jump loops when ICR not defined.

   ! Finally, assign CFACES to neighboring GASPHASE cut-face underlying Cartesian faces.
   ! Avoid double counting, for use in Radiation FVM.
   DO K=1,KBAR
      DO J=1,JBAR
         DO I=1,IBAR
            ! If there are no CFACES to distribute cycle:
            ICF=CCVAR(I,J,K,IBM_IDCF)
            IF (ICF<1) CYCLE
            IF (CUT_FACE(ICF)%NFACE==0) CYCLE
            IF (SOLID(CELL_INDEX(I,J,K))) CYCLE
            DO X1AXIS=IAXIS,KAXIS
               SELECT CASE(X1AXIS)
               CASE(IAXIS)
                  FTY_LO = FCVAR(I-1,J  ,K  ,IBM_FGSC,IAXIS)
                  FTY_HI = FCVAR(I  ,J  ,K  ,IBM_FGSC,IAXIS)
                  ICR_LO = FCVAR(I-1,J  ,K  ,IBM_IDRA,IAXIS)
                  ICR_HI = FCVAR(I  ,J  ,K  ,IBM_IDRA,IAXIS)
                  X1LO   = X(I-1)
                  X1HI   = X(I  )
               CASE(JAXIS)
                  FTY_LO = FCVAR(I  ,J-1,K  ,IBM_FGSC,JAXIS)
                  FTY_HI = FCVAR(I  ,J  ,K  ,IBM_FGSC,JAXIS)
                  ICR_LO = FCVAR(I  ,J-1,K  ,IBM_IDRA,JAXIS)
                  ICR_HI = FCVAR(I  ,J  ,K  ,IBM_IDRA,JAXIS)
                  X1LO   = Y(J-1)
                  X1HI   = Y(J  )
               CASE(KAXIS)
                  FTY_LO = FCVAR(I  ,J  ,K-1,IBM_FGSC,KAXIS)
                  FTY_HI = FCVAR(I  ,J  ,K  ,IBM_FGSC,KAXIS)
                  ICR_LO = FCVAR(I  ,J  ,K-1,IBM_IDRA,KAXIS)
                  ICR_HI = FCVAR(I  ,J  ,K  ,IBM_IDRA,KAXIS)
                  X1LO   = Z(K-1)
                  X1HI   = Z(K  )
               ENDSELECT

               ! IF FTY_LO == IBM_SOLID    and FTY_HI == IBM_SOLID, do not assign.
               IF (FTY_LO==IBM_SOLID .AND. FTY_HI==IBM_SOLID) CYCLE

               ! If FTY_LO == IBM_CUTCFE and FTY_HI == IBM_GASPHASE assign all CFACES of this cell to
               ! RAD_CFACE(ICF_LO)%ASSIGNED_CFACES_RADI.
               IF ( (FTY_LO==IBM_CUTCFE   .AND. FTY_HI==IBM_GASPHASE) ) THEN
                  CALL ASSIGN_CFACE_CARTFCS(NM,LOW_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                  CYCLE
               ENDIF

               ! If FTY_LO == IBM_GASPHASE and FTY_HI == IBM_CUTCFE assign all CFACES of this cell to
               ! RAD_CFACE(ICF_HI)%ASSIGNED_CFACES_RADI
               IF ( (FTY_LO==IBM_GASPHASE .AND. FTY_HI==IBM_CUTCFE  ) ) THEN
                  CALL ASSIGN_CFACE_CARTFCS(NM,HIGH_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                  CYCLE
               ENDIF

               ! If (FTY_LO == IBM_CUTCFE and FTY_HI == IBM_CUTCFE) .OR.
               !    (FTY_LO == IBM_GASPHASE and FTY_HI == IBM_GASPHASE) assign CFACES with centriods on low
               ! X1AXIS side of cell to RAD_CFACE(ICF_LO)%ASSIGNED_CFACES_RADI, and CFACE with centroids
               ! on high X1AXIS side to RAD_CFACE(ICF_HI)%ASSIGNED_CFACES_RADI.
               IF ( (FTY_LO==IBM_CUTCFE   .AND. FTY_HI==IBM_SOLID   ) .OR. &
                    (FTY_LO==IBM_SOLID    .AND. FTY_HI==IBM_CUTCFE  ) .OR. &
                    (FTY_LO==IBM_CUTCFE   .AND. FTY_HI==IBM_CUTCFE  ) .OR. &
                    (FTY_LO==IBM_GASPHASE .AND. FTY_HI==IBM_GASPHASE)       ) THEN
                  CALL ASSIGN_CFACE_CARTFCS(NM,0,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                  CYCLE
               ENDIF

               ! Now, what to do when:
               ! If FTY_LO == IBM_SOLID    and FTY_HI == IBM_GASPHASE,
               ! If FTY_LO == IBM_GASPHASE and FTY_HI == IBM_SOLID.
               CFACE_SNAP_IF : IF (RAD_CFACE_SNAPTO_METHOD==RAD_GOTO_GASPHASE) THEN

                  ! If FTY_LO == IBM_GASPHASE and FTY_HI == IBM_SOLID, assign to the GASPHASE side.
                  IF ( (FTY_LO==IBM_GASPHASE .AND. FTY_HI==IBM_SOLID )       ) THEN
                     CALL ASSIGN_CFACE_CARTFCS(NM,LOW_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     CYCLE
                  ENDIF
                  ! If FTY_LO == IBM_SOLID    and FTY_HI == IBM_GASPHASE, assign to the GASPHASE side.
                  IF ( (FTY_LO==IBM_SOLID  .AND. FTY_HI==IBM_GASPHASE)       ) THEN
                     CALL ASSIGN_CFACE_CARTFCS(NM,HIGH_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     CYCLE
                  ENDIF

               ELSEIF (RAD_CFACE_SNAPTO_METHOD==RAD_USE_CCVOLUS) THEN ! CFACE_SNAP_IF

                  ICC=CCVAR(I,J,K,IBM_IDCC); IF(ICC<1) CYCLE
                  CC_VOL=0._EB
                  DO JCC=1,CUT_CELL(ICC)%NCELL
                     CC_VOL=CC_VOL+CUT_CELL(ICC)%VOLUME(JCC)
                  ENDDO
                  GAS_VOL_RATIO_FLAG = CC_VOL < 0.5_EB*(DX(I)*DY(J)*DZ(K))

                  ! If FTY_LO == IBM_GASPHASE and FTY_HI == IBM_SOLID, assign depending on GAS_VOL_RATIO_FLAG.
                  ! IF GAS_VOL_RATIO_FLAG = .TRUE. we assume GEOM surface closer to gas face -> Assign to GASPHASE.
                  ! IF GAS_VOL_RATIO_FLAG =.FALSE. we assume GEOM surface closer to solid face-> Assign to SOLID.
                  IF ( (FTY_LO==IBM_GASPHASE .AND. FTY_HI==IBM_SOLID )       ) THEN
                     IF(GAS_VOL_RATIO_FLAG) THEN
                        CALL ASSIGN_CFACE_CARTFCS(NM,LOW_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ELSE
                        CALL ASSIGN_CFACE_CARTFCS(NM,HIGH_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ENDIF
                     CYCLE
                  ENDIF
                  ! If FTY_LO == IBM_SOLID    and FTY_HI == IBM_GASPHASE, assign to the GASPHASE side.
                  IF ( (FTY_LO==IBM_SOLID  .AND. FTY_HI==IBM_GASPHASE)       ) THEN
                     IF(GAS_VOL_RATIO_FLAG) THEN
                        CALL ASSIGN_CFACE_CARTFCS(NM,HIGH_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ELSE
                        CALL ASSIGN_CFACE_CARTFCS(NM,LOW_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ENDIF
                     CYCLE
                  ENDIF

               ELSEIF (RAD_CFACE_SNAPTO_METHOD==RAD_USE_AVGCFACES_CEN) THEN ! CFACE_SNAP_IF

                  X1AREA=0._EB
                  AREAT =0._EB
                  DO IFACE=1,CUT_FACE(ICF)%NFACE
                     AREAT = AREAT + CUT_FACE(ICF)%AREA(IFACE)
                     X1AREA=X1AREA + CUT_FACE(ICF)%XYZCEN(X1AXIS,IFACE)*CUT_FACE(ICF)%AREA(IFACE)
                  ENDDO
                  IF (AREAT > TWO_EPSILON_EB) THEN
                     LOHI_X1_FLAG = X1AREA/AREAT-X1LO < 0.5_EB*(X1HI-X1LO) ! If .TRUE. average CFACE centroid in the
                                                                           ! cell is closer to X1LO side.
                  ELSE
                     CYCLE ! No need to add these CFACES.
                  ENDIF
                  ! IF LOHI_X1_FLAG = .TRUE., assign to low X1AXIS face, if .FALSE. assign to high X1AXIS face.
                  IF ( (FTY_LO==IBM_GASPHASE .AND. FTY_HI==IBM_SOLID ) .OR. &
                       (FTY_LO==IBM_SOLID  .AND. FTY_HI==IBM_GASPHASE)       ) THEN
                     IF(LOHI_X1_FLAG) THEN
                        CALL ASSIGN_CFACE_CARTFCS(NM,LOW_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ELSE
                        CALL ASSIGN_CFACE_CARTFCS(NM,HIGH_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)
                     ENDIF
                  ENDIF

               ENDIF CFACE_SNAP_IF


            ENDDO
         ENDDO
      ENDDO
   ENDDO

ENDDO MESH_LOOP_5

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   WRITE(LU_SETCC,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,', sec.'
   IF (MY_RANK==0) WRITE(LU_ERR  ,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,', sec.'
ENDIF

RETURN
END SUBROUTINE GET_INBCUTFACES_TO_CFACE


! ------------------------ ASSIGN_CFACE_CARTFCS ----------------------------------

SUBROUTINE ASSIGN_CFACE_CARTFCS(NM,LOHI_IND,X1LO,X1HI,X1AXIS,ICF,ICR_LO,ICR_HI,I,J,K)

! This routine assumes ICF is not zero, terefore there are CFACES in cell I,J,K.

INTEGER, INTENT(IN) :: NM,LOHI_IND,ICF,ICR_LO,ICR_HI,X1AXIS,I,J,K
REAL(EB),INTENT(IN) :: X1LO,X1HI

IF ( LOHI_IND == LOW_IND ) THEN ! Add cface indexes of boundary faces in cell I,J,K to RAD_CFACE(ICR_LO)
   CALL ASSIGN_ONE_FACE_RADI(NM,LOHI_IND,ICR_LO,ICF,X1AXIS,I,J,K)
ELSEIF ( LOHI_IND == HIGH_IND ) THEN ! ADD cface indexes of boundary faces in cell I,J,K to RAD_CFACE(ICR_HI)
   CALL ASSIGN_ONE_FACE_RADI(NM,LOHI_IND,ICR_HI,ICF,X1AXIS,I,J,K)
ELSE ! Distribute among ICR_LO and ICR_HI:
   CALL ASSIGN_TWO_FACE_RADI(NM,ICR_LO,ICR_HI,ICF,X1LO,X1HI,X1AXIS,I,J,K)
ENDIF

RETURN
END SUBROUTINE ASSIGN_CFACE_CARTFCS


! ------------------------ ASSIGN_TWO_FACE_RADI ---------------------------------

SUBROUTINE ASSIGN_TWO_FACE_RADI(NM,ICR_LO,ICR_HI,ICF,X1LO,X1HI,X1AXIS,I,J,K)

INTEGER, INTENT(IN) :: NM,ICF,ICR_LO,ICR_HI,X1AXIS,I,J,K
REAL(EB),INTENT(IN) :: X1LO,X1HI

! Local veriables:
REAL(EB) :: DX1O2, NVEC_COMP
INTEGER  :: NCFACE(LOW_IND:HIGH_IND),ICR2(LOW_IND:HIGH_IND),ICR,IFACE,NCFACES,NASSIGN,IDUM,IND,II,JJ,KK
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFACES_RADI_AUX

DX1O2 = 0.5_EB*(X1HI-X1LO)
NCFACE(LOW_IND:HIGH_IND) = 0
ICR2(LOW_IND:HIGH_IND) = (/ ICR_LO, ICR_HI /)

! First count how many CFACES each Cartesian face on the X1AXIS will receive.
! A CFACE is assigned to the cartesian face that lays closer to its centroid in the X1AXIS direction.
DO IFACE=1,CUT_FACE(ICF)%NFACE
   IF(ABS(MESHES(NM)%CFACE(CUT_FACE(ICF)%CFACE_INDEX(IFACE))%NVEC(X1AXIS)) < GEOMEPS) CYCLE
   IF(ABS(CUT_FACE(ICF)%XYZCEN(X1AXIS,IFACE)-X1LO) < DX1O2) THEN
      NCFACE(LOW_IND)  = NCFACE(LOW_IND)  + 1
   ELSE
      NCFACE(HIGH_IND) = NCFACE(HIGH_IND) + 1
   ENDIF
ENDDO

! Allocate RAD_CFACE(ICR2(IND)):
DO IND=LOW_IND,HIGH_IND
   NCFACES = NCFACE(IND)
   ICR     = ICR2(IND)
   NASSIGN = MESHES(NM)%RAD_CFACE(ICR)%N_ASSIGNED_CFACES_RADI
   IF (NCFACES > 0) THEN
      IF (NASSIGN==0) THEN
         ! Allocate for first time RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI:
         ALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,NCFACES))
      ELSE
         ! Reallocate and add NCFACES:
         ALLOCATE(CFACES_RADI_AUX(1:5,NASSIGN));
         CFACES_RADI_AUX(1:5,1:NASSIGN) = MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,1:NASSIGN)
         DEALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI)
         ALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,NASSIGN+NCFACES))
         MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,1:NASSIGN)=CFACES_RADI_AUX(1:5,1:NASSIGN)
         DEALLOCATE(CFACES_RADI_AUX)
      ENDIF
   ENDIF
   NCFACE(IND) = NASSIGN
ENDDO

! Add to RAD_CFACE ICR_LO, ICR_HI:
DO IFACE=1,CUT_FACE(ICF)%NFACE
   NVEC_COMP = MESHES(NM)%CFACE(CUT_FACE(ICF)%CFACE_INDEX(IFACE))%NVEC(X1AXIS)
   IF(ABS(NVEC_COMP) < GEOMEPS) CYCLE
   II = I; JJ=J; KK=K
   IF(ABS(CUT_FACE(ICF)%XYZCEN(X1AXIS,IFACE)-X1LO) < DX1O2) THEN
      IND = LOW_IND
      IF (NVEC_COMP < 0._EB) THEN
         SELECT CASE(X1AXIS)
         CASE(IAXIS); II=I-1
         CASE(JAXIS); JJ=J-1
         CASE(KAXIS); KK=K-1
         END SELECT
      ENDIF
   ELSE
      IND = HIGH_IND
      IF (NVEC_COMP > 0._EB) THEN
         SELECT CASE(X1AXIS)
         CASE(IAXIS); II=I+1
         CASE(JAXIS); JJ=J+1
         CASE(KAXIS); KK=K+1
         END SELECT
      ENDIF
   ENDIF
   NCFACE(IND) = NCFACE(IND)  + 1
   IDUM        = NCFACE(IND)
   ICR         =   ICR2(IND)
   MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,IDUM)= (/ CUT_FACE(ICF)%CFACE_INDEX(IFACE), II, JJ ,KK, X1AXIS /)
ENDDO

DO IND=LOW_IND,HIGH_IND
   MESHES(NM)%RAD_CFACE(ICR2(IND))%N_ASSIGNED_CFACES_RADI = NCFACE(IND)
   IF(NCFACE(IND)==0 .AND. ALLOCATED(MESHES(NM)%RAD_CFACE(ICR2(IND))%ASSIGNED_CFACES_RADI) ) &
   DEALLOCATE(MESHES(NM)%RAD_CFACE(ICR2(IND))%ASSIGNED_CFACES_RADI)
ENDDO


RETURN
END SUBROUTINE ASSIGN_TWO_FACE_RADI


! ------------------------ ASSIGN_ONE_FACE_RADI ---------------------------------

SUBROUTINE ASSIGN_ONE_FACE_RADI(NM,LOHI_IND,ICR,ICF,X1AXIS,I,J,K)

! Assign all CFACES in CUT_FACE(ICF)%CFACE_INDEX to RAD_CFACE(ICR)

INTEGER, INTENT(IN) :: NM, LOHI_IND, ICR, ICF, X1AXIS, I ,J ,K

! Local Variables:
INTEGER :: NASSIGN, NCFACES, IDUM, IFACE, II, JJ, KK
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFACES_RADI_AUX
REAL(EB):: NVEC_COMP

NASSIGN = MESHES(NM)%RAD_CFACE(ICR)%N_ASSIGNED_CFACES_RADI
NCFACES = CUT_FACE(ICF)%NFACE

IF (NASSIGN==0) THEN
   ! Allocate for first time RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI:
   ALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,NCFACES))
ELSE
   ! Reallocate and add NCFACES:
   ALLOCATE(CFACES_RADI_AUX(1:5,NASSIGN));
   CFACES_RADI_AUX(1:5,1:NASSIGN) = MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,1:NASSIGN)
   DEALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI)
   ALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,NASSIGN+NCFACES))
   MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,1:NASSIGN)=CFACES_RADI_AUX(1:5,1:NASSIGN)
   DEALLOCATE(CFACES_RADI_AUX)
ENDIF
IDUM = NASSIGN
LOHI_IF : IF(LOHI_IND == LOW_IND) THEN
   DO IFACE=1,NCFACES
      NVEC_COMP = MESHES(NM)%CFACE(CUT_FACE(ICF)%CFACE_INDEX(IFACE))%NVEC(X1AXIS)
      IF(ABS(NVEC_COMP) < GEOMEPS) CYCLE
      IDUM=IDUM+1
      II = I; JJ=J; KK=K
      IF (NVEC_COMP < 0._EB) THEN
         SELECT CASE(X1AXIS)
         CASE(IAXIS); II=I-1
         CASE(JAXIS); JJ=J-1
         CASE(KAXIS); KK=K-1
         END SELECT
      ENDIF
      MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,IDUM)=(/ CUT_FACE(ICF)%CFACE_INDEX(IFACE), II, JJ, KK, X1AXIS /)
   ENDDO
ELSE
   DO IFACE=1,NCFACES
      NVEC_COMP = MESHES(NM)%CFACE(CUT_FACE(ICF)%CFACE_INDEX(IFACE))%NVEC(X1AXIS)
      IF(ABS(NVEC_COMP) < GEOMEPS) CYCLE
      IDUM=IDUM+1
      II = I; JJ=J; KK=K
      IF (NVEC_COMP > 0._EB) THEN
         SELECT CASE(X1AXIS)
         CASE(IAXIS); II=I+1
         CASE(JAXIS); JJ=J+1
         CASE(KAXIS); KK=K+1
         END SELECT
      ENDIF
      MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI(1:5,IDUM)=(/ CUT_FACE(ICF)%CFACE_INDEX(IFACE), II, JJ, KK, X1AXIS /)
   ENDDO
ENDIF LOHI_IF
MESHES(NM)%RAD_CFACE(ICR)%N_ASSIGNED_CFACES_RADI = IDUM
IF(IDUM==0) DEALLOCATE(MESHES(NM)%RAD_CFACE(ICR)%ASSIGNED_CFACES_RADI)

RETURN
END SUBROUTINE ASSIGN_ONE_FACE_RADI


! ------------------------- SET_GC_CUTCELLS_3D -----------------------------------

SUBROUTINE SET_GC_CUTCELLS_3D

! Local Variables:
INTEGER :: IW,II,JJ,KK,IOR,IIO,JJO,KKO,IIF,JJF,KKF,IIOF,JJOF,KKOF,ICF,ICOF,X1AXIS,ICC,NMICC,NOFC,N_CF,N_CRT
REAL(EB):: XNM, XNOM
TYPE (WALL_TYPE), POINTER :: WC
TYPE (EXTERNAL_WALL_TYPE), POINTER :: EWC
LOGICAL :: WC_PERIODIC, TEST_ICC
INTEGER, PARAMETER :: INDADD(1:3,1:6) = RESHAPE((/-1,0,0,0,0,0,0,-1,0,0,0,0,0,0,-1,0,0,0/),(/3,6/))
INTEGER, PARAMETER :: MYAXIS(1:6) = (/ IAXIS,IAXIS,JAXIS,JAXIS,KAXIS,KAXIS /)
REAL(EB):: AREA_NM, AREA_NOM, AREA_CRT


IF (CCGUARD == 0) RETURN

IF(GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_SETCC,'(A)',advance='no') ' 3. Define boundary CUT_FACES, ghost-cell CUT_CELLs relation to NOM ones ..'
   IF (MY_RANK==0) THEN
      WRITE(LU_ERR  ,'(A)',advance='no') ' 3. Define boundary CUT_FACES, ghost-cell CUT_CELLs relation to NOM ones ..'
   ENDIF
ENDIF

! Meshes Loop:
! First Mesh Loop:
! Test if NOM mesh cells are of the same size or smaller than NM mesh that areas match:
MESH_LOOP_1 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX

   IF (MESHES(NM)%N_CUTFACE_MESH==0) CYCLE MESH_LOOP_1
   CALL POINT_TO_MESH(NM)

   EXTERNAL_WALL_LOOP_1 : DO IW=1,N_EXTERNAL_WALL_CELLS

      WC=>WALL(IW)
      EWC=>EXTERNAL_WALL(IW)
      IF (.NOT.(WC%BOUNDARY_TYPE == INTERPOLATED_BOUNDARY .OR. &
                WC%BOUNDARY_TYPE == MIRROR_BOUNDARY) ) CYCLE EXTERNAL_WALL_LOOP_1

      II  = WC%ONE_D%II
      JJ  = WC%ONE_D%JJ
      KK  = WC%ONE_D%KK
      IOR = WC%ONE_D%IOR

      ! Skip if no cut-faces present on this WC:
      ! Define underlying Cartesian faces indexes:
      SELECT CASE(IOR)
      CASE( IAXIS) ! Lower X boundary for Mesh NM. Note we are using ghost cell II,JJ,KK.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-IAXIS) ! Higher X boundary for Mesh NM.
         IIF = II - 1; JJF = JJ    ; KKF = KK
      CASE( JAXIS) ! Lower Y boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-JAXIS) ! Higher Y boundary for Mesh NM.
         IIF = II    ; JJF = JJ - 1; KKF = KK
      CASE( KAXIS) ! Lower Z boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-KAXIS) ! Higher Z boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK - 1
      END SELECT
      X1AXIS = ABS(IOR)
      IF(FCVAR(IIF,JJF,KKF,IBM_FGSC,X1AXIS) /= IBM_CUTCFE) CYCLE EXTERNAL_WALL_LOOP_1

      ! Gas cut-face area in wall-cell IW face:
      ICF     = FCVAR(IIF,JJF,KKF,IBM_IDCF,X1AXIS)
      AREA_NM = SUM(CUT_FACE(ICF)%AREA(1:CUT_FACE(ICF)%NFACE))

      IF(WC%BOUNDARY_TYPE == INTERPOLATED_BOUNDARY) THEN
         NOM = EWC%NOM ! Use Other Mesh Data.
         IF(MESHES(NOM)%N_CUTFACE_MESH==0) CYCLE EXTERNAL_WALL_LOOP_1
         ! Now Obtain the CUT_FACE for the same face on NM-NOM:

         AREA_NOM = 0._EB; N_CF=0; N_CRT=0
         DO KKO=EWC%KKO_MIN,EWC%KKO_MAX
            DO JJO=EWC%JJO_MIN,EWC%JJO_MAX
               DO IIO=EWC%IIO_MIN,EWC%IIO_MAX
                SELECT CASE(IOR)
                CASE( IAXIS) ! Lower X boundary for Mesh NM, Higher for mesh NOM.
                   IIOF= IIO   ; JJOF= JJO   ; KKOF= KKO   ; AREA_CRT = MESHES(NOM)%DY(JJOF)*MESHES(NOM)%DZ(KKOF)
                CASE(-IAXIS) ! Higher X boundary for Mesh NM, Lower for mesh NOM.
                   IIOF= IIO- 1; JJOF= JJO   ; KKOF= KKO   ; AREA_CRT = MESHES(NOM)%DY(JJOF)*MESHES(NOM)%DZ(KKOF)
                CASE( JAXIS) ! Lower Y boundary for Mesh NM, Higher for mesh NOM.
                   IIOF= IIO   ; JJOF= JJO   ; KKOF= KKO   ; AREA_CRT = MESHES(NOM)%DX(IIOF)*MESHES(NOM)%DZ(KKOF)
                CASE(-JAXIS) ! Higher Y boundary for Mesh NM, Lower for mesh NOM.
                   IIOF= IIO   ; JJOF= JJO- 1; KKOF= KKO   ; AREA_CRT = MESHES(NOM)%DX(IIOF)*MESHES(NOM)%DZ(KKOF)
                CASE( KAXIS) ! Lower Z boundary for Mesh NM, Higher for mesh NOM.
                   IIOF= IIO   ; JJOF= JJO   ; KKOF= KKO   ; AREA_CRT = MESHES(NOM)%DX(IIOF)*MESHES(NOM)%DY(JJOF)
                CASE(-KAXIS) ! Higher Z boundary for Mesh NM, Lower for mesh NOM.
                   IIOF= IIO   ; JJOF= JJO   ; KKOF= KKO- 1; AREA_CRT = MESHES(NOM)%DX(IIOF)*MESHES(NOM)%DY(JJOF)
                END SELECT
                IF(MESHES(NOM)%FCVAR(IIOF,JJOF,KKOF,IBM_FGSC,X1AXIS) == IBM_GASPHASE) THEN
                   AREA_NOM = AREA_NOM + AREA_CRT
                   N_CRT    = N_CRT + 1
                ELSEIF(MESHES(NOM)%FCVAR(IIOF,JJOF,KKOF,IBM_IDCF,X1AXIS) > 0) THEN ! there are gasphase cut-faces
                   ICOF     = MESHES(NOM)%FCVAR(IIOF,JJOF,KKOF,IBM_IDCF,X1AXIS)
                   AREA_NOM = AREA_NOM + SUM(MESHES(NOM)%CUT_FACE(ICOF)%AREA(1:MESHES(NOM)%CUT_FACE(ICOF)%NFACE))
                   N_CF     = N_CF + 1
                ENDIF
               ENDDO
            ENDDO
         ENDDO

         ! Check if:
         ! 1. other mesh faces are more than one -> areas match.
         ! 2. other mesh face and size of cartesian faces the same -> areas match.
         ! 3. Left the case of fine mesh face with OMESH face coarse.
         NOFC = EWC%NIC_MAX - EWC%NIC_MIN + 1
         IF ( (NOFC > 1) .OR. (ABS(WC%ONE_D%AREA-AREA_CRT) < GEOMEPS) )THEN
            IF(ABS(AREA_NM-AREA_NOM) > GEOMEPS) THEN
               WRITE(LU_ERR,*) 'SET_GC_CUTCELLS_3D Error: MESH=',NM,', CUT_FACE=',ICF,' does not match OMESH=',&
                               NOM,', with CUT_FACEs,CRT_FACEs=',N_CF,N_CRT,', area difference=',&
                               ABS(AREA_NM-AREA_NOM),', GEOMEPS=',GEOMEPS
            ENDIF
         ENDIF

      ENDIF

   ENDDO EXTERNAL_WALL_LOOP_1

ENDDO MESH_LOOP_1


! Second mesh loop:
! Define cut-cell data on guard-cell region to be communicated:
MESH_LOOP_2 : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX

   CALL POINT_TO_MESH(NM)

   IF ((MESHES(NM)%N_CUTCELL_MESH+MESHES(NM)%N_GCCUTCELL_MESH)==0) CYCLE MESH_LOOP_2

   EXTERNAL_WALL_LOOP_2 : DO IW=1,N_EXTERNAL_WALL_CELLS

      WC=>WALL(IW)
      EWC=>EXTERNAL_WALL(IW)
      IF (.NOT.(WC%BOUNDARY_TYPE == INTERPOLATED_BOUNDARY .OR. &
                WC%BOUNDARY_TYPE == MIRROR_BOUNDARY) ) CYCLE EXTERNAL_WALL_LOOP_2

      II  = WC%ONE_D%II
      JJ  = WC%ONE_D%JJ
      KK  = WC%ONE_D%KK
      IOR = WC%ONE_D%IOR
      NOM = EWC%NOM ! Use Other Mesh Data.

      IF(NOM>0) THEN
         IF(MESHES(NOM)%N_CUTFACE_MESH==0) CYCLE EXTERNAL_WALL_LOOP_2
      ENDIF

      IF(WC%BOUNDARY_TYPE == INTERPOLATED_BOUNDARY) THEN

         ! Skip if no cut-faces present on this WC:
         ! Define underlying Cartesian faces indexes:
         SELECT CASE(IOR)
         CASE( IAXIS) ! Lower X boundary for Mesh NM. Note we are using ghost cell II,JJ,KK.
            IIF = II    ; JJF = JJ    ; KKF = KK
         CASE(-IAXIS) ! Higher X boundary for Mesh NM.
            IIF = II - 1; JJF = JJ    ; KKF = KK
         CASE( JAXIS) ! Lower Y boundary for Mesh NM.
            IIF = II    ; JJF = JJ    ; KKF = KK
         CASE(-JAXIS) ! Higher Y boundary for Mesh NM.
            IIF = II    ; JJF = JJ - 1; KKF = KK
         CASE( KAXIS) ! Lower Z boundary for Mesh NM.
            IIF = II    ; JJF = JJ    ; KKF = KK
         CASE(-KAXIS) ! Higher Z boundary for Mesh NM.
            IIF = II    ; JJF = JJ    ; KKF = KK - 1
         END SELECT
         X1AXIS = ABS(IOR)
         IF(FCVAR(IIF,JJF,KKF,IBM_FGSC,X1AXIS) == IBM_SOLID) CYCLE EXTERNAL_WALL_LOOP_2

         IF (MESHES(NM)%CCVAR(II,JJ,KK,IBM_CGSC) == IBM_CUTCFE) THEN
            TEST_ICC = .TRUE.
            DO KKO=EWC%KKO_MIN,EWC%KKO_MAX
               DO JJO=EWC%JJO_MIN,EWC%JJO_MAX
                  DO IIO=EWC%IIO_MIN,EWC%IIO_MAX
                     TEST_ICC = TEST_ICC .AND. (MESHES(NOM)%CCVAR(IIO,JJO,KKO,IBM_IDCC) <= 0)
                  ENDDO
               ENDDO
            ENDDO

            NMICC = MESHES(NM)%CCVAR(II,JJ,KK,IBM_IDCC)
            ! Do test for PERIODIC boundaries. Note: PERIODIC boundaries at this point have been redefined as INTERPOLATED_BOUNDARY,
            ! so we test using the Mesh center relative locations.
            IF (WC%BOUNDARY_TYPE==INTERPOLATED_BOUNDARY .AND. NMICC > 0 .AND. TEST_ICC) THEN
               WC_PERIODIC=.FALSE.
               SELECT CASE(IOR)
               CASE(-IAXIS) ! High X wall cell.
                  XNM =0.5_EB*(MESHES(NM)%XS+MESHES(NM)%XF); XNOM=0.5_EB*(MESHES(NOM)%XS+MESHES(NOM)%XF)
                  IF( (XNOM-XNM) <  TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               CASE( IAXIS) ! Low X wall cell.
                  XNM =0.5_EB*(MESHES(NM)%XS+MESHES(NM)%XF); XNOM=0.5_EB*(MESHES(NOM)%XS+MESHES(NOM)%XF)
                  IF( (XNOM-XNM) > -TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               CASE(-JAXIS) ! High Y wall cell.
                  XNM =0.5_EB*(MESHES(NM)%YS+MESHES(NM)%YF); XNOM=0.5_EB*(MESHES(NOM)%YS+MESHES(NOM)%YF)
                  IF( (XNOM-XNM) <  TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               CASE( JAXIS) ! Low Y wall cell.
                  XNM =0.5_EB*(MESHES(NM)%YS+MESHES(NM)%YF); XNOM=0.5_EB*(MESHES(NOM)%YS+MESHES(NOM)%YF)
                  IF( (XNOM-XNM) > -TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               CASE(-KAXIS) ! High Z wall cell.
                  XNM =0.5_EB*(MESHES(NM)%ZS+MESHES(NM)%ZF); XNOM=0.5_EB*(MESHES(NOM)%ZS+MESHES(NOM)%ZF)
                  IF( (XNOM-XNM) < TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               CASE( KAXIS) ! Low Z wall cell.
                  XNM =0.5_EB*(MESHES(NM)%ZS+MESHES(NM)%ZF); XNOM=0.5_EB*(MESHES(NOM)%ZS+MESHES(NOM)%ZF)
                  IF( (XNOM-XNM) > -TWO_EPSILON_EB ) WC_PERIODIC=.TRUE.
               END SELECT
               IF (WC_PERIODIC) THEN
                  MESHES(NM)%CCVAR(II,JJ,KK,IBM_IDCC) = 0 ! Set NMICC = 0.
                  DO KKO=EWC%KKO_MIN,EWC%KKO_MAX
                     DO JJO=EWC%JJO_MIN,EWC%JJO_MAX
                        DO IIO=EWC%IIO_MIN,EWC%IIO_MAX
                           IF(MESHES(NOM)%CCVAR(IIO,JJO,KKO,IBM_CGSC)==IBM_SOLID) THEN
                              MESHES(NM)%CCVAR(II,JJ,KK,IBM_CGSC)=IBM_SOLID ! set to Solid.
                              CYCLE EXTERNAL_WALL_LOOP_2
                           ENDIF
                        ENDDO
                     ENDDO
                  ENDDO
               ENDIF
            ENDIF

            NOFC = EWC%NIC_MAX - EWC%NIC_MIN + 1
            ALLOCATE(MESHES(NM)%CUT_CELL(NMICC)%NOMICC(2,NOFC)); MESHES(NM)%CUT_CELL(NMICC)%NOMICC(1:2,1:NOFC) = 0
            N_CF = 0
            DO KKO=EWC%KKO_MIN,EWC%KKO_MAX
               DO JJO=EWC%JJO_MIN,EWC%JJO_MAX
                  DO IIO=EWC%IIO_MIN,EWC%IIO_MAX
                    ICC   = MESHES(NOM)%CCVAR(IIO,JJO,KKO,IBM_IDCC)
                    IF (ICC > 0) THEN
                       N_CF = N_CF + 1
                       MESHES(NM)%CUT_CELL(NMICC)%NOMICC(1:2,N_CF) = (/ NOM, ICC /)
                       NCELL = MESHES(NOM)%CUT_CELL(ICC)%NCELL
                       ! Add NCELL cut-cells to OM%NCC_R:
                       MESHES(NM)%OMESH(NOM)%NICC_R(1) = MESHES(NM)%OMESH(NOM)%NICC_R(1) + 1
                       MESHES(NM)%OMESH(NOM)%NICC_R(2) = MESHES(NM)%OMESH(NOM)%NICC_R(2) + NCELL
                    ENDIF
                  ENDDO
               ENDDO
            ENDDO
            MESHES(NM)%CUT_CELL(NMICC)%N_NOMICC = N_CF
         ENDIF

      ELSEIF(WC%BOUNDARY_TYPE == MIRROR_BOUNDARY) THEN
         NOM = NM ! Use gas cell data, same mesh.
         IIO = WC%ONE_D%IIG
         JJO = WC%ONE_D%JJG
         KKO = WC%ONE_D%KKG
         ! CYCLE if OBJECT face is in the Mirror Boundary, normal out into ghost-cell:
         SELECT CASE(IOR)
         CASE( IAXIS)
            IF(FCVAR(IIO-1,JJO  ,KKO  ,IBM_FGSC,IAXIS) == IBM_SOLID) CYCLE
         CASE(-IAXIS)
            IF(FCVAR(IIO  ,JJO  ,KKO  ,IBM_FGSC,IAXIS) == IBM_SOLID) CYCLE
         CASE( JAXIS)
            IF(FCVAR(IIO  ,JJO-1,KKO  ,IBM_FGSC,JAXIS) == IBM_SOLID) CYCLE
         CASE(-JAXIS)
            IF(FCVAR(IIO  ,JJO  ,KKO  ,IBM_FGSC,JAXIS) == IBM_SOLID) CYCLE
         CASE( KAXIS)
            IF(FCVAR(IIO  ,JJO  ,KKO-1,IBM_FGSC,KAXIS) == IBM_SOLID) CYCLE
         CASE(-KAXIS)
            IF(FCVAR(IIO  ,JJO  ,KKO  ,IBM_FGSC,KAXIS) == IBM_SOLID) CYCLE
         END SELECT
         IF (MESHES(NM)%CCVAR(II,JJ,KK,IBM_CGSC) == IBM_CUTCFE) THEN
            ICC   = MESHES(NOM)%CCVAR(IIO,JJO,KKO,IBM_IDCC)
            NMICC = MESHES(NM)%CCVAR(II,JJ,KK,IBM_IDCC)
            NOFC  = 1
            ALLOCATE(MESHES(NM)%CUT_CELL(NMICC)%NOMICC(2,NOFC)); MESHES(NM)%CUT_CELL(NMICC)%NOMICC(1:2,1:NOFC) = 0
            MESHES(NM)%CUT_CELL(NMICC)%NOMICC(1:2,NOFC) = (/ NOM, ICC /)
            MESHES(NM)%CUT_CELL(NMICC)%N_NOMICC = NOFC
            NCELL = MESHES(NOM)%CUT_CELL(ICC)%NCELL
            ! Add NCELL cut-cells to OM%NCC_R:
            MESHES(NM)%OMESH(NOM)%NICC_R(1) = MESHES(NM)%OMESH(NOM)%NICC_R(1) + 1
            MESHES(NM)%OMESH(NOM)%NICC_R(2) = MESHES(NM)%OMESH(NOM)%NICC_R(2) + NCELL
         ENDIF
      ENDIF


   ENDDO EXTERNAL_WALL_LOOP_2

ENDDO MESH_LOOP_2

IF(GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   WRITE(LU_SETCC,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,' sec.'
   IF (MY_RANK==0) THEN
      WRITE(LU_ERR  ,'(A,F8.3,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START,' sec.'
   ENDIF
ENDIF

RETURN

END SUBROUTINE SET_GC_CUTCELLS_3D


! --------------------------- GET_GEOM_TRIBIN --------------------------------------

SUBROUTINE GET_GEOM_TRIBIN

! This routine separates lists of triangles for each GEOMETRY in interval
! bins in each direction. They are used in SET_CUTCELLS_3D/GET_BODINT_PLANE to optimize
! cut-cell generation.

! Local Variables:
INTEGER :: IG, IWSEL, IEDGE, NTL, SZE, IBIN, ILO_BIN, IHI_BIN, WSELEM(NOD1:NOD3)
REAL(EB):: LEDGE, DXYZE(MAX_DIM), LX1, DELBIN, X1V_LO, X1V_HI, X1V(NOD1:NOD3)
INTEGER, ALLOCATABLE, DIMENSION(:) :: TRI_LIST
REAL(EB):: MINMAX_MESHES(LOW_IND:HIGH_IND,IAXIS:KAXIS),MIN_MESHGEOM,MAX_MESHGEOM
TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()
INTEGER :: DELTA_TBIN2


! Define boundary region of Meshes handled by MPI process and their connected meshes:
! Select MESHES assigned to processor and OMESHES of these. Cut-cells will be computed for all of them.
ALLOCATE(CC_COMPUTE_MESH(1:NMESHES)); CC_COMPUTE_MESH = .FALSE.
MINMAX_MESHES( LOW_IND,:)=  1._EB/TWO_EPSILON_EB
MINMAX_MESHES(HIGH_IND,:)= -1._EB/TWO_EPSILON_EB
DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CC_COMPUTE_MESH(NM)=.TRUE. ! Compute cut-cells for my meshes.
   ! Min-max locations of MESH + halo region.
   IG = MESHES(NM)%IBAR
   MINMAX_MESHES( LOW_IND,IAXIS) = MIN(MINMAX_MESHES( LOW_IND,IAXIS),MESHES(NM)%XS-REAL(NGUARD,EB)*MESHES(NM)%DX( 1))
   MINMAX_MESHES(HIGH_IND,IAXIS) = MAX(MINMAX_MESHES(HIGH_IND,IAXIS),MESHES(NM)%XF+REAL(NGUARD,EB)*MESHES(NM)%DX(IG))
   IG = MESHES(NM)%JBAR
   MINMAX_MESHES( LOW_IND,JAXIS) = MIN(MINMAX_MESHES( LOW_IND,JAXIS),MESHES(NM)%YS-REAL(NGUARD,EB)*MESHES(NM)%DY( 1))
   MINMAX_MESHES(HIGH_IND,JAXIS) = MAX(MINMAX_MESHES(HIGH_IND,JAXIS),MESHES(NM)%YF+REAL(NGUARD,EB)*MESHES(NM)%DY(IG))
   IG = MESHES(NM)%KBAR
   MINMAX_MESHES( LOW_IND,KAXIS) = MIN(MINMAX_MESHES( LOW_IND,KAXIS),MESHES(NM)%ZS-REAL(NGUARD,EB)*MESHES(NM)%DZ( 1))
   MINMAX_MESHES(HIGH_IND,KAXIS) = MAX(MINMAX_MESHES(HIGH_IND,KAXIS),MESHES(NM)%ZF+REAL(NGUARD,EB)*MESHES(NM)%DZ(IG))
   DO NOM=1,NMESHES
      IF (MESHES(NM)%OMESH(NOM)%NIC_R > 0) THEN
         CC_COMPUTE_MESH(NOM)=.TRUE. ! There are cells from mesh NOM that are guardcells of mesh NM.
         ! Min-max locations of MESH + halo region.
         IG = MESHES(NOM)%IBAR
         MINMAX_MESHES( LOW_IND,IAXIS) = MIN(MINMAX_MESHES( LOW_IND,IAXIS),MESHES(NOM)%XS-REAL(NGUARD,EB)*MESHES(NOM)%DX( 1))
         MINMAX_MESHES(HIGH_IND,IAXIS) = MAX(MINMAX_MESHES(HIGH_IND,IAXIS),MESHES(NOM)%XF+REAL(NGUARD,EB)*MESHES(NOM)%DX(IG))
         IG = MESHES(NOM)%JBAR
         MINMAX_MESHES( LOW_IND,JAXIS) = MIN(MINMAX_MESHES( LOW_IND,JAXIS),MESHES(NOM)%YS-REAL(NGUARD,EB)*MESHES(NOM)%DY( 1))
         MINMAX_MESHES(HIGH_IND,JAXIS) = MAX(MINMAX_MESHES(HIGH_IND,JAXIS),MESHES(NOM)%YF+REAL(NGUARD,EB)*MESHES(NOM)%DY(IG))
         IG = MESHES(NOM)%KBAR
         MINMAX_MESHES( LOW_IND,KAXIS) = MIN(MINMAX_MESHES( LOW_IND,KAXIS),MESHES(NOM)%ZS-REAL(NGUARD,EB)*MESHES(NOM)%DZ( 1))
         MINMAX_MESHES(HIGH_IND,KAXIS) = MAX(MINMAX_MESHES(HIGH_IND,KAXIS),MESHES(NOM)%ZF+REAL(NGUARD,EB)*MESHES(NOM)%DZ(IG))
      ENDIF
   ENDDO
ENDDO


! Loop geometries:
LOOP_GEOM : DO IG = 1, N_GEOMETRY

   G=>GEOMETRY(IG)

   ! Define EDGE sizes and FACE cointaining boxes:
   G%MAX_LEDGE = GEOMEPS       ! Initialize to a small number.
   G%MIN_LEDGE = 1._EB/GEOMEPS ! Initialize to a large number.
   G%MEAN_LEDGE= 0._EB         ! Initialize to 0.

   ! Loop Faces:
   DO IWSEL = 0,G%N_FACES-1
      WSELEM(NOD1:NOD3) = G%FACES(3*IWSEL+1:3*IWSEL+3)

      ! Obtain edges length, test against MAX_LEDGE:
      DO IEDGE=1,3
         ! DX = XYZ2 - XYZ1:
         DXYZE(IAXIS:KAXIS) = G%VERTS(MAX_DIM*(WSELEM(NOD2)-1)+1:MAX_DIM*WSELEM(NOD2)) - &
                              G%VERTS(MAX_DIM*(WSELEM(NOD1)-1)+1:MAX_DIM*WSELEM(NOD1))
         LEDGE = sqrt( DXYZE(IAXIS)**2._EB + DXYZE(JAXIS)**2._EB + DXYZE(KAXIS)**2._EB )

         G%MAX_LEDGE = MAX(G%MAX_LEDGE,LEDGE)
         G%MIN_LEDGE = MIN(G%MIN_LEDGE,LEDGE)
         G%MEAN_LEDGE= G%MEAN_LEDGE + LEDGE

         WSELEM=CSHIFT(WSELEM,1)  ! Shift cyclically array by 1 entry. This rotates nodes connectivities.
                                  ! i.e: initially WSELEM=(/1,2,3/), 1st call gives WSELEM=(/2,3,1/), 2nd
                                  ! call gives WSELEM=(/3,1,2/).
      ENDDO

   ENDDO
   ! Mean length of Edge:
   G%MEAN_LEDGE = G%MEAN_LEDGE / REAL(G%N_FACES*EDGS_WSEL,EB) !Num EDGES summed in NUM_FACES * NUM edges on a face.

   ! Now define Bin sizes to distribute Faces subsets:
   DO X1AXIS=IAXIS,KAXIS

      ! Here reduce the X1_LOW to X1_HIGH distance to the smallest of FDS Mesh and connected meshes BBOX or Geometry:
      MIN_MESHGEOM = MAX(MINMAX_MESHES( LOW_IND,X1AXIS),G%GEOM_BOX( LOW_IND,X1AXIS))
      MAX_MESHGEOM = MIN(MINMAX_MESHES(HIGH_IND,X1AXIS),G%GEOM_BOX(HIGH_IND,X1AXIS))
      LX1 = MAX_MESHGEOM - MIN_MESHGEOM

      ! Define number of bins in direction X1AXIS:
      G%TBAXIS(X1AXIS)%N_BINS = CEILING(LX1/(GAMMA_MULT*G%MEAN_LEDGE))

      ! No overlap between procs meshes and Geometry, cycle:
      IF (G%TBAXIS(X1AXIS)%N_BINS < 1) THEN; G%TBAXIS(X1AXIS)%N_BINS = 0; CYCLE; ENDIF

      DELTA_TBIN2 = MAX(DELTA_TBIN,CEILING(0.05_EB*LX1/(G%GEOM_BOX(HIGH_IND,X1AXIS)-G%GEOM_BOX(LOW_IND,X1AXIS))*&
                                                        REAL(G%N_FACES,EB)/REAL(G%TBAXIS(X1AXIS)%N_BINS+1,EB)))

      ! Allocate TRIBIN field:
      IF(ALLOCATED(G%TBAXIS(X1AXIS)%TRIBIN)) DEALLOCATE(G%TBAXIS(X1AXIS)%TRIBIN)
      ALLOCATE(G%TBAXIS(X1AXIS)%TRIBIN(1:G%TBAXIS(X1AXIS)%N_BINS))

      ! Set BIN boundaries and make initial allocation of TRI_LIST for each bin:
      DELBIN = LX1 / REAL(G%TBAXIS(X1AXIS)%N_BINS,EB)
      G%TBAXIS(X1AXIS)%DELBIN = DELBIN
      DO IBIN=1,G%TBAXIS(X1AXIS)%N_BINS
         G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_LOW  = MIN_MESHGEOM + REAL(IBIN-1,EB)*DELBIN
         G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_HIGH = MIN_MESHGEOM + REAL(IBIN  ,EB)*DELBIN
         G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%NTL = 0
         ALLOCATE(G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST(DELTA_TBIN2))
      ENDDO

      ! Finally, populate TRI_LIST for X1AXIS bins:
      DO IWSEL = 0,G%N_FACES-1
         WSELEM(NOD1:NOD3) = G%FACES(3*IWSEL+1:3*IWSEL+3)
         X1V(NOD1:NOD3) = G%VERTS(MAX_DIM*(WSELEM(NOD1:NOD3)-1)+X1AXIS)
         X1V_LO = MINVAL(X1V(NOD1:NOD3));
         X1V_HI = MAXVAL(X1V(NOD1:NOD3));
         ILO_BIN = MAX(1,CEILING((X1V_LO-GEOMEPS-MIN_MESHGEOM)/DELBIN))
         IHI_BIN = MIN(G%TBAXIS(X1AXIS)%N_BINS,CEILING((X1V_HI+GEOMEPS-MIN_MESHGEOM)/DELBIN))
         DO IBIN=ILO_BIN,IHI_BIN
            NTL = G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%NTL + 1
            SZE = SIZE(G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST,DIM=1)
            IF (NTL > SZE) THEN
               ! Reallocate:
               ALLOCATE(TRI_LIST(1:SZE+DELTA_TBIN2));
               TRI_LIST(1:SZE)=G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST(1:SZE)
               CALL MOVE_ALLOC(FROM=TRI_LIST,TO=G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST)
            ENDIF
            ! Add Triangle index to BINs TRI_LIST
            G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%NTL = NTL
            G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST(NTL) = IWSEL+1

         ENDDO
      ENDDO
   END DO

   ! WRITE(LU_ERR,*) 'GEOMETRY=',IG,'NBINS=',G%TBAXIS(IAXIS)%N_BINS,G%TBAXIS(JAXIS)%N_BINS,G%TBAXIS(KAXIS)%N_BINS
   ! DO X1AXIS=IAXIS,KAXIS
   !    DO IBIN=1,G%TBAXIS(X1AXIS)%N_BINS
   !       WRITE(LU_ERR,*) X1AXIS,'IBIN, NTL=',IBIN,G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%NTL, &
   !       G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_LOW,G%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_HIGH
   !    END DO
   ! END DO

ENDDO LOOP_GEOM

RETURN
END SUBROUTINE GET_GEOM_TRIBIN


END SUBROUTINE SET_CUTCELLS_3D

! --------------------- BLOCK_IBM_SOLID_EXTWALLCELLS -----------------------------

SUBROUTINE BLOCK_IBM_SOLID_EXTWALLCELLS(FIRST_CALL)

LOGICAL, INTENT(IN) :: FIRST_CALL

! Local variables:
INTEGER :: NM,IW,IIF,JJF,KKF,II,JJ,KK,IOR,X1AXIS
TYPE (WALL_TYPE), POINTER :: WC

MESH_LOOP : DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
   CALL POINT_TO_MESH(NM)
   EXTERNAL_WALL_LOOP : DO IW=1,N_EXTERNAL_WALL_CELLS
      WC=>WALL(IW)
      IF (FIRST_CALL) THEN
      IF(.NOT.(WC%BOUNDARY_TYPE==INTERPOLATED_BOUNDARY)) CYCLE EXTERNAL_WALL_LOOP
      ELSE
      IF(.NOT.(WC%BOUNDARY_TYPE==OPEN_BOUNDARY .OR. WC%BOUNDARY_TYPE==SOLID_BOUNDARY)) CYCLE EXTERNAL_WALL_LOOP ! Here we might need
                                                                                                  !to add other EXT wall cell types.
      ENDIF
      II     = WC%ONE_D%II
      JJ     = WC%ONE_D%JJ
      KK     = WC%ONE_D%KK
      IOR    = WC%ONE_D%IOR
      X1AXIS = ABS(IOR)
      ! Define underlying Cartesian faces indexes:
      SELECT CASE(IOR)
      CASE( IAXIS) ! Lower X boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-IAXIS) ! Higher X boundary for Mesh NM.
         IIF = II - 1; JJF = JJ    ; KKF = KK
      CASE( JAXIS) ! Lower Y boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-JAXIS) ! Higher Y boundary for Mesh NM.
         IIF = II    ; JJF = JJ - 1; KKF = KK
      CASE( KAXIS) ! Lower Z boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK
      CASE(-KAXIS) ! Higher Z boundary for Mesh NM.
         IIF = II    ; JJF = JJ    ; KKF = KK - 1
      END SELECT
      ! Change BOUNDARY_TYPE to null:
      IF (FIRST_CALL) THEN
      IF(FCVAR(IIF,JJF,KKF,IBM_FGSC,X1AXIS) == IBM_SOLID) WC%BOUNDARY_TYPE = SOLID_BOUNDARY
      ELSE
      IF(FCVAR(IIF,JJF,KKF,IBM_FGSC,X1AXIS) == IBM_SOLID) WC%BOUNDARY_TYPE = NULL_BOUNDARY
      ENDIF
   ENDDO EXTERNAL_WALL_LOOP
ENDDO MESH_LOOP

RETURN
END SUBROUTINE BLOCK_IBM_SOLID_EXTWALLCELLS


! ----------------------- INIT_CFACE_CELL -----------------------------

SUBROUTINE INIT_CFACE_CELL(NM,ICF,IFACE,CFACE_INDEX,SURF_INDEX,STAGE_FLG)

USE GEOMETRY_FUNCTIONS, ONLY : SEARCH_OTHER_MESHES
USE MEMORY_FUNCTIONS, ONLY: ALLOCATE_STORAGE

! Routine that initializes new CFACE with index CFACE_INDEX.
! Geometry information for CFACE is loaded from MESHES(NM)%CUT_FACE(ICF)%AREA(IFACE), etc.
! Assumes POINT_TO_MESH has been called.

INTEGER, INTENT(IN) :: NM,ICF,IFACE,CFACE_INDEX,SURF_INDEX,STAGE_FLG


! Local Variables:
INTEGER :: IBOD, IWSEL, ICC, JCC

INTEGER :: IG, TRI, WSELEM(NOD1:NOD3), NOM, IIO, JJO, KKO, IIV(3), JJV(3), KKV(3), ICF2, JCF2, JCF22, ICF3, JCF3, &
           II, JJ, KK, III, JJJ, KKK, ICFACE, ICFF
REAL(EB):: XP(IAXIS:KAXIS),RDIR(IAXIS:KAXIS),V1(IAXIS:KAXIS),V2(IAXIS:KAXIS),V3(IAXIS:KAXIS),POS(IAXIS:KAXIS),DIST,DIST2
LOGICAL :: IS_INTERSECT=.FALSE., BACK_CFACE_FOUND=.FALSE.


STAGE_FLG_BRANCH : SELECT CASE(STAGE_FLG)
CASE(INTEGER_ONE) ! Geometry information for CFACE.

   CALL ALLOCATE_STORAGE(NM,SURF_INDEX,CFACE_INDEX=CFACE_INDEX)

   MESHES(NM)%CFACE(CFACE_INDEX)%X = CUT_FACE(ICF)%XYZCEN(IAXIS,IFACE)
   MESHES(NM)%CFACE(CFACE_INDEX)%Y = CUT_FACE(ICF)%XYZCEN(JAXIS,IFACE)
   MESHES(NM)%CFACE(CFACE_INDEX)%Z = CUT_FACE(ICF)%XYZCEN(KAXIS,IFACE)
   MESHES(NM)%CFACE(CFACE_INDEX)%AREA= CUT_FACE(ICF)%AREA(IFACE)
   MESHES(NM)%CFACE(CFACE_INDEX)%VEL_ERR_NEW=CUT_FACE(ICF)%VEL(IFACE) - 0._EB ! Assumes zero veloc of solid.

   ! Check if fire spreads radially over this surface type
   IF (SURFACE(SURF_INDEX)%FIRE_SPREAD_RATE>0._EB) THEN
      MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%T_IGN = T_BEGIN + &
         SQRT((MESHES(NM)%CFACE(CFACE_INDEX)%X-SURFACE(SURF_INDEX)%XYZ(1))**2 + &
              (MESHES(NM)%CFACE(CFACE_INDEX)%Y-SURFACE(SURF_INDEX)%XYZ(2))**2 + &
              (MESHES(NM)%CFACE(CFACE_INDEX)%Z-SURFACE(SURF_INDEX)%XYZ(3))**2)/SURFACE(SURF_INDEX)%FIRE_SPREAD_RATE
   ENDIF

   ! Normal to cut-face:
   IBOD =CUT_FACE(ICF)%BODTRI(1,IFACE)
   IWSEL=CUT_FACE(ICF)%BODTRI(2,IFACE)
   MESHES(NM)%CFACE(CFACE_INDEX)%NVEC(IAXIS:KAXIS) = GEOMETRY(IBOD)%FACES_NORMAL(IAXIS:KAXIS,IWSEL)

   ! Now populate cut-face information:
   MESHES(NM)%CFACE(CFACE_INDEX)%CUT_FACE_IND1 = ICF
   MESHES(NM)%CFACE(CFACE_INDEX)%CUT_FACE_IND2 = IFACE

   ! Boundary CFACES processed are defined of type SOLID_BOUNDARY
   MESHES(NM)%CFACE(CFACE_INDEX)%BOUNDARY_TYPE = SOLID_BOUNDARY

   ! Might need to rethink this, but for the time being...
   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%II = CUT_FACE(ICF)%IJK(IAXIS)
   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%JJ = CUT_FACE(ICF)%IJK(JAXIS)
   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%KK = CUT_FACE(ICF)%IJK(KAXIS)

   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%IIG = CUT_FACE(ICF)%IJK(IAXIS)
   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%JJG = CUT_FACE(ICF)%IJK(JAXIS)
   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%KKG = CUT_FACE(ICF)%IJK(KAXIS)
   ! ......................................................

   MESHES(NM)%CFACE(CFACE_INDEX)%ONE_D%AREA = CUT_FACE(ICF)%AREA(IFACE) ! Init to CFACE AREA.

CASE(INTEGER_TWO) ! Assign AREA_ADJUST for CFACE, BCs information for CFACE.

   ! First: Assign AREA_ADJUST for CFACEs.
   ! ...
   ! To DO.


CASE(INTEGER_THREE)

   ! Associated cut-cell location in CUT_CELL array.
   ! This CFACE initialization assumes TMP,RHO,ZZ have been initialized in cut-cell ICC,JCC.
   ICC = CUT_FACE(ICF)%CELL_LIST(2,LOW_IND,IFACE)
   JCC = CUT_FACE(ICF)%CELL_LIST(3,LOW_IND,IFACE)

   ! Here add VOLUME_FLOW case.. etc.
   ! ...
   ! To DO.

   ! Set TMP_F to Surface value and rest to ambient in underlying cartesian cell.
   CFACE(CFACE_INDEX)%ONE_D%TMP_G = TMP_0(CUT_FACE(ICF)%IJK(KAXIS))
   IF (SURFACE(SURF_INDEX)%TMP_FRONT > 0._EB) THEN
      CFACE(CFACE_INDEX)%ONE_D%TMP_F = SURFACE(SURF_INDEX)%TMP_FRONT
   ELSE
      CFACE(CFACE_INDEX)%ONE_D%TMP_F = CFACE(CFACE_INDEX)%ONE_D%TMP_G
   ENDIF
   CFACE(CFACE_INDEX)%ONE_D%RHO_F = CUT_CELL(ICC)%RHO(JCC)
   CFACE(CFACE_INDEX)%ONE_D%RHO_G = CUT_CELL(ICC)%RHO(JCC)
   CFACE(CFACE_INDEX)%ONE_D%ZZ_F(1:N_TOTAL_SCALARS)  = CUT_CELL(ICC)%ZZ(1:N_TOTAL_SCALARS,JCC)

   ! Assign normal velocity to CFACE from SURF input:
   CFACE(CFACE_INDEX)%ONE_D%U_NORMAL_0 = SURFACE(SURF_INDEX)%VEL
   ! Vegetation T_IGN setup:
   CFACE(CFACE_INDEX)%ONE_D%T_IGN      = SURFACE(SURF_INDEX)%T_IGN

   ! Case of exposed Backing we need to find CFACE_INDEX of BACK CFACE.
   IF (SURFACE(SURF_INDEX)%BACKING==EXPOSED .AND. SURFACE(SURF_INDEX)%THERMAL_BC_INDEX==THERMALLY_THICK) THEN
      IG  = CUT_FACE(ICF)%BODTRI(1,IFACE)
      TRI = CUT_FACE(ICF)%BODTRI(2,IFACE)
      XP(IAXIS:KAXIS)  = (/ CFACE(CFACE_INDEX)%X, CFACE(CFACE_INDEX)%Y, CFACE(CFACE_INDEX)%Z /)
      RDIR(IAXIS:KAXIS)= - GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,TRI) ! Normal into the body.
      TRI_LOOP : DO IWSEL=1,GEOMETRY(IG)%N_FACES
         IF (IWSEL==TRI) CYCLE
         WSELEM(NOD1:NOD3) = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)
         ! Triangles NODES coordinates:
         V1(IAXIS:KAXIS)  = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD1)-1)+1:MAX_DIM*WSELEM(NOD1))
         V2(IAXIS:KAXIS)  = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD2)-1)+1:MAX_DIM*WSELEM(NOD2))
         V3(IAXIS:KAXIS)  = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD3)-1)+1:MAX_DIM*WSELEM(NOD3))

         ! Fast triangle discard method: To do.

         ! Search for intersection point:
         CALL RAY_TRIANGLE_INTERSECT_PT(V1,V2,V3,XP,RDIR,IS_INTERSECT,POS)

         IF (IS_INTERSECT) EXIT TRI_LOOP

      ENDDO TRI_LOOP

      IF (IS_INTERSECT) THEN

         ! WRITE(LU_ERR,*) CFACE_INDEX,', intersect=',XP(:),RDIR(:),POS(IAXIS:KAXIS)

         ! We Found an intersection with IWSEL in position POS(IAXIS:KAXIS):
         ! Find indexes and mesh of cell containing intersection point:
         CALL SEARCH_OTHER_MESHES(POS(IAXIS),POS(JAXIS),POS(KAXIS),NOM,IIO,JJO,KKO)

         ! This test and restriction of NOM==NM is temporary. Discard when parallel CFACE info is in place.
         IF (NOM/=NM) THEN
            IF(NOM==0) RETURN
            WRITE(LU_ERR,*) 'WARNING: BACK CFACE search, other mesh NOM not equal to working mesh NM. NM=',NM,&
                            ', NOM and other cell IIO,JJO,KKO=',NOM,IIO,JJO,KKO,', intersection pt=',POS(IAXIS:KAXIS)
            RETURN
         ENDIF

         IF (NOM>0) THEN
            IF (ALLOCATED(MESHES(NOM)%CCVAR)) THEN
               IIV(1:3) = (/ IIO, MAX(IIO-1,1), MIN(IIO+1,MESHES(NOM)%IBAR) /)
               JJV(1:3) = (/ JJO, MAX(JJO-1,1), MIN(JJO+1,MESHES(NOM)%JBAR) /)
               KKV(1:3) = (/ KKO, MAX(KKO-1,1), MIN(KKO+1,MESHES(NOM)%KBAR) /)

               DIST= 1._EB/TWO_EPSILON_EB; ICFF=0; JCF2=0
               K_LOOP : DO KKK=1,3
                  KK=KKV(KKK)
                  DO JJJ=1,3
                     JJ=JJV(JJJ)
                     DO III=1,3
                        II=IIV(III)
                        ICF2 = MESHES(NOM)%CCVAR(II,JJ,KK,IBM_IDCF)
                        ICF2_COND : IF (ICF2>0) THEN

                           ! Use cut-face with closest centroid to POS:
                           DO JCF22=1,MESHES(NOM)%CUT_FACE(ICF2)%NFACE
                              IF(ICF==ICF2 .AND. IFACE==JCF22) CYCLE
                              DIST2 = (POS(IAXIS) - MESHES(NOM)%CUT_FACE(ICF2)%XYZCEN(IAXIS,JCF22))**2._EB + &
                                      (POS(JAXIS) - MESHES(NOM)%CUT_FACE(ICF2)%XYZCEN(JAXIS,JCF22))**2._EB + &
                                      (POS(KAXIS) - MESHES(NOM)%CUT_FACE(ICF2)%XYZCEN(KAXIS,JCF22))**2._EB
                              IF (DIST2<DIST) THEN
                                 DIST = DIST2
                                 ICFF = ICF2
                                 JCF2 = JCF22
                                 BACK_CFACE_FOUND = .TRUE.
                              ENDIF
                           ENDDO
                        ENDIF ICF2_COND
                     ENDDO
                  ENDDO
               ENDDO K_LOOP

               ! Loop NOM CUT_FACE array to find BACKING CFACE index:
               IF(BACK_CFACE_FOUND) THEN
                  ICFACE=0;
                  ICF3_LOOP : DO ICF3=1,MESHES(NOM)%N_CUTFACE_MESH
                     IF(MESHES(NOM)%CUT_FACE(ICF3)%STATUS/=IBM_INBOUNDARY) CYCLE ICF3_LOOP
                     DO JCF3=1,MESHES(NOM)%CUT_FACE(ICF3)%NFACE
                        ICFACE=ICFACE+1
                        IF(ICFF==ICF3 .AND. JCF2==JCF3) EXIT ICF3_LOOP
                     ENDDO
                  ENDDO ICF3_LOOP

                  ! Define BACK_MESH, BACK_INDEX:
                  CFACE(CFACE_INDEX)%BACK_MESH  = NOM
                  CFACE(CFACE_INDEX)%BACK_INDEX = ICFACE
                  !WRITE(LU_ERR,*) CFACE_INDEX,'BACK_MESH, BACK_INDEX=', &
                  !CFACE(CFACE_INDEX)%BACK_MESH,CFACE(CFACE_INDEX)%BACK_INDEX

                  ! Write error for testing:
               ELSE
                  WRITE(LU_ERR,*) 'WARNING: BACK CFACE search, MESH, CFACE_INDEX=',NM,CFACE_INDEX,&
                  ', back CFACE not found in mesh NOM,IIO,JJO,KKO=',NOM,IIO,JJO,KKO
                  RETURN
               ENDIF
            ELSE ! Intersection in mesh furher away than neighboring meshes.
               ! To Do stop.

            ENDIF

         ELSE ! Intersection outside of domain.
            ! To Do stop.

         ENDIF

      ELSE ! Did not find intersection with other triangles.
         ! To Do : Here we can add a test to check if CFACE is indeed within geometry IG. Geometry intersection and
         ! linearization lead need to CFACES lay outside of the geometry.
         WRITE(LU_ERR,*) 'WARNING: BACK CFACE search did NOT Find Intersection. MESH=',NM,', GEOM=',IG,&
                         ', CFACE_INDEX, Centroid location=',CFACE_INDEX,XP(:)
         RETURN
      ENDIF

   ENDIF

END SELECT STAGE_FLG_BRANCH

RETURN
END SUBROUTINE INIT_CFACE_CELL


! --------------------- GET_REGULAR_CUTCELL_EDGES_BC --------------------------------

SUBROUTINE GET_REGULAR_CUTCELL_EDGES_BC(NM)

! This routine adds to FDS edge arrays OME_E, TAU_E, IJKE, EDGE_INTERPOLATION_FACTOR
! the sum of regular edges that are boundary at least a neighboring IBM_CUTCFE face and
! one IBM_GASPHASE face. All neighboring IBM_GASPHASE cells are added to CELL_COUNT_CC(NM).

INTEGER, INTENT(IN) :: NM

! Local variables:
INTEGER :: ECOUNT, IBM_ECOUNT, CCOUNT, I, J, K, N_CC, N_RG, IE, IADD, JADD, KADD
LOGICAL, ALLOCATABLE, DIMENSION(:,:,:) :: CELL_ADDED
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: TAU_E_AUX,OME_E_AUX,EDGE_INT_AUX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: IJKE_AUX,EDGE_INDEX_AUX,WALL_INDEX_AUX,WALL_INDEX_HT3D_AUX
LOGICAL, ALLOCATABLE, DIMENSION(:) :: SOLID_AUX, EXTERIOR_AUX
INTEGER, ALLOCATABLE, DIMENSION(:) :: I_CELL_AUX,J_CELL_AUX,K_CELL_AUX,OBST_INDEX_C_AUX
INTEGER :: ICMM,ICPM,ICPP,ICMP
INTEGER :: IDUM,IOR,IW1,IW2
INTEGER, PARAMETER :: IAXIS_WALL_INDS(1:4) = (/ -3, -2, 2, 3 /)
INTEGER, PARAMETER :: JAXIS_WALL_INDS(1:4) = (/ -3, -1, 1, 3 /)
INTEGER, PARAMETER :: KAXIS_WALL_INDS(1:4) = (/ -2, -1, 1, 2 /)

! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
CHARACTER(100) :: MSEGS_FILE

IF (DEBUG_SET_CUTCELLS) THEN
   ! Write out:
   WRITE(MSEGS_FILE,'(A,A,I4.4,A)') TRIM(CHID),'_rcsegs_mesh_',NM,'.dat'
   OPEN(333,FILE=TRIM(MSEGS_FILE),STATUS='UNKNOWN')
   CLOSE(333)
ENDIF

CALL POINT_TO_MESH(NM)

! Return if nothing to do for the mesh:
IF(MESHES(NM)%N_CUTCELL_MESH+MESHES(NM)%N_GCCUTCELL_MESH == 0) RETURN

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating     REGULAR_CUTCELL_EDGES_BC for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating     REGULAR_CUTCELL_EDGES_BC for mesh :',NM,' ..'
ENDIF

MESHES(NM)%ECVAR(:,:,:,IBM_IDCE,:) = IBM_UNDEFINED
ALLOCATE(CELL_ADDED(0:IBP1,0:JBP1,0:KBP1)); CELL_ADDED = .FALSE.

! Now count added edge number for mesh N_EDGES_DIM_CC(2,NM), and added non zero cell indexes for mesh
! CELL_COUNT_CC(NM).
ECOUNT = 0; IBM_ECOUNT=0
CCOUNT = 0;

! X axis edges:
DO K=0,KBAR
   DO J=0,JBAR
      IX_LOOP_1 : DO I=1,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,IAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO JADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(4,CELL_INDEX(I,J,K)) ! EDGE in Xaxis in upper Y,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO KADD=0,1
                  DO JADD=0,1
                  IF(CELL_INDEX(I     ,J+JADD,K+KADD)==0 .AND. .NOT.CELL_ADDED(I     ,J+JADD,K+KADD)) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I     ,J+JADD,K+KADD) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=IAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-2)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IX_LOOP_1
   ENDDO
ENDDO

! Y axis edges:
DO K=0,KBAR
   DO J=1,JBAR
      IY_LOOP_1 : DO I=0,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,JAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(8,CELL_INDEX(I,J,K)) ! EDGE in Yaxis in upper X,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO KADD=0,1
                  DO IADD=0,1
                  IF(CELL_INDEX(I+IADD,J     ,K+KADD)==0 .AND. .NOT.CELL_ADDED(I+IADD,J     ,K+KADD)) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I+IADD,J     ,K+KADD) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=JAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-1)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IY_LOOP_1
   ENDDO
ENDDO

! Z axis edges:
DO K=1,KBAR
   DO J=0,JBAR
      IZ_LOOP_1 : DO I=0,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,KAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO JADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(12,CELL_INDEX(I,J,K)) ! EDGE in Zaxis in upper X,Y boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO JADD=0,1
                  DO IADD=0,1
                  IF(CELL_INDEX(I+IADD,J+JADD,K     )==0 .AND. .NOT.CELL_ADDED(I+IADD,J+JADD,K     )) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I+IADD,J+JADD,K     ) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=KAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-1)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-2)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IZ_LOOP_1
   ENDDO
ENDDO

IF (IBM_ECOUNT==0) THEN
   DEALLOCATE(CELL_ADDED)
   RETURN
ENDIF

! Allocate IBM_RCEDGE:
MESHES(NM)%IBM_NRCEDGE = IBM_ECOUNT
ALLOCATE(MESHES(NM)%IBM_RCEDGE(1:IBM_ECOUNT))

! Reallocate edge variables OME_E, TAU_E, IJKE, EDGE_INTERPOLATION_FACTOR:
IF (ECOUNT > 0) THEN
   ! N_EDGES_DIM_CC(1:2,NM)
   N_EDGES_DIM_CC(1,NM) = SIZE(MESHES(NM)%IJKE, DIM=2)
   N_EDGES_DIM_CC(2,NM) = ECOUNT

   ! OME_E, TAU_E:
   ALLOCATE(OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)),TAU_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)))
   OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)) = MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(MESHES(NM)%OME_E); ALLOCATE(MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%OME_E = -1.E6_EB
   MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM)) = OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM))

   TAU_E_AUX(:,:) = MESHES(NM)%TAU_E(:,:)
   DEALLOCATE(MESHES(NM)%TAU_E); ALLOCATE(MESHES(NM)%TAU_E(-2:2,0:N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%TAU_E = -1.E6_EB
   MESHES(NM)%TAU_E(-2:2,0:N_EDGES_DIM_CC(1,NM)) = TAU_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(OME_E_AUX, TAU_E_AUX)

   ! IJKE, EDGE_INTERPOLATION_FACTOR:
   ALLOCATE(IJKE_AUX(16,N_EDGES_DIM_CC(1,NM))); IJKE_AUX(:,:) = MESHES(NM)%IJKE(:,:)
   DEALLOCATE(MESHES(NM)%IJKE); ALLOCATE(MESHES(NM)%IJKE(16,N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%IJKE = 0; MESHES(NM)%IJKE(1:16,1:N_EDGES_DIM_CC(1,NM)) = IJKE_AUX(1:16,1:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(IJKE_AUX)

   ALLOCATE(EDGE_INT_AUX(N_EDGES_DIM_CC(1,NM),2));
   EDGE_INT_AUX(:,:) = MESHES(NM)%EDGE_INTERPOLATION_FACTOR(:,:)
   DEALLOCATE(MESHES(NM)%EDGE_INTERPOLATION_FACTOR);
   ALLOCATE(MESHES(NM)%EDGE_INTERPOLATION_FACTOR(N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM),2))
   MESHES(NM)%EDGE_INTERPOLATION_FACTOR = 1._EB
   MESHES(NM)%EDGE_INTERPOLATION_FACTOR(1:N_EDGES_DIM_CC(1,NM),1:2) = EDGE_INT_AUX(1:N_EDGES_DIM_CC(1,NM),1:2)
   DEALLOCATE(EDGE_INT_AUX)
ENDIF

! Reallocate cell indexing vars SOLID, OBST_INDEX_C, WALL_INDEX, WALL_INDEX_HT3D, EDGE_INDEX, EXTERIOR,
! I_CELL, J_CELL, K_CELL:
IF (CCOUNT > 0) THEN
   ! CELL_COUNT_CC(NM): Cells to be added to arrays related to Geometries.
   CELL_COUNT_CC(NM) = CCOUNT

   ! SOLID:
   ALLOCATE(SOLID_AUX(0:CELL_COUNT(NM))); SOLID_AUX(:)=MESHES(NM)%SOLID(:)
   DEALLOCATE(MESHES(NM)%SOLID); ALLOCATE(MESHES(NM)%SOLID(0:CELL_COUNT(NM)+CELL_COUNT_CC(NM)));
   MESHES(NM)%SOLID = .FALSE.; MESHES(NM)%SOLID(0:CELL_COUNT(NM))=SOLID_AUX(0:CELL_COUNT(NM))
   DEALLOCATE(SOLID_AUX)

   ! WALL_INDEX, WALL_INDEX_HT3D, EDGE_INDEX, UVW_GHOST:
   ALLOCATE(WALL_INDEX_AUX(0:CELL_COUNT(NM),-3:3)); WALL_INDEX_AUX(:,:) = MESHES(NM)%WALL_INDEX(:,:)
   ALLOCATE(WALL_INDEX_HT3D_AUX(0:CELL_COUNT(NM),-3:3)); WALL_INDEX_HT3D_AUX(:,:) = MESHES(NM)%WALL_INDEX_HT3D(:,:)
   ALLOCATE(EDGE_INDEX_AUX(1:12,0:CELL_COUNT(NM))); EDGE_INDEX_AUX(:,:) = MESHES(NM)%EDGE_INDEX(:,:)
   DEALLOCATE(MESHES(NM)%WALL_INDEX, MESHES(NM)%WALL_INDEX_HT3D, MESHES(NM)%EDGE_INDEX)
   ALLOCATE(MESHES(NM)%WALL_INDEX(0:CELL_COUNT(NM)+CELL_COUNT_CC(NM),-3:3)); MESHES(NM)%WALL_INDEX = 0
   ALLOCATE(MESHES(NM)%WALL_INDEX_HT3D(0:CELL_COUNT(NM)+CELL_COUNT_CC(NM),-3:3)); MESHES(NM)%WALL_INDEX_HT3D = 0
   ALLOCATE(MESHES(NM)%EDGE_INDEX(1:12,0:CELL_COUNT(NM)+CELL_COUNT_CC(NM))); MESHES(NM)%EDGE_INDEX = 0
   MESHES(NM)%WALL_INDEX(0:CELL_COUNT(NM),-3:3) = WALL_INDEX_AUX(0:CELL_COUNT(NM),-3:3)
   MESHES(NM)%WALL_INDEX_HT3D(0:CELL_COUNT(NM),-3:3) = WALL_INDEX_HT3D_AUX(0:CELL_COUNT(NM),-3:3)
   MESHES(NM)%EDGE_INDEX(1:12,0:CELL_COUNT(NM)) = EDGE_INDEX_AUX(1:12,0:CELL_COUNT(NM))
   DEALLOCATE(WALL_INDEX_AUX, WALL_INDEX_HT3D_AUX, EDGE_INDEX_AUX)

   ALLOCATE(EXTERIOR_AUX(0:CELL_COUNT(NM))); EXTERIOR_AUX(:)=MESHES(NM)%EXTERIOR(:)
   DEALLOCATE(MESHES(NM)%EXTERIOR); ALLOCATE(MESHES(NM)%EXTERIOR(0:CELL_COUNT(NM)+CELL_COUNT_CC(NM)))
   MESHES(NM)%EXTERIOR = .FALSE.; MESHES(NM)%EXTERIOR(0:CELL_COUNT(NM))=EXTERIOR_AUX(0:CELL_COUNT(NM))
   DEALLOCATE(EXTERIOR_AUX)

   ! I_CELL, J_CELL, K_CELL, OBST_INDEX_C:
   ALLOCATE(I_CELL_AUX(CELL_COUNT(NM)),J_CELL_AUX(CELL_COUNT(NM)),K_CELL_AUX(CELL_COUNT(NM)))
   I_CELL_AUX(:) = MESHES(NM)%I_CELL(:); J_CELL_AUX(:) = MESHES(NM)%J_CELL(:); K_CELL_AUX(:) = MESHES(NM)%K_CELL(:)
   ALLOCATE(OBST_INDEX_C_AUX(0:CELL_COUNT(NM))); OBST_INDEX_C_AUX(:) = MESHES(NM)%OBST_INDEX_C(:)
   DEALLOCATE(MESHES(NM)%I_CELL,MESHES(NM)%J_CELL,MESHES(NM)%K_CELL,MESHES(NM)%OBST_INDEX_C)
   ALLOCATE(MESHES(NM)%I_CELL(CELL_COUNT(NM)+CELL_COUNT_CC(NM))); MESHES(NM)%I_CELL = -1
   ALLOCATE(MESHES(NM)%J_CELL(CELL_COUNT(NM)+CELL_COUNT_CC(NM))); MESHES(NM)%J_CELL = -1
   ALLOCATE(MESHES(NM)%K_CELL(CELL_COUNT(NM)+CELL_COUNT_CC(NM))); MESHES(NM)%K_CELL = -1
   ALLOCATE(MESHES(NM)%OBST_INDEX_C(0:CELL_COUNT(NM)+CELL_COUNT_CC(NM))); MESHES(NM)%OBST_INDEX_C = 0
   MESHES(NM)%I_CELL(1:CELL_COUNT(NM)) = I_CELL_AUX(1:CELL_COUNT(NM))
   MESHES(NM)%J_CELL(1:CELL_COUNT(NM)) = J_CELL_AUX(1:CELL_COUNT(NM))
   MESHES(NM)%K_CELL(1:CELL_COUNT(NM)) = K_CELL_AUX(1:CELL_COUNT(NM))
   MESHES(NM)%OBST_INDEX_C(0:CELL_COUNT(NM)) = OBST_INDEX_C_AUX(0:CELL_COUNT(NM))
   DEALLOCATE(I_CELL_AUX,J_CELL_AUX,K_CELL_AUX,OBST_INDEX_C_AUX)

ENDIF


! Finally repeat search process and assign edge and cell values to cut-cell region entities:
ECOUNT = N_EDGES_DIM_CC(1,NM); IBM_ECOUNT=0
CCOUNT = CELL_COUNT(NM);

! X axis edges:
DO K=0,KBAR
   DO J=0,JBAR
      IX_LOOP_2 : DO I=1,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,IAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO JADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(4,CELL_INDEX(I,J,K)) ! EDGE in Xaxis in upper Y,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO KADD=0,1
                  DO JADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I     ,J+JADD,K+KADD)==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I     ,J+JADD,K+KADD) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I
                        MESHES(NM)%J_CELL(CCOUNT)=J+JADD
                        MESHES(NM)%K_CELL(CCOUNT)=K+KADD
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICPM = MESHES(NM)%CELL_INDEX(I  ,J+1,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I  ,J+1,K+1)
               ICMP = MESHES(NM)%CELL_INDEX(I  ,J  ,K+1)
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, IAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX(1,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(2,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(3,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(4,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=IAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-2)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_RCEDGE:
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IE = IE

            ! Note RCEDGE number in ECVAR:
            MESHES(NM)%ECVAR(I,J,K,IBM_IDCE,IAXIS) = IBM_ECOUNT

         ENDIF
      ENDDO IX_LOOP_2
   ENDDO
ENDDO

! Y axis edges:
DO K=0,KBAR
   DO J=1,JBAR
      IY_LOOP_2 : DO I=0,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,JAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(8,CELL_INDEX(I,J,K)) ! EDGE in Yaxis in upper X,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO KADD=0,1
                  DO IADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I+IADD,J     ,K+KADD)==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I+IADD,J     ,K+KADD) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I+IADD
                        MESHES(NM)%J_CELL(CCOUNT)=J
                        MESHES(NM)%K_CELL(CCOUNT)=K+KADD
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICMP = MESHES(NM)%CELL_INDEX(I+1,J  ,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I+1,J  ,K+1)
               ICPM = MESHES(NM)%CELL_INDEX(I  ,J  ,K+1)
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, JAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX(5,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(6,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(7,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(8,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=JAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-1)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_RCEDGE:
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IE = IE

            ! Note RCEDGE number in ECVAR:
            MESHES(NM)%ECVAR(I,J,K,IBM_IDCE,JAXIS) = IBM_ECOUNT

         ENDIF
      ENDDO IY_LOOP_2
   ENDDO
ENDDO

! Z axis edges:
DO K=1,KBAR
   DO J=0,JBAR
      IZ_LOOP_2 : DO I=0,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,KAXIS) /= IBM_GASPHASE) CYCLE
         N_CC = 0; N_RG = 0
         DO JADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==IBM_GASPHASE) N_RG=N_RG+1
         ENDDO
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and one regular face.
            IE = MESHES(NM)%EDGE_INDEX(12,CELL_INDEX(I,J,K)) ! EDGE in Zaxis in upper X,Y boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO JADD=0,1
                  DO IADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I+IADD,J+JADD,K     )==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I+IADD,J+JADD,K     ) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I+IADD
                        MESHES(NM)%J_CELL(CCOUNT)=J+JADD
                        MESHES(NM)%K_CELL(CCOUNT)=K
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICPM = MESHES(NM)%CELL_INDEX(I+1,J  ,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I+1,J+1,K  )
               ICMP = MESHES(NM)%CELL_INDEX(I  ,J+1,K  )
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, KAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX( 9,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(10,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(11,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(12,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=KAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-1)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-2)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_RCEDGE:
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_RCEDGE(IBM_ECOUNT)%IE = IE

            ! Note RCEDGE number in ECVAR:
            MESHES(NM)%ECVAR(I,J,K,IBM_IDCE,KAXIS) = IBM_ECOUNT

         ENDIF
      ENDDO IZ_LOOP_2
   ENDDO
ENDDO

DEALLOCATE(CELL_ADDED)

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   WRITE(LU_SETCC,'(A,F8.3,A,7I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Reg-CC edges for BC : ', &
   IBM_ECOUNT,MESHES(NM)%IBM_NRCEDGE,N_EDGES_DIM_CC(1:2,NM),CELL_COUNT(NM),CELL_COUNT_CC(NM),CCOUNT,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,7I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Reg-CC edges for BC : ', &
   IBM_ECOUNT,MESHES(NM)%IBM_NRCEDGE,N_EDGES_DIM_CC(1:2,NM),CELL_COUNT(NM),CELL_COUNT_CC(NM),CCOUNT,'. '
   ENDIF
   ! DO I=1,MESHES(NM)%IBM_NRCEDGE
   !    WRITE(LU_ERR,*) 'IE,I,J,K,IAXIS=',MESHES(NM)%IBM_RCEDGE(I)%IE,MESHES(NM)%IBM_RCEDGE(I)%IJK(IAXIS:KAXIS+1)
   ! ENDDO
ENDIF

IF (DEBUG_SET_CUTCELLS) THEN
   ! Write segment information for the mesh if it belongs to the process:
   ! Write out:
   WRITE(MSEGS_FILE,'(A,A,I4.4,A)') TRIM(CHID),'_rcsegs_mesh_',NM,'.dat'
   LU_DB_SETCC = GET_FILE_NUMBER()
   OPEN(LU_DB_SETCC,FILE=TRIM(MSEGS_FILE),STATUS='UNKNOWN')
   !WRITE(LU_ERR,*) TRIM(MSEGS_FILE),MESHES(NM)%IBM_NRCEDGE,IBM_ECOUNT
   DO ECOUNT=1,MESHES(NM)%IBM_NRCEDGE
      I=MESHES(NM)%IBM_RCEDGE(ECOUNT)%IJK(IAXIS)
      J=MESHES(NM)%IBM_RCEDGE(ECOUNT)%IJK(JAXIS)
      K=MESHES(NM)%IBM_RCEDGE(ECOUNT)%IJK(KAXIS)
      IE=MESHES(NM)%IBM_RCEDGE(ECOUNT)%IJK(KAXIS+1)
      SELECT CASE(IE)
      CASE(IAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DX(I),XC(I),Y(J),Z(K)
      CASE(JAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DY(J),X(I),YC(J),Z(K)
      CASE(KAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DZ(K),X(I),Y(J),ZC(K)
      END SELECT
   ENDDO
   CLOSE(LU_DB_SETCC)
ENDIF

RETURN
END SUBROUTINE GET_REGULAR_CUTCELL_EDGES_BC


! --------------------- GET_SOLID_CUTCELL_EDGES_BC --------------------------------

SUBROUTINE GET_SOLID_CUTCELL_EDGES_BC(NM)

! This routine adds to FDS edge arrays OME_E, TAU_E, IJKE, EDGE_INTERPOLATION_FACTOR
! the sum of regular edges that are boundary at least a neighboring IBM_CUTCFE face and
! one IBM_SOLID face. All neighboring IBM_CUTCFE cells are added to CELL_COUNT_CC(NM).

INTEGER, INTENT(IN) :: NM

! Local variables:
INTEGER :: ECOUNT, IBM_ECOUNT, CCOUNT, I, J, K, N_CC, N_RG, IE, IADD, JADD, KADD, CELL_COUNT_NM
LOGICAL, ALLOCATABLE, DIMENSION(:,:,:) :: CELL_ADDED
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: TAU_E_AUX,OME_E_AUX,EDGE_INT_AUX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: IJKE_AUX,EDGE_INDEX_AUX,WALL_INDEX_AUX,WALL_INDEX_HT3D_AUX
LOGICAL, ALLOCATABLE, DIMENSION(:) :: SOLID_AUX, EXTERIOR_AUX
INTEGER, ALLOCATABLE, DIMENSION(:) :: I_CELL_AUX,J_CELL_AUX,K_CELL_AUX,OBST_INDEX_C_AUX
INTEGER :: ICMM,ICPM,ICPP,ICMP
INTEGER :: IDUM,IOR,IW1,IW2
INTEGER, PARAMETER :: IAXIS_WALL_INDS(1:4) = (/ -3, -2, 2, 3 /)
INTEGER, PARAMETER :: JAXIS_WALL_INDS(1:4) = (/ -3, -1, 1, 3 /)
INTEGER, PARAMETER :: KAXIS_WALL_INDS(1:4) = (/ -2, -1, 1, 2 /)
INTEGER :: IN1,IN2,JN1,JN2,KN1,KN2
LOGICAL :: INI,INJ,INK,INMESH

! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
CHARACTER(100) :: MSEGS_FILE

IF (DEBUG_SET_CUTCELLS) THEN
   ! Write out:
   WRITE(MSEGS_FILE,'(A,A,I4.4,A)') TRIM(CHID),'_ibsegs_mesh_',NM,'.dat'
   LU_DB_SETCC = GET_FILE_NUMBER()
   OPEN(LU_DB_SETCC,FILE=TRIM(MSEGS_FILE),STATUS='UNKNOWN')
   CLOSE(LU_DB_SETCC)
ENDIF

CALL POINT_TO_MESH(NM)

! Return if nothing to do for the mesh:
IF(MESHES(NM)%N_CUTCELL_MESH+MESHES(NM)%N_GCCUTCELL_MESH == 0) RETURN

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating     SOLID_CUTCELL_EDGES_BC for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating     SOLID_CUTCELL_EDGES_BC for mesh :',NM,' ..'
ENDIF

ALLOCATE(CELL_ADDED(0:IBP1,0:JBP1,0:KBP1)); CELL_ADDED = .FALSE.

! Now count added edge number for mesh N_EDGES_DIM_CC(2,NM), and added non zero cell indexes for mesh
! CELL_COUNT_CC(NM).
ECOUNT = 0; IBM_ECOUNT=0
CCOUNT = 0;

! X axis edges:
DO K=0,KBAR
   INK = .FALSE.
   KN1 = K; KN2 = K+1
   IF (K==0) THEN;       KN1=K+1
   ELSEIF(K==KBAR) THEN; KN2=K
   ELSE
      INK = .TRUE.
   ENDIF
   DO J=0,JBAR
      INJ = .FALSE.
      JN1 = J; JN2 = J+1
      IF (J==0) THEN; JN1=J+1
      ELSEIF(J==JBAR) THEN; JN2=J
      ELSE
         INJ = .TRUE.
      ENDIF
      INMESH = INK .AND. INJ
      IX_LOOP_1 : DO I=1,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,IAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO JADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         ! This Test is to drop IBEDGES related to only IBM_SOLID cells in the mesh, no need to have them on this mesh:
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(I,JN1:JN2,KN1:KN2,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-face, and a solid face.
            IE = MESHES(NM)%EDGE_INDEX(4,CELL_INDEX(I,J,K)) ! EDGE in Xaxis in upper Y,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO KADD=0,1
                  DO JADD=0,1
                  IF(CELL_INDEX(I     ,J+JADD,K+KADD)==0 .AND. .NOT.CELL_ADDED(I     ,J+JADD,K+KADD)) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I     ,J+JADD,K+KADD) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=IAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-2)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IX_LOOP_1
   ENDDO
ENDDO

! Y axis edges:
DO K=0,KBAR
   INK = .FALSE.
   KN1 = K; KN2 = K+1
   IF (K==0) THEN;       KN1=K+1
   ELSEIF(K==KBAR) THEN; KN2=K
   ELSE
      INK = .TRUE.
   ENDIF
   DO J=1,JBAR
      IY_LOOP_1 : DO I=0,IBAR
         INI = .FALSE.
         IN1 = I; IN2 = I+1
         IF (I==0) THEN;       IN1=I+1
         ELSEIF(I==IBAR) THEN; IN2=I
         ELSE
            INI = .TRUE.
         ENDIF
         INMESH = INK .AND. INI
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,JAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         ! This Test is to drop IBEDGES related to only IBM_SOLID cells in the mesh, no need to have them on this mesh:
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(IN1:IN2,J,KN1:KN2,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-cell, and two regular cells.
            IE = MESHES(NM)%EDGE_INDEX(8,CELL_INDEX(I,J,K)) ! EDGE in Yaxis in upper X,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO KADD=0,1
                  DO IADD=0,1
                  IF(CELL_INDEX(I+IADD,J     ,K+KADD)==0 .AND. .NOT.CELL_ADDED(I+IADD,J     ,K+KADD)) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I+IADD,J     ,K+KADD) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=JAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-1)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IY_LOOP_1
   ENDDO
ENDDO

! Z axis edges:
DO K=1,KBAR
   DO J=0,JBAR
      INJ = .FALSE.
      JN1 = J; JN2 = J+1
      IF (J==0) THEN; JN1=J+1
      ELSEIF(J==JBAR) THEN; JN2=J
      ELSE
         INJ = .TRUE.
      ENDIF
      IZ_LOOP_1 : DO I=0,IBAR
         INI = .FALSE.
         IN1 = I; IN2 = I+1
         IF (I==0) THEN;       IN1=I+1
         ELSEIF(I==IBAR) THEN; IN2=I
         ELSE
            INI = .TRUE.
         ENDIF
         INMESH = INJ .AND. INI
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,KAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO JADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         ! This Test is to drop IBEDGES related to only IBM_SOLID cells in the mesh, no need to have them on this mesh:
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(IN1:IN2,JN1:JN2,K,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-cell, and two regular cells.
            IE = MESHES(NM)%EDGE_INDEX(12,CELL_INDEX(I,J,K)) ! EDGE in Zaxis in upper X,Y boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT:
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1
               ! See if we need to add to CCOUNT any neighboring cells:
               DO JADD=0,1
                  DO IADD=0,1
                  IF(CELL_INDEX(I+IADD,J+JADD,K     )==0 .AND. .NOT.CELL_ADDED(I+IADD,J+JADD,K     )) THEN
                     CCOUNT = CCOUNT + 1
                     CELL_ADDED(I+IADD,J+JADD,K     ) = .TRUE.
                  ENDIF
                  ENDDO
               ENDDO
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=KAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-1)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-2)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_1
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_1
                  ENDIF
               ENDDO
            ENDIF
            IBM_ECOUNT = IBM_ECOUNT + 1
         ENDIF
      ENDDO IZ_LOOP_1
   ENDDO
ENDDO

IF (IBM_ECOUNT==0) THEN
   DEALLOCATE(CELL_ADDED)
   RETURN
ENDIF

! Allocate IBM_IBEDGE:
MESHES(NM)%IBM_NIBEDGE = IBM_ECOUNT
ALLOCATE(MESHES(NM)%IBM_IBEDGE(1:IBM_ECOUNT))

! Reallocate edge variables OME_E, TAU_E, IJKE, EDGE_INTERPOLATION_FACTOR:
! N_EDGES_DIM_CC(1:2,NM)
N_EDGES_DIM_CC(1,NM) = SIZE(MESHES(NM)%IJKE, DIM=2)
N_EDGES_DIM_CC(2,NM) = ECOUNT
IF (ECOUNT > 0) THEN

   ! OME_E, TAU_E:
   ALLOCATE(OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)),TAU_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)))
   OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM)) = MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(MESHES(NM)%OME_E); ALLOCATE(MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%OME_E = -1.E6_EB
   MESHES(NM)%OME_E(-2:2,0:N_EDGES_DIM_CC(1,NM)) = OME_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM))

   TAU_E_AUX(:,:) = MESHES(NM)%TAU_E(:,:)
   DEALLOCATE(MESHES(NM)%TAU_E); ALLOCATE(MESHES(NM)%TAU_E(-2:2,0:N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%TAU_E = -1.E6_EB
   MESHES(NM)%TAU_E(-2:2,0:N_EDGES_DIM_CC(1,NM)) = TAU_E_AUX(-2:2,0:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(OME_E_AUX, TAU_E_AUX)

   ! IJKE, EDGE_INTERPOLATION_FACTOR:
   ALLOCATE(IJKE_AUX(16,N_EDGES_DIM_CC(1,NM))); IJKE_AUX(:,:) = MESHES(NM)%IJKE(:,:)
   DEALLOCATE(MESHES(NM)%IJKE); ALLOCATE(MESHES(NM)%IJKE(16,N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM)));
   MESHES(NM)%IJKE = 0; MESHES(NM)%IJKE(1:16,1:N_EDGES_DIM_CC(1,NM)) = IJKE_AUX(1:16,1:N_EDGES_DIM_CC(1,NM))
   DEALLOCATE(IJKE_AUX)

   ALLOCATE(EDGE_INT_AUX(N_EDGES_DIM_CC(1,NM),2));
   EDGE_INT_AUX(:,:) = MESHES(NM)%EDGE_INTERPOLATION_FACTOR(:,:)
   DEALLOCATE(MESHES(NM)%EDGE_INTERPOLATION_FACTOR);
   ALLOCATE(MESHES(NM)%EDGE_INTERPOLATION_FACTOR(N_EDGES_DIM_CC(1,NM)+N_EDGES_DIM_CC(2,NM),2))
   MESHES(NM)%EDGE_INTERPOLATION_FACTOR = 1._EB
   MESHES(NM)%EDGE_INTERPOLATION_FACTOR(1:N_EDGES_DIM_CC(1,NM),1:2) = EDGE_INT_AUX(1:N_EDGES_DIM_CC(1,NM),1:2)
   DEALLOCATE(EDGE_INT_AUX)
ENDIF

! Reallocate cell indexing vars SOLID, OBST_INDEX_C, WALL_INDEX, WALL_INDEX_HT3D, EDGE_INDEX, EXTERIOR,
! I_CELL, J_CELL, K_CELL:
! CELL_COUNT_CC(NM): Cells to be added to arrays related to Geometries.
CELL_COUNT_NM     = CELL_COUNT(NM)+CELL_COUNT_CC(NM)
CELL_COUNT_CC(NM) = CCOUNT
IF (CCOUNT > 0) THEN

   ! SOLID:
   ALLOCATE(SOLID_AUX(0:CELL_COUNT_NM)); SOLID_AUX(:)=MESHES(NM)%SOLID(:)
   DEALLOCATE(MESHES(NM)%SOLID); ALLOCATE(MESHES(NM)%SOLID(0:CELL_COUNT_NM+CELL_COUNT_CC(NM)));
   MESHES(NM)%SOLID = .FALSE.; MESHES(NM)%SOLID(0:CELL_COUNT_NM)=SOLID_AUX(0:CELL_COUNT_NM)
   DEALLOCATE(SOLID_AUX)

   ! WALL_INDEX, WALL_INDEX_HT3D, EDGE_INDEX, UVW_GHOST:
   ALLOCATE(WALL_INDEX_AUX(0:CELL_COUNT_NM,-3:3)); WALL_INDEX_AUX(:,:) = MESHES(NM)%WALL_INDEX(:,:)
   ALLOCATE(WALL_INDEX_HT3D_AUX(0:CELL_COUNT_NM,-3:3)); WALL_INDEX_HT3D_AUX(:,:) = MESHES(NM)%WALL_INDEX_HT3D(:,:)
   ALLOCATE(EDGE_INDEX_AUX(1:12,0:CELL_COUNT_NM)); EDGE_INDEX_AUX(:,:) = MESHES(NM)%EDGE_INDEX(:,:)
   DEALLOCATE(MESHES(NM)%WALL_INDEX, MESHES(NM)%WALL_INDEX_HT3D, MESHES(NM)%EDGE_INDEX)
   ALLOCATE(MESHES(NM)%WALL_INDEX(0:CELL_COUNT_NM+CELL_COUNT_CC(NM),-3:3)); MESHES(NM)%WALL_INDEX = 0
   ALLOCATE(MESHES(NM)%WALL_INDEX_HT3D(0:CELL_COUNT_NM+CELL_COUNT_CC(NM),-3:3)); MESHES(NM)%WALL_INDEX_HT3D = 0
   ALLOCATE(MESHES(NM)%EDGE_INDEX(1:12,0:CELL_COUNT_NM+CELL_COUNT_CC(NM))); MESHES(NM)%EDGE_INDEX = 0
   MESHES(NM)%WALL_INDEX(0:CELL_COUNT_NM,-3:3) = WALL_INDEX_AUX(0:CELL_COUNT_NM,-3:3)
   MESHES(NM)%WALL_INDEX_HT3D(0:CELL_COUNT_NM,-3:3) = WALL_INDEX_HT3D_AUX(0:CELL_COUNT_NM,-3:3)
   MESHES(NM)%EDGE_INDEX(1:12,0:CELL_COUNT_NM) = EDGE_INDEX_AUX(1:12,0:CELL_COUNT_NM)
   DEALLOCATE(WALL_INDEX_AUX, WALL_INDEX_HT3D_AUX, EDGE_INDEX_AUX)

   ALLOCATE(EXTERIOR_AUX(0:CELL_COUNT_NM)); EXTERIOR_AUX(:)=MESHES(NM)%EXTERIOR(:)
   DEALLOCATE(MESHES(NM)%EXTERIOR); ALLOCATE(MESHES(NM)%EXTERIOR(0:CELL_COUNT_NM+CELL_COUNT_CC(NM)))
   MESHES(NM)%EXTERIOR = .FALSE.; MESHES(NM)%EXTERIOR(0:CELL_COUNT_NM)=EXTERIOR_AUX(0:CELL_COUNT_NM)
   DEALLOCATE(EXTERIOR_AUX)

   ! I_CELL, J_CELL, K_CELL, OBST_INDEX_C:
   ALLOCATE(I_CELL_AUX(CELL_COUNT_NM),J_CELL_AUX(CELL_COUNT_NM),K_CELL_AUX(CELL_COUNT_NM))
   I_CELL_AUX(:) = MESHES(NM)%I_CELL(:); J_CELL_AUX(:) = MESHES(NM)%J_CELL(:); K_CELL_AUX(:) = MESHES(NM)%K_CELL(:)
   ALLOCATE(OBST_INDEX_C_AUX(0:CELL_COUNT_NM)); OBST_INDEX_C_AUX(:) = MESHES(NM)%OBST_INDEX_C(:)
   DEALLOCATE(MESHES(NM)%I_CELL,MESHES(NM)%J_CELL,MESHES(NM)%K_CELL,MESHES(NM)%OBST_INDEX_C)
   ALLOCATE(MESHES(NM)%I_CELL(CELL_COUNT_NM+CELL_COUNT_CC(NM))); MESHES(NM)%I_CELL = -1
   ALLOCATE(MESHES(NM)%J_CELL(CELL_COUNT_NM+CELL_COUNT_CC(NM))); MESHES(NM)%J_CELL = -1
   ALLOCATE(MESHES(NM)%K_CELL(CELL_COUNT_NM+CELL_COUNT_CC(NM))); MESHES(NM)%K_CELL = -1
   ALLOCATE(MESHES(NM)%OBST_INDEX_C(0:CELL_COUNT_NM+CELL_COUNT_CC(NM))); MESHES(NM)%OBST_INDEX_C = 0
   MESHES(NM)%I_CELL(1:CELL_COUNT_NM) = I_CELL_AUX(1:CELL_COUNT_NM)
   MESHES(NM)%J_CELL(1:CELL_COUNT_NM) = J_CELL_AUX(1:CELL_COUNT_NM)
   MESHES(NM)%K_CELL(1:CELL_COUNT_NM) = K_CELL_AUX(1:CELL_COUNT_NM)
   MESHES(NM)%OBST_INDEX_C(0:CELL_COUNT_NM) = OBST_INDEX_C_AUX(0:CELL_COUNT_NM)
   DEALLOCATE(I_CELL_AUX,J_CELL_AUX,K_CELL_AUX,OBST_INDEX_C_AUX)

ENDIF


! Finally repeat search process and assign edge and cell values to cut-cell region entities:
ECOUNT = N_EDGES_DIM_CC(1,NM); IBM_ECOUNT=0
CCOUNT = CELL_COUNT_NM;

! X axis edges:
DO K=0,KBAR
   INK = .FALSE.
   KN1 = K; KN2 = K+1
   IF (K==0) THEN;       KN1=K+1
   ELSEIF(K==KBAR) THEN; KN2=K
   ELSE
      INK = .TRUE.
   ENDIF
   DO J=0,JBAR
      INJ = .FALSE.
      JN1 = J; JN2 = J+1
      IF (J==0) THEN; JN1=J+1
      ELSEIF(J==JBAR) THEN; JN2=J
      ELSE
         INJ = .TRUE.
      ENDIF
      INMESH = INK .AND. INJ
      IX_LOOP_2 : DO I=1,IBAR
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,IAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,JAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO JADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,KAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         ! This Test is to drop IBEDGES related to only IBM_SOLID cells in the mesh, no need to have them on this mesh:
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(I,JN1:JN2,KN1:KN2,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-cell, and two regular cells, NEW edge to force.
            IE = MESHES(NM)%EDGE_INDEX(4,CELL_INDEX(I,J,K)) ! EDGE in Xaxis in upper Y,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO KADD=0,1
                  DO JADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I     ,J+JADD,K+KADD)==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I     ,J+JADD,K+KADD) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I
                        MESHES(NM)%J_CELL(CCOUNT)=J+JADD
                        MESHES(NM)%K_CELL(CCOUNT)=K+KADD
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICPM = MESHES(NM)%CELL_INDEX(I  ,J+1,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I  ,J+1,K+1)
               ICMP = MESHES(NM)%CELL_INDEX(I  ,J  ,K+1)
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, IAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX(1,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(2,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(3,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(4,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=IAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-2)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IX_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_IBEDGE:
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IE = IE

         ENDIF
      ENDDO IX_LOOP_2
   ENDDO
ENDDO

! Y axis edges:
DO K=0,KBAR
   INK = .FALSE.
   KN1 = K; KN2 = K+1
   IF (K==0) THEN;       KN1=K+1
   ELSEIF(K==KBAR) THEN; KN2=K
   ELSE
      INK = .TRUE.
   ENDIF
   DO J=1,JBAR
      IY_LOOP_2 : DO I=0,IBAR
         INI = .FALSE.
         IN1 = I; IN2 = I+1
         IF (I==0) THEN;       IN1=I+1
         ELSEIF(I==IBAR) THEN; IN2=I
         ELSE
            INI = .TRUE.
         ENDIF
         INMESH = INK .AND. INI
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,JAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO KADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J     ,K+KADD,IBM_FGSC,IAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Z.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,KAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         ! This Test is to drop IBEDGES related to only IBM_SOLID cells in the mesh, no need to have them on this mesh:
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(IN1:IN2,J,KN1:KN2,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-cell, and two regular cells.
            IE = MESHES(NM)%EDGE_INDEX(8,CELL_INDEX(I,J,K)) ! EDGE in Yaxis in upper X,Z boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO KADD=0,1
                  DO IADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I+IADD,J     ,K+KADD)==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I+IADD,J     ,K+KADD) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I+IADD
                        MESHES(NM)%J_CELL(CCOUNT)=J
                        MESHES(NM)%K_CELL(CCOUNT)=K+KADD
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICMP = MESHES(NM)%CELL_INDEX(I+1,J  ,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I+1,J  ,K+1)
               ICPM = MESHES(NM)%CELL_INDEX(I  ,J  ,K+1)
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, JAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX(5,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(6,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(7,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(8,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=JAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-1)
                     CASE(-3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 3)
                     CASE( 3)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K+1),-3)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K+1),-3)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IY_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_IBEDGE:
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IE = IE

         ENDIF
      ENDDO IY_LOOP_2
   ENDDO
ENDDO

! Z axis edges:
DO K=1,KBAR
   DO J=0,JBAR
      INJ = .FALSE.
      JN1 = J; JN2 = J+1
      IF (J==0) THEN; JN1=J+1
      ELSEIF(J==JBAR) THEN; JN2=J
      ELSE
         INJ = .TRUE.
      ENDIF
      IZ_LOOP_2 : DO I=0,IBAR
         INI = .FALSE.
         IN1 = I; IN2 = I+1
         IF (I==0) THEN;       IN1=I+1
         ELSEIF(I==IBAR) THEN; IN2=I
         ELSE
            INI = .TRUE.
         ENDIF
         INMESH = INJ .AND. INI
         IF (MESHES(NM)%ECVAR(I,J,K,IBM_EGSC,KAXIS) /= IBM_SOLID) CYCLE
         N_CC = 0; N_RG = 0
         DO JADD=0,1 ! Faces aligned in X.
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I     ,J+JADD,K     ,IBM_FGSC,IAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         DO IADD=0,1 ! Faces aligned in Y.
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_CUTCFE) N_CC=N_CC+1
            IF (MESHES(NM)%FCVAR(I+IADD,J     ,K     ,IBM_FGSC,JAXIS)==  IBM_SOLID)  N_RG=N_RG+1
         ENDDO
         IF (.NOT.INMESH) THEN
            IF(ALL(MESHES(NM)%CCVAR(IN1:IN2,JN1:JN2,K,IBM_CGSC)==IBM_SOLID)) N_CC=0 ! Drop IBEDGE.
         ENDIF
         IF (N_CC>0 .AND. N_RG>0) THEN ! At least one neighboring cut-cell, and two regular cells.
            IE = MESHES(NM)%EDGE_INDEX(12,CELL_INDEX(I,J,K)) ! EDGE in Zaxis in upper X,Y boundaries of cell I,J,K.
            ! If IE not counted yet increase ECOUNT, Add to EDGE IJKE, EDGE_INDEX, renumber if needed surrounding
            ! cells CELL_INDEX(I,J,K):
            IF (IE==0) THEN
               ECOUNT = ECOUNT + 1; IE = ECOUNT
               DO JADD=0,1
                  DO IADD=0,1
                     IF(MESHES(NM)%CELL_INDEX(I+IADD,J+JADD,K     )==0) THEN ! Add cell to CELL_INDEX
                        CCOUNT = CCOUNT + 1
                        MESHES(NM)%CELL_INDEX(I+IADD,J+JADD,K     ) = CCOUNT
                        MESHES(NM)%I_CELL(CCOUNT)=I+IADD
                        MESHES(NM)%J_CELL(CCOUNT)=J+JADD
                        MESHES(NM)%K_CELL(CCOUNT)=K
                     ENDIF
                  ENDDO
               ENDDO
               ICMM = MESHES(NM)%CELL_INDEX(I  ,J  ,K  )
               ICPM = MESHES(NM)%CELL_INDEX(I+1,J  ,K  )
               ICPP = MESHES(NM)%CELL_INDEX(I+1,J+1,K  )
               ICMP = MESHES(NM)%CELL_INDEX(I  ,J+1,K  )
               MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE) = (/ I, J, K, KAXIS /)
               MESHES(NM)%IJKE(5,IE) = ICMM
               MESHES(NM)%IJKE(6,IE) = ICPM
               MESHES(NM)%IJKE(7,IE) = ICMP
               MESHES(NM)%IJKE(8,IE) = ICPP
               MESHES(NM)%EDGE_INDEX( 9,ICPP) = IE
               MESHES(NM)%EDGE_INDEX(10,ICMP) = IE
               MESHES(NM)%EDGE_INDEX(11,ICPM) = IE
               MESHES(NM)%EDGE_INDEX(12,ICMM) = IE
            ELSE
               ! Search if WALL cells related to the edge are of type SOLID_BOUNDARY or MIRROR_BOUNDARY.
               ! If so discard edge for CCIBM stress recalculation, no need to do it.
               DO IDUM=1,4
                  IOR=KAXIS_WALL_INDS(IDUM)
                  SELECT CASE(IOR)
                     CASE(-1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ), 1)
                     CASE( 1)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ),-1)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-1)
                     CASE(-2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J  ,K  ), 2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J  ,K  ), 2)
                     CASE( 2)
                        IW1 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I  ,J+1,K  ),-2)
                        IW2 = MESHES(NM)%WALL_INDEX(CELL_INDEX(I+1,J+1,K  ),-2)
                  END SELECT
                  IF (IW1>0) THEN
                     IF(MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW1)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_2
                  ENDIF
                  IF (IW2>0) THEN
                     IF(MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==SOLID_BOUNDARY .OR. &
                        MESHES(NM)%WALL(IW2)%BOUNDARY_TYPE==MIRROR_BOUNDARY) CYCLE IZ_LOOP_2
                  ENDIF
               ENDDO
            ENDIF

            IBM_ECOUNT = IBM_ECOUNT + 1

            ! Add info to IBM_IBEDGE:
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IJK(IAXIS:KAXIS+1) = MESHES(NM)%IJKE(IAXIS:KAXIS+1,IE)
            MESHES(NM)%IBM_IBEDGE(IBM_ECOUNT)%IE = IE

         ENDIF
      ENDDO IZ_LOOP_2
   ENDDO
ENDDO

DEALLOCATE(CELL_ADDED)

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   WRITE(LU_SETCC,'(A,F8.3,A,7I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Sol-CC edges for BC : ', &
   IBM_ECOUNT,MESHES(NM)%IBM_NIBEDGE,N_EDGES_DIM_CC(1:2,NM),CELL_COUNT_NM,CELL_COUNT_CC(NM),CCOUNT,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,7I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Sol-CC edges for BC : ', &
   IBM_ECOUNT,MESHES(NM)%IBM_NIBEDGE,N_EDGES_DIM_CC(1:2,NM),CELL_COUNT_NM,CELL_COUNT_CC(NM),CCOUNT,'. '
   ENDIF
   ! DO I=1,MESHES(NM)%IBM_NRCEDGE
   !    WRITE(LU_ERR,*) 'IE,I,J,K,IAXIS=',MESHES(NM)%IBM_RCEDGE(I)%IE,MESHES(NM)%IBM_RCEDGE(I)%IJK(IAXIS:KAXIS+1)
   ! ENDDO
ENDIF

IF (DEBUG_SET_CUTCELLS) THEN
   ! Write segment information for the mesh if it belongs to the process:
   ! Write out:
   WRITE(MSEGS_FILE,'(A,A,I4.4,A)') TRIM(CHID),'_ibsegs_mesh_',NM,'.dat'
   LU_DB_SETCC = GET_FILE_NUMBER()
   OPEN(LU_DB_SETCC,FILE=TRIM(MSEGS_FILE),STATUS='UNKNOWN')
   !WRITE(LU_ERR,*) TRIM(MSEGS_FILE),MESHES(NM)%IBM_NRCEDGE,IBM_ECOUNT
   DO ECOUNT=1,MESHES(NM)%IBM_NIBEDGE
      I=MESHES(NM)%IBM_IBEDGE(ECOUNT)%IJK(IAXIS)
      J=MESHES(NM)%IBM_IBEDGE(ECOUNT)%IJK(JAXIS)
      K=MESHES(NM)%IBM_IBEDGE(ECOUNT)%IJK(KAXIS)
      IE=MESHES(NM)%IBM_IBEDGE(ECOUNT)%IJK(KAXIS+1)
      SELECT CASE(IE)
      CASE(IAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DX(I),XC(I),Y(J),Z(K)
      CASE(JAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DY(J),X(I),YC(J),Z(K)
      CASE(KAXIS)
         WRITE(LU_DB_SETCC,'(4I4,4F13.8)') I,J,K,IE,DZ(K),X(I),Y(J),ZC(K)
      END SELECT
   ENDDO
   CLOSE(LU_DB_SETCC)
ENDIF

RETURN
END SUBROUTINE GET_SOLID_CUTCELL_EDGES_BC

! ------------------------- ALLOC_BODINT_PLANE ----------------------------------

SUBROUTINE ALLOC_BODINT_PLANE(BODINT_PLANE,FIRST_CALL_ARG)

TYPE(BODINT_PLANE_TYPE), INTENT(INOUT) :: BODINT_PLANE
LOGICAL,                INTENT (INOUT) :: FIRST_CALL_ARG

! Local Variables:
INTEGER,  SAVE :: N_VERTS_TOT, N_FACES_TOT
LOGICAL,  SAVE :: FIRST_CALL=.TRUE.
REAL(EB)       :: LEDGE
INTEGER        :: IG

IF (FIRST_CALL) THEN
   ! Define BODINT_PLANE allocation sizes, hard wired for now:
   ! Maximum number of vertices and elements in BODINT_PLANE:
   N_VERTS_TOT=0; N_FACES_TOT=0
   DO IG=1,N_GEOMETRY
      N_VERTS_TOT = N_VERTS_TOT + GEOMETRY(IG)%N_VERTS
      N_FACES_TOT = N_FACES_TOT + GEOMETRY(IG)%N_FACES
   ENDDO

   ! Conservative estimate:
   IBM_MAX_NNODS = 2 * N_VERTS_TOT
   IBM_MAX_NSGLS = N_VERTS_TOT
   IBM_MAX_NSEGS = N_FACES_TOT
   IBM_MAX_NTRIS = N_FACES_TOT

   ! Maximum number of grid crossings on BODINT_PLANE segments, MAX_LEDGE is a module variable:
   MAX_LEDGE = GEOMEPS ! Initialize to a small number.
   DO IG=1,N_GEOMETRY
      LEDGE = GEOMETRY(IG)%MAX_LEDGE ! This has been computed at setup in GET_GEOM_TRIBIN
      MAX_LEDGE = MAX(MAX_LEDGE,LEDGE)
   ENDDO

   FIRST_CALL =.FALSE.
ENDIF

IF (.NOT.FIRST_CALL_ARG) RETURN

IF ( ALLOCATED(BODINT_PLANE%XYZ)  )      DEALLOCATE(BODINT_PLANE%XYZ)
IF ( ALLOCATED(BODINT_PLANE%SGLS) )      DEALLOCATE(BODINT_PLANE%SGLS)
IF ( ALLOCATED(BODINT_PLANE%SEGS) )      DEALLOCATE(BODINT_PLANE%SEGS)
IF ( ALLOCATED(BODINT_PLANE%TRIS) )      DEALLOCATE(BODINT_PLANE%TRIS)
IF ( ALLOCATED(BODINT_PLANE%INDSEG) )    DEALLOCATE(BODINT_PLANE%INDSEG)
IF ( ALLOCATED(BODINT_PLANE%INDTRI) )    DEALLOCATE(BODINT_PLANE%INDTRI)
IF ( ALLOCATED(BODINT_PLANE%X2ALIGNED) ) DEALLOCATE(BODINT_PLANE%X2ALIGNED)
IF ( ALLOCATED(BODINT_PLANE%X3ALIGNED) ) DEALLOCATE(BODINT_PLANE%X3ALIGNED)
IF ( ALLOCATED(BODINT_PLANE%SEGTYPE) )   DEALLOCATE(BODINT_PLANE%SEGTYPE)
IF ( ALLOCATED(BODINT_PLANE%NOD_PERM) )  DEALLOCATE(BODINT_PLANE%NOD_PERM)

ALLOCATE(BODINT_PLANE%      XYZ(IAXIS:KAXIS,            IBM_MAX_NNODS))
ALLOCATE(BODINT_PLANE% NOD_PERM(IBM_MAX_NNODS))
ALLOCATE(BODINT_PLANE%     SGLS(NOD1,                   IBM_MAX_NSGLS))
ALLOCATE(BODINT_PLANE%     SEGS(NOD1:NOD2,              IBM_MAX_NSEGS))
ALLOCATE(BODINT_PLANE%     TRIS(NOD1:NOD3,              IBM_MAX_NTRIS))
ALLOCATE(BODINT_PLANE%   INDSEG(IBM_MAX_WSTRIANG_SEG+2, IBM_MAX_NSEGS))
ALLOCATE(BODINT_PLANE%   INDTRI(IBM_MAX_WSTRIANG_TRI+1, IBM_MAX_NTRIS))
ALLOCATE(BODINT_PLANE%X2ALIGNED(IBM_MAX_NSEGS))
ALLOCATE(BODINT_PLANE%X3ALIGNED(IBM_MAX_NSEGS))
ALLOCATE(BODINT_PLANE%  SEGTYPE(LOW_IND:HIGH_IND,       IBM_MAX_NSEGS))

FIRST_CALL_ARG=.FALSE.

END SUBROUTINE ALLOC_BODINT_PLANE

! -------------------------- GET_BODINT_PLANE -----------------------------------

SUBROUTINE GET_BODINT_PLANE(X1AXIS,X1PLN,INDX1,PLNORMAL,X2AXIS,X3AXIS,&
                            X2LO,X2HI,X3LO,X3HI,X2FACE,X3FACE,X2LO_CELL,&
                            X2HI_CELL,X3LO_CELL,X3HI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE)

INTEGER, INTENT(IN) :: X1AXIS, X2AXIS, X3AXIS, INDX1, X2LO, X2HI, X3LO, X3HI, X2LO_CELL,&
                       X2HI_CELL,X3LO_CELL,X3HI_CELL
REAL(EB),INTENT(IN) :: X1PLN, PLNORMAL(MAX_DIM)
REAL(EB), ALLOCATABLE, DIMENSION(:), INTENT(IN) :: X2FACE,X3FACE
LOGICAL, INTENT(IN) :: TRI_ONPLANE_ONLY, RAYTRACE_X2_ONLY
TYPE(BODINT_PLANE_TYPE), INTENT(INOUT) :: BODINT_PLANE

! Local variables:
INTEGER :: IG, IBIN, IWSEL, IWSELDUM, IEDGE, ISGL, ISEG, ITRI, EDGE_TRI
REAL(EB):: XYZV(MAX_DIM,NODS_WSEL)
INTEGER :: ELEM(NODS_WSEL), IND_P(NODS_WSEL), NTRIS, NSEGS
REAL(EB):: DOT1, DOT2, DOT3
LOGICAL :: INTFLG, INLIST
REAL(EB):: LN1(MAX_DIM,NOD1:NOD2), LN2(MAX_DIM,NOD1:NOD2)
REAL(EB):: XYZ_INT1(MAX_DIM), XYZ_INT2(MAX_DIM)
INTEGER :: SEG(NOD1:NOD2), EDGES(NOD1:NOD2,3), VEC3(3)
REAL(EB):: X2X3(IAXIS:JAXIS,NODS_WSEL), AREALOC
REAL(EB):: XP1(IAXIS:JAXIS), XP2(IAXIS:JAXIS), TX2P(IAXIS:JAXIS), TX3P(IAXIS:JAXIS)
REAL(EB):: NMTX2P
INTEGER :: IWSEL1, IWSEL2, ELEM1(NODS_WSEL), ELEM2(NODS_WSEL)
REAL(EB):: XYZ1(MAX_DIM), NXYZ1(MAX_DIM), NX3P1, N1(IAXIS:JAXIS), NMNL
REAL(EB):: XYZ2(MAX_DIM), NXYZ2(MAX_DIM), NX3P2, N2(IAXIS:JAXIS)
REAL(EB):: X3PVERT, PVERT(IAXIS:JAXIS), X3P1, P1CEN(IAXIS:JAXIS), X3P2, P2CEN(IAXIS:JAXIS)
INTEGER :: VCT(2)
REAL(EB):: PCT(IAXIS:JAXIS,1:2), V1(IAXIS:JAXIS), V2(IAXIS:JAXIS), CRSSNV, CTST
REAL(EB):: VEC(IAXIS:JAXIS,1:2)
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: SEGAUX, INDSEGAUX, SEGTYPEAUX, ISEG_NODE
REAL(EB),ALLOCATABLE, DIMENSION(:,:) :: ANGS_NODE
REAL(EB):: X3_1, X2_1, X3_2, X2_2, SLEN, SBOD
INTEGER :: INOD, ISEG_NEW, NBCROSS
REAL(EB):: DELBIN
INTEGER :: ILO_BIN, IHI_BIN

INTEGER :: AXIS, NTL, SZE, IBCR, ICROSS, IDUM, ISVAR, ISX, JJ2, KK2, BISEG, BIISEG, JJ2_LO, JJ2_HI, KK2_LO, KK2_HI
INTEGER :: VAXIS(IAXIS:JAXIS), I
REAL(EB):: LXI, MEAN_SLEN, XIV(NOD1:NOD2), XIV_LO, XIV_HI, MIN_MESHGEOM
INTEGER, ALLOCATABLE, DIMENSION(:) :: TRI_LIST, SEGS_NODE, CIRC_MED
INTEGER :: SEGV(NOD1:NOD2,EDG1:EDG2), ISEGV(EDG1:EDG2), INT_FLG, MAX_SEG_NODE, ISEG2, ISEG3, NSN, COUNT
REAL(EB):: XPOS, XY(IAXIS:JAXIS), S1_X2_MIN, S1_X3_MIN, S1_X2_MAX, S1_X3_MAX, AVAL, ANG, DX2, DX3
REAL(EB):: D1(IAXIS:JAXIS),P1(IAXIS:JAXIS),D2(IAXIS:JAXIS),P2(IAXIS:JAXIS),SLENV(EDG1:EDG2),SVARV(NOD1:NOD2,EDG1:EDG2)
REAL(EB) :: TNOW
LOGICAL :: LO_X2_TEST, HI_X2_TEST, LO_X3_TEST, HI_X3_TEST, FOUND_SEG, CRS_FLG
CHARACTER(100) :: BIPL_FILE

INTEGER :: WSELEM(NOD1:NOD3), MYAXIS
REAL(EB):: FACECUBE(LOW_IND:HIGH_IND,IAXIS:KAXIS)

IG = INDX1
TNOW = CURRENT_TIME()

! Now allocate BODINT_PLANE:
BODINT_PLANE%NNODS = 0
BODINT_PLANE%NSGLS = 0
BODINT_PLANE%NSEGS = 0
BODINT_PLANE%NTRIS = 0

! Main Loop over Geometries:
MAIN_GEOM_LOOP : DO IG=1,N_GEOMETRY

   IF (GEOMETRY(IG)%TBAXIS(X1AXIS)%N_BINS<1) CYCLE
   DELBIN       = GEOMETRY(IG)%TBAXIS(X1AXIS)%DELBIN
   MIN_MESHGEOM = GEOMETRY(IG)%TBAXIS(X1AXIS)%TRIBIN(1)%X1_LOW
   ILO_BIN = MAX(1,CEILING((X1PLN-GEOMEPS-MIN_MESHGEOM)/DELBIN))
   IHI_BIN = MIN(GEOMETRY(IG)%TBAXIS(X1AXIS)%N_BINS,CEILING((X1PLN+GEOMEPS-MIN_MESHGEOM)/DELBIN))

   ! Find for this geometry where does the plane lay on triangle bins:
   IBIN_DO : DO IBIN=ILO_BIN,IHI_BIN !1,GEOMETRY(IG)%TBAXIS(X1AXIS)%N_BINS

   IF ( X1PLN < GEOMETRY(IG)%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_LOW-GEOMEPS)  CYCLE
   IF ( X1PLN > GEOMETRY(IG)%TBAXIS(X1AXIS)%TRIBIN(IBIN)%X1_HIGH+GEOMEPS) CYCLE

   ! Loop surface triangles:
!   DO IWSEL =1,GEOMETRY(IG)%N_FACES
   DO IWSELDUM=1,GEOMETRY(IG)%TBAXIS(X1AXIS)%TRIBIN(IBIN)%NTL

      IWSEL=GEOMETRY(IG)%TBAXIS(X1AXIS)%TRIBIN(IBIN)%TRI_LIST(IWSELDUM)
      WSELEM(NOD1:NOD3) = GEOMETRY(IG)%FACES(MAX_DIM*(IWSEL-1)+1:MAX_DIM*IWSEL)
      ! Triangles NODES coordinates:
      DO INOD=NOD1,NOD3
         XYZV(IAXIS:KAXIS,INOD) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(INOD)-1)+1:MAX_DIM*WSELEM(INOD))
      ENDDO
      ! FACECUBE:
      DO MYAXIS=IAXIS,KAXIS
         FACECUBE( LOW_IND,MYAXIS) = MINVAL(XYZV(MYAXIS,NOD1:NOD3))
         FACECUBE(HIGH_IND,MYAXIS) = MAXVAL(XYZV(MYAXIS,NOD1:NOD3))
      ENDDO

      ! Test low-high vertices of triangle along x1axis vs plane (O(NT) operation):
      IF( (FACECUBE( LOW_IND,X1AXIS)-X1PLN) > GEOMEPS) CYCLE
      IF( (X1PLN-FACECUBE(HIGH_IND,X1AXIS)) > GEOMEPS) CYCLE

      IF(RAYTRACE_X2_ONLY) THEN
         IF( (X3LO_RT-FACECUBE(HIGH_IND,X3AXIS)) > GEOMEPS) CYCLE
         IF( (FACECUBE( LOW_IND,X3AXIS)-X3HI_RT) > GEOMEPS) CYCLE
      ELSE
         LO_X2_TEST=(X2FACE(X2LO)-FACECUBE(HIGH_IND,X2AXIS)) > GEOMEPS
         LO_X3_TEST=(X3FACE(X3LO)-FACECUBE(HIGH_IND,X3AXIS)) > GEOMEPS
         IF(  LO_X2_TEST .AND. LO_X3_TEST ) CYCLE
         HI_X2_TEST=(FACECUBE( LOW_IND,X2AXIS)-X2FACE(X2HI)) > GEOMEPS
         IF(  HI_X2_TEST .AND. LO_X3_TEST ) CYCLE
         HI_X3_TEST=(FACECUBE( LOW_IND,X3AXIS)-X3FACE(X3HI)) > GEOMEPS
         IF(  LO_X2_TEST .AND. HI_X3_TEST ) CYCLE
         IF(  HI_X2_TEST .AND. HI_X3_TEST ) CYCLE
      ENDIF

      ! Compute simplified dot(PLNORMAL,XYZV-XYZPLANE):
      DOT1 = XYZV(X1AXIS,NOD1) - X1PLN
      DOT2 = XYZV(X1AXIS,NOD2) - X1PLN
      DOT3 = XYZV(X1AXIS,NOD3) - X1PLN
      IF ( ABS(DOT1) <= GEOMEPS ) DOT1 = 0._EB
      IF ( ABS(DOT2) <= GEOMEPS ) DOT2 = 0._EB
      IF ( ABS(DOT3) <= GEOMEPS ) DOT3 = 0._EB

      ! Test if IWSEL lays in X1PLN:
      IF ( (ABS(DOT1)+ABS(DOT2)+ABS(DOT3)) == 0._EB ) THEN

         ! Force nodes location in X1PLN plane:
         XYZV(X1AXIS,NOD1:NOD3) = X1PLN

         ! Index to point 1 of triangle in BODINT_PLANE%XYZ list:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZV(IAXIS:KAXIS,NOD1),IND_P(NOD1))

         ! Index to point 2 of triangle in BODINT_PLANE%XYZ list:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZV(IAXIS:KAXIS,NOD2),IND_P(NOD2))

         ! Index to point 3 of triangle in BODINT_PLANE%XYZ list:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZV(IAXIS:KAXIS,NOD3),IND_P(NOD3))

         ! Do we need to test if we already have this triangle on
         ! the list? Shouldn't unless repeated -> Possibility for
         ! zero thickness.
         NTRIS = BODINT_PLANE % NTRIS + 1
         BODINT_PLANE % NTRIS = NTRIS
         BODINT_PLANE % TRIS(NOD1:NOD3,NTRIS) = IND_P
         BODINT_PLANE % INDTRI(1:2,NTRIS) = (/ IWSEL, IG /)

         CYCLE ! Next WSELEM

      ENDIF

      ! Test if we are looking for intersection triangles only:
      ONLY_TRIANG_EDGES_COND : IF (.NOT.TRI_ONPLANE_ONLY) THEN
         ! Case a: Typical intersections:
         ! Points 1,2 on on side of plane, point 3 on the other:
         IF ( ((DOT1 > 0._EB) .AND. (DOT2 > 0._EB) .AND. (DOT3 < 0._EB)) .OR. &
              ((DOT1 < 0._EB) .AND. (DOT2 < 0._EB) .AND. (DOT3 > 0._EB)) ) THEN

            ! Line 1, from node 2 to 3:
            LN1(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD2)
            LN1(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

            CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN1,XYZ_INT1,INTFLG)

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Line 2, from node 1 to 3:
            LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
            LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

            CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

            ! Index to XYZ_INT2:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

            ! Now add segment:
            NSEGS = BODINT_PLANE % NSEGS + 1
            BODINT_PLANE % NSEGS = NSEGS
            IF ( DOT1 > 0._EB ) THEN ! First case, counterclockwise p1 to p2
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
            ELSE
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
            ENDIF
            BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
            BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

            CYCLE ! Next WSELEM

         ENDIF
         ! Points 2,3 on one side of plane, point 1 on the other:
         IF ( ((DOT2 > 0._EB) .AND. (DOT3 > 0._EB) .AND. (DOT1 < 0._EB)) .OR. &
              ((DOT2 < 0._EB) .AND. (DOT3 < 0._EB) .AND. (DOT1 > 0._EB)) ) THEN

              ! Line 1, from node 1 to 2:
              LN1(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
              LN1(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD2)

              CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN1,XYZ_INT1,INTFLG)

              ! Index to XYZ_INT1:
              CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

              ! Line 2, from node 1 to 3:
              LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
              LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

              CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

              ! Index to XYZ_INT2:
              CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

              ! Now add segment:
              NSEGS = BODINT_PLANE % NSEGS + 1
              BODINT_PLANE % NSEGS = NSEGS
              IF ( DOT2 > 0._EB ) THEN ! Second case, counterclockwise p2 to p1
                 BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
              ELSE
                 BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
              ENDIF
              BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
              BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

              CYCLE ! Next WSELEM

         ENDIF
         ! Points 1,3 on one side of plane, point 2 on the other:
         IF ( ((DOT1 > 0._EB) .AND. (DOT3 > 0._EB) .AND. (DOT2 < 0._EB)) .OR. &
              ((DOT1 < 0._EB) .AND. (DOT3 < 0._EB) .AND. (DOT2 > 0._EB)) ) THEN

              ! Line 1, from node 1 to 2:
              LN1(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
              LN1(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD2)

              CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN1,XYZ_INT1,INTFLG)

              ! Index to XYZ_INT1:
              CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

              ! Line 2, from node 2 to 3:
              LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD2)
              LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

              CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

              ! Index to XYZ_INT2:
              CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

              ! Now add segment:
              NSEGS = BODINT_PLANE % NSEGS + 1
              BODINT_PLANE % NSEGS = NSEGS
              IF ( DOT1 > 0._EB ) THEN ! Third case, counterclockwise p1 to p2
                 BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
              ELSE
                 BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
              ENDIF
              BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
              BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

              CYCLE ! Next WSELEM

         ENDIF

         ! Case b: only one point intersection. They will be used to define
         ! Solid vertex points in case of coincidence.
         ! Point 1 is on the plane:
         IF ( (DOT1 == 0._EB) .AND. ( ((DOT2 > 0._EB) .AND. (DOT3 > 0._EB)) .OR. &
                                      ((DOT2 < 0._EB) .AND. (DOT3 < 0._EB)) ) ) THEN

            ! First node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD1); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Add index to singles:
            ! Find if oriented segment is in list:
            INLIST = .FALSE.
            DO ISGL=1,BODINT_PLANE%NSGLS
               IF (BODINT_PLANE%SGLS(NOD1,ISGL) == IND_P(NOD1)) THEN
                  INLIST = .TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF (.NOT.INLIST) THEN
               ISGL = BODINT_PLANE%NSGLS + 1
               BODINT_PLANE % NSGLS = ISGL
               BODINT_PLANE % SGLS(NOD1,ISGL) = IND_P(NOD1)
            ENDIF

            CYCLE ! Next WSELEM

         ENDIF
         ! Point 2 is on the plane:
         IF ( (DOT2 == 0._EB) .AND. ( ((DOT1 > 0._EB) .AND. (DOT3 > 0._EB)) .OR. &
                                      ((DOT1 < 0._EB) .AND. (DOT3 < 0._EB)) ) ) THEN

            ! Second node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD2); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Add index to singles:
            ! Find if oriented segment is in list:
            INLIST = .FALSE.
            DO ISGL=1,BODINT_PLANE%NSGLS
               IF (BODINT_PLANE%SGLS(NOD1,ISGL) == IND_P(NOD1)) THEN
                  INLIST = .TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF (.NOT.INLIST) THEN
               ISGL = BODINT_PLANE%NSGLS + 1
               BODINT_PLANE % NSGLS = ISGL
               BODINT_PLANE % SGLS(NOD1,ISGL) = IND_P(NOD1)
            ENDIF

            CYCLE ! Next WSELEM

         ENDIF
         ! Point 3 is on the plane:
         IF ( (DOT3 == 0._EB) .AND. ( ((DOT1 > 0._EB) .AND. (DOT2 > 0._EB)) .OR. &
                                      ((DOT1 < 0._EB) .AND. (DOT2 < 0._EB)) ) ) THEN

            ! Third node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD3); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Add index to singles:
            ! Find if single element is in list:
            INLIST = .FALSE.
            DO ISGL=1,BODINT_PLANE%NSGLS
               IF (BODINT_PLANE%SGLS(NOD1,ISGL) == IND_P(NOD1)) THEN
                  INLIST = .TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF (.NOT.INLIST) THEN
               ISGL = BODINT_PLANE%NSGLS + 1
               BODINT_PLANE % NSGLS = ISGL
               BODINT_PLANE % SGLS(NOD1,ISGL) = IND_P(NOD1)
            ENDIF

            CYCLE ! Next WSELEM

         ENDIF

         ! Case c: one node is part of the intersection:
         ! Node 1 is in the plane:
         IF ( (DOT1 == 0._EB) .AND. ( ((DOT2 > 0._EB) .AND. (DOT3 < 0._EB)) .OR. &
                                      ((DOT2 < 0._EB) .AND. (DOT3 > 0._EB)) ) ) THEN

            ! First node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD1); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Line 2, from node 2 to 3:
            LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD2)
            LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

            CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

            ! Index to XYZ_INT2:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

            ! Now add segment:
            NSEGS = BODINT_PLANE % NSEGS + 1
            BODINT_PLANE % NSEGS = NSEGS
            IF ( DOT2 > 0._EB ) THEN ! Second case, counterclockwise p2 to p1
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
            ELSE
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
            ENDIF
            BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
            BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

            CYCLE ! Next WSELEM

         ENDIF
         ! Node 2 is in the plane:
         IF ( (DOT2 == 0._EB) .AND. ( ((DOT1 > 0._EB) .AND. (DOT3 < 0._EB)) .OR. &
                                      ((DOT1 < 0._EB) .AND. (DOT3 > 0._EB)) ) ) THEN

            ! Second node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD2); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Line 2, from node 1 to 3:
            LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
            LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD3)

            CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

            ! Index to XYZ_INT2:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

            ! Now add segment:
            NSEGS = BODINT_PLANE % NSEGS + 1
            BODINT_PLANE % NSEGS = NSEGS
            IF ( DOT1 > 0._EB ) THEN
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
            ELSE
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
            ENDIF
            BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
            BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

            CYCLE ! Next WSELEM

         ENDIF
         ! Node 3 is in the plane:
         IF ( (DOT3 == 0._EB) .AND. ( ((DOT1 > 0._EB) .AND. (DOT2 < 0._EB)) .OR. &
                                      ((DOT1 < 0._EB) .AND. (DOT2 > 0._EB)) ) ) THEN

            ! Third node is an intersection point:
            XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD3); XYZ_INT1(X1AXIS) = X1PLN

            ! Index to XYZ_INT1:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

            ! Line 2, from node 1 to 2:
            LN2(IAXIS:KAXIS,NOD1) = XYZV(IAXIS:KAXIS,NOD1)
            LN2(IAXIS:KAXIS,NOD2) = XYZV(IAXIS:KAXIS,NOD2)

            CALL LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LN2,XYZ_INT2,INTFLG)

            ! Index to XYZ_INT2:
            CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

            ! Now add segment:
            NSEGS = BODINT_PLANE % NSEGS + 1
            BODINT_PLANE % NSEGS = NSEGS
            IF ( DOT1 > 0._EB ) THEN
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD2), IND_P(NOD1) /)
            ELSE
               BODINT_PLANE%SEGS(NOD1:NOD2,NSEGS) = (/ IND_P(NOD1), IND_P(NOD2) /)
            ENDIF
            BODINT_PLANE%INDSEG(1:4,NSEGS) = (/ 1, IWSEL, 0, IG /)
            BODINT_PLANE%SEGTYPE(1:2,NSEGS)= (/ IBM_SOLID, IBM_GASPHASE /)

            CYCLE ! Next WSELEM

         ENDIF
      ENDIF ONLY_TRIANG_EDGES_COND

      ! Case D: A triangle segment is in the plane.
      ! Intersection is line 1-2:
      IF ( (DOT1 == 0._EB) .AND. (DOT2 == 0._EB) ) THEN

         ! First node:
         XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD1); XYZ_INT1(X1AXIS) = X1PLN

         ! Index to XYZ_INT1:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

         ! Second node:
         XYZ_INT2 = XYZV(IAXIS:KAXIS,NOD2); XYZ_INT2(X1AXIS) = X1PLN

         ! Index to XYZ_INT2:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

         ! Set oriented segment regarding plane:
         IF ( DOT3 > 0._EB ) THEN
            SEG(NOD1:NOD2) = (/ IND_P(NOD1), IND_P(NOD2) /)
         ELSE
            SEG(NOD1:NOD2) = (/ IND_P(NOD2), IND_P(NOD1) /)
         ENDIF
         ! Find if oriented segment is in list:
         EDGE_TRI= GEOMETRY(IG)%FACE_EDGES(EDG1,IWSEL) ! 1st edge: Ed1 NOD1-NOD2, Ed2 NOD2-NOD3, Ed3 NOD3-NOD1.
         VEC3(1) = GEOMETRY(IG)%EDGE_FACES(1,EDGE_TRI)
         VEC3(2) = GEOMETRY(IG)%EDGE_FACES(2,EDGE_TRI)
         VEC3(3) = GEOMETRY(IG)%EDGE_FACES(4,EDGE_TRI)
         INLIST  = .FALSE.
         DO ISEG=1,BODINT_PLANE%NSEGS
            FOUND_SEG = ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD1))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD2))) .OR.  &
                        ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD2))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD1)))
            IF (  FOUND_SEG                                 .AND. &
                 (BODINT_PLANE%INDSEG(2,ISEG)  == VEC3(2))  .AND. &
                 (BODINT_PLANE%INDSEG(3,ISEG)  == VEC3(3))  .AND. &
                 (BODINT_PLANE%INDSEG(4,ISEG)  ==      IG) ) THEN
               INLIST = .TRUE.
               EXIT
            ENDIF
         ENDDO
         IF (.NOT.INLIST) THEN
            ISEG = BODINT_PLANE%NSEGS + 1
            BODINT_PLANE%NSEGS = ISEG
            BODINT_PLANE%SEGS(NOD1:NOD2,ISEG) = SEG
            BODINT_PLANE%INDSEG(1:4,ISEG) = (/ VEC3(1), VEC3(2), VEC3(3), IG /)
         ENDIF

         CYCLE ! Next WSELEM

      ENDIF
      ! Intersection is line 2-3:
      IF ( (DOT2 == 0._EB) .AND. (DOT3 == 0._EB) ) THEN

         ! Second node:
         XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD2); XYZ_INT1(X1AXIS) = X1PLN

         ! Index to XYZ_INT1:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

         ! Third node:
         XYZ_INT2 = XYZV(IAXIS:KAXIS,NOD3); XYZ_INT2(X1AXIS) = X1PLN

         ! Index to XYZ_INT2:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

         ! Set oriented segment regarding plane:
         IF ( DOT1 > 0._EB ) THEN
            SEG(NOD1:NOD2) = (/ IND_P(NOD1), IND_P(NOD2) /)
         ELSE
            SEG(NOD1:NOD2) = (/ IND_P(NOD2), IND_P(NOD1) /)
         ENDIF
         ! Find if oriented segment is in list:
         EDGE_TRI= GEOMETRY(IG)%FACE_EDGES(EDG2,IWSEL) ! 2nd edge: Ed1 NOD1-NOD2, Ed2 NOD2-NOD3, Ed3 NOD3-NOD1.
         VEC3(1) = GEOMETRY(IG)%EDGE_FACES(1,EDGE_TRI)
         VEC3(2) = GEOMETRY(IG)%EDGE_FACES(2,EDGE_TRI)
         VEC3(3) = GEOMETRY(IG)%EDGE_FACES(4,EDGE_TRI)
         INLIST  = .FALSE.
         DO ISEG=1,BODINT_PLANE%NSEGS
            FOUND_SEG = ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD1))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD2))) .OR.  &
                        ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD2))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD1)))
            IF (  FOUND_SEG                                 .AND. &
                 (BODINT_PLANE%INDSEG(2,ISEG)  == VEC3(2))  .AND. &
                 (BODINT_PLANE%INDSEG(3,ISEG)  == VEC3(3))  .AND. &
                 (BODINT_PLANE%INDSEG(4,ISEG)  ==      IG) ) THEN
               INLIST = .TRUE.
               EXIT
            ENDIF
         ENDDO
         IF (.NOT.INLIST) THEN
            ISEG = BODINT_PLANE%NSEGS + 1
            BODINT_PLANE%NSEGS = ISEG
            BODINT_PLANE%SEGS(NOD1:NOD2,ISEG) = SEG
            BODINT_PLANE%INDSEG(1:4,ISEG) = (/ VEC3(1), VEC3(2), VEC3(3), IG /)
         ENDIF

         CYCLE ! Next WSELEM

      ENDIF
      ! Intersection is line 3-1:
      IF ( (DOT3 == 0._EB) .AND. (DOT1 == 0._EB) ) THEN

         ! Third node:
         XYZ_INT1 = XYZV(IAXIS:KAXIS,NOD3); XYZ_INT1(X1AXIS) = X1PLN

         ! Index to XYZ_INT1:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT1,IND_P(NOD1))

         ! First node:
         XYZ_INT2 = XYZV(IAXIS:KAXIS,NOD1); XYZ_INT2(X1AXIS) = X1PLN

         ! Index to XYZ_INT2:
         CALL GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ_INT2,IND_P(NOD2))

         ! Set oriented segment regarding plane:
         IF ( DOT2 > 0._EB ) THEN
            SEG(NOD1:NOD2) = (/ IND_P(NOD1), IND_P(NOD2) /)
         ELSE
            SEG(NOD1:NOD2) = (/ IND_P(NOD2), IND_P(NOD1) /)
         ENDIF
         ! Find if oriented segment is in list:
         EDGE_TRI= GEOMETRY(IG)%FACE_EDGES(EDG3,IWSEL) ! 3rd edge: Ed1 NOD1-NOD2, Ed2 NOD2-NOD3, Ed3 NOD3-NOD1.
         VEC3(1) = GEOMETRY(IG)%EDGE_FACES(1,EDGE_TRI)
         VEC3(2) = GEOMETRY(IG)%EDGE_FACES(2,EDGE_TRI)
         VEC3(3) = GEOMETRY(IG)%EDGE_FACES(4,EDGE_TRI)
         INLIST  = .FALSE.
         DO ISEG=1,BODINT_PLANE%NSEGS
            FOUND_SEG = ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD1))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD2))) .OR.  &
                        ((BODINT_PLANE%SEGS(NOD1,ISEG) == SEG(NOD2))  .AND. &
                         (BODINT_PLANE%SEGS(NOD2,ISEG) == SEG(NOD1)))
            IF (  FOUND_SEG                                 .AND. &
                 (BODINT_PLANE%INDSEG(2,ISEG)  == VEC3(2))  .AND. &
                 (BODINT_PLANE%INDSEG(3,ISEG)  == VEC3(3))  .AND. &
                 (BODINT_PLANE%INDSEG(4,ISEG)  ==      IG) ) THEN
               INLIST = .TRUE.
               EXIT
            ENDIF
         ENDDO
         IF (.NOT.INLIST) THEN
            ISEG = BODINT_PLANE%NSEGS + 1
            BODINT_PLANE%NSEGS = ISEG
            BODINT_PLANE%SEGS(NOD1:NOD2,ISEG) = SEG
            BODINT_PLANE%INDSEG(1:4,ISEG) = (/ VEC3(1), VEC3(2), VEC3(3), IG /)
         ENDIF

         CYCLE ! Next WSELEM

      ENDIF

      ! If you get to this point -> you have a problem:
      IF (.NOT.TRI_ONPLANE_ONLY) print*, "Error GET_BODINT_PLANE: Missed wet surface Triangle =",IWSEL

   ENDDO ! IWSEL

   EXIT IBIN_DO ! No need to test more bins.

   ENDDO IBIN_DO

ENDDO MAIN_GEOM_LOOP


! Next step is to Test triangles sides normals on plane against the obtained
! segments normals. If two identical segments found contain oposite
! normals, drop the segment in BODINT_PLANE%SEGS:
IF ( BODINT_PLANE%NTRIS > 0 ) THEN

   DO ITRI=1,BODINT_PLANE%NTRIS

      ! Triang conectivities:
      ELEM(NOD1:NOD3) = BODINT_PLANE%TRIS(NOD1:NOD3,ITRI)

      ! Coordinates in x2, x3 directions:
      X2X3(IAXIS,NOD1:NOD3) = (/ BODINT_PLANE%XYZ(X2AXIS,ELEM(NOD1)), &
                                 BODINT_PLANE%XYZ(X2AXIS,ELEM(NOD2)), &
                                 BODINT_PLANE%XYZ(X2AXIS,ELEM(NOD3)) /)
      X2X3(JAXIS,NOD1:NOD3) = (/ BODINT_PLANE%XYZ(X3AXIS,ELEM(NOD1)), &
                                 BODINT_PLANE%XYZ(X3AXIS,ELEM(NOD2)), &
                                 BODINT_PLANE%XYZ(X3AXIS,ELEM(NOD3)) /)

      ! Test Area sign, if -ve switch node order:
      AREALOC = 0.5_EB*(X2X3(IAXIS,NOD1)*X2X3(JAXIS,NOD2) - X2X3(IAXIS,NOD2)*X2X3(JAXIS,NOD1) + &
                        X2X3(IAXIS,NOD2)*X2X3(JAXIS,NOD3) - X2X3(IAXIS,NOD3)*X2X3(JAXIS,NOD2) + &
                        X2X3(IAXIS,NOD3)*X2X3(JAXIS,NOD1) - X2X3(IAXIS,NOD1)*X2X3(JAXIS,NOD3))
      IF (AREALOC < 0._EB) THEN
         ISEG    = ELEM(3)
         ELEM(3) = ELEM(2)
         ELEM(2)  =   ISEG
      ENDIF

      ! Now corresponding segments, ordered normal outside of plane x2-x3.
      EDGES(NOD1:NOD2,1) = (/ ELEM(1), ELEM(2) /) ! edge 1.
      EDGES(NOD1:NOD2,2) = (/ ELEM(2), ELEM(3) /) ! edge 2.
      EDGES(NOD1:NOD2,3) = (/ ELEM(3), ELEM(1) /)

      ! Now Test against segments, Beast approach:
      DO IEDGE=1,3
         DO ISEG=1,BODINT_PLANE%NSEGS
            IF ( (BODINT_PLANE%SEGS(NOD1,ISEG) == EDGES(NOD2,IEDGE)) .AND. &
                 (BODINT_PLANE%SEGS(NOD2,ISEG) == EDGES(NOD1,IEDGE)) ) THEN ! Edge normals
                                                                              ! oriented in opposite dirs.
               ! Set to SOLID SOLID segtype from BODINT_PLANE.SEGS
               BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)=(/ IBM_SOLID, IBM_SOLID /)

            ENDIF
         ENDDO
      ENDDO

   ENDDO
ENDIF

! For segments that are related to 2 Wet Surface triangles, test if they are of type GG or SS:
DO ISEG=1,BODINT_PLANE%NSEGS
    IF (BODINT_PLANE%INDSEG(1,ISEG) > 1) THEN ! Related to 2 WS triangles:

       SEG(NOD1:NOD2) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)

       ! Segment nodes positions:
       XP1(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/X2AXIS,X3AXIS/) ,SEG(NOD1))
       XP2(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/X2AXIS,X3AXIS/) ,SEG(NOD2))

       ! Unit normal versor along x2p (axis directed from NOD2 to NOD1):
       NMTX2P = SQRT( (XP1(IAXIS)-XP2(IAXIS))**2._EB + (XP1(JAXIS)-XP2(JAXIS))**2._EB )
       TX2P(IAXIS:JAXIS) = (XP1(IAXIS:JAXIS)-XP2(IAXIS:JAXIS)) * NMTX2P**(-1._EB)
       ! Versor along x3p.
       TX3P(IAXIS:JAXIS) = (/ -TX2P(JAXIS), TX2P(IAXIS) /)

       ! Now related WS triangles centroids:
       IWSEL1 = BODINT_PLANE%INDSEG(2,ISEG)
       IWSEL2 = BODINT_PLANE%INDSEG(3,ISEG)
       IG     = BODINT_PLANE%INDSEG(4,ISEG)

       ! Centroid of WS elem 1:
       ELEM1(NOD1:NOD3)  = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL1-1)+1:NODS_WSEL*IWSEL1)
       XYZ1(IAXIS:KAXIS) = ( GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM1(NOD1)-1)+1:MAX_DIM*ELEM1(NOD1)) + &
                             GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM1(NOD2)-1)+1:MAX_DIM*ELEM1(NOD2)) + &
                             GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM1(NOD3)-1)+1:MAX_DIM*ELEM1(NOD3)) ) / 3._EB
       NXYZ1(IAXIS:KAXIS)= GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,IWSEL1)
       ! Normal versor in x3p-x1 direction:
       NX3P1 = TX3P(IAXIS)*NXYZ1(X2AXIS) + TX3P(JAXIS)*NXYZ1(X3AXIS)
       N1(IAXIS:JAXIS) = (/ NX3P1, NXYZ1(X1AXIS) /)
       NMNL = SQRT( N1(IAXIS)**2._EB + N1(JAXIS)**2._EB )
       N1 = N1 * NMNL**(-1._EB)

       ! Centroid of WS elem 2:
       ELEM2(NOD1:NOD3)  = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL2-1)+1:NODS_WSEL*IWSEL2)
       XYZ2(IAXIS:KAXIS) = ( GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM2(NOD1)-1)+1:MAX_DIM*ELEM2(NOD1)) + &
                             GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM2(NOD2)-1)+1:MAX_DIM*ELEM2(NOD2)) + &
                             GEOMETRY(IG)%VERTS(MAX_DIM*(ELEM2(NOD3)-1)+1:MAX_DIM*ELEM2(NOD3)) ) / 3._EB
       NXYZ2(IAXIS:KAXIS)= GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,IWSEL2)
       ! Normal versor in x3p-x1 direction:
       NX3P2 = TX3P(IAXIS)*NXYZ2(X2AXIS) + TX3P(JAXIS)*NXYZ2(X3AXIS)
       N2(IAXIS:JAXIS) = (/ NX3P2, NXYZ2(X1AXIS) /)
       NMNL = SQRT( N2(IAXIS)**2._EB + N2(JAXIS)**2._EB )
       N2 = N2 * NMNL**(-1._EB)

       ! Define points in plane x3p-x1:
       ! vertex point:
       X3PVERT = TX3P(IAXIS)*XP1(IAXIS) + TX3P(JAXIS)*XP1(JAXIS)
       PVERT(IAXIS:JAXIS) = (/ X3PVERT, X1PLN /)
       ! First triangle centroid:
       X3P1 = TX3P(IAXIS)*XYZ1(X2AXIS) + TX3P(JAXIS)*XYZ1(X3AXIS)
       P1CEN(IAXIS:JAXIS) = (/ X3P1, XYZ1(X1AXIS) /)
       ! Second triangle centroid:
       X3P2 = TX3P(IAXIS)*XYZ2(X2AXIS) + TX3P(JAXIS)*XYZ2(X3AXIS)
       P2CEN(IAXIS:JAXIS) = (/ X3P2, XYZ2(X1AXIS) /)

       VCT(1:2) = 0
       PCT(IAXIS:JAXIS,1:2) = 0._EB

       ! Segment on triangle 1:
       V1(IAXIS:JAXIS) = P1CEN(IAXIS:JAXIS) - PVERT(IAXIS:JAXIS)
       CRSSNV = N1(IAXIS)*V1(JAXIS) - N1(JAXIS)*V1(IAXIS)
       IF (CRSSNV > 0._EB) THEN
           ! v1 stays as is, and is second segment:
           VEC(IAXIS:JAXIS,2) = V1(IAXIS:JAXIS)
           PCT(IAXIS:JAXIS,2) = P1CEN(IAXIS:JAXIS)
           VCT(2) = 1
       ELSE
           ! -v1 is the first segment:
           VEC(IAXIS:JAXIS,1) = -V1(IAXIS:JAXIS)
           PCT(IAXIS:JAXIS,1) = P1CEN(IAXIS:JAXIS)
           VCT(1) = 1
       ENDIF

       ! Segment on triangle 2:
       V2(IAXIS:JAXIS) = P2CEN(IAXIS:JAXIS) - PVERT(IAXIS:JAXIS)
       CRSSNV = N2(IAXIS)*V2(JAXIS) - N2(JAXIS)*V2(IAXIS)
       IF (CRSSNV > 0._EB) THEN
           ! v2 stays as is, and is second segment:
           VEC(IAXIS:JAXIS,2) = V2(IAXIS:JAXIS)
           PCT(IAXIS:JAXIS,2) = P2CEN(IAXIS:JAXIS)
           VCT(2) = 1
       ELSE
           ! -v2 is the first segment:
           VEC(IAXIS:JAXIS,1) = -V2(IAXIS:JAXIS)
           PCT(IAXIS:JAXIS,1) = P2CEN(IAXIS:JAXIS)
           VCT(1) = 1
       ENDIF

       IF ( (VCT(1) == 0) .OR. (VCT(2) == 0) ) THEN
          print*, "Error GET_BODINT_PLANE: One component of vct == 0."
       ENDIF

       ! Cross product of v1 and v2 gives magnitude along x2p axis:
       CTST = VEC(IAXIS,1)*VEC(JAXIS,2) - VEC(JAXIS,1)*VEC(IAXIS,2)

       ! Now tests:
       ! Start with SOLID GASPHASE  definition for segtype:
       BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG) = (/ IBM_SOLID, IBM_GASPHASE /)

       ! Test for SOLID SOLID condition:
       IF ( ((PCT(JAXIS,1)-X1PLN) > -GEOMEPS) .AND.  &
            ((PCT(JAXIS,2)-X1PLN) > -GEOMEPS) .AND. (CTST < GEOMEPS) ) THEN
           BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG) = (/ IBM_SOLID, IBM_SOLID /)
           CYCLE
       ELSEIF (((PCT(JAXIS,1)-X1PLN) < GEOMEPS) .AND. &
              ((PCT(JAXIS,2)-X1PLN) < GEOMEPS) .AND. (CTST < GEOMEPS) ) THEN
           BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG) = (/ IBM_SOLID, IBM_SOLID /)
           CYCLE
       ENDIF

       ! Test for GASPHASE GASPHASE condition:
       IF ( ((PCT(JAXIS,1)-X1PLN) > GEOMEPS) .AND.  &
            ((PCT(JAXIS,2)-X1PLN) > GEOMEPS) .AND. (CTST > GEOMEPS) ) THEN
            BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG) = (/ IBM_GASPHASE, IBM_GASPHASE /)
            CYCLE
       ELSEIF (((PCT(JAXIS,1)-X1PLN) < -GEOMEPS) .AND.  &
              ((PCT(JAXIS,2)-X1PLN) < -GEOMEPS) .AND. (CTST > GEOMEPS) ) THEN
            BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG) = (/ IBM_GASPHASE, IBM_GASPHASE /)
            CYCLE
       ENDIF

    ENDIF
ENDDO


! For the time being, as BODINT_PLANE is used to create Cartesian face cut-faces
! We eliminate from the list the SEGTYPE=[SOLID SOLID] segments:
ALLOCATE(SEGAUX(NOD1:NOD2,BODINT_PLANE%NSEGS))
ALLOCATE(INDSEGAUX(IBM_MAX_WSTRIANG_SEG+2,BODINT_PLANE%NSEGS))
ALLOCATE(SEGTYPEAUX(NOD1:NOD2,BODINT_PLANE%NSEGS))

ISEG_NEW = 0
IF(.NOT.TRI_ONPLANE_ONLY) THEN
   DO ISEG=1,BODINT_PLANE%NSEGS
       IF ( (BODINT_PLANE%SEGTYPE(NOD1,ISEG) == IBM_SOLID) .AND. &
            (BODINT_PLANE%SEGTYPE(NOD2,ISEG) == IBM_SOLID) ) CYCLE

          ISEG_NEW = ISEG_NEW + 1
          SEGAUX(NOD1:NOD2,ISEG_NEW) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
          INDSEGAUX(1:IBM_MAX_WSTRIANG_SEG+2,ISEG_NEW) = &
             BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,ISEG)
          SEGTYPEAUX(NOD1:NOD2,ISEG_NEW) = BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)
   ENDDO
ELSE
   DO ISEG=1,BODINT_PLANE%NSEGS
       IF ( (BODINT_PLANE%SEGTYPE(NOD1,ISEG) == IBM_SOLID) .AND. &
            (BODINT_PLANE%SEGTYPE(NOD2,ISEG) == IBM_SOLID) ) THEN

          ISEG_NEW = ISEG_NEW + 1
          SEGAUX(NOD1:NOD2,ISEG_NEW) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
          INDSEGAUX(1:IBM_MAX_WSTRIANG_SEG+2,ISEG_NEW) = &
             BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,ISEG)
          SEGTYPEAUX(NOD1:NOD2,ISEG_NEW) = BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)
       ENDIF
   ENDDO
ENDIF

BODINT_PLANE%NSEGS = ISEG_NEW
BODINT_PLANE%SEGS(NOD1:NOD2,1:ISEG_NEW) = SEGAUX(NOD1:NOD2,1:ISEG_NEW)
BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,1:ISEG_NEW) = INDSEGAUX(1:IBM_MAX_WSTRIANG_SEG+2,1:ISEG_NEW)
BODINT_PLANE%SEGTYPE(NOD1:NOD2,1:ISEG_NEW) = SEGTYPEAUX(NOD1:NOD2,1:ISEG_NEW)

DEALLOCATE(SEGAUX,INDSEGAUX,SEGTYPEAUX)

IF(TRI_ONPLANE_ONLY .OR. (BODINT_PLANE%NSEGS == 0)) THEN
   T_CC_USED(GET_BODINT_PLANE_TIME_INDEX) = T_CC_USED(GET_BODINT_PLANE_TIME_INDEX) + CURRENT_TIME() - TNOW
   RETURN
ENDIF

! Segments Crossings fields:
! Initialize nbcross with segment nodes locations:
IF ( ALLOCATED(BODINT_PLANE%NBCROSS) )   DEALLOCATE(BODINT_PLANE%NBCROSS)
IF ( ALLOCATED(BODINT_PLANE%SVAR) )      DEALLOCATE(BODINT_PLANE%SVAR)
ALLOCATE(BODINT_PLANE%NBCROSS(1:BODINT_PLANE%NSEGS),BODINT_PLANE%SVAR(1:IBM_DELTA_NBCROSS,1:BODINT_PLANE%NSEGS))
BODINT_PLANE%NBCROSS(1:BODINT_PLANE%NSEGS)                   =  0
BODINT_PLANE%SVAR(1:IBM_DELTA_NBCROSS,1:BODINT_PLANE%NSEGS)  = -1._EB

BODINT_PLANE%BOX(LOW_IND:HIGH_IND,IAXIS:KAXIS) = 0._EB
BODINT_PLANE%BOX(LOW_IND, X2AXIS) = MINVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))-10._EB*GEOMEPS
BODINT_PLANE%BOX(HIGH_IND,X2AXIS) = MAXVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))+10._EB*GEOMEPS
BODINT_PLANE%BOX(LOW_IND, X3AXIS) = MINVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))-10._EB*GEOMEPS
BODINT_PLANE%BOX(HIGH_IND,X3AXIS) = MAXVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))+10._EB*GEOMEPS
IF (RAYTRACE_X2_ONLY) THEN
   AXIS = X3AXIS
   BODINT_PLANE%TBAXIS(AXIS)%DELBIN = BODINT_PLANE%BOX(HIGH_IND,AXIS)-BODINT_PLANE%BOX(LOW_IND,AXIS)
   IBIN =      1
   BODINT_PLANE%TBAXIS(AXIS)%N_BINS = IBIN
   ! If needed, deallocate the TRIBIN container for this AXIS:
   IF(ALLOCATED(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN)) DEALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN)
   ALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN))
   BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%X1_LOW   = BODINT_PLANE%BOX( LOW_IND,AXIS)
   BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%X1_HIGH  = BODINT_PLANE%BOX(HIGH_IND,AXIS)
   BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%NTL      = BODINT_PLANE%NSEGS
   ALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(BODINT_PLANE%NSEGS))
   DO ISEG=1,BODINT_PLANE%NSEGS; BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(ISEG) = ISEG; ENDDO
   RETURN
ENDIF


! Initialize nbcross with segment nodes locations:
! Add segment ends as crossings:
ALLOCATE(SEGS_NODE(BODINT_PLANE%NNODS)); SEGS_NODE = 0
MEAN_SLEN=0._EB
DO ISEG=1,BODINT_PLANE%NSEGS

   ! End nodes to cross:
   SEG(NOD1:NOD2) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)

   IF(ANY(BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)/=IBM_GASPHASE)) THEN
      SEGS_NODE(SEG(NOD1)) = SEGS_NODE(SEG(NOD1)) + 1
      SEGS_NODE(SEG(NOD2)) = SEGS_NODE(SEG(NOD2)) + 1
   ENDIF

   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD1))
   XYZ2(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD2))

   ! Is segment aligned with x3 direction?
   BODINT_PLANE%X3ALIGNED(ISEG) = (ABS(XYZ2(X2AXIS)-XYZ1(X2AXIS)) < GEOMEPS)
   ! Is segment aligned with x2 rays?:
   BODINT_PLANE%X2ALIGNED(ISEG) = (ABS(XYZ2(X3AXIS)-XYZ1(X3AXIS)) < GEOMEPS)

   ! x2_x3 of segment point 1:
   X2_1 = XYZ1(X2AXIS); X3_1 = XYZ1(X3AXIS)
   ! x2_x3 of segment point 2:
   X2_2 = XYZ2(X2AXIS); X3_2 = XYZ2(X3AXIS)

   ! Segment length:
   SLEN = SQRT( (X2_2-X2_1)**2._EB + (X3_2-X3_1)**2._EB )
   MEAN_SLEN = MEAN_SLEN + SLEN

   ! First node:
   SBOD = 0._EB
   ! Add crossing to BODINT_PLANE:
   NBCROSS = BODINT_PLANE%NBCROSS(ISEG) + 1
   BODINT_PLANE%NBCROSS(ISEG) = NBCROSS
   BODINT_PLANE%SVAR(NBCROSS,ISEG) = SBOD

   ! Second node:
   SBOD = SLEN
   ! Add crossing to BODINT_PLANE:
   NBCROSS = BODINT_PLANE%NBCROSS(ISEG) + 1
   BODINT_PLANE%NBCROSS(ISEG) = NBCROSS
   BODINT_PLANE%SVAR(NBCROSS,ISEG) = SBOD

ENDDO

! Spread Segments in BINs in the x2-x3 directions:
MEAN_SLEN          = MEAN_SLEN / REAL(BODINT_PLANE%NSEGS,EB)
VAXIS(IAXIS:JAXIS) = (/ X2AXIS, X3AXIS /)
DO I = 1,2
   AXIS = VAXIS(I)
   LXI  = BODINT_PLANE%BOX(HIGH_IND,AXIS)-BODINT_PLANE%BOX(LOW_IND,AXIS)
   IF (BODINT_PLANE%NSEGS < 100) THEN
      BODINT_PLANE%TBAXIS(AXIS)%N_BINS = MAX(1 ,CEILING(LXI/(MEAN_SLEN)))
   ELSE
      BODINT_PLANE%TBAXIS(AXIS)%N_BINS = MAX(10,CEILING(LXI/(MEAN_SLEN)))
   ENDIF

   ! Allocate TRIBIN field:
   IF(ALLOCATED(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN)) DEALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN)
   ALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(1:BODINT_PLANE%TBAXIS(AXIS)%N_BINS))

   ! Set BIN boundaries and make initial allocation of TRI_LIST (here for SEGS) for each bin:
   DELBIN = LXI / REAL(BODINT_PLANE%TBAXIS(AXIS)%N_BINS,EB)
   BODINT_PLANE%TBAXIS(AXIS)%DELBIN = DELBIN
   DO IBIN=1,BODINT_PLANE%TBAXIS(AXIS)%N_BINS
      BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%X1_LOW  = BODINT_PLANE%BOX( LOW_IND,AXIS) + REAL(IBIN-1,EB)*DELBIN
      BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%X1_HIGH = BODINT_PLANE%BOX( LOW_IND,AXIS) + REAL(IBIN  ,EB)*DELBIN
      BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%NTL     = 0
      IF(ALLOCATED(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST)) &
      DEALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST)
      ALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(DELTA_SEGBIN))
   ENDDO
   ! Finally, populate TRI_LIST (here for SEGS) for AXIS bins:
   DO ISEG=1,BODINT_PLANE%NSEGS
      XIV(NOD1:NOD2) = BODINT_PLANE%XYZ(AXIS,BODINT_PLANE%SEGS(NOD1:NOD2,ISEG))
      XIV_LO  = MINVAL(XIV(NOD1:NOD2)); XIV_HI = MAXVAL(XIV(NOD1:NOD2))
      AVAL   = (XIV_LO-GEOMEPS-BODINT_PLANE%BOX(LOW_IND,AXIS))/DELBIN
      ILO_BIN= MAX(1, &
               CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE%TBAXIS(AXIS)%N_BINS,EB),ABS(AVAL)) ))
      AVAL   = (XIV_HI+GEOMEPS-BODINT_PLANE%BOX(LOW_IND,AXIS))/DELBIN
      IHI_BIN= MIN(BODINT_PLANE%TBAXIS(AXIS)%N_BINS, &
               CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE%TBAXIS(AXIS)%N_BINS,EB),ABS(AVAL)) ))
      DO IBIN=ILO_BIN,IHI_BIN
         NTL = BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%NTL + 1
         SZE = SIZE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST,DIM=1)
         IF (NTL > SZE) THEN
            ! Reallocate:
            ALLOCATE(TRI_LIST(1:SZE)); TRI_LIST(1:SZE)=BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(1:SZE)
            DEALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST)
            ALLOCATE(BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(1:SZE+DELTA_SEGBIN))
            BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(1:SZE) = TRI_LIST(1:SZE)
            DEALLOCATE(TRI_LIST)
         ENDIF
         ! Add Triangle index to BINs TRI_LIST
         BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%NTL = NTL
         BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(NTL) = ISEG
      ENDDO
   ENDDO
ENDDO

! Add Segments intersections:
DO IBIN=1,BODINT_PLANE%TBAXIS(AXIS)%N_BINS
   NTL = BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%NTL
   ! Now double loop, cost O(1/2*NTL^2):
   DO BISEG=1,NTL
      ISEGV(EDG1) = BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(BISEG)
      SEGV(NOD1:NOD2,EDG1) =   BODINT_PLANE%SEGS(NOD1:NOD2,ISEGV(EDG1))
      P1(IAXIS:JAXIS)      = (/BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1,EDG1)), BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1,EDG1))/)
      D1(IAXIS:JAXIS)      = (/BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD2,EDG1)), BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD2,EDG1))/)
      D1 = D1 - P1
      S1_X2_MIN=MINVAL(BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1:NOD2,EDG1)))
      S1_X2_MAX=MAXVAL(BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1:NOD2,EDG1)))
      S1_X3_MIN=MINVAL(BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1:NOD2,EDG1)))
      S1_X3_MAX=MAXVAL(BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1:NOD2,EDG1)))
      DO BIISEG=BISEG+1,NTL
         ! Test for segment-segment intersection:
         ISEGV(EDG2) = BODINT_PLANE%TBAXIS(AXIS)%TRIBIN(IBIN)%TRI_LIST(BIISEG)
         SEGV(NOD1:NOD2,EDG2) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEGV(EDG2))
         P2(IAXIS:JAXIS)      = (/BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1,EDG2)), BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1,EDG2))/)
         D2(IAXIS:JAXIS)      = (/BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD2,EDG2)), BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD2,EDG2))/)
         D2 = D2 - P2

         ! Tests for quick discard:
         IF( MAXVAL(BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1:NOD2,EDG2)))+GEOMEPS < S1_X2_MIN) CYCLE
         IF( MINVAL(BODINT_PLANE%XYZ(X2AXIS,SEGV(NOD1:NOD2,EDG2)))-GEOMEPS > S1_X2_MAX) CYCLE
         IF( MAXVAL(BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1:NOD2,EDG2)))+GEOMEPS < S1_X3_MIN) CYCLE
         IF( MINVAL(BODINT_PLANE%XYZ(X3AXIS,SEGV(NOD1:NOD2,EDG2)))-GEOMEPS > S1_X3_MAX) CYCLE

         ! Test for segment-segment intersection:
         CALL GET_SEGSEG_INTERSECTION(P1,D1,P2,D2,SVARV,SLENV,INT_FLG)

         ! Now discard repeated intersections:
         ! If crossing is already defined in SEG don't add:
         DO ICROSS=1,INT_FLG
           DO ISX = EDG1,EDG2
               SBOD = SVARV(ICROSS,ISX)
               ! Discard intersections already present in segment, including ends:
               INLIST = .FALSE.
               DO ISVAR=1,BODINT_PLANE%NBCROSS(ISEGV(ISX))
                  IF ( ABS(SBOD-BODINT_PLANE%SVAR(ISVAR,ISEGV(ISX))) < GEOMEPS ) THEN
                      INLIST = .TRUE.
                      EXIT
                  ENDIF
               ENDDO
               IF (INLIST) CYCLE

               ! Add crossing to BODINT_PLANE, insertion sort:
               NBCROSS  = BODINT_PLANE%NBCROSS(ISEGV(ISX)) + 1
               BODINT_PLANE%SVAR(NBCROSS,ISEGV(ISX)) = 1._EB/GEOMEPS
               DO IBCR=1,NBCROSS
                  IF ( SBOD < BODINT_PLANE%SVAR(IBCR,ISEGV(ISX)) ) EXIT
               ENDDO
               IBCR = MIN(IBCR,NBCROSS)

               ! Here copy from the back (updated nbcross) to the ibcr location:
               DO IDUM = NBCROSS,IBCR+1,-1
                  BODINT_PLANE%SVAR(IDUM,ISEGV(ISX)) = BODINT_PLANE%SVAR(IDUM-1,ISEGV(ISX))
               ENDDO
               BODINT_PLANE%SVAR(IBCR,ISEGV(ISX)) = SBOD
               BODINT_PLANE%NBCROSS(ISEGV(ISX))   = NBCROSS

               ! Here we have an intersection inside a segment, note it in FACERT:
               IF ( ISX==EDG1 ) THEN
                   ! X2AXIS, X3AXIS location of intersection:
                   XY(IAXIS:JAXIS) = P1(IAXIS:JAXIS) + SBOD*D1(IAXIS:JAXIS)/NORM2(D1(IAXIS:JAXIS))
               ELSE
                   ! X2AXIS, X3AXIS location of intersection:
                   XY(IAXIS:JAXIS) = P2(IAXIS:JAXIS) + SBOD*D2(IAXIS:JAXIS)/NORM2(D2(IAXIS:JAXIS))
               ENDIF
               XPOS = XY(IAXIS)
               IF ( X2NOC==0 ) THEN
                   JJ2_LO  = FLOOR((XPOS-GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
                   JJ2_HI  = FLOOR((XPOS+GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
                   IF (ALL((/JJ2_LO,JJ2_HI/) < X2LO_CELL) .OR. ALL((/JJ2_LO,JJ2_HI/) > X2HI_CELL)) CYCLE
                   JJ2_LO = MAX(JJ2_LO,X2LO_CELL); JJ2_HI = MIN(JJ2_HI,X2HI_CELL)
               ELSE
                   FOUND_SEG = .FALSE.; JJ2_LO = -100; JJ2_HI = -100
                   DO JJ2=X2LO_CELL,X2HI_CELL
                       ! Check if XPOS is within this segment JJ2:
                       IF ( ((XPOS-X2FACE(JJ2-1))>-GEOMEPS) .AND. ((X2FACE(JJ2)-XPOS)>-GEOMEPS) ) THEN
                           IF (JJ2_LO > -100) THEN
                               JJ2_HI = JJ2
                               EXIT
                           ELSE
                               JJ2_LO = JJ2
                               JJ2_HI = JJ2
                           ENDIF
                           FOUND_SEG = .TRUE.
                       ENDIF
                   ENDDO
                   IF (.NOT.FOUND_SEG) CYCLE
               ENDIF
               XPOS = XY(JAXIS)
               IF ( X3NOC==0 ) THEN
                   KK2_LO  = FLOOR((XPOS-GEOMEPS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
                   KK2_HI  = FLOOR((XPOS+GEOMEPS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
                   IF (ALL((/KK2_LO,KK2_HI/) < X3LO_CELL) .OR. ALL((/KK2_LO,KK2_HI/) > X3HI_CELL)) CYCLE
                   KK2_LO = MAX(KK2_LO,X3LO_CELL); KK2_HI = MIN(KK2_HI,X3HI_CELL)
               ELSE
                   FOUND_SEG = .FALSE.; KK2_LO = -100; KK2_HI = -100
                   DO KK2=X3LO_CELL,X3HI_CELL
                       ! Check if XPOS is within this segment KK2:
                       IF ( ((XPOS-X3FACE(KK2-1))>-GEOMEPS) .AND. ((X3FACE(KK2)-XPOS)>-GEOMEPS) ) THEN
                           IF (KK2_LO > -100) THEN
                               KK2_HI = KK2
                               EXIT
                           ELSE
                               KK2_LO = KK2
                               KK2_HI = KK2
                           ENDIF
                           FOUND_SEG = .TRUE.
                       ENDIF
                   ENDDO
                   IF (.NOT.FOUND_SEG) CYCLE
               ENDIF

               ! Here JJ2 and KK2 have the face containing the intersection:
               DO KK2=KK2_LO,KK2_HI
                   DO JJ2=JJ2_LO,JJ2_HI
                       FACERT(JJ2,KK2) = .TRUE.
                   ENDDO
               ENDDO

            ENDDO
         ENDDO
      ENDDO
   ENDDO
ENDDO


! Loop nodes and test in SEG_NODES: if more than 2 segments end in the
! node, note it in FACERT.
MAX_SEG_NODE = MAXVAL(SEGS_NODE(1:BODINT_PLANE%NNODS))
ALLOCATE(ISEG_NODE(MAX_SEG_NODE+1,BODINT_PLANE%NNODS)); ISEG_NODE = 0
ALLOCATE(ANGS_NODE(MAX_SEG_NODE  ,BODINT_PLANE%NNODS)); ANGS_NODE = 0._EB
ANGNODE_LOOP : DO ISEG=1,BODINT_PLANE%NSEGS
   ! End nodes to cross:
   IF( ANY(BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)/=IBM_GASPHASE) ) THEN
      SEG(NOD1:NOD2) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
      DX2 = BODINT_PLANE%XYZ(X2AXIS,SEG(NOD2))-BODINT_PLANE%XYZ(X2AXIS,SEG(NOD1))
      DX3 = BODINT_PLANE%XYZ(X3AXIS,SEG(NOD2))-BODINT_PLANE%XYZ(X3AXIS,SEG(NOD1))
      NOD_LOOP : DO INOD=NOD1,NOD2
         ! Compute angle, for NOD2 the seg andgle is -ANG.
         ANG=REAL(NOD2-INOD,EB)*ATAN2(DX3,DX2) + REAL(INOD-NOD1,EB)*ATAN2(-DX3,-DX2)
         IF(ANG < 0._EB) ANG = ANG + TWOPI ! Make angle from 0 to 2*pi.
         ! Insert-add segment into ISEG_NODE depending on angle value:
         NSN                      = ISEG_NODE(1,SEG(INOD))
         ISEG_NODE(1  ,SEG(INOD)) = NSN+1
         FOUND_SEG=.FALSE.; ISEG2=1
         IF (NSN>0) THEN
             DO ISEG2=1,NSN
                 IF (ANGS_NODE(ISEG2,SEG(INOD)) > ANG) THEN
                     FOUND_SEG=.TRUE.; EXIT
                 ENDIF
             ENDDO
         ENDIF
         IF (FOUND_SEG) THEN
            DO ISEG3=NSN+1,ISEG2+1,-1
                ISEG_NODE(ISEG3+1,SEG(INOD)) = ISEG_NODE(ISEG3  ,SEG(INOD))
                ANGS_NODE(ISEG3  ,SEG(INOD)) = ANGS_NODE(ISEG3-1,SEG(INOD))
            ENDDO
         ENDIF
         ISEG_NODE(ISEG2+1,SEG(INOD)) =  ISEG
         ANGS_NODE(ISEG2  ,SEG(INOD)) =   ANG
      ENDDO NOD_LOOP
   ENDIF
ENDDO ANGNODE_LOOP

ALLOCATE(CIRC_MED(MAX_SEG_NODE+1))
INOD_LOOP : DO INOD = 1,BODINT_PLANE%NNODS
    IF (SEGS_NODE(INOD) < 3) CYCLE INOD_LOOP

    ! Test case of even number of segments:
    IF (MOD(SEGS_NODE(INOD),2)==0) THEN ! Case of even number of segments.
       ! Test if circling around the node we have media discontinuity.
       NSN=ISEG_NODE(1,INOD); COUNT=0
       DO ISEG2=2,NSN+1
          ISEG =ISEG_NODE(ISEG2,INOD)
          COUNT=COUNT+1
          SEG  = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
          IF (INOD==SEG(NOD2)) THEN
             CIRC_MED(COUNT) = BODINT_PLANE%SEGTYPE(NOD2,ISEG)
          ELSE
             CIRC_MED(COUNT) = BODINT_PLANE%SEGTYPE(NOD1,ISEG)
          ENDIF
       ENDDO
       CIRC_MED(COUNT+1)=CIRC_MED(1)
       CRS_FLG=.FALSE.
       DO COUNT=1,NSN
           IF(CIRC_MED(COUNT)==CIRC_MED(COUNT+1)) THEN
               CRS_FLG=.TRUE.; EXIT
           ENDIF
       ENDDO
       IF (.NOT.CRS_FLG) CYCLE INOD_LOOP
    ENDIF

    ! X2AXIS, X3AXIS location of intersection:
    XY(IAXIS:JAXIS) = (/BODINT_PLANE%XYZ(X2AXIS,INOD), BODINT_PLANE%XYZ(X3AXIS,INOD)/)
    XPOS = XY(IAXIS)
    IF ( X2NOC==0 ) THEN
       JJ2_LO  = FLOOR((XPOS-GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
       JJ2_HI  = FLOOR((XPOS+GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
       IF (ALL((/JJ2_LO,JJ2_HI/) < X2LO_CELL) .OR. ALL((/JJ2_LO,JJ2_HI/) > X2HI_CELL)) CYCLE INOD_LOOP
       JJ2_LO = MAX(JJ2_LO,X2LO_CELL); JJ2_HI = MIN(JJ2_HI,X2HI_CELL)
    ELSE
       FOUND_SEG = .FALSE.; JJ2_LO = -100; JJ2_HI = -100
       DO JJ2=X2LO_CELL,X2HI_CELL
           ! Check if XPOS is within this segment JJ2:
           IF ( ((XPOS-X2FACE(JJ2-1))>-GEOMEPS) .AND. ((X2FACE(JJ2)-XPOS)>-GEOMEPS) ) THEN
               IF (JJ2_LO > -100) THEN
                   JJ2_HI = JJ2
                   EXIT
               ELSE
                   JJ2_LO = JJ2
                   JJ2_HI = JJ2
               ENDIF
               FOUND_SEG = .TRUE.
           ENDIF
       ENDDO
       IF (.NOT.FOUND_SEG) CYCLE INOD_LOOP
    ENDIF
    XPOS = XY(JAXIS)
    IF ( X3NOC==0 ) THEN
       KK2_LO  = FLOOR((XPOS-GEOMEPS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
       KK2_HI  = FLOOR((XPOS+GEOMEPS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
       IF (ALL((/KK2_LO,KK2_HI/) < X3LO_CELL) .OR. ALL((/KK2_LO,KK2_HI/) > X3HI_CELL)) CYCLE INOD_LOOP
       KK2_LO = MAX(KK2_LO,X3LO_CELL); KK2_HI = MIN(KK2_HI,X3HI_CELL)
    ELSE
       FOUND_SEG = .FALSE.; KK2_LO = -100; KK2_HI = -100
       DO KK2=X3LO_CELL,X3HI_CELL
           ! Check if XPOS is within this segment KK2:
           IF ( ((XPOS-X3FACE(KK2-1))>-GEOMEPS) .AND. ((X3FACE(KK2)-XPOS)>-GEOMEPS) ) THEN
               IF (KK2_LO > -100) THEN
                   KK2_HI = KK2
                   EXIT
               ELSE
                   KK2_LO = KK2
                   KK2_HI = KK2
               ENDIF
               FOUND_SEG = .TRUE.
           ENDIF
       ENDDO
       IF (.NOT.FOUND_SEG) CYCLE INOD_LOOP
    ENDIF

    ! Here JJ2 and KK2 have the face containing the intersection:
    DO KK2=KK2_LO,KK2_HI
        DO JJ2=JJ2_LO,JJ2_HI
            FACERT(JJ2,KK2) = .TRUE.
        ENDDO
    ENDDO
ENDDO INOD_LOOP
DEALLOCATE(SEGS_NODE,ISEG_NODE,ANGS_NODE,CIRC_MED)

T_CC_USED(GET_BODINT_PLANE_TIME_INDEX) = T_CC_USED(GET_BODINT_PLANE_TIME_INDEX) + CURRENT_TIME() - TNOW

IF (DEBUG_SET_CUTCELLS) THEN
   ! Write out:
   IF(INDX1 < 0) THEN
   WRITE(BIPL_FILE,'(A,A,I3.3,A,I1.1,A,I2.1,A)') TRIM(CHID),'_BODINT_PLANE_',MY_RANK,'_',X1AXIS,'_',INDX1,'.csv'
   ELSE
   WRITE(BIPL_FILE,'(A,A,I3.3,A,I1.1,A,I2.2,A)') TRIM(CHID),'_BODINT_PLANE_',MY_RANK,'_',X1AXIS,'_',INDX1,'.csv'
   ENDIF
   LU_DB_SETCC = GET_FILE_NUMBER()
   OPEN(LU_DB_SETCC,FILE=TRIM(BIPL_FILE),STATUS='UNKNOWN')
   WRITE(LU_DB_SETCC,*) 'X1AXIS,X2AXIS,X3AXIS,X1PLN,GEOMEPS'
   WRITE(LU_DB_SETCC,*) X1AXIS,X2AXIS,X3AXIS,X1PLN,GEOMEPS
   WRITE(LU_DB_SETCC,*) 'NNODS, NSEGS, NSGLS, NTRIS'
   WRITE(LU_DB_SETCC,*) BODINT_PLANE%NNODS,BODINT_PLANE%NSEGS,BODINT_PLANE%NSGLS,BODINT_PLANE%NTRIS
   DO INOD=1,BODINT_PLANE%NNODS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%XYZ(IAXIS:KAXIS,INOD)
   END DO
   DO INOD=1,BODINT_PLANE%NNODS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%NOD_PERM(INOD)
   ENDDO
   DO ISEG=1,BODINT_PLANE%NSEGS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   END DO
   DO ISEG=1,BODINT_PLANE%NSEGS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG)
   END DO
   DO ISGL=1,BODINT_PLANE%NSGLS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%SGLS(NOD1,ISGL)
   END DO
   DO ITRI=1,BODINT_PLANE%NTRIS
      WRITE(LU_DB_SETCC,*) BODINT_PLANE%TRIS(NOD1:NOD3,ITRI)
   ENDDO
   CLOSE(333)
ENDIF

RETURN
END SUBROUTINE GET_BODINT_PLANE


! ------------------------ GET_SEGSEG_INTERSECTION ------------------------------

SUBROUTINE GET_SEGSEG_INTERSECTION(P1,D1,P2,D2,SVARV,SLENV,INT_FLG)

REAL(EB), INTENT(IN) :: P1(IAXIS:JAXIS),D1(IAXIS:JAXIS),P2(IAXIS:JAXIS),D2(IAXIS:JAXIS)
REAL(EB), INTENT(OUT):: SVARV(NOD1:NOD2,EDG1:EDG2), SLENV(EDG1:EDG2)
INTEGER,  INTENT(OUT):: INT_FLG

! Local Variables:
REAL(EB) :: SVR, TVR, KRS, KRS2, E2, L12, L22, E(IAXIS:JAXIS), S1, S2, SMIN, SMAX

! Test for segment-segment intersection:
E(IAXIS:JAXIS) = P2(IAXIS:JAXIS) - P1(IAXIS:JAXIS)
KRS = D1(IAXIS)*D2(JAXIS) - D1(JAXIS)*D2(IAXIS); KRS2=KRS**2._EB
L12 = D1(IAXIS)**2._EB + D1(JAXIS)**2._EB
L22 = D2(IAXIS)**2._EB + D2(JAXIS)**2._EB
! Case of segments not parallel.
IF ( KRS2 > GEOMEPS**2._EB*L12*L22) THEN
    SVR = (E(IAXIS)*D2(JAXIS)-E(JAXIS)*D2(IAXIS))/ KRS
    IF ( (SVR<-GEOMEPS) .OR. ((SVR-1._EB)>GEOMEPS) ) THEN
        ! intersection not a point of segment SEG.
        INT_FLG = 0
        RETURN
    ENDIF
    TVR = (E(IAXIS)*D1(JAXIS)-E(JAXIS)*D1(IAXIS))/ KRS
    IF ( (TVR<-GEOMEPS) .OR. ((TVR-1._EB)>GEOMEPS) ) THEN
        ! intersection not a point of segment SEG2.
        INT_FLG = 0
        RETURN
    ENDIF
    ! Intersection a point on SEG and SEG2.
    SLENV(EDG1)      = SQRT(L12)
    SLENV(EDG2)      = SQRT(L22)
    SVARV(NOD1,EDG1) = SVR*SLENV(EDG1)
    SVARV(NOD1,EDG2) = TVR*SLENV(EDG2)
    INT_FLG=1
    RETURN
ENDIF

! Parallel Segments:
E2 = E(IAXIS)**2._EB + E(JAXIS)**2._EB
KRS= E(IAXIS)*D1(JAXIS) - E(JAXIS)*D1(IAXIS); KRS2=KRS**2._EB
IF ( KRS2 > GEOMEPS**2._EB*L12*E2 ) THEN
    ! Segments are different.
    INT_FLG = 0
    RETURN
ENDIF
! Segment lines are the same.
S1  = DOT_PRODUCT(D1,E)/L12; S2 = S1+DOT_PRODUCT(D1,D2)/L12
SMIN=MIN(S1,S2); SMAX=MAX(S1,S2)
IF ( (1._EB+GEOMEPS) < SMIN .OR. (0._EB-GEOMEPS) > SMAX) THEN
    INT_FLG = 0
    RETURN
ENDIF
! Overlap tests:
SLENV(EDG1)      = SQRT(L12)
SLENV(EDG2)      = SQRT(L22)
IF ( (1._EB+GEOMEPS) > SMIN ) THEN ! SMIN between P1 and P1+D1
    IF ( (0._EB-GEOMEPS) < SMAX) THEN ! SMAX greater that P1
       IF (0._EB < SMIN) THEN ! SMIN higher that P1
           SVARV(NOD1,EDG1) = SMIN*SLENV(EDG1) ! First crossing on P1-P1+D1
           IF (ABS(SMIN-S1) < GEOMEPS/2._EB) THEN ! SMIN is P2
               SVARV(NOD1,EDG2)=0._EB ! First crossing in P2-P2+D2
           ELSE ! SMIN is P2+D2
               SVARV(NOD2,EDG2)=1._EB*SLENV(EDG2) ! Second crossing in P2-P2+D2
           ENDIF
       ELSE ! SMIN lower than P1
           SVARV(NOD1,EDG1) = 0._EB ! First crossing in P1-P1+D1
           IF (ABS(SMIN-S1) < GEOMEPS/2._EB) THEN ! SMIN os P2
               SVARV(NOD1,EDG2)=-SMIN*SLENV(EDG1) ! First crossing in P2-P2-D2
           ELSE
               SVARV(NOD2,EDG2)=SMAX*SLENV(EDG1)
           ENDIF
       ENDIF
       IF (1._EB > SMAX) THEN
           SVARV(NOD2,EDG1) = SMAX*SLENV(EDG1)
           IF (ABS(SMAX-S1) < GEOMEPS/2._EB) THEN ! SMAX is P2
               SVARV(NOD1,EDG2)=0._EB*SLENV(EDG2)
           ELSE
               SVARV(NOD2,EDG2)=1._EB*SLENV(EDG2)
           ENDIF
       ELSE
           SVARV(NOD2,EDG1) = 1._EB*SLENV(EDG1)
           IF (ABS(SMAX-S1) < GEOMEPS/2._EB) THEN ! SMAX is P2
               SVARV(NOD1,EDG2)=(SMAX-1._EB)*SLENV(EDG1)
           ELSE
               SVARV(NOD2,EDG2)=(1._EB-SMIN)*SLENV(EDG1)
           ENDIF
       ENDIF
       INT_FLG = 2
    ELSE
       ! SMAX = 0._EB
       SVARV(NOD1,EDG1) = 0._EB
       IF (ABS(SMAX-S1) < GEOMEPS/2._EB) THEN
           SVARV(NOD1,EDG2) = 0._EB
       ELSE
           SVARV(NOD1,EDG2) = 1._EB*SLENV(EDG2)
       ENDIF
       INT_FLG = 1
    ENDIF
ELSE
    ! SMIN = 1._EB
    SVARV(NOD1,EDG1) = 1._EB*SLENV(EDG1)
    IF (ABS(SMIN-S1) < GEOMEPS/2._EB) THEN
        SVARV(NOD1,EDG2) = 0._EB
    ELSE
        SVARV(NOD1,EDG2) = 1._EB*SLENV(EDG2)
    ENDIF
    INT_FLG = 1
ENDIF

RETURN
END SUBROUTINE GET_SEGSEG_INTERSECTION

! -------------------------- GET_X2INTERSECTIONS --------------------------------

SUBROUTINE GET_X2_INTERSECTIONS(X1AXIS,X2AXIS,X3AXIS,X3RAY,X1PLN)

INTEGER, INTENT(IN) :: X1AXIS, X2AXIS, X3AXIS
REAL(EB),INTENT(IN) :: X3RAY,X1PLN

! Local Variables:
INTEGER :: ISGL, SGL, ISEG, SEG(NOD1:NOD2)
REAL(EB):: XYZ1(MAX_DIM), XYZ2(MAX_DIM), X2_1, X2_2, X3_1, X3_2, DOT1, DOT2
REAL(EB):: SVARI, STANI(IAXIS:JAXIS)
INTEGER :: ICRSI(LOW_IND:HIGH_IND+1), SCRSI, ISSEG(LOW_IND:HIGH_IND), GAM(LOW_IND:HIGH_IND)
REAL(EB):: X3MIN, X3MAX, DV12(MAX_DIM), MODTI, NOMLI(IAXIS:JAXIS)
LOGICAL :: OUTRAY
REAL(EB):: DELBIN, AVAL
INTEGER :: ILO_BIN,IHI_BIN,IBIN,IISEG,ICR

REAL(EB) :: TNOW
! INTEGER :: IAUX

TNOW = CURRENT_TIME()

! Initialize crossings arrays:
IBM_N_CRS        = 0
IBM_SVAR_CRS     = 1._EB / GEOMEPS
IBM_IS_CRS       = IBM_UNDEFINED
IBM_IS_CRS2      = IBM_UNDEFINED
IBM_SEG_TAN      = 0._EB
IBM_SEG_CRS      = 0
IBM_BDNUM_CRS    = 0 ! Size (0:IBM_MAXCROSS_X2)
IBM_BDNUM_CRS_AUX= 0 ! Size (0:IBM_MAXCROSS_X2)

! First Single points:
! Treat them as [GASPHASE GASPHASE] crossings:
DO ISGL=1,BODINT_PLANE%NSGLS
   SGL = BODINT_PLANE%SGLS(NOD1,ISGL)
   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SGL)
   ! x2-x3 coordinates of point:
   X2_1 = XYZ1(X2AXIS)
   X3_1 = XYZ1(X3AXIS)

   ! Dot product dot(X_1-XRAY,e3)
   DOT1 = X3_1-X3RAY
   IF (ABS(DOT1) <= GEOMEPS) DOT1=0._EB
   IF ( ABS(DOT1) == 0._EB ) THEN
       ! Point 1:
       SVARI = X2_1
       ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_GASPHASE, IBM_GASPHASE, IBM_UNDEFINED /)
       SCRSI = -ISGL
       STANI(IAXIS:JAXIS)  = 0._EB

       ! Insertion sort:
       CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI) ! Modifies crossings arrays.
   ENDIF
ENDDO

! Now Segments:
NSEGS_COND : IF (BODINT_PLANE%NSEGS > 0) THEN

DELBIN = BODINT_PLANE%TBAXIS(X3AXIS)%DELBIN
AVAL   = (X3RAY-GEOMEPS-BODINT_PLANE%BOX(LOW_IND,X3AXIS))/DELBIN
ILO_BIN= MAX(1, &
         CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE%TBAXIS(X3AXIS)%N_BINS,EB),ABS(AVAL)) ))
AVAL   = (X3RAY+GEOMEPS-BODINT_PLANE%BOX(LOW_IND,X3AXIS))/DELBIN
IHI_BIN= MIN(BODINT_PLANE%TBAXIS(X3AXIS)%N_BINS, &
         CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE%TBAXIS(X3AXIS)%N_BINS,EB),ABS(AVAL)) ))
IBIN_DO : DO IBIN=ILO_BIN,IHI_BIN

 IF (X3RAY < BODINT_PLANE%TBAXIS(X3AXIS)%TRIBIN(IBIN)%X1_LOW -GEOMEPS) CYCLE
 IF (X3RAY > BODINT_PLANE%TBAXIS(X3AXIS)%TRIBIN(IBIN)%X1_HIGH+GEOMEPS) CYCLE

 TRIBIN_DO : DO IISEG=1,BODINT_PLANE%TBAXIS(X3AXIS)%TRIBIN(IBIN)%NTL

   ISEG = BODINT_PLANE%TBAXIS(X3AXIS)%TRIBIN(IBIN)%TRI_LIST(IISEG)
!SEGMENTS_LOOP : DO ISEG=1,BODINT_PLANE%NSEGS

   SEG(NOD1:NOD2)    = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD1))
   XYZ2(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD2))

   ! x2,x3 coordinates of segment:
   X2_1 = XYZ1(X2AXIS)
   X3_1 = XYZ1(X3AXIS) ! Lower index endpoint.
   X2_2 = XYZ2(X2AXIS)
   X3_2 = XYZ2(X3AXIS) ! Upper index endpoint.

   ! First Test if the whole segment is on one side of the Ray:
   ! Test segment crosses the ray, or is in geomepsilon proximity
   ! of it:
   X3MIN = MIN(X3_1,X3_2)
   X3MAX = MAX(X3_1,X3_2)
   OUTRAY=(((X3RAY-X3MAX) > GEOMEPS) .OR. ((X3MIN-X3RAY) > GEOMEPS))

   IF (OUTRAY) CYCLE

   DOT1 = X3_1-X3RAY
   DOT2 = X3_2-X3RAY

   IF (ABS(DOT1) <= GEOMEPS) DOT1 = 0._EB
   IF (ABS(DOT2) <= GEOMEPS) DOT2 = 0._EB

   ! Segment tangent unit vector.
   DV12(IAXIS:JAXIS) = XYZ2( (/ X2AXIS, X3AXIS /) ) - XYZ1( (/ X2AXIS, X3AXIS /) )
   MODTI = SQRT( DV12(IAXIS)**2._EB + DV12(JAXIS)**2._EB )
   STANI(IAXIS:JAXIS)  = DV12(IAXIS:JAXIS) * MODTI**(-1._EB)
   NOMLI(IAXIS:JAXIS)  = (/ STANI(JAXIS), -STANI(IAXIS) /)
   ISSEG(LOW_IND:HIGH_IND) = BODINT_PLANE%SEGTYPE(LOW_IND:HIGH_IND,ISEG)

   ! For x2, in local x2-x3 coords e2=(1,0):
   GAM(LOW_IND) = (1 + NINT(SIGN( 1._EB, NOMLI(IAXIS))) ) / 2  !(1+SIGN(DOT_PRODUCT(NOMLI,e2)))/2;
   GAM(HIGH_IND)= (1 - NINT(SIGN( 1._EB, NOMLI(IAXIS))) ) / 2  !(1-SIGN(DOT_PRODUCT(NOMLI,e2)))/2;

   ! Test if whole segment is in ray, if so add segment nodes as crossings:
   IF ( (ABS(DOT1)+ABS(DOT2)) == 0._EB ) THEN

      ! Count both points as crossings:
      ! Point 1:
      SVARI = MIN(X2_1,X2_2)
      ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_GASPHASE, IBM_SOLID, IBM_UNDEFINED /)
      SCRSI = ISEG

      ! Insertion sort:
      CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

      DO ICR=2,BODINT_PLANE%NBCROSS(ISEG)-1
          SVARI = X2_1 + BODINT_PLANE%SVAR(ICR,ISEG)*STANI(IAXIS)
          ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_SOLID, IBM_SOLID /)
          SCRSI = ISEG
          ! Insertion sort:
          CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
      ENDDO

      ! Point 2:
      SVARI = MAX(X2_1,X2_2)
      ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_GASPHASE, IBM_UNDEFINED /)
      SCRSI = ISEG

      ! Insertion sort:
      CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

      CYCLE

   ENDIF

   ! Now nodes individually:
   IF ( ABS(DOT1) == 0._EB ) THEN

      ! Point 1:
      SVARI = X2_1

      ! LOW and HIGH media type, using the segment definition:
      ICRSI(LOW_IND)   = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
      ICRSI(HIGH_IND)  = GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
      ICRSI(HIGH_IND+1)= IBM_UNDEFINED
      SCRSI = ISEG

      ! Insertion sort:
      CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

      CYCLE

   ENDIF
   IF ( ABS(DOT2) == 0._EB ) THEN

      ! Point 2:
      SVARI = X2_2

      ! LOW and HIGH_IND media type, using the segment definition:
      ICRSI(LOW_IND)    = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
      ICRSI(HIGH_IND)   = GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
      ICRSI(HIGH_IND+1) = IBM_UNDEFINED
      SCRSI = ISEG

      ! Insertion sort:
      CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

      CYCLE

   ENDIF

   ! Finally regular case:
   ! Points 1 on one side of ray, point 2 on the other:
   ! IF ((DOT1 > 0. .AND. DOT2 < 0.) .OR. (DOT1 < 0. .AND. DOT2 > 0.))
   IF ( DOT1*DOT2 < 0._EB ) THEN

      ! Intersection Point along segment:
      !DS    = (X3RAY-X3_1) / (X3_2-X3_1)
      !SVARI = X2_1 + DS*(X2_2-X2_1)
      SVARI = X2_1 + (X3RAY-X3_1) * (X2_2-X2_1) / (X3_2-X3_1)

      ! LOW and HIGH media type, using the segment definition:
      ICRSI(LOW_IND)    = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
      ICRSI(HIGH_IND)   = GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
      ICRSI(HIGH_IND+1) = IBM_UNDEFINED
      SCRSI = ISEG

      ! Insertion sort:
      CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

      CYCLE

   ENDIF

   print*, "Error GET_X2INTERSECTIONS: Missed segment=",ISEG

 ENDDO TRIBIN_DO
ENDDO IBIN_DO
!ENDDO SEGMENTS_LOOP

ENDIF NSEGS_COND

! Do we have any intersections?
IF ( IBM_N_CRS == 0 ) RETURN

! Collapse crossings to single SVARs:
CALL COLLAPSE_CROSSINGS(BODINT_PLANE,X1AXIS,X2AXIS,X3AXIS,X3RAY,X1PLN,1)


! Write out:
! print*, "X3RAY=",X3RAY,", Intersect X2=",IBM_N_CRS
! DO ICRS=1,IBM_N_CRS
!    print*, ICRS,", ",IBM_SVAR_CRS(ICRS),", ",IBM_IS_CRS(ICRS)
! ENDDO

T_CC_USED(GET_X2_INTERSECTIONS_TIME_INDEX) = T_CC_USED(GET_X2_INTERSECTIONS_TIME_INDEX) + CURRENT_TIME() - TNOW

RETURN
END SUBROUTINE GET_X2_INTERSECTIONS


! ------------------------ COLLAPSE_CROSSINGS -----------------------------------

SUBROUTINE COLLAPSE_CROSSINGS(BODINT_PLANE2,X1AXIS,X2AXIS,X3AXIS,X3RAY,X1PLN,ITITLE)

TYPE(BODINT_PLANE_TYPE), INTENT(IN) :: BODINT_PLANE2
INTEGER,  INTENT(IN) :: X1AXIS,X2AXIS,X3AXIS,ITITLE
REAL(EB), INTENT(IN) :: X3RAY,X1PLN

! Local Variables:
INTEGER :: IBM_N_CRS_AUX
REAL(EB):: IBM_SVAR_CRS_AUX(IBM_MAXCROSS_X2)
INTEGER :: IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_MAXCROSS_X2),BODNUM(IBM_MAXCROSS_X2)
REAL(EB):: IBM_SEG_TAN_AUX(IAXIS:JAXIS,IBM_MAXCROSS_X2)
INTEGER :: IBM_SEG_CRS_AUX(IBM_MAXCROSS_X2)
INTEGER :: CRS_NUM(IBM_MAXCROSS_X2),IND_CRS(LOW_IND:HIGH_IND,IBM_MAXCROSS_X2)
INTEGER :: LEFT_MEDIA, NCRS_REMAIN
INTEGER :: ICRS, ICRS1, ICRS2, IDCR, IDCR2, IND_LEFT, IND_RIGHT, NUBD, IBDNUM, ISEG, IUBD, SBOD
LOGICAL :: DROP_SS_GG, FOUND_LEFT, NOT_COUNTED(IBM_MAXCROSS_X2), USE_INT_POINT(IBM_MAXCROSS_X2), ALGN_CROSS
INTEGER, ALLOCATABLE, DIMENSION(:) :: UBOD

IBM_N_CRS_AUX    = 0
IBM_SVAR_CRS_AUX = 1._EB/GEOMEPS ! svar = x2_intersection
IBM_IS_CRS2_AUX  = IBM_UNDEFINED ! Is the intersection an actual GS.
IBM_SEG_CRS_AUX  = 0             ! Segment containing the crossing.
IBM_SEG_TAN_AUX  = 0._EB         ! Segment orientation for each intersection.

! Count how many crossings with different SVAR:
CRS_NUM(:)                      = 0
ICRS                            = 1
CRS_NUM(ICRS)                   = 1
IND_CRS(:,:)                    = 0
IND_CRS(LOW_IND, CRS_NUM(ICRS)) = ICRS-1
IND_CRS(HIGH_IND,CRS_NUM(ICRS)) = IND_CRS(HIGH_IND,ICRS)+1

DO ICRS=2,IBM_N_CRS
   IF ( ABS(IBM_SVAR_CRS(ICRS)-IBM_SVAR_CRS(ICRS-1)) < GEOMEPS ) THEN
      CRS_NUM(ICRS) = CRS_NUM(ICRS-1)
   ELSE
      CRS_NUM(ICRS) = CRS_NUM(ICRS-1)+1
      IND_CRS(LOW_IND,CRS_NUM(ICRS)) = ICRS-1
   ENDIF
   IND_CRS(HIGH_IND,CRS_NUM(ICRS)) = IND_CRS(HIGH_IND,CRS_NUM(ICRS))+1
ENDDO

! Computation of IBM_BDNUM_CRS_AUX requires knowledge of how many different
! bodies reach an intersection:
BODNUM(:) = 0
ALLOCATE(UBOD(N_GEOMETRY)); UBOD=0
IDCR_DO_1 : DO IDCR=1,CRS_NUM(IBM_N_CRS)
    ! Load body numbers:
    DO IDCR2=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
       ISEG=IBM_SEG_CRS(IDCR2)
       IF (ISEG > 0) BODNUM(IDCR2)=BODINT_PLANE2%INDSEG(4,ISEG)
    ENDDO
    ! Unique bodies:
    NUBD = 0
    DO IDCR2=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
        IF ( BODNUM(IDCR2)<1 ) CYCLE
        IF ((NUBD > 0) .AND. ANY(UBOD(1:NUBD)==BODNUM(IDCR2))) CYCLE
        NUBD = NUBD + 1
        UBOD(NUBD) = BODNUM(IDCR2)
    ENDDO
    ! Now assign IBM_BDNUM_CRS_AUX(IDCR):
    SBOD = 0
    DO IUBD=1,NUBD
       ! Drop extra intersections (same intersection type, same body):
       USE_INT_POINT(IND_CRS(LOW_IND,IDCR)+1:IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)) = .TRUE.
       DO ICRS1=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
          IF (.NOT.USE_INT_POINT(ICRS1)) CYCLE ! Don't use collapsed point as pivot.
          ! Collapse GS or SG points:
          DO ICRS2 = IND_CRS(LOW_IND,IDCR)+1 , IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
             IF ( (ICRS2==ICRS1) .OR. .NOT.USE_INT_POINT(ICRS2) ) CYCLE ! Don't use pivot, or collapsed point.
             IF ((IBM_IS_CRS2(LOW_IND ,ICRS1) == IBM_IS_CRS2(LOW_IND ,ICRS2)) .AND. &
                 (IBM_IS_CRS2(HIGH_IND,ICRS1) == IBM_IS_CRS2(HIGH_IND,ICRS2)) .AND. &
                 (BODNUM(ICRS1) == BODNUM(ICRS2))) THEN
                 USE_INT_POINT(ICRS2) = .FALSE.
             ENDIF
          ENDDO
       ENDDO
       IBDNUM=0
       DO IDCR2=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
          IF (BODNUM(IDCR2) /= UBOD(IUBD)) CYCLE
          IF ( .NOT.USE_INT_POINT(IDCR2) ) CYCLE
          IBDNUM = IBDNUM + IBM_BDNUM_CRS(IDCR2)
       ENDDO
       IF (IBDNUM /= 0) SBOD = SBOD + SIGN(1,IBDNUM)
    ENDDO
    IF (IDCR == 1) THEN
        IBM_BDNUM_CRS_AUX(IDCR) = SBOD
    ELSE
        IBM_BDNUM_CRS_AUX(IDCR) = IBM_BDNUM_CRS_AUX(IDCR-1) + SBOD
    ENDIF
ENDDO IDCR_DO_1
DEALLOCATE(UBOD)


! This is where we merge intersections at same svar location (i.e. same CRS_NUM value):
! Loop over different crossings:
LEFT_MEDIA = IBM_GASPHASE ! Here we could change the initial LEFT_MEDIA to IBM_SOLID if needed. Would require adding
                          ! IBM_BDNUM_CRS(LOW_IND,0) = 1, i.e crossed into SOLID at x2 -> -Inf.
IDCR_DO_2 : DO IDCR=1,CRS_NUM(IBM_N_CRS)

   IBM_N_CRS_AUX = IBM_N_CRS_AUX + 1
   ! Case of single crossing with new svar:
   SNGL_CRS_IF : IF ( IND_CRS(HIGH_IND,IDCR) == 1 ) THEN

      ICRS =IND_CRS(LOW_IND,IDCR) + 1

      IF ( (ICRS>1) .AND. (IBM_BDNUM_CRS_AUX(IDCR-1)>0) .AND. (IBM_BDNUM_CRS_AUX(IDCR)>0) ) THEN
         ! Test if already inside an Object.
         IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS) = IBM_SOLID
      ELSEIF ( IBM_IS_CRS2(LOW_IND,ICRS) /= LEFT_MEDIA ) THEN

         ! Check if this is a single point SGLS which was initially tagged as IBM_GASPHASE,
         ! if so switch media type to LEFT_MEDIA
         IF (IBM_SEG_CRS(ICRS) < 0) THEN
            IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS) = LEFT_MEDIA
         ELSE
            IF (ITITLE==1) THEN
            WRITE(LU_ERR,*) "Error GET_X2INTERSECTIONS: IS_CRS(LOW_IND,ICRS) ~= LEFT_MEDIA, media continuity problem"
            WRITE(LU_ERR,*) "X1AXIS,X1PLN=",X1AXIS,X1PLN,", X2AXIS,X3AXIS=",X2AXIS,X3AXIS,", RAY X3 POSITION=",X3RAY
            ELSEIF (ITITLE==2) THEN
            WRITE(LU_ERR,*) "Error GET_IS_SOLID_PT: IS_CRS(LOW_IND,ICRS) ~= LEFT_MEDIA, media continuity problem"
            WRITE(LU_ERR,*) "X1AXIS,X1PLN=",X1AXIS,X1PLN,", X2AXIS,X3AXIS=",X2AXIS,X3AXIS,", RAY X3 POSITION=",X3RAY
            ENDIF
            IF (IDCR==1) THEN
               ! FIXME: this should be the error message, IG should be made available here
               !    WRITE(MESSAGE,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), &
               !       "': Face normals are probably pointing in the wrong direction. Check they point towards the gas phase."
               IF (POSITIVE_ERROR_TEST) THEN
                 WRITE(LU_ERR,'(A)') " SUCCESS: GEOM ID Unknown:"
               ELSE
                 WRITE(LU_ERR,'(A)') " ERROR: GEOM ID Unknown:"
               ENDIF
               WRITE(LU_ERR,'(A)') "  Face normals are probably pointing in the wrong direction. "
               WRITE(LU_ERR,'(A)') "  Check they point towards the gas phase."
            ENDIF
            CALL SHUTDOWN("") ; RETURN
         ENDIF
      ENDIF

      IBM_SVAR_CRS_AUX(IBM_N_CRS_AUX)             = IBM_SVAR_CRS(ICRS)
      IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX)     = IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS)
      IBM_SEG_CRS_AUX(IBM_N_CRS_AUX)              = IBM_SEG_CRS(ICRS)
      IBM_SEG_TAN_AUX(IAXIS:JAXIS,IBM_N_CRS_AUX)  = IBM_SEG_TAN(IAXIS:JAXIS,ICRS)
      LEFT_MEDIA = IBM_IS_CRS2(HIGH_IND,ICRS)

      CYCLE

   ENDIF SNGL_CRS_IF

   ! Case of several crossings with new svar:
   DROP_SS_GG = .FALSE.
   DO ICRS=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
      IF ( IBM_IS_CRS2(LOW_IND,ICRS) /= IBM_IS_CRS2(HIGH_IND,ICRS) ) THEN
         DROP_SS_GG = .TRUE.
         EXIT
      ENDIF
   ENDDO

   ! Variables related to new svar crossing:
   ICRS = IND_CRS(LOW_IND,IDCR) + 1
   IBM_SVAR_CRS_AUX(IBM_N_CRS_AUX)             = IBM_SVAR_CRS(ICRS)
   IBM_SEG_CRS_AUX(IBM_N_CRS_AUX)              = IBM_SEG_CRS(ICRS)
   IBM_SEG_TAN_AUX(IAXIS:JAXIS,IBM_N_CRS_AUX)  = IBM_SEG_TAN(IAXIS:JAXIS,ICRS)

   ! Case of intersection inside segment aligned with SVAR location, i.e.
   ! intersection among two bodies or self intersection:
   ALGN_CROSS=.FALSE.
   DO ICRS=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
      IF ( IBM_IS_CRS2(HIGH_IND+1,ICRS) /= IBM_SOLID ) CYCLE
      IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX) = IBM_SOLID
      ALGN_CROSS=.TRUE.
      EXIT
   ENDDO
   IF ( ALGN_CROSS ) CYCLE

   ! Now figure out the type of crossing:
   NOT_COUNTED = .TRUE.
   NCRS_REMAIN = IND_CRS(HIGH_IND,IDCR)
   DROP_SS_GG_IF : IF (DROP_SS_GG) THEN

      ! Points of the same type are collapsed:
      USE_INT_POINT(IND_CRS(LOW_IND,IDCR)+1:IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)) = .TRUE.
      DO ICRS1 = IND_CRS(LOW_IND,IDCR)+1, IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR) ! Pivot Loop
         IF(.NOT.USE_INT_POINT(ICRS1)) CYCLE ! Don't use collapsed point as pivot.
         DO ICRS2 = IND_CRS(LOW_IND,IDCR)+1, IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
            IF( (ICRS2==ICRS1) .OR. .NOT.USE_INT_POINT(ICRS2) ) CYCLE ! Don't use pivot, or collapsed point.
            IF( (IBM_IS_CRS2(LOW_IND ,ICRS1) == IBM_IS_CRS2(LOW_IND ,ICRS2)) .AND. &
                (IBM_IS_CRS2(HIGH_IND,ICRS1) == IBM_IS_CRS2(HIGH_IND,ICRS2)) .AND. &
                (BODNUM(ICRS1) == BODNUM(ICRS2)) ) USE_INT_POINT(ICRS2) = .FALSE.
         ENDDO
      ENDDO

      ! Left Side:
      FOUND_LEFT = .FALSE.
      IND_LEFT   = 0
      IND_RIGHT  = 0
      DO ICRS=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)
         ! Case crossing type GG or SS, drop:
         IF (IBM_IS_CRS2(LOW_IND,ICRS) == IBM_IS_CRS2(HIGH_IND,ICRS)) CYCLE
         ! Case collapsed point, drop:
         IF (.NOT.USE_INT_POINT(ICRS)) CYCLE

         IND_LEFT  =  IND_LEFT + IBM_IS_CRS2(LOW_IND,ICRS)
         IND_RIGHT = IND_RIGHT + IBM_IS_CRS2(HIGH_IND,ICRS)
      ENDDO

      IF (IND_LEFT  /= 0) IND_LEFT = SIGN(1,IND_LEFT)
      IF (IND_RIGHT /= 0) IND_RIGHT = SIGN(1,IND_RIGHT)

      IF ( (IDCR>1) .AND. (IBM_BDNUM_CRS_AUX(IDCR-1)>0) .AND. (IBM_BDNUM_CRS_AUX(IDCR)>0) ) THEN
         ! Test if we are inside an Object.
         IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX) = IBM_SOLID; ! GS or SG.

      ELSEIF (ABS(IND_LEFT)+ABS(IND_RIGHT) == 0) THEN ! Same number of SG and GS crossings,
                                                      ! both sides of the crossing
                                                      ! defined as left_media:
         IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX)     = LEFT_MEDIA
      ELSEIF (IND_LEFT == LEFT_MEDIA) THEN
         IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX) = (/ IND_LEFT, IND_RIGHT /) ! GS or SG.
      ELSE
         IF (ITITLE==1) THEN
         WRITE(LU_ERR,*) "Error GET_X2INTERSECTIONS: DROP_SS_GG = .TRUE., Didn't find left side continuity."
         ELSEIF (ITITLE==2) THEN
         WRITE(LU_ERR,*) "Error GET_IS_SOLID_PT: DROP_SS_GG = .TRUE., Didn't find left side continuity."
         ENDIF
         ! WRITE(LU_ERR,*) "BODINT_PLANE, NSGLS, NSEGS=",BODINT_PLANE%NSGLS,BODINT_PLANE%NSEGS
         ! WRITE(LU_ERR,*) "X1PLN, X2AXIS, X3AXIS, X3RAY=",X1PLN,X2AXIS,X3AXIS,X3RAY
         ! WRITE(LU_ERR,*) "IBM_N_CRS=",IBM_N_CRS,", IDCR=",IDCR
         ! WRITE(LU_ERR,*) ICRS,"IND_LEFT=",IND_LEFT,", IND_RIGHT=",IND_RIGHT
         ! WRITE(LU_ERR,*) "IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS)",IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS)
         ! DO IAUX=1,IBM_N_CRS
         !    WRITE(LU_ERR,*) IAUX,CRS_NUM(IBM_N_CRS),IND_LEFT,IND_RIGHT,IBM_SVAR_CRS(IND_CRS(LOW_IND,IAUX)+1)
         ! ENDDO
         ! WRITE(LU_ERR,*) ' '
         ! CALL DEBUG_WAIT
      ENDIF
      LEFT_MEDIA = IBM_IS_CRS2_AUX(HIGH_IND,IBM_N_CRS_AUX)

   ELSE ! Intersections are either GG or SS

      ! Left side:
      FOUND_LEFT = .FALSE.
      DO ICRS=IND_CRS(LOW_IND,IDCR)+1,IND_CRS(LOW_IND,IDCR)+IND_CRS(HIGH_IND,IDCR)

         ! Case GG or SS with IBM_IS_CRS2(LOW_IND,ICRS) == LEFT_MEDIA:
         ! This collapses all types SS or GG that have the left side
         ! type. Note they should all be one type (either GG or SS):
         IF (IBM_IS_CRS2(LOW_IND,ICRS) == LEFT_MEDIA) THEN
            IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX) = IBM_IS_CRS2(LOW_IND:HIGH_IND,ICRS)
            NOT_COUNTED(ICRS) = .FALSE.
            NCRS_REMAIN = NCRS_REMAIN-1
            FOUND_LEFT = .TRUE.
         ENDIF
      ENDDO

      IF ( (IDCR>1) .AND. (IBM_BDNUM_CRS_AUX(IDCR-1)>0) .AND. (IBM_BDNUM_CRS_AUX(IDCR)>0) ) THEN
         ! Test if we are inside an Object.
         IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,IBM_N_CRS_AUX) = IBM_SOLID
         LEFT_MEDIA = IBM_IS_CRS2_AUX(HIGH_IND,IBM_N_CRS_AUX)
         CYCLE
      ENDIF

      IF (.NOT.FOUND_LEFT) print*, "Error GET_X2INTERSECTIONS: DROP_SS_GG = .FALSE., Didn't find left side continuity."
      IF ( NCRS_REMAIN /= 0) print*, "Error GET_X2INTERSECTIONS: DROP_SS_GG = .FALSE., NCRS_REMAIN /= 0."

      LEFT_MEDIA = IBM_IS_CRS2_AUX(HIGH_IND,IBM_N_CRS_AUX)

   ENDIF DROP_SS_GG_IF

ENDDO IDCR_DO_2

! Copy final results:
IBM_N_CRS    = IBM_N_CRS_AUX
IBM_SVAR_CRS(1:IBM_MAXCROSS_X2)             = IBM_SVAR_CRS_AUX(1:IBM_MAXCROSS_X2)
IBM_SEG_CRS(1:IBM_MAXCROSS_X2)              = IBM_SEG_CRS_AUX(1:IBM_MAXCROSS_X2)
IBM_SEG_TAN(IAXIS:JAXIS,1:IBM_MAXCROSS_X2)  = IBM_SEG_TAN_AUX(IAXIS:JAXIS,1:IBM_MAXCROSS_X2)
! IBM_IS_CRS2(LOW_IND:HIGH_IND,1:IBM_MAXCROSS_X2) = IBM_IS_CRS2_AUX(LOW_IND:HIGH_IND,1:IBM_MAXCROSS_X2)

DO ICRS=1,IBM_N_CRS
  IBM_IS_CRS(ICRS) = 2*( IBM_IS_CRS2_AUX(LOW_IND,ICRS) + 1 ) - IBM_IS_CRS2_AUX(HIGH_IND,ICRS)
ENDDO

RETURN
END SUBROUTINE COLLAPSE_CROSSINGS


! ------------------------- INSERT_RAY_CROSS ------------------------------------

SUBROUTINE INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)

REAL(EB), INTENT(IN) :: SVARI, STANI(IAXIS:JAXIS)
INTEGER,  INTENT(IN) :: ICRSI(LOW_IND:HIGH_IND+1), SCRSI

! Local Variables:
INTEGER :: ICRS, IDUM
REAL(EB), ALLOCATABLE, DIMENSION(:)  :: IBM_SVAR_CRS_DUM
INTEGER,  ALLOCATABLE, DIMENSION(:)  :: IBM_IS_CRS_DUM,IBM_SEG_CRS_DUM,IBM_BDNUM_CRS_DUM,IBM_BDNUM_CRS_AUX_DUM
INTEGER,  ALLOCATABLE, DIMENSION(:,:):: IBM_IS_CRS2_DUM
REAL(EB), ALLOCATABLE, DIMENSION(:,:):: IBM_SEG_TAN_DUM


IBM_N_CRS = IBM_N_CRS + 1

! Test maximum crossings defined:
IF ( IBM_N_CRS > IBM_MAXCROSS_X2) THEN
   IDUM = IBM_MAXCROSS_X2
   IBM_MAXCROSS_X2 = IDUM + DELTA_CROSS_X2
   ! Allocate Intersection variables:
   ALLOCATE(IBM_SVAR_CRS_DUM(IBM_MAXCROSS_X2),IBM_IS_CRS_DUM(IBM_MAXCROSS_X2),IBM_SEG_CRS_DUM(IBM_MAXCROSS_X2))
   IBM_SVAR_CRS_DUM = 1._EB/GEOMEPS; IBM_SVAR_CRS_DUM(1:IDUM) = IBM_SVAR_CRS(1:IDUM)
   IBM_IS_CRS_DUM   = IBM_UNDEFINED;
   IBM_SEG_CRS_DUM  = 0; IBM_SEG_CRS_DUM(1:IDUM) = IBM_SEG_CRS(1:IDUM)
   ALLOCATE(IBM_BDNUM_CRS_DUM(0:IBM_MAXCROSS_X2),IBM_BDNUM_CRS_AUX_DUM(0:IBM_MAXCROSS_X2))
   IBM_BDNUM_CRS_DUM    = 0; IBM_BDNUM_CRS_DUM(0:IDUM) = IBM_BDNUM_CRS(0:IDUM)
   IBM_BDNUM_CRS_AUX_DUM= 0;  IBM_BDNUM_CRS_AUX_DUM(0:IDUM) = IBM_BDNUM_CRS_AUX(0:IDUM)
   ALLOCATE(IBM_IS_CRS2_DUM(LOW_IND:HIGH_IND+1,IBM_MAXCROSS_X2),IBM_SEG_TAN_DUM(IAXIS:JAXIS,IBM_MAXCROSS_X2))
   IBM_IS_CRS2_DUM  = IBM_UNDEFINED; IBM_IS_CRS2_DUM(LOW_IND:HIGH_IND+1,1:IDUM) = IBM_IS_CRS2(LOW_IND:HIGH_IND+1,1:IDUM)
   IBM_SEG_TAN_DUM  = 0._EB; IBM_SEG_TAN_DUM(IAXIS:JAXIS,1:IDUM) = IBM_SEG_TAN(IAXIS:JAXIS,1:IDUM)
   CALL MOVE_ALLOC(FROM=IBM_SVAR_CRS_DUM,TO=IBM_SVAR_CRS)
   CALL MOVE_ALLOC(FROM=IBM_IS_CRS_DUM,TO=IBM_IS_CRS)
   CALL MOVE_ALLOC(FROM=IBM_SEG_CRS_DUM,TO=IBM_SEG_CRS)
   CALL MOVE_ALLOC(FROM=IBM_BDNUM_CRS_DUM,TO=IBM_BDNUM_CRS)
   CALL MOVE_ALLOC(FROM=IBM_BDNUM_CRS_AUX_DUM,TO=IBM_BDNUM_CRS_AUX)
   CALL MOVE_ALLOC(FROM=IBM_IS_CRS2_DUM,TO=IBM_IS_CRS2)
   CALL MOVE_ALLOC(FROM=IBM_SEG_TAN_DUM,TO=IBM_SEG_TAN)
ENDIF

! Add in place, ascending value order:
DO ICRS=1,IBM_N_CRS ! The updated IBM_N_CRS is for ICRS to reach the
                    ! initialization value IBM_SVAR_CRS(ICRS)=1/GEOMEPS.
   IF ( SVARI < IBM_SVAR_CRS(ICRS) ) EXIT
ENDDO

! Here copy from the back (updated IBM_N_CRS) to the ICRS location:
! if ICRS=IBM_N_CRS -> nothing gets copied:
DO IDUM = IBM_N_CRS,ICRS+1,-1
   IBM_SVAR_CRS(IDUM)           = IBM_SVAR_CRS(IDUM-1)
   IBM_IS_CRS2(LOW_IND:HIGH_IND+1,IDUM)   = IBM_IS_CRS2(LOW_IND:HIGH_IND+1,IDUM-1)
   IBM_SEG_CRS(IDUM)            = IBM_SEG_CRS(IDUM-1);
   IBM_SEG_TAN(IAXIS:JAXIS,IDUM)= IBM_SEG_TAN(IAXIS:JAXIS,IDUM-1);
   IBM_BDNUM_CRS(IDUM) = IBM_BDNUM_CRS(IDUM-1)
ENDDO

IBM_SVAR_CRS(ICRS)             = SVARI              ! x2 location.
IBM_IS_CRS2(LOW_IND:HIGH_IND+1,ICRS)     = ICRSI(LOW_IND:HIGH_IND+1)    ! Does point separate GASPHASE from SOLID?
IBM_SEG_CRS(ICRS)              = SCRSI              ! Segment on BOINT_PLANE the crossing belongs to.
IBM_SEG_TAN(IAXIS:JAXIS,ICRS)  = STANI(IAXIS:JAXIS) ! IBM_SEG_TAN might not be needed in new implementation.
IBM_BDNUM_CRS(ICRS)            = 0
IF (SCRSI > 0) THEN
   IF(ICRSI(LOW_IND) == IBM_GASPHASE .AND. ICRSI(HIGH_IND) == IBM_SOLID) THEN
      IBM_BDNUM_CRS(ICRS) = 1
   ELSEIF(ICRSI(LOW_IND) == IBM_SOLID .AND. ICRSI(HIGH_IND) == IBM_GASPHASE) THEN
      IBM_BDNUM_CRS(ICRS) =-1
   ENDIF
ENDIF
RETURN
END SUBROUTINE INSERT_RAY_CROSS

! ----------------------- GET_BODINT_NODE_INDEX ----------------------------------

SUBROUTINE GET_BODINT_NODE_INDEX(BODINT_PLANE,X2AXIS,X3AXIS,XYZ,IND_PI)

TYPE(BODINT_PLANE_TYPE), INTENT(INOUT) :: BODINT_PLANE
INTEGER,  INTENT(IN)  :: X2AXIS,X3AXIS
REAL(EB), INTENT(IN)  :: XYZ(MAX_DIM)
INTEGER,  INTENT(OUT) :: IND_PI

! Local variables:
INTEGER :: INOD=1, PIVOT(LOW_IND:HIGH_IND), INOD2
REAL(EB):: DIFFX2, DIFFX3

! Test if XYZ is already on BODINT_PLANE%XYZ:
IND_PI = -1 ! Initialize to negative index.
IF (BODINT_PLANE%NNODS < LINSEARCH_LIMIT) THEN
   ! Linear Search:
   DO INOD=1,BODINT_PLANE%NNODS
      DIFFX2 = BODINT_PLANE%XYZ(X2AXIS,BODINT_PLANE%NOD_PERM(INOD))-XYZ(X2AXIS)
      IF( DIFFX2 > GEOMEPS ) THEN
         EXIT
      ELSEIF( ABS(DIFFX2) <= GEOMEPS) THEN
         DIFFX3 = BODINT_PLANE%XYZ(X3AXIS,BODINT_PLANE%NOD_PERM(INOD))-XYZ(X3AXIS)
         IF ( DIFFX3 > GEOMEPS ) THEN
            EXIT
         ELSEIF ( ABS(DIFFX3) <= GEOMEPS ) THEN
            IND_PI = BODINT_PLANE%NOD_PERM(INOD)
            RETURN
         ENDIF
      ENDIF
   ENDDO
ELSE
   ! Binary Search:
   PIVOT(LOW_IND) = 0
   PIVOT(HIGH_IND)= BODINT_PLANE%NNODS + 1
   DO WHILE( (PIVOT(HIGH_IND)-PIVOT(LOW_IND)) > 1)
      INOD   = (PIVOT(LOW_IND)+PIVOT(HIGH_IND))/2
      DIFFX2 = BODINT_PLANE%XYZ(X2AXIS,BODINT_PLANE%NOD_PERM(INOD))-XYZ(X2AXIS)
      IF( DIFFX2 < -GEOMEPS ) THEN
         PIVOT(LOW_IND) = INOD
      ELSEIF( DIFFX2 > GEOMEPS ) THEN
         PIVOT(HIGH_IND)= INOD
      ELSE ! ABS(DIFFX2) < GEOMEPS
         DIFFX3 = BODINT_PLANE%XYZ(X3AXIS,BODINT_PLANE%NOD_PERM(INOD))-XYZ(X3AXIS)
         IF ( DIFFX3 < -GEOMEPS ) THEN
            PIVOT(LOW_IND) = INOD
         ELSEIF( DIFFX3 > GEOMEPS ) THEN
            PIVOT(HIGH_IND)= INOD
         ELSE ! ABS(DIFFX3) < GEOMEPS
            IND_PI = BODINT_PLANE%NOD_PERM(INOD)
            RETURN
         ENDIF
      ENDIF
   ENDDO
   INOD=PIVOT(HIGH_IND)
ENDIF

! Insert add NOD_PERM permutation array, O(NP) operation:
DO INOD2=BODINT_PLANE%NNODS+1,INOD+1,-1
  BODINT_PLANE%NOD_PERM(INOD2) = BODINT_PLANE%NOD_PERM(INOD2-1)
ENDDO
IND_PI = BODINT_PLANE%NNODS + 1
BODINT_PLANE%NNODS = IND_PI
BODINT_PLANE%NOD_PERM(INOD) = IND_PI
BODINT_PLANE%XYZ(IAXIS:KAXIS,IND_PI) = XYZ(IAXIS:KAXIS)

RETURN
END SUBROUTINE GET_BODINT_NODE_INDEX


! ---------------------- GET_BODINT_NODE_INDEX ----------------------------------

! SUBROUTINE GET_BODINT_NODE_INDEX(X2AXIS,X3AXIS,XYZ,IND_PI)
!
! INTEGER,  INTENT(IN)  :: X2AXIS,X3AXIS
! REAL(EB), INTENT(IN)  :: XYZ(MAX_DIM)
! INTEGER,  INTENT(OUT) :: IND_PI
!
! ! Local variables:
! !LOGICAL :: INLIST
! INTEGER :: INOD
!
! ! Test if XYZ is already on BODINT_PLANE%XYZ:
! ! INLIST = .FALSE.
! IND_PI = -1 ! Initialize to negative index.
! DO INOD=1,BODINT_PLANE%NNODS
!    IF(ABS(BODINT_PLANE%XYZ(X2AXIS,INOD)-XYZ(X2AXIS)) > GEOMEPS) CYCLE
!    IF(ABS(BODINT_PLANE%XYZ(X3AXIS,INOD)-XYZ(X3AXIS)) > GEOMEPS) CYCLE
!    IND_PI = INOD
!    RETURN
! ENDDO
!
! WRITE(LU_ERR,*) 'X2AXIS,X3AXIS',X2AXIS,X3AXIS,BODINT_PLANE%NNODS,INOD
! IND_PI = BODINT_PLANE%NNODS + 1
! BODINT_PLANE%NNODS = IND_PI
! BODINT_PLANE%XYZ(IAXIS:KAXIS,IND_PI) = XYZ
! DO INOD=1,BODINT_PLANE%NNODS
!    WRITE(LU_ERR,*) INOD,BODINT_PLANE%XYZ(IAXIS:KAXIS,INOD)
! ENDDO
! RETURN
! END SUBROUTINE GET_BODINT_NODE_INDEX


! -------------------- LINE_INTERSECT_COORDPLANE --------------------------------

SUBROUTINE LINE_INTERSECT_COORDPLANE(X1AXIS,X1PLN,PLNORMAL,LNC,XYZ_INT,INTFLG)

INTEGER, INTENT(IN)  :: X1AXIS
REAL(EB), INTENT(IN) :: X1PLN,PLNORMAL(MAX_DIM),LNC(MAX_DIM,NOD1:NOD2)
REAL(EB), INTENT(OUT):: XYZ_INT(MAX_DIM)
LOGICAL, INTENT(OUT) :: INTFLG

! Local variables:
REAL(EB) :: DVEC(MAX_DIM), DIRV(MAX_DIM), NMDV, DENOM, PLNEQ, TLINE
! REAL(QB) :: DVECQ(MAX_DIM), DIRVQ(MAX_DIM), NMDVQ, DENOMQ, PLNEQQ, TLINEQ


! Initialize:
INTFLG = .FALSE.
XYZ_INT(IAXIS:KAXIS) = 0._EB

! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
! Preliminary calculations:
DVEC(IAXIS:KAXIS) = LNC(IAXIS:KAXIS,NOD2) - LNC(IAXIS:KAXIS,NOD1)
NMDV = SQRT( DVEC(IAXIS)**2._EB + DVEC(JAXIS)**2._EB + DVEC(KAXIS)**2._EB )
DIRV = DVEC(IAXIS:KAXIS) * NMDV**(-1._EB)
DENOM = DIRV(IAXIS)*PLNORMAL(IAXIS) +DIRV(JAXIS)*PLNORMAL(JAXIS) +DIRV(KAXIS)*PLNORMAL(KAXIS)
PLNEQ = LNC(IAXIS,NOD1)*PLNORMAL(IAXIS) + &
        LNC(JAXIS,NOD1)*PLNORMAL(JAXIS) + &
        LNC(KAXIS,NOD1)*PLNORMAL(KAXIS) - X1PLN

! Line parallel to plane:
IF ( ABS(DENOM) < GEOMEPS ) THEN
   ! Check if seg lies on plane or not.
   ! Do this by checking if node one of segment is on plane.
   IF ( ABS(PLNEQ) < GEOMEPS ) THEN
      XYZ_INT(IAXIS:KAXIS) = LNC(IAXIS:KAXIS,NOD1); XYZ_INT(X1AXIS) = X1PLN
      INTFLG = .TRUE.
   ENDIF
   RETURN
ENDIF

! Non parallel case:
TLINE = -PLNEQ/DENOM  ! Coordinate along the line LNC.
XYZ_INT(IAXIS:KAXIS) = LNC(IAXIS:KAXIS,NOD1) + TLINE*DIRV(IAXIS:KAXIS) ! Intersection point.
XYZ_INT(X1AXIS) = X1PLN ! Force X1AXIS coordinate to be the planes value.
! ELSE
!    ! Preliminary calculations:
!    DVECQ(IAXIS:KAXIS) = REAL(LNC(IAXIS:KAXIS,NOD2),QB) - REAL(LNC(IAXIS:KAXIS,NOD1),QB)
!    NMDVQ  = SQRT( DVECQ(IAXIS)**2._QB + DVECQ(JAXIS)**2._QB + DVECQ(KAXIS)**2._QB )
!    DIRVQ  = DVECQ(IAXIS:KAXIS) * NMDVQ**(-1._QB)
!    DENOMQ = DIRVQ(IAXIS)*REAL(PLNORMAL(IAXIS),QB) + &
!             DIRVQ(JAXIS)*REAL(PLNORMAL(JAXIS),QB) + &
!             DIRVQ(KAXIS)*REAL(PLNORMAL(KAXIS),QB)
!    PLNEQQ = REAL(LNC(IAXIS,NOD1),QB)*REAL(PLNORMAL(IAXIS),QB) + &
!             REAL(LNC(JAXIS,NOD1),QB)*REAL(PLNORMAL(JAXIS),QB) + &
!             REAL(LNC(KAXIS,NOD1),QB)*REAL(PLNORMAL(KAXIS),QB) - REAL(X1PLN,QB)
!
!    ! Line parallel to plane:
!    IF ( ABS(REAL(DENOMQ,EB)) < GEOMEPS ) THEN
!       ! Check if seg lies on plane or not.
!       ! Do this by checking if node one of segment is on plane.
!       IF ( ABS(REAL(PLNEQ,EB)) < GEOMEPS ) THEN
!          XYZ_INT(IAXIS:KAXIS) = LNC(IAXIS:KAXIS,NOD1); XYZ_INT(X1AXIS) = X1PLN
!          INTFLG = .TRUE.
!       ENDIF
!       RETURN
!    ENDIF
!
!    ! Non parallel case:
!    TLINEQ = -PLNEQQ/DENOMQ  ! Coordinate along the line LNC.
!    XYZ_INT(IAXIS:KAXIS) = REAL(REAL(LNC(IAXIS:KAXIS,NOD1),QB)+TLINEQ*DIRVQ(IAXIS:KAXIS),EB) ! Intersection pt.
!    XYZ_INT(X1AXIS) = X1PLN ! Force X1AXIS coordinate to be the planes value.
! ENDIF

INTFLG = .TRUE.

RETURN
END SUBROUTINE LINE_INTERSECT_COORDPLANE


! ------------------------- IBM_INIT_GEOM ---------------------------------------

SUBROUTINE IBM_INIT_GEOM

! Local Variables:
INTEGER :: IG, IWSEL, INOD, IEDGE, NVERT, NWSEL, NWSEDG, IEDLIST, IX, N_TENT_EDGES
INTEGER :: WSELEM(NOD1:NOD3),SEG(NOD1:NOD2)
REAL(EB):: XYZV(MAX_DIM,NODS_WSEL), V12(MAX_DIM), V23(MAX_DIM), V31(MAX_DIM), WSNORM(MAX_DIM)
REAL(EB):: X12(MAX_DIM), X23(MAX_DIM), X31(MAX_DIM), SQAREA(MAX_DIM), INT2
REAL(EB):: MGNRM, XCEN
REAL(EB):: GEOMEPSSQ ! Local epsilon for GEOM quality check
LOGICAL :: INLIST

INTEGER, ALLOCATABLE, DIMENSION(:,:):: EDGES2
LOGICAL, ALLOCATABLE, DIMENSION(:)  :: COUNTED_VERT

LOGICAL, PARAMETER :: OPTIMIZE_SEG_DEF = .TRUE.

! REAL(QB) :: V12Q(IAXIS:KAXIS),V23Q(IAXIS:KAXIS),V31Q(IAXIS:KAXIS),WSNORMQ(IAXIS:KAXIS),MGNRMQ

REAL(EB) :: CPUTIME_START, CPUTIME

IF(MY_RANK==0 .AND. GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_ERR,'(A,I5,A)',advance="no") ' 1. Number of Geometries : ',N_GEOMETRY,&
   ', IBM_INIT_GEOM, processed GEOMETRY : '
ENDIF

! In this subroutine the quality of the GEOM lines is checked
! Calc local squared epsilon for GEOM quality check
GEOMEPSSQ = (GEOMEPS * GEOMQUALITYFCT)**2._EB

! Geometry loop:
GEOMETRY_LOOP : DO IG=1,N_GEOMETRY

   NWSEL = GEOMETRY(IG)%N_FACES
   NVERT = GEOMETRY(IG)%N_VERTS

   IF (GEOMETRY(IG)%IS_TERRAIN) THEN ! Terrain is always manifold with volume.
      N_TENT_EDGES = INT(1.55_EB*REAL(NWSEL,EB)) ! Number of edges is 1.5 number of triangles.
   ELSE
      N_TENT_EDGES = 3*NWSEL
   ENDIF

   ! Allocate fields of Geometry used by IBM:
   ! WS Faces normal unit vectors:
   IF (ALLOCATED(GEOMETRY(IG)%FACES_NORMAL)) DEALLOCATE(GEOMETRY(IG)%FACES_NORMAL)
   ALLOCATE(GEOMETRY(IG)%FACES_NORMAL(MAX_DIM,NWSEL))
   ! WS Faces areas:
   IF (ALLOCATED(GEOMETRY(IG)%FACES_AREA)) DEALLOCATE(GEOMETRY(IG)%FACES_AREA)
   ALLOCATE(GEOMETRY(IG)%FACES_AREA(NWSEL))
   ! WS Faces edges:
   IF (ALLOCATED(GEOMETRY(IG)%EDGES)) DEALLOCATE(GEOMETRY(IG)%EDGES)
   ALLOCATE(GEOMETRY(IG)%EDGES(NOD1:NOD2,N_TENT_EDGES)) ! Size large enough to take care of surfaces
                                         ! (zero thickness immersed solids) and 3D domains
                                         ! boundaries (what we call wet surfaces).
   ! WS Faces edges:
   IF (ALLOCATED(GEOMETRY(IG)%FACE_EDGES)) DEALLOCATE(GEOMETRY(IG)%FACE_EDGES)
   ALLOCATE(GEOMETRY(IG)%FACE_EDGES(EDG1:EDG3,NWSEL)) ! Edges in GEOMETRY(IG)%EDGES for this triangle.
   ! WS Edges faces:
   IF (ALLOCATED(GEOMETRY(IG)%EDGE_FACES)) DEALLOCATE(GEOMETRY(IG)%EDGE_FACES)
   ALLOCATE(GEOMETRY(IG)%EDGE_FACES(5,N_TENT_EDGES)) ! Triangles sharing this edge [niel iwel1 LocEdge1 iwel2 LocEdge2]

   ! COUNTED_VERT used for test of loose vertices:
   ALLOCATE(COUNTED_VERT(1:NVERT)); COUNTED_VERT = .FALSE.

   GEOMETRY(IG)%GEOM_VOLUME    = 0._EB
   GEOMETRY(IG)%GEOM_AREA      = 0._EB
   GEOMETRY(IG)%GEOM_XYZCEN(:) = 0._EB

   ! Compute normal, area and volume:
   SQAREA(IAXIS:KAXIS) = 0._EB
   DO IWSEL=1,NWSEL

      WSELEM(NOD1:NOD3) = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)

      COUNTED_VERT(WSELEM(NOD1:NOD3)) = .TRUE.

      ! Triangles NODES coordinates:
      DO INOD=NOD1,NOD3
         XYZV(IAXIS:KAXIS,INOD) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(INOD)-1)+1:MAX_DIM*WSELEM(INOD))
      ENDDO

      V12(IAXIS:KAXIS) = XYZV(IAXIS:KAXIS,NOD2) - XYZV(IAXIS:KAXIS,NOD1)
      V23(IAXIS:KAXIS) = XYZV(IAXIS:KAXIS,NOD3) - XYZV(IAXIS:KAXIS,NOD2)
      V31(IAXIS:KAXIS) = XYZV(IAXIS:KAXIS,NOD1) - XYZV(IAXIS:KAXIS,NOD3)

      ! Check that face edges are not too small
      IF ((V12(IAXIS)**2._EB + V12(JAXIS)**2._EB + V12(KAXIS)**2._EB ) < GEOMEPSSQ) THEN
        IF (MY_RANK==0) THEN
           IF (POSITIVE_ERROR_TEST) THEN
             WRITE(LU_ERR,'(A,A,A)')  "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ELSE
             WRITE(LU_ERR,'(A,A,A)')  "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ENDIF
           WRITE(LU_ERR,'(A,3F12.3)') "  Edge length too small at:", XYZV(IAXIS:KAXIS,NOD2)
           WRITE(LU_ERR,'(A,I8,A,I8,A)')  "  Check that Vertices:",WSELEM(NOD1),', ',WSELEM(NOD2),' are not equal.'
        ENDIF
        CALL SHUTDOWN("") ; RETURN
      ENDIF
      IF ((V23(IAXIS)**2._EB + V23(JAXIS)**2._EB + V23(KAXIS)**2._EB ) < GEOMEPSSQ) THEN
        IF (MY_RANK==0) THEN
           IF (POSITIVE_ERROR_TEST) THEN
             WRITE(LU_ERR,'(A,A,A)')  "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ELSE
             WRITE(LU_ERR,'(A,A,A)')  "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ENDIF
           WRITE(LU_ERR,'(A,3F12.3)') "  Edge length too small at:", XYZV(IAXIS:KAXIS,NOD3)
           WRITE(LU_ERR,'(A,I8,A,I8,A)')  "  Check that Vertices:",WSELEM(NOD2),', ',WSELEM(NOD3),' are not equal.'
        END IF
        CALL SHUTDOWN("") ; RETURN
      ENDIF
      IF ((V31(IAXIS)**2._EB + V31(JAXIS)**2._EB + V31(KAXIS)**2._EB ) < GEOMEPSSQ) THEN
        IF (MY_RANK==0) THEN
           IF (POSITIVE_ERROR_TEST) THEN
             WRITE(LU_ERR,'(A,A,A)')  "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ELSE
             WRITE(LU_ERR,'(A,A,A)')  "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ENDIF
           WRITE(MESSAGE,'(A,3F12.3)') "  Edge length too small at:", XYZV(IAXIS:KAXIS,NOD1)
           WRITE(LU_ERR,'(A,I8,A,I8,A)')  "  Check that Vertices:",WSELEM(NOD1),', ',WSELEM(NOD3),' are not equal.'
        ENDIF
        CALL SHUTDOWN("") ; RETURN
      END IF

      ! Cross V12 x V23:
      ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
      WSNORM(IAXIS) = V12(JAXIS)*V23(KAXIS) - V12(KAXIS)*V23(JAXIS)
      WSNORM(JAXIS) = V12(KAXIS)*V23(IAXIS) - V12(IAXIS)*V23(KAXIS)
      WSNORM(KAXIS) = V12(IAXIS)*V23(JAXIS) - V12(JAXIS)*V23(IAXIS)
      MGNRM = SQRT( WSNORM(IAXIS)**2._EB + WSNORM(JAXIS)**2._EB + WSNORM(KAXIS)**2._EB )
      ! ELSE
      !    V12Q(IAXIS:KAXIS) = REAL(XYZV(IAXIS:KAXIS,NOD2),QB) - REAL(XYZV(IAXIS:KAXIS,NOD1),QB)
      !    V23Q(IAXIS:KAXIS) = REAL(XYZV(IAXIS:KAXIS,NOD3),QB) - REAL(XYZV(IAXIS:KAXIS,NOD2),QB)
      !    V31Q(IAXIS:KAXIS) = REAL(XYZV(IAXIS:KAXIS,NOD1),QB) - REAL(XYZV(IAXIS:KAXIS,NOD3),QB)
      !    WSNORMQ(IAXIS) = V12Q(JAXIS)*V23Q(KAXIS) - V12Q(KAXIS)*V23Q(JAXIS)
      !    WSNORMQ(JAXIS) = V12Q(KAXIS)*V23Q(IAXIS) - V12Q(IAXIS)*V23Q(KAXIS)
      !    WSNORMQ(KAXIS) = V12Q(IAXIS)*V23Q(JAXIS) - V12Q(JAXIS)*V23Q(IAXIS)
      !    MGNRMQ = SQRT( WSNORMQ(IAXIS)**2._QB + WSNORMQ(JAXIS)**2._QB + WSNORMQ(KAXIS)**2._QB )
      !    MGNRM  = REAL(MGNRMQ,EB)
      ! ENDIF

      XCEN  = (XYZV(IAXIS,NOD1) + XYZV(IAXIS,NOD2) + XYZV(IAXIS,NOD3)) / 3._EB

      ! Check that face area is not too small
      IF(MGNRM < GEOMEPSSQ) THEN
        IF (MY_RANK==0) THEN
           IF (POSITIVE_ERROR_TEST) THEN
             WRITE(LU_ERR,'(A,A,A)')  "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ELSE
             WRITE(LU_ERR,'(A,A,A)')  "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
           ENDIF
           WRITE(LU_ERR,'(A,3F12.3)') "  Face area too small at:", XYZV(IAXIS:KAXIS,NOD1)
           WRITE(LU_ERR,*) '  Face IWSEL=', IWSEL, ', Connectivity=', WSELEM(NOD1:NOD3),', Norm Cross=', MGNRM
        ENDIF
        CALL SHUTDOWN("") ; RETURN
      ENDIF

      ! Assign to GEOMETRY:
      ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
      GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,IWSEL) = WSNORM(IAXIS:KAXIS) * MGNRM**(-1._EB)
      GEOMETRY(IG)%FACES_AREA(IWSEL) = MGNRM/2._EB
      ! ELSE
      !    GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,IWSEL) = REAL(WSNORMQ(IAXIS:KAXIS)*MGNRMQ**(-1._QB),EB)
      !    GEOMETRY(IG)%FACES_AREA(IWSEL) = REAL(MGNRMQ/2._QB,EB)
      ! ENDIF

      ! Total Area and Volume for GEOMETRY(IG).
      GEOMETRY(IG)%GEOM_AREA  = GEOMETRY(IG)%GEOM_AREA  + GEOMETRY(IG)%FACES_AREA(IWSEL)
      GEOMETRY(IG)%GEOM_VOLUME= GEOMETRY(IG)%GEOM_VOLUME+ & ! Divergence theorem with F = x i, assumes we have a volume.
      GEOMETRY(IG)%FACES_NORMAL(IAXIS,IWSEL)*XCEN*GEOMETRY(IG)%FACES_AREA(IWSEL)

      ! Define Centroid:
      X12(IAXIS:KAXIS) = 0.5_EB*(XYZV(IAXIS:KAXIS,NOD1) + XYZV(IAXIS:KAXIS,NOD2))
      X23(IAXIS:KAXIS) = 0.5_EB*(XYZV(IAXIS:KAXIS,NOD2) + XYZV(IAXIS:KAXIS,NOD3))
      X31(IAXIS:KAXIS) = 0.5_EB*(XYZV(IAXIS:KAXIS,NOD3) + XYZV(IAXIS:KAXIS,NOD1))
      ! dot(i,nc) int(x^2)dA, dot(j,nc) int(y^2)dA, dot(k,nc) int(z^2)dA
      DO IX=IAXIS,KAXIS
         INT2 = (X12(IX)**2._EB + X23(IX)**2._EB + X31(IX)**2._EB) / 3._EB
         SQAREA(IX) = SQAREA(IX) + GEOMETRY(IG)%FACES_NORMAL(IX,IWSEL)*INT2*GEOMETRY(IG)%FACES_AREA(IWSEL) ! Midpt rule.
      ENDDO
   ENDDO

   ! In the broken case where GEOM normals are wrong, GEOM_VOLUME can become too small
   IF(GEOMETRY(IG)%GEOM_VOLUME < GEOMEPSSQ) THEN
     IF (MY_RANK==0) THEN
        IF (POSITIVE_ERROR_TEST) THEN
          WRITE(LU_ERR,'(A,A,A)')  "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
        ELSE
          WRITE(LU_ERR,'(A,A,A)')  "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
        ENDIF
        WRITE(LU_ERR,'(A)') "  Geometry volume too small."
        WRITE(LU_ERR,'(A)') "  Face normals are probably pointing in the wrong direction. "
        WRITE(LU_ERR,'(A)') "  Check they point towards the gas phase."
     ENDIF
     CALL SHUTDOWN("") ; RETURN
   ENDIF

   ! Geometry Centroid:
   DO IX=IAXIS,KAXIS
      GEOMETRY(IG)%GEOM_XYZCEN(IX) = SQAREA(IX) / (2._EB * GEOMETRY(IG)%GEOM_VOLUME)
   ENDDO

   ! Build geometry connectivity
   ! While building, check that the triangulated surface is manifold and oriented

   NWSEDG = 0
   OPTIMIZE_SEG_DEF_COND : IF (OPTIMIZE_SEG_DEF) THEN
   IX = SIZE(GEOMETRY(IG)%FACES,DIM=1)
   CALL GET_GEOM_EDGES(NVERT,NWSEL,IX,GEOMETRY(IG)%FACES,NWSEDG,GEOMETRY(IG)%EDGES,&
                       GEOMETRY(IG)%FACE_EDGES,GEOMETRY(IG)%EDGE_FACES)

   ! Perform manifoldness tests:
   ALLOCATE(EDGES2(2,NWSEDG)); EDGES2=0
   DO IWSEL=1,NWSEL
      WSELEM(NOD1:NOD3) = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)
      DO IEDGE=EDG1,EDG3
         IEDLIST = GEOMETRY(IG)%FACE_EDGES(IEDGE,IWSEL)
         IF(WSELEM(IEDGE) == GEOMETRY(IG)%EDGES(NOD1,IEDLIST)) THEN ! First node of face edge equals first node of seg.
            EDGES2(1,IEDLIST)=EDGES2(1,IEDLIST)+1
         ELSEIF(WSELEM(IEDGE) == GEOMETRY(IG)%EDGES(NOD2,IEDLIST)) THEN ! Inverted.
            EDGES2(2,IEDLIST)=EDGES2(2,IEDLIST)+1
         ENDIF
      ENDDO
   ENDDO
   DO IWSEL=1,NWSEDG
      IF(SUM(EDGES2(1:2,IWSEL)) < 2) THEN ! Less that two faces have this edge as boundary:
         SEG(NOD1:NOD2) = GEOMETRY(IG)%EDGES(NOD1:NOD2,IWSEL)
         XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD1)-1)+1:MAX_DIM*SEG(NOD1))
         XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD2)-1)+1:MAX_DIM*SEG(NOD2))
         IF (MY_RANK==0) THEN
            IF (POSITIVE_ERROR_TEST) THEN
              WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ELSE
              WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ENDIF
            WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') "  Open geometry at edge with nodes: NOD1",SEG(NOD1),&
            " (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",SEG(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
         ENDIF
         CALL SHUTDOWN("") ; RETURN

      ELSEIF(SUM(EDGES2(1:2,IWSEL)) > 2) THEN ! More than two faces share this edge:
         SEG(NOD1:NOD2) = GEOMETRY(IG)%EDGES(NOD1:NOD2,IWSEL)
         XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD1)-1)+1:MAX_DIM*SEG(NOD1))
         XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD2)-1)+1:MAX_DIM*SEG(NOD2))
         IF (MY_RANK==0) THEN
            IF (POSITIVE_ERROR_TEST) THEN
              WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ELSE
              WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ENDIF
            WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') "  Non manifold geometry in adjacent faces at edge with nodes: NOD1",&
            SEG(NOD1)," (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",SEG(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
         ENDIF
         CALL SHUTDOWN("") ; RETURN

      ELSEIF(ANY(EDGES2(1:2,IWSEL) > 1)) THEN ! half edge counted more than once, opposite normals on triangles
         SEG(NOD1:NOD2) = GEOMETRY(IG)%EDGES(NOD1:NOD2,IWSEL)
         XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD1)-1)+1:MAX_DIM*SEG(NOD1))
         XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD2)-1)+1:MAX_DIM*SEG(NOD2))
         IF (MY_RANK==0) THEN
            IF (POSITIVE_ERROR_TEST) THEN
              WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ELSE
              WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ENDIF
            WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') &
            " Opposite normals on triangles sharing edge with nodes: NOD1",&
            SEG(NOD1)," (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",SEG(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
         ENDIF
         CALL SHUTDOWN("") ; RETURN

      ENDIF
   ENDDO
   DEALLOCATE(EDGES2)

   ELSE OPTIMIZE_SEG_DEF_COND

   DO IWSEL=1,NWSEL

      WSELEM(NOD1:NOD3) = GEOMETRY(IG)%FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)

      DO IEDGE=EDG1,EDG3 ! For each face halfedge

         SEG(NOD1:NOD2) = WSELEM(NOD1:NOD2) ! Get halfedge

         ! Test triangles edge iedge is already on list
         ! GEOMETRY(IG)%EDGES. Makes use of fact that two triangles
         ! sharing an edge have opposite connectivity for it (right hand
         ! rule for connectivity for normal outside solid).

         INLIST = .FALSE.
         DO IEDLIST=1,NWSEDG
            ! Check if halfedge already in list. This would mean that the surface is
            ! - non-manifold (three faces share the same edge) or
            ! - not oriented (opposite normals in adjacent faces)
            IF ( (SEG(NOD1) == GEOMETRY(IG)%EDGES(NOD1,IEDLIST)) .AND. &
                 (SEG(NOD2) == GEOMETRY(IG)%EDGES(NOD2,IEDLIST)) ) THEN
               XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD1)-1)+1:MAX_DIM*WSELEM(NOD1))
               XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD2)-1)+1:MAX_DIM*WSELEM(NOD2))
               IF (MY_RANK==0) THEN
                  IF (POSITIVE_ERROR_TEST) THEN
                    WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
                  ELSE
                    WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
                  ENDIF
                  WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') &
                  "  Non manifold geometry in adjacent faces at edge with nodes: NOD1",&
                  WSELEM(NOD1)," (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",WSELEM(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
               ENDIF
               CALL SHUTDOWN("") ; RETURN
            ENDIF
            ! Check if opposite halfedge already in list.
            IF ( (SEG(NOD1) == GEOMETRY(IG)%EDGES(NOD2,IEDLIST)) .AND. &
                 (SEG(NOD2) == GEOMETRY(IG)%EDGES(NOD1,IEDLIST)) ) THEN
               INLIST = .TRUE.
               EXIT
            ENDIF
         ENDDO
         IF (INLIST) THEN ! Opposite halfedge already in list
            ! Check if the opposite halfedge is already coupled with its pair.
            ! This would mean that the surface is non-manifold (three faces share the same edge)
            IF (GEOMETRY(IG)%EDGE_FACES(1,IEDLIST) == 2) THEN
               XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD1)-1)+1:MAX_DIM*WSELEM(NOD1))
               XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD2)-1)+1:MAX_DIM*WSELEM(NOD2))
               IF (MY_RANK==0) THEN
                  IF (POSITIVE_ERROR_TEST) THEN
                    WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
                  ELSE
                    WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
                  ENDIF
                  WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') "  Non manifold geometry at edge with nodes: NOD1",&
                  WSELEM(NOD1)," (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",WSELEM(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
               ENDIF
               CALL SHUTDOWN("") ; RETURN
            ENDIF
            ! Couple halfedge with its pair
            GEOMETRY(IG)%EDGE_FACES(1,IEDLIST)   = 2
            GEOMETRY(IG)%EDGE_FACES(4,IEDLIST)   = IWSEL;
            GEOMETRY(IG)%EDGE_FACES(5,IEDLIST)   = IEDGE;
            GEOMETRY(IG)%FACE_EDGES(IEDGE,IWSEL) = IEDLIST;
         ELSE ! Opposite halfedge not in list, add a new entry
            NWSEDG = NWSEDG + 1;
            GEOMETRY(IG)%EDGES(NOD1:NOD2,NWSEDG) = SEG(NOD1:NOD2)
            GEOMETRY(IG)%EDGE_FACES(1,NWSEDG)    = 1
            GEOMETRY(IG)%EDGE_FACES(2,NWSEDG)    = IWSEL
            GEOMETRY(IG)%EDGE_FACES(3,NWSEDG)    = IEDGE
            GEOMETRY(IG)%FACE_EDGES(IEDGE,IWSEL) = NWSEDG
         ENDIF

         WSELEM=CSHIFT(WSELEM,1)

      ENDDO
   ENDDO

   ENDIF OPTIMIZE_SEG_DEF_COND

   ! Check if the surface is closed
   ! Each halfedge should be coupled with an opposite halfedge
   DO IEDLIST=1,NWSEDG
      IF (GEOMETRY(IG)%EDGE_FACES(1,IEDLIST) == 1) THEN
         XYZV(IAXIS:KAXIS,NOD1) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD1)-1)+1:MAX_DIM*WSELEM(NOD1))
         XYZV(IAXIS:KAXIS,NOD2) = GEOMETRY(IG)%VERTS(MAX_DIM*(WSELEM(NOD2)-1)+1:MAX_DIM*WSELEM(NOD2))
         IF (MY_RANK==0) THEN
            IF (POSITIVE_ERROR_TEST) THEN
              WRITE(LU_ERR,'(A,A,A)') "SUCCESS: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ELSE
              WRITE(LU_ERR,'(A,A,A)') "ERROR: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "':"
            ENDIF
            WRITE(LU_ERR,'(A,I8,A,3F12.3,A,I8,A,3F12.3,A)') "  Open geometry at edge with nodes: NOD1",&
            WSELEM(NOD1)," (", XYZV(IAXIS:KAXIS,NOD1), "), NOD2",WSELEM(NOD2)," (", XYZV(IAXIS:KAXIS,NOD2), ")"
         ENDIF
         CALL SHUTDOWN("") ; RETURN
      ENDIF
   ENDDO

   ! Check that all vertices are counted:
   DO INOD=1,NVERT
      IF (.NOT.COUNTED_VERT(INOD) .AND. MY_RANK==0) &
      WRITE(LU_ERR,'(A,A,A,I8,A)') " WARNING: GEOM ID='", TRIM(GEOMETRY(IG)%ID), "': Vertex ",INOD," not connected."
   ENDDO
   DEALLOCATE(COUNTED_VERT)

   GEOMETRY(IG)%N_EDGES = NWSEDG

   ! At this point the surface is manifold, well oriented, and closed.

   IF(MY_RANK==0 .AND. GET_CUTCELLS_VERBOSE) THEN
      IF (IG==N_GEOMETRY) THEN
         WRITE(LU_ERR,'(I4.4,A)',advance="no") IG,'.. done.'
         CALL CPU_TIME(CPUTIME)
         WRITE(LU_ERR  ,'(A,F8.3,A)') ' Time taken : ',CPUTIME-CPUTIME_START,' sec.'
      ELSE
         WRITE(LU_ERR,'(I4.4,A)',advance="no") IG,', '
      ENDIF
   ENDIF

ENDDO GEOMETRY_LOOP

! Print out of computed result:
! DO IG=1,N_GEOMETRY
!    NWSEL = GEOMETRY(IG)%N_FACES
!    DO IWSEL=1,NWSEL
!       print*, IWSEL,GEOMETRY(IG)%FACES_AREA(IWSEL)
!    ENDDO
!    DO IWSEL=1,NWSEL
!       print*, IWSEL,GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,IWSEL)
!    ENDDO
!    print*, "EDGES="
!    DO NWSEDG=1,GEOMETRY(IG)%N_EDGES
!       print*, NWSEDG,GEOMETRY(IG)%EDGES(NOD1:NOD2,NWSEDG)
!    ENDDO
!    DO NWSEDG=1,GEOMETRY(IG)%N_EDGES
!       print*, GEOMETRY(IG)%EDGE_FACES(1:5,NWSEDG)
!    ENDDO
!    print*, "FACES="
!    DO IWSEL=1,NWSEL
!       print*, IWSEL,GEOMETRY(IG)%FACE_EDGES(EDG1:EDG3,IWSEL)
!    ENDDO
! ENDDO

RETURN
END SUBROUTINE IBM_INIT_GEOM

! ------------------------ GET_GEOM_EDGES ---------------------------------------

SUBROUTINE GET_GEOM_EDGES(NVERT,NWSEL,SIZEFC,FACES,NWSEDG,EDGES,FACE_EDGES,EDGE_FACES)

INTEGER, INTENT(IN) :: NVERT,NWSEL,SIZEFC
INTEGER, INTENT(IN) :: FACES(1:SIZEFC)
INTEGER, INTENT(OUT):: NWSEDG,EDGES(NOD1:NOD2,3*NWSEL),FACE_EDGES(EDG1:EDG3,NWSEL),EDGE_FACES(5,3*NWSEL)

! Local Variables:
INTEGER :: IWSEL,IVERT,IEDGE,TOT_ELVERT,IEDLIST,WSELEM(NOD1:NOD3),SEG(NOD1:NOD2)
LOGICAL :: INLIST
LOGICAL :: FLG_LOHI
INTEGER, ALLOCATABLE, DIMENSION(:)  :: NELVERT,ISTVERT,EDGE_RNK
INTEGER, ALLOCATABLE, DIMENSION(:,:):: EDGES2,EDGE_FACES2

NWSEDG = 0

! Populate NELVERT with the number of elements associated per node:
ALLOCATE(NELVERT(NVERT));  NELVERT(:) = 0
ALLOCATE(ISTVERT(NVERT));  ISTVERT(:) = 0
DO IWSEL=1,NWSEL
   NELVERT(FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)) = &
   NELVERT(FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)) + 2
   ! +2 to have max number of verts in allocation, even though might mean
   ! non manifold.
ENDDO
DO IVERT=2,NVERT
   ISTVERT(IVERT) = ISTVERT(IVERT-1) + NELVERT(IVERT-1)
ENDDO

! First pass build unique list of segments per VERTEX where:
! SEG_IJ = [ni nj] with ni < nj
TOT_ELVERT = SUM(NELVERT(1:NVERT))
ALLOCATE(EDGES2(NOD1:NOD2,TOT_ELVERT)); EDGES2(:,:)      = 0
ALLOCATE(EDGE_FACES2(   5,TOT_ELVERT)); EDGE_FACES2(:,:) = 0
ALLOCATE(EDGE_RNK(        TOT_ELVERT)); EDGE_RNK(:)      = 0
NELVERT(:) = 0 ! Reset NELVERT.

DO IWSEL=1,NWSEL
   WSELEM(NOD1:NOD3) = FACES(NODS_WSEL*(IWSEL-1)+1:NODS_WSEL*IWSEL)

   DO IEDGE=EDG1,EDG3
      SEG(NOD1:NOD2) = (/ MINVAL(WSELEM(NOD1:NOD2)), MAXVAL(WSELEM(NOD1:NOD2)) /)
      FLG_LOHI = .TRUE.; IF(SEG(NOD2) /= WSELEM(NOD2)) FLG_LOHI = .FALSE.

      IF(NELVERT(SEG(NOD2)) == 0) THEN
         NELVERT(SEG(NOD2)) = NELVERT(SEG(NOD2)) + 1
         FACE_EDGES(IEDGE,IWSEL) = ISTVERT(SEG(NOD2)) + NELVERT(SEG(NOD2))
         EDGES2(NOD1:NOD2,FACE_EDGES(IEDGE,IWSEL)) = SEG(NOD1:NOD2)
         EDGE_FACES2(1,FACE_EDGES(IEDGE,IWSEL)) = &
         EDGE_FACES2(1,FACE_EDGES(IEDGE,IWSEL)) + 1
         IF(FLG_LOHI) THEN
             EDGE_FACES2(2,FACE_EDGES(IEDGE,IWSEL))   = IWSEL
             EDGE_FACES2(3,FACE_EDGES(IEDGE,IWSEL))   = IEDGE
         ELSE
             EDGE_FACES2(4,FACE_EDGES(IEDGE,IWSEL))   = IWSEL
             EDGE_FACES2(5,FACE_EDGES(IEDGE,IWSEL))   = IEDGE
         ENDIF
         WSELEM=CSHIFT(WSELEM,1)
         CYCLE ! IEDGE
      ENDIF

      INLIST = .FALSE.
      DO IEDLIST=ISTVERT(SEG(NOD2))+1,ISTVERT(SEG(NOD2))+NELVERT(SEG(NOD2))
         ! Here SEG(NOD2) is by construction the same as
         ! EDGES2(NOD2,IEDLIST), search only NOD1 component.
         IF(SEG(NOD1) == EDGES2(NOD1,IEDLIST)) THEN
            INLIST = .TRUE.
            EXIT ! IEDLIST
         ENDIF
      ENDDO
      IF(INLIST) THEN
         FACE_EDGES(IEDGE,IWSEL) = IEDLIST
      ELSE
         NELVERT(SEG(NOD2)) = NELVERT(SEG(NOD2)) + 1
         FACE_EDGES(IEDGE,IWSEL) = ISTVERT(SEG(NOD2)) + NELVERT(SEG(NOD2))
         EDGES2(NOD1:NOD2,FACE_EDGES(IEDGE,IWSEL)) = SEG(NOD1:NOD2)
      ENDIF

      EDGE_FACES2(1,FACE_EDGES(IEDGE,IWSEL)) = &
      EDGE_FACES2(1,FACE_EDGES(IEDGE,IWSEL)) + 1
      IF(FLG_LOHI) THEN
          EDGE_FACES2(2,FACE_EDGES(IEDGE,IWSEL))   = IWSEL
          EDGE_FACES2(3,FACE_EDGES(IEDGE,IWSEL))   = IEDGE
      ELSE
          EDGE_FACES2(4,FACE_EDGES(IEDGE,IWSEL))   = IWSEL
          EDGE_FACES2(5,FACE_EDGES(IEDGE,IWSEL))   = IEDGE
      ENDIF

      WSELEM=CSHIFT(WSELEM,1)
   ENDDO
ENDDO

! Second pass get segments ranking:
DO IVERT=1,NVERT
   DO IEDLIST=ISTVERT(IVERT)+1,ISTVERT(IVERT)+NELVERT(IVERT)
       NWSEDG = NWSEDG + 1
       EDGE_RNK(IEDLIST) = NWSEDG
       EDGES(NOD1:NOD2,NWSEDG) = EDGES2(NOD1:NOD2,IEDLIST)
       EDGE_FACES(1:5,NWSEDG)  = EDGE_FACES2(1:5,IEDLIST)
   ENDDO
ENDDO

! Third pass populate FACE_EDGES data:
DO IWSEL=1,NWSEL
   DO IEDGE=EDG1,EDG3
      IEDLIST = EDGE_RNK(FACE_EDGES(IEDGE,IWSEL))
      FACE_EDGES(IEDGE,IWSEL) = IEDLIST
   ENDDO
ENDDO

DEALLOCATE(NELVERT,ISTVERT,EDGES2,EDGE_FACES2,EDGE_RNK)

RETURN
END SUBROUTINE GET_GEOM_EDGES

! ------------------------- GET_X2_VERTVAR --------------------------------------

SUBROUTINE GET_X2_VERTVAR(X1AXIS,X2LO,X2HI,NM,I,KK)

INTEGER, INTENT(IN) :: X1AXIS,X2LO,X2HI,NM,I,KK

! Local Variables:
INTEGER :: ICRS,ICRS1,JSTR,JEND,JJ,X2LO_LOC,X2HI_LOC
REAL(EB):: TNOW

TNOW=CURRENT_TIME()

! Work By Edge, Only one X1AXIS=IAXIS needs to be used:
SELECT CASE(X1AXIS)
CASE(IAXIS)
   X2LO_LOC = X2LO
   X2HI_LOC = X2HI
   ! Case of GG, SS points:
   DO ICRS=1,IBM_N_CRS
      ! If is_crs(icrs) == GG, SS, SGG see if crossing is
      ! exactly on a Cartesian cell vertex:
      SELECT CASE(IBM_IS_CRS(ICRS))
      CASE(IBM_GG,IBM_SS)
         JSTR = X2LO_LOC; JEND = X2HI_LOC
         IF(X2NOC==0) THEN
            ! Optimized and will ONLY work for Uniform Grids:
            JSTR = MAX(X2LO_LOC,   FLOOR((IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(X2LO_LOC))/DX2FACE(X2LO_LOC)) + X2LO_LOC)
            JEND = MIN(X2HI_LOC, CEILING((IBM_SVAR_CRS(ICRS)+GEOMEPS-X2FACE(X2LO_LOC))/DX2FACE(X2LO_LOC)) + X2LO_LOC)
         ENDIF

         DO JJ=JSTR,JEND
            ! Crossing on Vertex?
            IF ( ABS(X2FACE(JJ)-IBM_SVAR_CRS(ICRS)) < GEOMEPS ) THEN
               MESHES(NM)%VERTVAR(I,JJ,KK,IBM_VGSC) = IBM_SOLID
               EXIT
            ENDIF
         ENDDO

      END SELECT
   ENDDO

   ! Other cases:
   DO ICRS=1,IBM_N_CRS-1
      ! Case GS-SG: All Cartesian vertices are set to IBM_SOLID.
      IF (IBM_IS_CRS(ICRS) == IBM_GS) THEN
         ! Find corresponding SG intersection:
         DO ICRS1=ICRS+1,IBM_N_CRS
            IF (IBM_IS_CRS(ICRS1) == IBM_SG) EXIT
         ENDDO
         JSTR = X2LO_LOC; JEND = X2HI_LOC
         IF(X2NOC==0) THEN
            ! Optimized for UG:
            JSTR = MAX(X2LO_LOC, CEILING(( IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(X2LO_LOC))/DX2FACE(X2LO_LOC)) + X2LO_LOC)
            JEND = MIN(X2HI_LOC,   FLOOR((IBM_SVAR_CRS(ICRS1)+GEOMEPS-X2FACE(X2LO_LOC))/DX2FACE(X2LO_LOC)) + X2LO_LOC)
         ELSE
            IF ((IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(X2LO_LOC))    <  0._EB) THEN
               JSTR=X2LO_LOC
            ELSEIF((IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(X2HI_LOC)) >= 0._EB) THEN
               JSTR=X2HI_LOC+1
            ELSE
               DO JJ=X2LO_LOC,X2HI_LOC
                  IF((IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(JJ))   >= 0._EB .AND. &
                     (IBM_SVAR_CRS(ICRS)-GEOMEPS-X2FACE(JJ+1)) <  0._EB ) THEN
                     JSTR = JJ+1
                     EXIT
                  ENDIF
               ENDDO
            ENDIF
            IF ((IBM_SVAR_CRS(ICRS1)+GEOMEPS-X2FACE(X2LO_LOC)) < 0._EB) THEN
               JEND=X2LO_LOC-1
            ELSEIF((IBM_SVAR_CRS(ICRS1)+GEOMEPS-X2FACE(X2HI))  >= 0._EB) THEN
               JEND=X2HI_LOC
            ELSE
               DO JJ=X2LO_LOC,X2HI_LOC
                  IF((IBM_SVAR_CRS(ICRS1)+GEOMEPS-X2FACE(JJ))   >= 0._EB .AND. &
                     (IBM_SVAR_CRS(ICRS1)+GEOMEPS-X2FACE(JJ+1)) <  0._EB ) THEN
                     JEND = JJ
                     EXIT
                  ENDIF
               ENDDO
            ENDIF
         ENDIF

         DO JJ=JSTR,JEND
            MESHES(NM)%VERTVAR(I,JJ,KK,IBM_VGSC) = IBM_SOLID
         ENDDO
      ENDIF
   ENDDO
END SELECT

T_CC_USED(GET_X2_VERTVAR_TIME_INDEX) = T_CC_USED(GET_X2_VERTVAR_TIME_INDEX) + CURRENT_TIME() - TNOW

RETURN
END SUBROUTINE GET_X2_VERTVAR

! -------------------------- GET_CARTEDGE_CUTEDGES ------------------------------

SUBROUTINE GET_CARTEDGE_CUTEDGES(X1AXIS,X2AXIS,X3AXIS,XIAXIS,XJAXIS,XKAXIS, &
                                 NM,X2LO_CELL,X2HI_CELL,INDX1,KK)

INTEGER, INTENT(IN) :: X1AXIS,X2AXIS,X3AXIS,XIAXIS,XJAXIS,XKAXIS, &
                       NM,X2LO_CELL,X2HI_CELL,INDX1(MAX_DIM),KK

! Local Variables:
INTEGER :: NEDGECROSS, NEDGECROSS_OLD, NCUTEDGE, JJ, INDXI(MAX_DIM), INDI, INDJ, INDK
INTEGER :: INDI1, INDJ1, INDK1, INDIE, INDJE, INDKE, NCROSS, ICROSS, ICRS, JSTR
INTEGER :: JJLOW, JJHIGH, JJADD
REAL(EB):: DELJJ
LOGICAL :: VSOLID, DIF, VFLUID
REAL(EB):: X123VERT(MAX_DIM,IBM_MAXCROSS_EDGE), XCEN, YCEN, ZCEN, SCEN, XYZCEN(IAXIS:KAXIS)
INTEGER :: NEDGE, NVERT, IVERT
LOGICAL :: IS_GASPHASE
REAL(EB) :: TNOW

LOGICAL :: FOUND_EDGE
REAL(EB):: XVJJ, DELJJ1

TNOW=CURRENT_TIME()

! INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CEELEMAUX, INDSEGAUX
! INTEGER :: NEDGE_SIZE

!  Now define Crossings on Cartesian Edges and Body segments:
!  - Edges: MESHES(NM) % ECVAR(:,:,:,IBM_EGSC,IAXIS) =
!                        ECVAR(:,:,:,IBM_EGSC,JAXIS) = IBM_GASPHASE, IBM_SOLID or IBM_CUTCFE
!                        ECVAR(:,:,:,IBM_EGSC,KAXIS) =
!                        ECVAR(:,:,:,IBM_ECRS,IAXIS) =
!                        ECVAR(:,:,:,IBM_ECRS,JAXIS) = Index to Corresponding EDGE_CROSS array.
!                        ECVAR(:,:,:,IBM_ECRS,KAXIS) =
!           MESHES(NM) % EDGE_CROSS: Data structure with
!                        crossings per cartesian edge information.
!                       .NCROSS = Number of crossings.
!                       .SVAR(1:NCROSS)   = distances along edge from lower
!                                           Cartesian vertex.
!           Note: Crossings right on vertices do not need to be added,
!           they are taken care of by setting VERTVAR(iv,jv,kv,IBM_VGSC,lb)=IBM_SOLID.
!           MESHES(NM) % CUT_EDGE: Data structure with info on IBM_GASPHASE cut-edges,
!                        per Cartesian Edge and IBM_INBOUNDARY cut-edges, per
!                        Cartesian Face:
!                       .NVERT  = number of vertices on cut-edges.
!                       .NEDGE  = number of cut-edges.
!                       .XYZVERT(IAXIS:KAXIS,1:NVERT) = Segments Vertices
!                       .CEELEM(NOD1:NOD2,1:NEDGE) = Segments connectivity list.
!                       .STATUS = IBM_GASPHASE or IBM_INBOUNDARY; if latter
!                       .IJK    = [I J K AXIS] for Cartesian Edge if status = IBM_GASPHASE
!                               = [I J K AXIS] for Cartesian Face if status = IBM_INBOUNDARY
!                       .INDSEG(1:4,1:NEDGE)   = [nwel iwel1 iwel2 ibod] if status = IBM_INBOUNDARY
!           Also:
!                       ECVAR(:,:,:,IBM_IDCE,IAXIS,:) =
!                       ECVAR(:,:,:,IBM_IDCE,IAXIS,:) = index on CUT_EDGE location.
!                       ECVAR(:,:,:,IBM_IDCE,IAXIS,:) =
!
!  Now figure out which segment the intersections belong to, also
!  add intersections to body segments.
!  As defined, a Cartesian CUT_EDGE is defined by:
!  1. A crossing.
!  2. A VERTVAR(iv,jv,kv,IBM_VGSC,lb) =    IBM_SOLID and another
!       VERTVAR(iv,jv,kv,IBM_VGSC,lb) = IBM_GASPHASE

! Set initially edges with MESHES(NM)%VERTVAR vertices == IBM_SOLID to IBM_SOLID status:
DO JJ=X2LO_CELL,X2HI_CELL

    ! Vert at index JJ-FCELL:
    INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ-FCELL, KK /) ! Local x1,x2,x3
    INDI=INDXI(XIAXIS)
    INDJ=INDXI(XJAXIS)
    INDK=INDXI(XKAXIS)
    ! Vert at index JJ-FCELL+1:
    INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ-FCELL+1, KK /) ! Local x1,x2,x3
    INDI1=INDXI(XIAXIS)
    INDJ1=INDXI(XJAXIS)
    INDK1=INDXI(XKAXIS)
    ! Edge at index JJ:
    INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ, KK /) ! Local x1,x2,x3
    INDIE=INDXI(XIAXIS)
    INDJE=INDXI(XJAXIS)
    INDKE=INDXI(XKAXIS)

    IF ((MESHES(NM)%VERTVAR(INDI ,INDJ ,INDK ,IBM_VGSC) == IBM_SOLID) .AND. &
        (MESHES(NM)%VERTVAR(INDI1,INDJ1,INDK1,IBM_VGSC) == IBM_SOLID) )     &
         MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_EGSC,X2AXIS) = IBM_SOLID

ENDDO


NEDGECROSS_OLD = MESHES(NM) % N_EDGE_CROSS
! Edges with Crossings not on VERTICES:
ICRS_DO : DO ICRS=1,IBM_N_CRS

    ! Skip SOLID-SOLID intersections, as there is no media crossing:
    IF (IBM_IS_CRS(ICRS) == IBM_SS) CYCLE

    ! Check location on grid of crossing:
    ! See if crossing is exactly on a Cartesian cell vertex:
    IF (X2NOC==0) THEN
       ! Optimized for UG:
       JSTR = FLOOR( (IBM_SVAR_CRS(ICRS)-GEOMEPS-X2CELL(X2LO_CELL))/DX2CELL(X2LO_CELL) ) + X2LO_CELL
       ! Discard cut-edges on Cartesian edges laying > X2HI_CELL.
       IF (JSTR < X2LO_CELL-1) CYCLE
       IF (JSTR > X2HI_CELL+1) CYCLE

       JJ    = JSTR
       DELJJ = ABS(X2CELL(JJ)-IBM_SVAR_CRS(ICRS)) - DX2CELL(X2LO_CELL)/2._EB
       ! Crossing on Vertex?
       IF ( ABS(DELJJ) < GEOMEPS ) THEN ! Add crossing to two edges:
           JJLOW=0; JJHIGH=1
       ELSEIF ( DELJJ < -GEOMEPS ) THEN ! Crossing in jj Edge.
           JJLOW=0; JJHIGH=0
       ELSEIF ( DELJJ > GEOMEPS ) THEN ! Crossing in jj+1 Edge.
           JJLOW=1; JJHIGH=1
       ENDIF
    ELSE
       FOUND_EDGE=.FALSE.
       JJLOW = -1000000
       JJHIGH=  1000000
       DO JJ=X2LO_CELL-1,X2HI_CELL
          DELJJ = IBM_SVAR_CRS(ICRS)-X2CELL(JJ)
          XVJJ  = X2CELL(JJ) + DX2CELL(JJ)/2._EB
          DELJJ1= IBM_SVAR_CRS(ICRS)-X2CELL(JJ+1)
          ! First two edges:
          IF(ABS(IBM_SVAR_CRS(ICRS)-XVJJ) < GEOMEPS) THEN ! Both JJ and JJ+1
             FOUND_EDGE=.TRUE.
             JJLOW=0; JJHIGH=1
             EXIT
          ELSEIF (ABS(DELJJ) <   DX2CELL(JJ)/2._EB) THEN ! JJ
             FOUND_EDGE=.TRUE.
             JJLOW=0; JJHIGH=0
             EXIT
          ELSEIF (ABS(DELJJ1)< DX2CELL(JJ+1)/2._EB) THEN ! JJ+1
             FOUND_EDGE=.TRUE.
             JJLOW=1; JJHIGH=1
             EXIT
          ENDIF
       ENDDO
       IF(.NOT.FOUND_EDGE) CYCLE
    ENDIF

    DO JJADD=JJLOW,JJHIGH
        ! Edge in the left:
        ! Edge at index JJ or JJ+1:
        INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ+JJADD, KK /) ! Local x1,x2,x3
        INDIE=INDXI(XIAXIS)
        INDJE=INDXI(XJAXIS)
        INDKE=INDXI(XKAXIS)

        ! Set MESHES(NM)%ECVAR(IE,JE,KE,IBM_EGSC,X2AXIS) = IBM_CUTCFE:
        ICROSS = MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_ECRS,X2AXIS)

        IF ( ICROSS > 0 ) THEN ! Edge has crossings already.

            ! Populate EDGECROSS struct:
            NCROSS = MESHES(NM)%EDGE_CROSS(ICROSS)%NCROSS + 1
            MESHES(NM)%EDGE_CROSS(ICROSS) % NCROSS       = NCROSS
            MESHES(NM)%EDGE_CROSS(ICROSS) % SVAR(NCROSS) = IBM_SVAR_CRS(ICRS)
            MESHES(NM)%EDGE_CROSS(ICROSS) % ISVAR(NCROSS)= IBM_IS_CRS(ICRS)

        ELSE ! No crossings yet.

            NEDGECROSS = MESHES(NM)%N_EDGE_CROSS + 1
            MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_EGSC,X2AXIS) = IBM_CUTCFE
            MESHES(NM)%N_EDGE_CROSS                      = NEDGECROSS
            MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_ECRS,X2AXIS) = NEDGECROSS

            CALL EDGE_CROSS_ARRAY_REALLOCATE(NM,NEDGECROSS)

            ! Populate EDGECROSS struct:
            NCROSS = 1
            MESHES(NM)%EDGE_CROSS(NEDGECROSS) % NCROSS       = NCROSS
            MESHES(NM)%EDGE_CROSS(NEDGECROSS) % SVAR(NCROSS) = IBM_SVAR_CRS(ICRS)
            MESHES(NM)%EDGE_CROSS(NEDGECROSS) % ISVAR(NCROSS)= IBM_IS_CRS(ICRS)
            MESHES(NM)%EDGE_CROSS(NEDGECROSS) % IJK(1:4) = (/ INDIE, INDJE, INDKE, X2AXIS /)

        ENDIF

    ENDDO

ENDDO ICRS_DO

! Now Define MESHES(NM)%CUT_EDGE for IBM_GASPHASE cut-edges:
! First: Run over crossings and set MESHES(NM)%IBM_CUT_EDGES:
DO ICROSS=NEDGECROSS_OLD+1,MESHES(NM)%N_EDGE_CROSS

   ! Discard edge outside of blocks ranges for ray on x2axis:
   IF ( (MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS) < X2LO_CELL) .OR. &
        (MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS) > X2HI_CELL) ) CYCLE

   NCROSS = MESHES(NM)%EDGE_CROSS(ICROSS)%NCROSS

   ! Edge Location in x1,x2,x3 axes:
   ! Vert at index JJ-FCELL:
   INDXI(IAXIS:KAXIS) = (/ MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X1AXIS),       &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL, &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X3AXIS) /) ! Local x1,x2,x3
   INDI=INDXI(XIAXIS)
   INDJ=INDXI(XJAXIS)
   INDK=INDXI(XKAXIS)
   ! Vert at index JJ-FCELL+1:
   INDXI(IAXIS:KAXIS) = (/ MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X1AXIS),           &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL+1,   &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X3AXIS) /) ! Local x1,x2,x3
   INDI1=INDXI(XIAXIS)
   INDJ1=INDXI(XJAXIS)
   INDK1=INDXI(XKAXIS)
   ! Edge at index jj:
   INDXI(IAXIS:KAXIS) = (/ MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X1AXIS),    &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS),    &
                           MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X3AXIS) /) ! Local x1,x2,x3
   INDIE=INDXI(XIAXIS) ! i.e. MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(IAXIS), etc.
   INDJE=INDXI(XJAXIS)
   INDKE=INDXI(XKAXIS)

   ! Discard Edge with one EDGECROSS and both vertices having VERTVAR = IBM_SOLID:
   ! The crossing is on one of the edge vertices.
   IF ( (NCROSS == 1)                                                 .AND. &
        (MESHES(NM)%VERTVAR(INDI ,INDJ ,INDK ,IBM_VGSC) == IBM_SOLID) .AND. &
        (MESHES(NM)%VERTVAR(INDI1,INDJ1,INDK1,IBM_VGSC) == IBM_SOLID) ) THEN

      MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_EGSC,X2AXIS) = IBM_SOLID
      CYCLE

   ENDIF

   ! Discard cases for edge with two crossings:
   IF ( NCROSS == 2 ) THEN

      VSOLID = (MESHES(NM)%VERTVAR(INDI ,INDJ ,INDK ,IBM_VGSC) == IBM_SOLID) .AND. &
               (MESHES(NM)%VERTVAR(INDI1,INDJ1,INDK1,IBM_VGSC) == IBM_SOLID)

      ! Test if crossings lay on same location + solid vertices:
      DIF  = ( MESHES(NM)%EDGE_CROSS(ICROSS)%SVAR(2) - &
               MESHES(NM)%EDGE_CROSS(ICROSS)%SVAR(1) ) < GEOMEPS
      IF (DIF .AND. VSOLID) THEN
           MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_EGSC,X2AXIS) = IBM_SOLID
           CYCLE
      ENDIF

      DIF  = (ABS(X2FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL  ) -     &
                         MESHES(NM)%EDGE_CROSS(ICROSS)%SVAR(1)) < GEOMEPS)  .AND. &
             (ABS(X2FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL+1) -     &
                         MESHES(NM)%EDGE_CROSS(ICROSS)%SVAR(2)) < GEOMEPS)

      VFLUID  = (MESHES(NM)%EDGE_CROSS(ICROSS)%ISVAR(1) == IBM_GS)  .AND. &
                (MESHES(NM)%EDGE_CROSS(ICROSS)%ISVAR(2) == IBM_SG)

      IF (DIF .AND. VSOLID .AND. VFLUID) THEN
         MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_EGSC,X2AXIS) = IBM_SOLID
         CYCLE
      ENDIF

   ENDIF

   ! New CUT_EDGE struct for this edge:
   NCUTEDGE = MESHES(NM)%N_CUTEDGE_MESH + 1
   MESHES(NM)%N_CUTEDGE_MESH                       = NCUTEDGE
   MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_IDCE,X2AXIS)= NCUTEDGE

   CALL CUT_EDGE_ARRAY_REALLOC(NM,NCUTEDGE)

   MESHES(NM)%CUT_EDGE(NCUTEDGE)%STATUS           = IBM_GASPHASE
   MESHES(NM)%CUT_EDGE(NCUTEDGE)%IJK(1:MAX_DIM+1) = MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(1:MAX_DIM+1)
   MESHES(NM)%CUT_EDGE(NCUTEDGE)%IJK(MAX_DIM+2)   = IBM_UNDEFINED ! No need to define type of CUT_EDGE
                                                                      ! (is IBM_GASPHASE).
   ! First Vertices:
   NVERT = NCROSS + 2
   MESHES(NM)%CUT_EDGE(NCUTEDGE)%NVERT = NVERT
   X123VERT(IAXIS:KAXIS,1:NVERT) = 0._EB
   X123VERT(IAXIS,1:NVERT)   = X1FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X1AXIS))
   X123VERT(JAXIS,1)         = X2FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL)
   X123VERT(JAXIS,2:NCROSS+1)= MESHES(NM)%EDGE_CROSS(ICROSS)%SVAR(1:NCROSS)
   X123VERT(JAXIS,NVERT)     = X2FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X2AXIS)-FCELL+1)
   X123VERT(KAXIS,1:NVERT)   = X3FACE(MESHES(NM)%EDGE_CROSS(ICROSS)%IJK(X3AXIS))

   ! Allocate new edge XYZVERT, CEELEM, INDSEG
   CALL NEW_EDGE_ALLOC(NM,NCUTEDGE,NVERT,IBM_ALLOC_DELEM)
   DO IVERT=1,MESHES(NM)%CUT_EDGE(NCUTEDGE)%NVERT
      MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(IAXIS:KAXIS,IVERT) = &
                        X123VERT( (/ XIAXIS, XJAXIS, XKAXIS /) ,IVERT)
   ENDDO

   ! Now Cut Edges:
   ! Cross type:
   !VERT_TYPE(1)          = MESHES(NM)%VERTVAR(indI ,indJ ,indK ,IBM_VGSC)
   !VERT_TYPE(2:NCROSS+1) = MESHES(NM)%EDGE_CROSS(ICROSS)%ISVAR(1:NCROSS)
   !VERT_TYPE(NVERT)      = MESHES(NM)%VERTVAR(indI1,indJ1,indK1,IBM_VGSC)

   ! This assumes crossings are ordered for increasing svar, no repeated svar:
   NEDGE = 0
   MESHES(NM)%CUT_EDGE(NCUTEDGE)%NEDGE = NEDGE
   DO IVERT=1,MESHES(NM)%CUT_EDGE(NCUTEDGE)%NVERT-1

      ! Drop zero length edge (in x2 local dir):
      IF (ABS(X123VERT(JAXIS,IVERT)-X123VERT(JAXIS,IVERT+1)) < GEOMEPS) CYCLE

      ! Define if the cut-edge is gasphase:
      ! Ray tracing for the center of the cut-edge most robust.
      XCEN  = 0.5_EB*(MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(IAXIS,IVERT  ) + &
                      MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(IAXIS,IVERT+1))
      YCEN  = 0.5_EB*(MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(JAXIS,IVERT  ) + &
                      MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(JAXIS,IVERT+1))
      ZCEN  = 0.5_EB*(MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(KAXIS,IVERT  ) + &
                      MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT(KAXIS,IVERT+1))
      XYZCEN(IAXIS:KAXIS) = (/ XCEN, YCEN, ZCEN /)

      ! Do a SOLID crossing count up to XYZcen(x2axis):
      SCEN=XYZCEN(X2AXIS)
      CALL GET_IS_GASPHASE(SCEN,IS_GASPHASE)
      ![isgasphase]=get_isgasphase(n_crs,svar_crs,is_crs,scen);

      IF ( IS_GASPHASE ) THEN
         NEDGE = NEDGE + 1
         ! Test for size of CEELEM, INDSEG, if smaller than NEDGE reallocate:
         CALL REALLOCATE_EDGE_ELEM(NM,NCUTEDGE,NEDGE)
         MESHES(NM)%CUT_EDGE(NCUTEDGE)%NEDGE = NEDGE
         MESHES(NM)%CUT_EDGE(NCUTEDGE)%CEELEM(NOD1:NOD2,NEDGE) = (/ IVERT, IVERT+1 /)
      ENDIF
   ENDDO

   IF (MESHES(NM)%CUT_EDGE(NCUTEDGE)%NEDGE == 0) THEN ! REWIND
      DEALLOCATE(MESHES(NM)%CUT_EDGE(NCUTEDGE)%XYZVERT)
      DEALLOCATE(MESHES(NM)%CUT_EDGE(NCUTEDGE)%CEELEM)
      DEALLOCATE(MESHES(NM)%CUT_EDGE(NCUTEDGE)%INDSEG)
      NCUTEDGE = NCUTEDGE - 1
      MESHES(NM)%N_CUTEDGE_MESH                        = NCUTEDGE
      MESHES(NM)%ECVAR(INDIE,INDJE,INDKE,IBM_IDCE,X2AXIS) = 0
   ENDIF

ENDDO

T_CC_USED(GET_CARTEDGE_CUTEDGES_TIME_INDEX) = T_CC_USED(GET_CARTEDGE_CUTEDGES_TIME_INDEX) + CURRENT_TIME() - TNOW

RETURN
END SUBROUTINE GET_CARTEDGE_CUTEDGES


! ------------------------EDGE_CROSS_ARRAY_REALLOCATE----------------------------

SUBROUTINE EDGE_CROSS_ARRAY_REALLOCATE(NM,CEI)

INTEGER, INTENT(IN) :: NM, CEI

! Local Variables:
INTEGER :: CEI1, SIZE_EDGE_CROSS

SIZE_EDGE_CROSS = SIZE(MESHES(NM)%EDGE_CROSS,DIM=1)
IF(CEI > SIZE_EDGE_CROSS) THEN
   ALLOCATE(EDGE_CROSS_AUX(SIZE_EDGE_CROSS+GLOBAL_DELTA_EDGE))
   DO CEI1=1,CEI-1
      EDGE_CROSS_AUX(CEI1)%NCROSS = MESHES(NM)%EDGE_CROSS(CEI1)%NCROSS
      EDGE_CROSS_AUX(CEI1)%SVAR   = MESHES(NM)%EDGE_CROSS(CEI1)%SVAR
      EDGE_CROSS_AUX(CEI1)%ISVAR  = MESHES(NM)%EDGE_CROSS(CEI1)%ISVAR
      EDGE_CROSS_AUX(CEI1)%IJK    = MESHES(NM)%EDGE_CROSS(CEI1)%IJK
   ENDDO
   CALL MOVE_ALLOC(FROM=EDGE_CROSS_AUX, TO=MESHES(NM)%EDGE_CROSS)
ENDIF

RETURN
END SUBROUTINE EDGE_CROSS_ARRAY_REALLOCATE


! --------------------------CUT_EDGE_ARRAY_REALLOC-------------------------------

SUBROUTINE CUT_EDGE_ARRAY_REALLOC(NM,CEI)

INTEGER, INTENT(IN) :: NM, CEI

! Local Variables:
INTEGER :: CEI1, SIZE_CUT_EDGE

SIZE_CUT_EDGE = SIZE(MESHES(NM)%CUT_EDGE,DIM=1)
IF (CEI > SIZE_CUT_EDGE) THEN
   ALLOCATE(CUT_EDGE_AUX(SIZE_CUT_EDGE+GLOBAL_DELTA_EDGE))
   DO CEI1=1,CEI-1
      CUT_EDGE_AUX(CEI1)%NVERT   =  MESHES(NM)%CUT_EDGE(CEI1)%NVERT
      CUT_EDGE_AUX(CEI1)%NEDGE   =  MESHES(NM)%CUT_EDGE(CEI1)%NEDGE
      CUT_EDGE_AUX(CEI1)%NEDGE1  =  MESHES(NM)%CUT_EDGE(CEI1)%NEDGE1
      CUT_EDGE_AUX(CEI1)%STATUS  =  MESHES(NM)%CUT_EDGE(CEI1)%STATUS
      CUT_EDGE_AUX(CEI1)%IJK     =  MESHES(NM)%CUT_EDGE(CEI1)%IJK
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_EDGE(CEI1)%XYZVERT,    TO=CUT_EDGE_AUX(CEI1)%XYZVERT)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_EDGE(CEI1)%CEELEM,     TO=CUT_EDGE_AUX(CEI1)%CEELEM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_EDGE(CEI1)%INDSEG,     TO=CUT_EDGE_AUX(CEI1)%INDSEG)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_EDGE(CEI1)%NOD_PERM,   TO=CUT_EDGE_AUX(CEI1)%NOD_PERM)
   ENDDO
   CALL MOVE_ALLOC(FROM=CUT_EDGE_AUX, TO=MESHES(NM)%CUT_EDGE)
ENDIF

RETURN
END SUBROUTINE CUT_EDGE_ARRAY_REALLOC


! ----------------------------- NEW_EDGE_ALLOC ----------------------------------

SUBROUTINE NEW_EDGE_ALLOC(NM,CEI,NVERTALLOC,NEDGEALLOC)

INTEGER, INTENT(IN) :: NM, CEI, NVERTALLOC, NEDGEALLOC

IF (ALLOCATED(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT))  DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT)
IF (ALLOCATED(MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM)) DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM)
IF (ALLOCATED(MESHES(NM)%CUT_EDGE(CEI)%CEELEM))   DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM)
IF (ALLOCATED(MESHES(NM)%CUT_EDGE(CEI)%INDSEG))   DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%INDSEG)

ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,1:NVERTALLOC))
ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(1:NVERTALLOC))
ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:NEDGEALLOC))
ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%INDSEG(IBM_MAX_WSTRIANG_SEG+3,1:NEDGEALLOC))

MESHES(NM)%CUT_EDGE(CEI)%XYZVERT = 0._EB
MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM= IBM_UNDEFINED
MESHES(NM)%CUT_EDGE(CEI)%CEELEM  = IBM_UNDEFINED
MESHES(NM)%CUT_EDGE(CEI)%INDSEG  = IBM_UNDEFINED

RETURN

END SUBROUTINE NEW_EDGE_ALLOC

! ------------------ REALLOCATE_EDGE_VERT(NM,CEI,NVERT) -------------------------

SUBROUTINE REALLOCATE_EDGE_VERT(NM,CEI,NVERT)

INTEGER, INTENT(IN) :: NM, CEI, NVERT

! Local Variables:
INTEGER :: NVERT_SIZE
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: XYZVERTAUX
INTEGER,  ALLOCATABLE, DIMENSION(:)   :: NOD_PERMAUX

NVERT_SIZE = SIZE(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT, DIM=2)

IF (NVERT > NVERT_SIZE) THEN ! Reallocate XYZVERT
   ALLOCATE(XYZVERTAUX(IAXIS:KAXIS,1:NVERT_SIZE))
   XYZVERTAUX(IAXIS:KAXIS,1:NVERT_SIZE) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(:,:)
   DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT)
   ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,1:NVERT_SIZE+IBM_ALLOC_DVERT))
   MESHES(NM)%CUT_EDGE(CEI)%XYZVERT = 0._EB
   MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,1:NVERT_SIZE) = XYZVERTAUX(IAXIS:KAXIS,1:NVERT_SIZE)

   ALLOCATE(NOD_PERMAUX(1:NVERT_SIZE))
   NOD_PERMAUX(1:NVERT_SIZE) = MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(1:NVERT_SIZE)
   DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM)
   ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(1:NVERT_SIZE+IBM_ALLOC_DVERT))
   MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM = IBM_UNDEFINED
   MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(1:NVERT_SIZE) = NOD_PERMAUX(1:NVERT_SIZE)

   DEALLOCATE(XYZVERTAUX, NOD_PERMAUX)
ENDIF

RETURN

END SUBROUTINE REALLOCATE_EDGE_VERT

! ------------------ REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE) -------------------------

SUBROUTINE REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE)

INTEGER, INTENT(IN) :: NM, CEI, NEDGE

! Local Variables:
INTEGER :: NEDGE_SIZE, IBM_ALLOC_ELEM
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CEELEMAUX, INDSEGAUX

NEDGE_SIZE = SIZE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM, DIM=2)

IF (NEDGE > NEDGE_SIZE) THEN ! Reallocate CEELEM,

   IBM_ALLOC_ELEM = MAX(NEDGE-NEDGE_SIZE,IBM_ALLOC_DELEM)

   ALLOCATE(CEELEMAUX(NOD1:NOD2,1:NEDGE_SIZE), INDSEGAUX(IBM_MAX_WSTRIANG_SEG+3,1:NEDGE_SIZE))
   CEELEMAUX(:,:) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(:,:)
   INDSEGAUX(:,:) = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(:,:)

   DEALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM,MESHES(NM)%CUT_EDGE(CEI)%INDSEG)

   ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:NEDGE_SIZE+IBM_ALLOC_ELEM))
   MESHES(NM)%CUT_EDGE(CEI)%CEELEM = IBM_UNDEFINED
   MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:NEDGE_SIZE) = CEELEMAUX(NOD1:NOD2,1:NEDGE_SIZE)

   ALLOCATE(MESHES(NM)%CUT_EDGE(CEI)%INDSEG(IBM_MAX_WSTRIANG_SEG+3,1:NEDGE_SIZE+IBM_ALLOC_ELEM))
   MESHES(NM)%CUT_EDGE(CEI)%INDSEG = IBM_UNDEFINED
   MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,1:NEDGE_SIZE) = &
   INDSEGAUX(1:IBM_MAX_WSTRIANG_SEG+3,1:NEDGE_SIZE)

   DEALLOCATE(CEELEMAUX,INDSEGAUX)
ENDIF

RETURN

END SUBROUTINE REALLOCATE_EDGE_ELEM

! -------------------------- GET_ISGASPHASE -------------------------------------

SUBROUTINE GET_IS_GASPHASE(SCEN,IS_GASPHASE)

REAL(EB), INTENT(IN) :: SCEN
LOGICAL, INTENT(OUT) :: IS_GASPHASE

! Local Variables:
LOGICAL :: IS_GASPHASE_LEFT, IS_GASPHASE_RIGHT
INTEGER :: ICRS

! Count GS,SG intersections from both sides:
IS_GASPHASE_LEFT = .TRUE.
DO ICRS=1,IBM_N_CRS
   IF (SCEN < IBM_SVAR_CRS(ICRS)-GEOMEPS/2._EB) CYCLE
   ! If solid change state:
   IF ( (IBM_IS_CRS(ICRS) == IBM_GS) .OR. (IBM_IS_CRS(ICRS) == IBM_SG) ) THEN
        IS_GASPHASE_LEFT = .NOT.IS_GASPHASE_LEFT
   ENDIF
ENDDO

IS_GASPHASE_RIGHT = .TRUE.
DO ICRS=IBM_N_CRS,1,-1
    IF (SCEN > IBM_SVAR_CRS(ICRS)+GEOMEPS/2._EB) CYCLE
    ! If solid change state:
    IF ( (IBM_IS_CRS(ICRS) == IBM_GS) .OR. (IBM_IS_CRS(ICRS) == IBM_SG) ) THEN
        IS_GASPHASE_RIGHT = .NOT.IS_GASPHASE_RIGHT
    ENDIF
ENDDO

! If at least one of left and right are true -> add
! IBM_GASPHASE cut-edge:
IS_GASPHASE = IS_GASPHASE_LEFT .OR. IS_GASPHASE_RIGHT

RETURN
END SUBROUTINE GET_IS_GASPHASE

! --------------------- GET_BODX2_INTERSECTIONS ---------------------------------

SUBROUTINE GET_BODX2_INTERSECTIONS(X2AXIS,X3AXIS,X3RAY)

INTEGER, INTENT(IN) :: X2AXIS,X3AXIS
REAL(EB),INTENT(IN) :: X3RAY

! Local Variables:
REAL(EB) :: XYZ1(MAX_DIM), XYZ2(MAX_DIM), X2_1, X2_2, X3_1, X3_2, SLEN, SBOD
REAL(EB) :: STANI(IAXIS:JAXIS), DV(IAXIS:JAXIS)
INTEGER  :: ISEG, SEG(NOD1:NOD2), NBCROSS, IBCR, IDUM, NBCROSS_SVAR
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: SVAR_AUX
REAL(EB) :: DX3_1, DX3_2, XI1, XI2
REAL(EB) :: TNOW

! REAL(QB) :: X2_21Q,X3_21Q,SLENQ,STANIQ(IAXIS:JAXIS),DX3_1Q,DX3_2Q,XI1Q,XI2Q,DVQ(IAXIS:JAXIS)

TNOW=CURRENT_TIME()


IF ( BODINT_PLANE%NSEGS == 0) RETURN

DO ISEG=1,BODINT_PLANE%NSEGS

   IF (BODINT_PLANE%X2ALIGNED(ISEG)) CYCLE
   SEG(NOD1:NOD2)    = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   IF( (X3RAY-MAX(BODINT_PLANE%XYZ(X3AXIS,SEG(NOD1)),BODINT_PLANE%XYZ(X3AXIS,SEG(NOD2)))) > GEOMEPS) CYCLE
   IF( (MIN(BODINT_PLANE%XYZ(X3AXIS,SEG(NOD1)),BODINT_PLANE%XYZ(X3AXIS,SEG(NOD2)))-X3RAY) > GEOMEPS) CYCLE
   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD1))
   XYZ2(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD2))

   ! x2_x3 of segment point 1:
   X2_1 = XYZ1(X2AXIS); X3_1 = XYZ1(X3AXIS)
   ! x2_x3 of segment point 2:
   X2_2 = XYZ2(X2AXIS); X3_2 = XYZ2(X3AXIS)

   ! IF (.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
   ! Segment length:
   SLEN = SQRT( (X2_2-X2_1)**2._EB + (X3_2-X3_1)**2._EB )

   ! Unit vector along segment:
   STANI(IAXIS:JAXIS) = 1._EB/SLEN * (/ (X2_2-X2_1), (X3_2-X3_1) /)

   ! S coordinate along segment:
   DX3_1 = X3_2 - X3RAY
   DX3_2 = X3RAY- X3_1
   XI1   = DX3_1 / (X3_2-X3_1)
   XI2   = DX3_2 / (X3_2-X3_1)
   DV(IAXIS:JAXIS) = (/ (XI1-1._EB)*X2_1+XI2*X2_2 , DX3_2 /)
   SBOD = DV(IAXIS)*STANI(IAXIS)+DV(JAXIS)*STANI(JAXIS)
   ! ELSE
   !    ! Segment length:
   !    X2_21Q = (REAL(X2_2,QB)-REAL(X2_1,QB))
   !    X3_21Q = (REAL(X3_2,QB)-REAL(X3_1,QB))
   !    SLENQ = SQRT( X2_21Q**2._QB + X3_21Q**2._QB )
   !
   !    ! Unit vector along segment:
   !    STANIQ(IAXIS:JAXIS) = 1._QB/SLENQ * (/ X2_21Q, X3_21Q /)
   !
   !    ! S coordinate along segment:
   !    DX3_1Q = REAL(X3_2,QB) - REAL(X3RAY,QB)
   !    DX3_2Q = REAL(X3RAY,QB)- REAL(X3_1,QB)
   !    XI1Q   = DX3_1Q / X3_21Q
   !    XI2Q   = DX3_2Q / X3_21Q
   !    DVQ(IAXIS:JAXIS) = (/ (XI1Q-1._QB)*REAL(X2_1,QB)+XI2Q*REAL(X2_2,QB) , DX3_2Q /)
   !    SBOD = REAL(DVQ(IAXIS)*STANIQ(IAXIS)+DVQ(JAXIS)*STANIQ(JAXIS),EB)
   ! ENDIF

   ! If crossing is already defined, cycle:
   DO IBCR=1,BODINT_PLANE%NBCROSS(ISEG)
       IF ( ABS(SBOD-BODINT_PLANE%SVAR(IBCR,ISEG)) < GEOMEPS ) EXIT
   ENDDO
   IF (IBCR<BODINT_PLANE%NBCROSS(ISEG)+1) CYCLE ! Crossing already counted.

   ! Add crossing to BODINT_PLANE, insertion sort:
   NBCROSS  = BODINT_PLANE%NBCROSS(ISEG) + 1
   ! Test-reallocate BODINT_PLANE%SVAR
   NBCROSS_SVAR = SIZE(BODINT_PLANE%SVAR,DIM=1)
   IF (NBCROSS > NBCROSS_SVAR) THEN
      ALLOCATE(SVAR_AUX(NBCROSS_SVAR+IBM_DELTA_NBCROSS,BODINT_PLANE%NSEGS)); SVAR_AUX = -1._EB
      SVAR_AUX(1:NBCROSS-1,1:BODINT_PLANE%NSEGS) = BODINT_PLANE%SVAR(1:NBCROSS-1,1:BODINT_PLANE%NSEGS)
      CALL MOVE_ALLOC(FROM=SVAR_AUX,TO=BODINT_PLANE%SVAR)
   ENDIF
   BODINT_PLANE%SVAR(NBCROSS,ISEG) = 1._EB/GEOMEPS
   DO IBCR=1,NBCROSS
    IF ( SBOD < BODINT_PLANE%SVAR(IBCR,ISEG) ) EXIT
   ENDDO

   ! Here copy from the back (updated nbcross) to the ibcr location:
   DO IDUM = NBCROSS,IBCR+1,-1
      BODINT_PLANE%SVAR(IDUM,ISEG) = BODINT_PLANE%SVAR(IDUM-1,ISEG)
   ENDDO
   BODINT_PLANE%SVAR(IBCR,ISEG) = SBOD
   BODINT_PLANE%NBCROSS(ISEG)   = NBCROSS

ENDDO

T_CC_USED(GET_BODX2X3_INTERSECTIONS_TIME_INDEX) = T_CC_USED(GET_BODX2X3_INTERSECTIONS_TIME_INDEX) + CURRENT_TIME() - TNOW
RETURN
END SUBROUTINE GET_BODX2_INTERSECTIONS

! ----------------------- GET_BODX3_INTERSECTIONS -------------------------------

SUBROUTINE GET_BODX3_INTERSECTIONS(X2AXIS,X3AXIS,X2LO,X2HI)

INTEGER,  INTENT(IN) :: X2AXIS,X3AXIS,X2LO,X2HI

! Local Variables:
REAL(EB) :: XYZ1(MAX_DIM), XYZ2(MAX_DIM), X2_1, X2_2, X3_1, X3_2, SLEN, SBOD
REAL(EB) :: STANI(IAXIS:JAXIS), DV(IAXIS:JAXIS), MINX, MAXX, XI1, XI2, DX2_1, DX2_2
INTEGER  :: ISEG, SEG(NOD1:NOD2), NBCROSS, IBCR, IDUM, JSTR, JEND, JJ, NBCROSS_SVAR
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: SVAR_AUX
LOGICAL  :: ISCONT
REAL(EB) :: TNOW

! REAL(QB) :: X2_21Q,X3_21Q,SLENQ,STANIQ(IAXIS:JAXIS),DX2_1Q,DX2_2Q,XI1Q,XI2Q,DVQ(IAXIS:JAXIS)

TNOW=CURRENT_TIME()

DO ISEG=1,BODINT_PLANE%NSEGS

   IF (BODINT_PLANE%X3ALIGNED(ISEG)) CYCLE ! This segment is not aligned with x3.

   SEG(NOD1:NOD2)    = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD1))
   XYZ2(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD2))

   ! x2_x3 of segment point 1:
   X2_1 = XYZ1(X2AXIS); X3_1 = XYZ1(X3AXIS)
   ! x2_x3 of segment point 2:
   X2_2 = XYZ2(X2AXIS); X3_2 = XYZ2(X3AXIS)

   ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
   ! Segment length:
   SLEN = SQRT( (X2_2-X2_1)**2._EB + (X3_2-X3_1)**2._EB )
   ! Unit vector along segment:
   STANI(IAXIS:JAXIS) = (/ (X2_2-X2_1), (X3_2-X3_1) /)*SLEN**(-1._EB)
   ! ELSE
   !    ! Segment length:
   !    X2_21Q = (REAL(X2_2,QB)-REAL(X2_1,QB))
   !    X3_21Q = (REAL(X3_2,QB)-REAL(X3_1,QB))
   !    SLENQ = SQRT( X2_21Q**2._QB + X3_21Q**2._QB )
   !    ! Unit vector along segment:
   !    STANIQ(IAXIS:JAXIS) = 1._QB/SLENQ * (/ X2_21Q, X3_21Q /)
   ! ENDIF

   MINX = MIN(X2_1,X2_2)
   MAXX = MAX(X2_1,X2_2)
   IF(X2NOC==0) THEN
      ! Optimized for UG:
      JSTR = MAX(X2LO, CEILING((  MINX-GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO))+X2LO)
      JEND = MIN(X2HI,   FLOOR((  MAXX+GEOMEPS-X2FACE(X2LO))/DX2FACE(X2LO))+X2LO)
   ELSE
      IF ((MINX-GEOMEPS-X2FACE(X2LO)) < 0._EB) THEN
         JSTR=X2LO
      ELSEIF((MINX-GEOMEPS-X2FACE(X2HI)) >= 0._EB) THEN
         JSTR=X2HI+1
      ELSE
         DO JJ=X2LO,X2HI
            IF((MINX-GEOMEPS-X2FACE(JJ)) >= 0._EB .AND. (MINX-GEOMEPS-X2FACE(JJ+1)) < 0._EB ) THEN
               JSTR = JJ+1
               EXIT
            ENDIF
         ENDDO
      ENDIF
      IF ((MAXX+GEOMEPS-X2FACE(X2LO)) < 0._EB) THEN
         JEND=X2LO-1
      ELSEIF((MAXX+GEOMEPS-X2FACE(X2HI)) >= 0._EB) THEN
         JEND=X2HI
      ELSE
         DO JJ=X2LO,X2HI
            IF((MAXX+GEOMEPS-X2FACE(JJ)) >= 0._EB .AND. (MAXX+GEOMEPS-X2FACE(JJ+1)) < 0._EB ) THEN
               JEND = JJ
               EXIT
            ENDIF
         ENDDO
      ENDIF
   ENDIF

   DO JJ=JSTR,JEND

      ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
      ! S coordinate along segment:
      DX2_1 = X2_2 - X2FACE(JJ)
      DX2_2 = X2FACE(JJ) - X2_1
      XI1   = DX2_1 / (X2_2-X2_1)
      XI2   = DX2_2 / (X2_2-X2_1)
      DV(IAXIS:JAXIS) = (/ DX2_2, (XI1-1._EB)*X3_1+XI2*X3_2 /)
      SBOD = DV(IAXIS)*STANI(IAXIS)+DV(JAXIS)*STANI(JAXIS)
      ! ELSE
      !    ! S coordinate along segment:
      !    DX2_1Q = REAL(X2_2,QB) - REAL(X2FACE(JJ),QB)
      !    DX2_2Q = REAL(X2FACE(JJ),QB)- REAL(X2_1,QB)
      !    XI1Q   = DX2_1Q / X2_21Q
      !    XI2Q   = DX2_2Q / X2_21Q
      !    DVQ(IAXIS:JAXIS) = (/ DX2_2Q, (XI1Q-1._QB)*REAL(X3_1,QB)+XI2Q*REAL(X3_2,QB) /)
      !    SBOD = REAL(DVQ(IAXIS)*STANIQ(IAXIS)+DVQ(JAXIS)*STANIQ(JAXIS),EB)
      ! ENDIF


      ! If crossing is already defined, cycle:
      NBCROSS = BODINT_PLANE%NBCROSS(ISEG)
      ISCONT = .FALSE.
      DO IBCR=1,NBCROSS
         IF ( ABS(SBOD-BODINT_PLANE%SVAR(IBCR,ISEG)) < GEOMEPS ) THEN
            ISCONT = .TRUE.
            EXIT
         ENDIF
      ENDDO
      IF (ISCONT) CYCLE

      ! Add crossing to BODINT_PLANE, insertion sort:
      NBCROSS = BODINT_PLANE%NBCROSS(ISEG) + 1
      ! Test-reallocate BODINT_PLANE%SVAR
      NBCROSS_SVAR = SIZE(BODINT_PLANE%SVAR,DIM=1)
      IF (NBCROSS > NBCROSS_SVAR) THEN
         ALLOCATE(SVAR_AUX(NBCROSS_SVAR+IBM_DELTA_NBCROSS,BODINT_PLANE%NSEGS)); SVAR_AUX = -1._EB
         SVAR_AUX(1:NBCROSS-1,1:BODINT_PLANE%NSEGS) = BODINT_PLANE%SVAR(1:NBCROSS-1,1:BODINT_PLANE%NSEGS)
         CALL MOVE_ALLOC(FROM=SVAR_AUX,TO=BODINT_PLANE%SVAR)
      ENDIF
      BODINT_PLANE%SVAR(NBCROSS,ISEG) = 1._EB/GEOMEPS
      DO IBCR=1,NBCROSS
         IF ( SBOD < BODINT_PLANE%SVAR(IBCR,ISEG) ) EXIT
      ENDDO

      ! Here copy from the back (updated nbcross) to the ibcr location:
      DO IDUM = NBCROSS,IBCR+1,-1
         BODINT_PLANE%SVAR(IDUM,ISEG) = BODINT_PLANE%SVAR(IDUM-1,ISEG)
      ENDDO
      BODINT_PLANE%SVAR(IBCR,ISEG) = SBOD
      BODINT_PLANE%NBCROSS(ISEG)   = NBCROSS

   ENDDO

ENDDO

T_CC_USED(GET_BODX2X3_INTERSECTIONS_TIME_INDEX) = T_CC_USED(GET_BODX2X3_INTERSECTIONS_TIME_INDEX) + CURRENT_TIME() - TNOW

RETURN
END SUBROUTINE GET_BODX3_INTERSECTIONS

! ----------------------- GET_CARTFACE_CUTEDGES ---------------------------------

SUBROUTINE GET_CARTFACE_CUTEDGES(X1AXIS,X2AXIS,X3AXIS,                   &
                                 XIAXIS,XJAXIS,XKAXIS,NM      ,          &
                                 X2LO,X2HI,X3LO,X3HI,X2LO_CELL,X2HI_CELL,     &
                                 X3LO_CELL,X3HI_CELL,INDX1,X1PLN)

INTEGER,  INTENT(IN) :: X1AXIS,X2AXIS,X3AXIS,XIAXIS,XJAXIS,XKAXIS,NM, &
                        X2LO,X2HI,X3LO,X3HI,X2LO_CELL,X2HI_CELL,           &
                        X3LO_CELL,X3HI_CELL,INDX1(MAX_DIM)
REAL(EB), INTENT(IN) :: X1PLN

! Local Variables:
REAL(EB) :: XYZ1(MAX_DIM), XYZ2(MAX_DIM), X2_1, X2_2, X3_1, X3_2, SLEN
REAL(EB) :: STANI(IAXIS:JAXIS), SNORI(IAXIS:JAXIS), X2RAY, X3RAY
INTEGER  :: ISEG, SEG(NOD1:NOD2), NBCROSS, IEDGE, JJ, KK, JJ2, KK2, IPFACE, NPFACE, INOD1, INOD2
LOGICAL  :: ADD2FACES, INRAY, CONDAX
INTEGER  :: INDSEG(1:IBM_MAX_WSTRIANG_SEG+2), NTRISEG, CETYPE, JJ2VEC(LOW_IND:HIGH_IND), KK2VEC(LOW_IND:HIGH_IND)
REAL(EB) :: SVAR1, SVAR2, SVAR12, XPOS, XY(IAXIS:JAXIS)
INTEGER  :: INDXI(IAXIS:KAXIS), INDIF, INDJF, INDKF, CEI, NVERT, NEDGE, DIRAXIS, IDG
REAL(EB) :: XYZV1(IAXIS:KAXIS), XYZV1LC(IAXIS:KAXIS)
REAL(EB) :: XYZV2(IAXIS:KAXIS), XYZV2LC(IAXIS:KAXIS)
REAL(EB) :: TNOW

LOGICAL :: FOUND_SEG, IS_SOLID

TNOW=CURRENT_TIME()

! Segment by segment define the INBOUNDARY MESHES(NM)%IBM_CUT_EDGES between crossings
! and individualize the Cartesian face they belong to.
! NCUTEDGEOLD   = MESHES(NM)%N_CUTEDGE_MESH + 1
SEGS_LOOP : DO ISEG=1,BODINT_PLANE%NSEGS

   SEG(NOD1:NOD2)    = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   XYZ1(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD1))
   XYZ2(IAXIS:KAXIS) = BODINT_PLANE%XYZ(IAXIS:KAXIS,SEG(NOD2))

   IF (MAX(XYZ1(X2AXIS),XYZ2(X2AXIS)) < X2FACE(X2LO)-GEOMEPS) CYCLE
   IF (MIN(XYZ1(X2AXIS),XYZ2(X2AXIS)) > X2FACE(X2HI)+GEOMEPS) CYCLE
   IF (MAX(XYZ1(X3AXIS),XYZ2(X3AXIS)) < X3FACE(X3LO)-GEOMEPS) CYCLE
   IF (MIN(XYZ1(X3AXIS),XYZ2(X3AXIS)) > X3FACE(X3HI)+GEOMEPS) CYCLE

   NBCROSS = BODINT_PLANE%NBCROSS(ISEG) ! Cross points include Node1, Node2

   ! x2_x3 of segment point 1:
   X2_1 = XYZ1(X2AXIS); X3_1 = XYZ1(X3AXIS)
   ! x2_x3 of segment point 2:
   X2_2 = XYZ2(X2AXIS); X3_2 = XYZ2(X3AXIS)

   ! Normal out:
   SLEN = SQRT( (X2_2-X2_1)**2._EB + (X3_2-X3_1)**2._EB )
   STANI(IAXIS:JAXIS) = (/ (X2_2-X2_1), (X3_2-X3_1) /)*SLEN**(-1._EB)
   SNORI(IAXIS:JAXIS) = (/ STANI(JAXIS), -STANI(IAXIS) /)

   INDSEG(1:IBM_MAX_WSTRIANG_SEG+2) = BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2, ISEG)
   NTRISEG = INDSEG(1)

   ADD2FACES = .FALSE.
   ! Type to be assigned to cut edges:
   CETYPE = 2*(BODINT_PLANE%SEGTYPE(LOW_IND,ISEG)+1) - BODINT_PLANE%SEGTYPE(HIGH_IND,ISEG)
   IF ( CETYPE == IBM_GG ) ADD2FACES = .TRUE.

   INRAY  = .FALSE.

   ! Different cases:
   ! First check if segment geomepsilon aligned with x2:
   IF (BODINT_PLANE%X2ALIGNED(ISEG)) THEN

      ! Test if node1 of segment is in geomepsilon vicinity of an x2 ray
      DO KK=X3LO,X3HI
         ! x3 location of ray along x2, on the x2-x3 plane:
         X3RAY = X3FACE(KK)
         IF ( ABS(X3RAY-X3_1) < GEOMEPS ) THEN
            INRAY = .TRUE.
            EXIT
         ENDIF
      ENDDO

      IF (INRAY) THEN ! Segment in x2 ray defined by x3 face index kk.

         ! 1. INB cut-edges on top of an x2 gridline, assign to cut-face
         !    defined by normal out.
         KK2VEC(LOW_IND:HIGH_IND) = 0
         IF (ADD2FACES) THEN
             NPFACE   = 2
             KK2VEC(LOW_IND) = KK + FCELL
             KK2VEC(HIGH_IND)= KK + FCELL - 1
         ELSE
             NPFACE = 1
             if ( SNORI(JAXIS) > 0._EB ) THEN ! add 1 to index kk+FCELL-1 (i.e. lower face index)
                 KK2VEC(LOW_IND) = KK + FCELL
             ELSE
                 KK2VEC(LOW_IND)= KK + FCELL - 1
             ENDIF
         ENDIF

         DO IPFACE=1,NPFACE

            KK2 = KK2VEC(IPFACE)

            ! Figure out which cut faces the inboundary cut-edges of
            ! this segment belong to:
            ! We have nbcross-1 INBOUNDARY CUT_EDGEs to generate.
            DO IEDGE=1,NBCROSS-1

               ! Location along Segment:
               SVAR1 = BODINT_PLANE%SVAR(IEDGE  ,ISEG)
               SVAR2 = BODINT_PLANE%SVAR(IEDGE+1,ISEG)
               ! Location of midpoint of cut-edge:
               SVAR12 = 0.5_EB * (SVAR1+SVAR2)
               ! Define Cartesian segment this cut-edge belongs:
               XPOS   = X2_1 + SVAR12*STANI(IAXIS)
               IF (X2NOC==0) THEN
                  JJ2 = FLOOR((XPOS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
                  ! Discard cut-edges on faces laying on x2hi.
                  IF ((JJ2 < X2LO_CELL) .OR. (JJ2 > X2HI_CELL)) CYCLE
               ELSE
                  FOUND_SEG=.FALSE.
                  DO JJ2=X2LO_CELL,X2HI_CELL
                     ! Check if XPOS is within this segment JJ2:
                     IF((XPOS-X2FACE(JJ2-1)) >= 0._EB .AND. (X2FACE(JJ2)-XPOS) > 0._EB) THEN
                        FOUND_SEG=.TRUE.
                        EXIT
                     ENDIF
                  ENDDO
                  IF(.NOT.FOUND_SEG) CYCLE
               ENDIF

               IF ((KK2 < X3LO_CELL) .OR. (KK2 > X3HI_CELL)) CYCLE

               ! HERE IF NEEDED TEST IF SEG IS INSIDE OR OUTSIDE.
               ! If segment is inside the solid region mark cells surrounding face
               ! to be treated in special manner (only if they happen to be type CUTCFE),
               ! then drop segment.
               XY(IAXIS:JAXIS) = (/ X2_1, X3_1 /) + SVAR12*STANI(IAXIS:JAXIS)
               CALL GET_IS_SOLID_PT(BODINT_PLANE,X1AXIS,X2AXIS,X3AXIS,XY,SNORI,X1PLN,IS_SOLID)
               IF (IS_SOLID) CYCLE

               ! Face indexes:
               INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ2, KK2 /) ! Local x1,x2,x3
               INDIF=INDXI(XIAXIS)
               INDJF=INDXI(XJAXIS)
               INDKF=INDXI(XKAXIS)

               ! Now the face is, FCVAR (x1axis):
               IF (MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS) > 0) THEN ! There is already
                                                                                 ! an entry in CUT_EDGE.
                  CEI = MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)
               ELSE ! We need a new entry in CUT_EDGE
                  CEI      = MESHES(NM)%N_CUTEDGE_MESH + 1
                  MESHES(NM)%N_CUTEDGE_MESH                       = CEI
                  MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)= CEI
                  CALL CUT_EDGE_ARRAY_REALLOC(NM,CEI)
                  MESHES(NM)%CUT_EDGE(CEI)%NVERT   = 0
                  CALL NEW_EDGE_ALLOC(NM,CEI,IBM_ALLOC_DVERT,IBM_ALLOC_DELEM)
                  MESHES(NM)%CUT_EDGE(CEI)%NEDGE   = 0
                  MESHES(NM)%CUT_EDGE(CEI)%NEDGE1 = 0
                  MESHES(NM)%CUT_EDGE(CEI)%IJK(1:MAX_DIM+2) = (/ INDIF, INDJF, INDKF, X1AXIS, CETYPE /)
                  MESHES(NM)%CUT_EDGE(CEI)%STATUS  = IBM_INBOUNDCF
               ENDIF

               ! Add vertices, non repeated vertex entries at this point.
               NVERT = MESHES(NM)%CUT_EDGE(CEI)%NVERT
               ! Define vertices for this segment:
               !                                           xv1                      yv1                     zv1
               XYZV1LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR1, X3_1+STANI(JAXIS)*SVAR1 /)
               XYZV1(IAXIS) = XYZV1LC(XIAXIS)
               XYZV1(JAXIS) = XYZV1LC(XJAXIS)
               XYZV1(KAXIS) = XYZV1LC(XKAXIS)
               CALL INSERT_FACE_VERT(XYZV1,NM,CEI,NVERT,INOD1)
               !                                           xv2                      yv2                     zv2
               XYZV2LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR2, X3_1+STANI(JAXIS)*SVAR2 /)
               XYZV2(IAXIS) = XYZV2LC(XIAXIS)
               XYZV2(JAXIS) = XYZV2LC(XJAXIS)
               XYZV2(KAXIS) = XYZV2LC(XKAXIS)
               CALL INSERT_FACE_VERT(XYZV2,NM,CEI,NVERT,INOD2)

               NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
               CALL REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE+1)
               IF ( NPFACE == 1 ) THEN
                  MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
               ELSE
                  DIRAXIS = X2AXIS
                  CONDAX  = (XYZV2(DIRAXIS)-XYZV1(DIRAXIS)) > 0
                  IF ( KK2 == KK+FCELL-1 ) THEN
                     IF (CONDAX) THEN
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
                     ELSE
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD2, INOD1 /)
                     ENDIF
                  ELSE
                     IF (CONDAX) THEN
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD2, INOD1 /)
                     ELSE
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
                     ENDIF
                  ENDIF
               ENDIF
               MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,NEDGE+1) = &
                               BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,ISEG)
               MESHES(NM)%CUT_EDGE(CEI)%INDSEG(  IBM_MAX_WSTRIANG_SEG+3,NEDGE+1) = 0 !Edges in face boundary counted once.
               MESHES(NM)%CUT_EDGE(CEI)%NVERT = NVERT
               MESHES(NM)%CUT_EDGE(CEI)%NEDGE = NEDGE+1
               MESHES(NM)%CUT_EDGE(CEI)%NEDGE1= MESHES(NM)%CUT_EDGE(CEI)%NEDGE

               ! Test for Repeated edge -> If so note FACERT:
               DO IDG=1,NEDGE
                   IF( ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD1   .AND. &
                         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD2 ) .OR.  &
                       ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD2   .AND. &
                         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD1 ) ) THEN
                       FACERT(JJ2,KK2) =.TRUE.
                       EXIT
                   ENDIF
               ENDDO

            ENDDO
         ENDDO
         CYCLE ! Skips rest of iseg loop, for this ISEG.
      ENDIF

   ! Second check if segment geomepsilon aligned with x3:
   ELSEIF (BODINT_PLANE%X3ALIGNED(ISEG)) THEN

      ! Test if node1 of segment is in geomepsilon vicinity of an x3 ray
      DO JJ=X2LO,X2HI
         ! x2 location of ray along x3, on the x2-x3 plane:
         X2RAY = X2FACE(JJ)
         IF ( ABS(X2RAY-X2_1) < GEOMEPS ) THEN
            INRAY = .TRUE.
            EXIT
         ENDIF
      ENDDO

      IF (INRAY) THEN ! Segment in x3 ray defined by x2 face index JJ

         ! 1. INB cut-edges on top of an x3 gridline, assign to cut-face
         !    defined by normal out.
         JJ2VEC(LOW_IND:HIGH_IND) = 0
         IF (ADD2FACES) THEN
            NPFACE = 2
            JJ2VEC(LOW_IND)  = JJ + FCELL
            JJ2VEC(HIGH_IND) = JJ + FCELL - 1
         ELSE
            NPFACE = 1
            IF ( SNORI(IAXIS) > 0._EB ) THEN ! add 1 to index jj+FCELL-1 (i.e. lower face index)
               JJ2VEC(LOW_IND) = JJ + FCELL
            ELSE
               JJ2VEC(LOW_IND) = JJ + FCELL - 1
            ENDIF
         ENDIF

         DO IPFACE=1,NPFACE

            JJ2 = JJ2VEC(IPFACE)

            ! Figure out which cut faces the inboundary cut-edges of
            ! this segment belong to:
            ! We have NBCROSS-1 INBOUNDARY CUT_EDGEs to generate.
            DO IEDGE=1,NBCROSS-1

               ! Location along Segment:
               SVAR1 = BODINT_PLANE%SVAR(IEDGE  ,ISEG)
               SVAR2 = BODINT_PLANE%SVAR(IEDGE+1,ISEG)
               ! Location of midpoint of cut-edge:
               SVAR12 = 0.5_EB * (SVAR1+SVAR2)

               ! Define Cartesian segment this cut-edge belongs:
               XPOS = X3_1 + SVAR12*STANI(JAXIS)
               IF (X3NOC==0) THEN
                  KK2 = FLOOR((XPOS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
                  ! Discard cut-edges on faces laying on x3hi.
                  IF ((KK2 < X3LO_CELL) .OR. (KK2 > X3HI_CELL)) CYCLE
               ELSE
                  FOUND_SEG=.FALSE.
                  DO KK2=X3LO_CELL,X3HI_CELL
                     ! Check if XPOS is within this segment KK2:
                     IF((XPOS-X3FACE(KK2-1)) >= 0._EB .AND. (X3FACE(KK2)-XPOS) > 0._EB) THEN
                        FOUND_SEG=.TRUE.
                        EXIT
                     ENDIF
                  ENDDO
                  IF(.NOT.FOUND_SEG) CYCLE
               ENDIF

               IF ((JJ2 < X2LO_CELL) .OR. (JJ2 > X2HI_CELL)) CYCLE

               ! HERE IF NEEDED TEST IF SEG IS INSIDE OR OUTSIDE.
               ! If segment is inside the solid region mark cells surrounding face
               ! to be treated in special manner (only if they happen to be type CUTCFE),
               ! then drop segment.
               XY(IAXIS:JAXIS) = (/ X2_1, X3_1 /) + SVAR12*STANI(IAXIS:JAXIS)
               CALL GET_IS_SOLID_PT(BODINT_PLANE,X1AXIS,X2AXIS,X3AXIS,XY,SNORI,X1PLN,IS_SOLID)
               IF (IS_SOLID) CYCLE

               ! Face indexes:
               INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ2, KK2 /) ! Local x1,x2,x3
               INDIF=INDXI(XIAXIS)
               INDJF=INDXI(XJAXIS)
               INDKF=INDXI(XKAXIS)

               ! Now the face is, FCVAR (x1axis):
               IF (MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS) > 0) THEN ! There is already
                                                                                 ! an entry in CUT_EDGE.
                  CEI = MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)
               ELSE ! We need a new entry in CUT_EDGE
                  CEI      = MESHES(NM)%N_CUTEDGE_MESH + 1
                  MESHES(NM)%N_CUTEDGE_MESH                       = CEI
                  MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)= CEI
                  CALL CUT_EDGE_ARRAY_REALLOC(NM,CEI)
                  MESHES(NM)%CUT_EDGE(CEI)%NVERT   = 0
                  CALL NEW_EDGE_ALLOC(NM,CEI,IBM_ALLOC_DVERT,IBM_ALLOC_DELEM)
                  MESHES(NM)%CUT_EDGE(CEI)%NEDGE   = 0
                  MESHES(NM)%CUT_EDGE(CEI)%NEDGE1  = 0
                  MESHES(NM)%CUT_EDGE(CEI)%IJK(1:MAX_DIM+2) = (/ INDIF, INDJF, INDKF, X1AXIS, CETYPE /)
                  MESHES(NM)%CUT_EDGE(CEI)%STATUS  = IBM_INBOUNDCF
               ENDIF

               ! Add vertices, non repeated vertex entries at this point.
               NVERT = MESHES(NM)%CUT_EDGE(CEI)%NVERT
               ! Define vertices for this segment:
               !                                           xv1                      yv1                     zv1
               XYZV1LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR1, X3_1+STANI(JAXIS)*SVAR1 /)
               XYZV1(IAXIS) = XYZV1LC(XIAXIS)
               XYZV1(JAXIS) = XYZV1LC(XJAXIS)
               XYZV1(KAXIS) = XYZV1LC(XKAXIS)
               CALL INSERT_FACE_VERT(XYZV1,NM,CEI,NVERT,INOD1)
               !                                           xv2                      yv2                     zv2
               XYZV2LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR2, X3_1+STANI(JAXIS)*SVAR2 /)
               XYZV2(IAXIS) = XYZV2LC(XIAXIS)
               XYZV2(JAXIS) = XYZV2LC(XJAXIS)
               XYZV2(KAXIS) = XYZV2LC(XKAXIS)
               CALL INSERT_FACE_VERT(XYZV2,NM,CEI,NVERT,INOD2)

               NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
               CALL REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE+1)
               IF ( NPFACE == 1 ) THEN
                  MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
               ELSE
                  DIRAXIS = X3AXIS
                  CONDAX  = (XYZV2(DIRAXIS)-XYZV1(DIRAXIS)) > 0
                  IF ( JJ2 == JJ+FCELL-1 ) THEN
                     IF (CONDAX) THEN
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD2, INOD1 /)
                     ELSE
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
                     ENDIF
                  ELSE
                     IF (CONDAX) THEN
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
                     ELSE
                        MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD2, INOD1 /)
                     ENDIF
                  ENDIF
               ENDIF
               MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,NEDGE+1) = &
                               BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,ISEG)
               MESHES(NM)%CUT_EDGE(CEI)%INDSEG(  IBM_MAX_WSTRIANG_SEG+3,NEDGE+1) = 0 !Edges in face boundary counted once.
               MESHES(NM)%CUT_EDGE(CEI)%NVERT = NVERT
               MESHES(NM)%CUT_EDGE(CEI)%NEDGE = NEDGE+1
               MESHES(NM)%CUT_EDGE(CEI)%NEDGE1= MESHES(NM)%CUT_EDGE(CEI)%NEDGE

               ! Test for Repeated edge -> If so note FACERT
               DO IDG=1,NEDGE
                   IF( ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD1   .AND. &
                         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD2 ) .OR.  &
                       ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD2   .AND. &
                         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD1 ) ) THEN
                       FACERT(JJ2,KK2) =.TRUE.
                       EXIT
                   ENDIF
               ENDDO

            ENDDO
         ENDDO
         CYCLE ! Skips rest of iseg loop, for this ISEG.
      ENDIF

   ENDIF

   ! 3. Regular case: INB cut-edge with centroid inside a
   !    Cartesian face, assign to corresponding FCVAR IBM_IDCE variable.
   ! This is the most common case, INBOUNDARY edges defined inside x1 faces.
   ! We have NBCROSS-1 INBOUNDARY CUT_EDGEs to generate.
   DO IEDGE=1,NBCROSS-1

      ! Location along Segment:
      SVAR1 = BODINT_PLANE%SVAR(IEDGE  ,ISEG)
      SVAR2 = BODINT_PLANE%SVAR(IEDGE+1,ISEG)
      ! Location of midpoint of cut-edge:
      SVAR12 = 0.5_EB * (SVAR1+SVAR2)

      ! Define Cartesian face this cut-edge belongs:
      XPOS = X2_1 + SVAR12*STANI(IAXIS)
      IF (X2NOC==0) THEN
         JJ2  = FLOOR((XPOS-X2FACE(X2LO))/DX2FACE(X2LO)) + X2LO_CELL
         IF ((JJ2 < X2LO_CELL) .OR. (JJ2 > X2HI_CELL)) CYCLE
      ELSE
         FOUND_SEG=.FALSE.
         DO JJ2=X2LO_CELL,X2HI_CELL
            ! Check if XPOS is within this segment JJ2:
            IF((XPOS-X2FACE(JJ2-1)) >= 0._EB .AND. (X2FACE(JJ2)-XPOS) > 0._EB) THEN
               FOUND_SEG=.TRUE.
               EXIT
            ENDIF
         ENDDO
         IF(.NOT.FOUND_SEG) CYCLE
      ENDIF
      XPOS = X3_1 + SVAR12*STANI(JAXIS)
      IF(X3NOC==0) THEN
         KK2  = FLOOR((XPOS-X3FACE(X3LO))/DX3FACE(X3LO)) + X3LO_CELL
         IF ((KK2 < X3LO_CELL) .OR. (KK2 > X3HI_CELL)) CYCLE
      ELSE
         FOUND_SEG=.FALSE.
         DO KK2=X3LO_CELL,X3HI_CELL
            ! Check if XPOS is within this segment KK2:
            IF((XPOS-X3FACE(KK2-1)) >= 0._EB .AND. (X3FACE(KK2)-XPOS) > 0._EB) THEN
               FOUND_SEG=.TRUE.
               EXIT
            ENDIF
         ENDDO
         IF(.NOT.FOUND_SEG) CYCLE
      ENDIF

      ! HERE IF NEEDED TEST IF SEG IS INSIDE OR OUTSIDE.
      ! If segment is inside the solid region mark cells surrounding face
      ! to be treated in special manner (only if they happen to be type CUTCFE),
      ! then drop segment.
      XY(IAXIS:JAXIS) = (/ X2_1, X3_1 /) + SVAR12*STANI(IAXIS:JAXIS)
      CALL GET_IS_SOLID_PT(BODINT_PLANE,X1AXIS,X2AXIS,X3AXIS,XY,SNORI,X1PLN,IS_SOLID)
      IF (IS_SOLID) CYCLE

      ! Face indexes:
      INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ2, KK2 /) ! Local x1,x2,x3
      INDIF=INDXI(XIAXIS)
      INDJF=INDXI(XJAXIS)
      INDKF=INDXI(XKAXIS)

      ! Now the face is, FCVAR (x1axis):
      IF (MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS) > 0) THEN ! There is already
                                                                        ! an entry in CUT_EDGE.
         CEI = MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)
      ELSE ! We need a new entry in CUT_EDGE
         CEI      = MESHES(NM)%N_CUTEDGE_MESH + 1
         MESHES(NM)%N_CUTEDGE_MESH                       = CEI
         MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)= CEI
         CALL CUT_EDGE_ARRAY_REALLOC(NM,CEI)
         MESHES(NM)%CUT_EDGE(CEI)%NVERT   = 0
         CALL NEW_EDGE_ALLOC(NM,CEI,IBM_ALLOC_DVERT,IBM_ALLOC_DELEM)
         MESHES(NM)%CUT_EDGE(CEI)%NEDGE   = 0
         MESHES(NM)%CUT_EDGE(CEI)%NEDGE1  = 0
         MESHES(NM)%CUT_EDGE(CEI)%IJK(1:MAX_DIM+2) = (/ INDIF, INDJF, INDKF, X1AXIS, CETYPE /)
         MESHES(NM)%CUT_EDGE(CEI)%STATUS  = IBM_INBOUNDCF
      ENDIF

      ! Add vertices, non repeated vertex entries at this point.
      NVERT = MESHES(NM)%CUT_EDGE(CEI)%NVERT

      ! Define vertices for this segment:
      !                                           xv1                      yv1                     zv1
      XYZV1LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR1, X3_1+STANI(JAXIS)*SVAR1 /)
      XYZV1(IAXIS) = XYZV1LC(XIAXIS)
      XYZV1(JAXIS) = XYZV1LC(XJAXIS)
      XYZV1(KAXIS) = XYZV1LC(XKAXIS)
      CALL INSERT_FACE_VERT(XYZV1,NM,CEI,NVERT,INOD1)
      !                                           xv2                      yv2                     zv2
      XYZV2LC(IAXIS:KAXIS)= (/ X1FACE(INDX1(X1AXIS)), X2_1+STANI(IAXIS)*SVAR2, X3_1+STANI(JAXIS)*SVAR2 /)
      XYZV2(IAXIS) = XYZV2LC(XIAXIS)
      XYZV2(JAXIS) = XYZV2LC(XJAXIS)
      XYZV2(KAXIS) = XYZV2LC(XKAXIS)
      CALL INSERT_FACE_VERT(XYZV2,NM,CEI,NVERT,INOD2)

      NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
      CALL REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE+1)
      MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE+1) = (/ INOD1, INOD2 /)
      MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,NEDGE+1) = &
                      BODINT_PLANE%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,ISEG)
      MESHES(NM)%CUT_EDGE(CEI)%INDSEG(  IBM_MAX_WSTRIANG_SEG+3,NEDGE+1) = &
                      -SUM(BODINT_PLANE%SEGTYPE(NOD1:NOD2,ISEG))/2
      MESHES(NM)%CUT_EDGE(CEI)%NVERT = NVERT
      MESHES(NM)%CUT_EDGE(CEI)%NEDGE = NEDGE+1
      MESHES(NM)%CUT_EDGE(CEI)%NEDGE1= MESHES(NM)%CUT_EDGE(CEI)%NEDGE

      ! Test for Repeated edge -> If so note FACERT
      DO IDG=1,NEDGE
          IF( ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD1   .AND. &
                MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD2 ) .OR.  &
              ( MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IDG) == INOD2   .AND. &
                MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IDG) == INOD1 ) ) THEN
              FACERT(JJ2,KK2) =.TRUE.
              EXIT
          ENDIF
      ENDDO

   ENDDO

ENDDO SEGS_LOOP

! Note cells in CELLRT due to FCERT intersections in GET_BODINT_PLANE:
DO KK2=X3LO_CELL,X3HI_CELL
    DO JJ2=X2LO_CELL,X2HI_CELL
       IF(.NOT.FACERT(JJ2,KK2)) CYCLE
       ! Low cell indexes:
       INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS), JJ2, KK2 /) ! Local x1,x2,x3
       INDIF=INDXI(XIAXIS); INDJF=INDXI(XJAXIS); INDKF=INDXI(XKAXIS)
       CELLRT(INDIF,INDJF,INDKF) =.TRUE.

       ! High cell indexes:
       INDXI(IAXIS:KAXIS) = (/ INDX1(X1AXIS)+1, JJ2, KK2 /) ! Local x1,x2,x3
       INDIF=INDXI(XIAXIS); INDJF=INDXI(XJAXIS); INDKF=INDXI(XKAXIS)
       CELLRT(INDIF,INDJF,INDKF) =.TRUE.
    ENDDO
ENDDO

T_CC_USED(GET_CARTFACE_CUTEDGES_TIME_INDEX) = T_CC_USED(GET_CARTFACE_CUTEDGES_TIME_INDEX) + CURRENT_TIME() - TNOW

RETURN
END SUBROUTINE GET_CARTFACE_CUTEDGES

! -------------------------- GET_IS_SOLID_PT ------------------------------------

SUBROUTINE GET_IS_SOLID_PT(BODINT_PLANE2,X1AXIS,X2AXIS,X3AXIS,XY,NVEC,X1PLN,IS_SOLID)

TYPE(BODINT_PLANE_TYPE), INTENT(IN) :: BODINT_PLANE2
INTEGER,  INTENT(IN) :: X1AXIS,X2AXIS,X3AXIS
REAL(EB), INTENT(IN) :: XY(IAXIS:JAXIS),NVEC(IAXIS:JAXIS),X1PLN
LOGICAL,  INTENT(OUT):: IS_SOLID

! Local Variables
REAL(EB):: XYZ1(IAXIS:KAXIS), XYZ2(IAXIS:KAXIS), SCEN, XRAY
REAL(EB):: X2_1, X2_2, X3_1, X3_2, X2MIN, X2MAX, X3MIN, X3MAX, DOT1, DOT2, DELBIN, MODTI, SVARI, AVAL
REAL(EB):: STANI(IAXIS:JAXIS), NOMLI(IAXIS:JAXIS), DV12(IAXIS:JAXIS)
INTEGER :: SEG(NOD1:NOD2), ISSEG(LOW_IND:HIGH_IND), ISEG, IISEG, XAXIS, IBIN, ICR, SCRSI, ILO_BIN, IHI_BIN,&
           ICRSI(LOW_IND:HIGH_IND+1), GAM(LOW_IND:HIGH_IND)
LOGICAL :: OUTRAY, IS_GASPHASE

! Initialize crossings arrays:
IBM_N_CRS       = 0
IBM_SVAR_CRS(:) = 1._EB/GEOMEPS
IBM_IS_CRS(:)   = IBM_UNDEFINED
IBM_IS_CRS2(:,:)= IBM_UNDEFINED
IBM_SEG_TAN(:,:)= 0._EB
IBM_SEG_CRS(:)  = 0
IBM_BDNUM_CRS(:)= 0
IBM_BDNUM_CRS_AUX(:)= 0

! Define crossings:
IF(ABS(NVEC(IAXIS)) > ABS(NVEC(JAXIS))) THEN ! Do X2 ray
   SCEN = XY(IAXIS); XRAY=XY(JAXIS); XAXIS=X3AXIS

   DELBIN = BODINT_PLANE2%TBAXIS(XAXIS)%DELBIN
   AVAL   = (XRAY-GEOMEPS-BODINT_PLANE2%BOX(LOW_IND,XAXIS))/DELBIN
   ILO_BIN= MAX(1, &
            CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS,EB),ABS(AVAL)) ))
   AVAL   = (XRAY+GEOMEPS-BODINT_PLANE2%BOX(LOW_IND,XAXIS))/DELBIN
   IHI_BIN= MIN(BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS, &
            CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS,EB),ABS(AVAL)) ))
   DO IBIN=ILO_BIN,IHI_BIN
      IF (XRAY < BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%X1_LOW-GEOMEPS) CYCLE
      IF (XRAY > BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%X1_HIGH+GEOMEPS) CYCLE
      DO IISEG=1,BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%NTL
         ISEG = BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%TRI_LIST(IISEG)
         SEG(NOD1:NOD2)    = BODINT_PLANE2%SEGS(NOD1:NOD2,ISEG)
         XYZ1(IAXIS:KAXIS) = BODINT_PLANE2%XYZ(IAXIS:KAXIS,SEG(NOD1))
         XYZ2(IAXIS:KAXIS) = BODINT_PLANE2%XYZ(IAXIS:KAXIS,SEG(NOD2))

         ! x2,x3 coordinates of segment:
         X2_1 = XYZ1(X2AXIS)
         X3_1 = XYZ1(X3AXIS) ! Lower index endpoint.
         X2_2 = XYZ2(X2AXIS)
         X3_2 = XYZ2(X3AXIS) ! Upper index endpoint.

         ! First Test if the whole segment is on one side of the Ray:
         ! Test segment crosses the ray, or is in geomepsilon proximity
         ! of it:
         X3MIN = MIN(X3_1,X3_2); X3MAX = MAX(X3_1,X3_2);
         OUTRAY=(((XRAY-X3MAX) > GEOMEPS) .OR. ((X3MIN-XRAY) > GEOMEPS))

         IF (OUTRAY) CYCLE
         DOT1 = X3_1-XRAY;          DOT2 = X3_2-XRAY
         IF (ABS(DOT1) <= GEOMEPS) DOT1 = 0._EB
         IF (ABS(DOT2) <= GEOMEPS) DOT2 = 0._EB

         ! Segment tangent unit vector.
         DV12(IAXIS:JAXIS) = XYZ2( (/ X2AXIS, X3AXIS /) ) - XYZ1( (/ X2AXIS, X3AXIS /) )
         MODTI = SQRT( DV12(IAXIS)**2._EB + DV12(JAXIS)**2._EB )
         STANI(IAXIS:JAXIS)  = DV12(IAXIS:JAXIS) * MODTI**(-1._EB)
         NOMLI(IAXIS:JAXIS)  = (/ STANI(JAXIS), -STANI(IAXIS) /)
         ISSEG(LOW_IND:HIGH_IND) = BODINT_PLANE2%SEGTYPE(LOW_IND:HIGH_IND,ISEG)

         ! For x2, in local x2-x3 coords e2=(1,0):
         GAM(LOW_IND) = (1 + NINT(SIGN(1._EB,NOMLI(IAXIS)))) / 2 ! (1+SIGN(DOT_PRODUCT(NOMLI,e2)))/2;
         GAM(HIGH_IND)= (1 - NINT(SIGN(1._EB,NOMLI(IAXIS)))) / 2 ! (1-SIGN(DOT_PRODUCT(NOMLI,e2)))/2;

         ! Test if whole segment is in ray, if so add segment nodes as crossings:
         IF ( (ABS(DOT1)+ABS(DOT2)) == 0._EB ) THEN
            ! Count both points as crossings:
            ! Point 1:
            SVARI = MIN(X2_1,X2_2)
            ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_GASPHASE, IBM_SOLID, IBM_UNDEFINED /)
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            DO ICR=2,BODINT_PLANE2%NBCROSS(ISEG)-1
                SVARI = X2_1 + BODINT_PLANE2%SVAR(ICR,ISEG)*STANI(IAXIS)
                ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_SOLID, IBM_SOLID /)
                SCRSI = ISEG
                ! Insertion sort:
                CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            ENDDO
            ! Point 2:
            SVARI = max(X2_1,X2_2)
            ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_GASPHASE, IBM_UNDEFINED /)
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         ! Now nodes individually:
         IF ( ABS(DOT1) == 0._EB ) THEN
            ! Point 1:
            SVARI = X2_1
            ! LOW and HIGH media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         IF ( ABS(DOT2) == 0._EB ) THEN
            ! Point 2:
            SVARI = X2_2
            ! LOW and HIGH_IND media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         ! Finally regular case:
         ! Points 1 on one side of ray, point 2 on the other:
         IF ( DOT1*DOT2 < 0._EB ) THEN
            ! Intersection Point along segment:
            ! DS    = (XRAY-X3_1) / (X3_2-X3_1)
            ! SVARI = X2_1 + DS*(X2_2-X2_1)
            SVARI = X2_1 + (XRAY-X3_1) * (X2_2-X2_1) / (X3_2-X3_1)
            ! LOW and HIGH media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         WRITE(LU_ERR,*) 'Error GET_IS_SOLID_PT NVEC(IAXIS): Missed segment=',ISEG
      ENDDO
    ENDDO

ELSE ! Do X3 ray
   SCEN=XY(JAXIS); XRAY=XY(IAXIS); XAXIS=X2AXIS;

   DELBIN = BODINT_PLANE2%TBAXIS(XAXIS)%DELBIN
   AVAL   = (XRAY-GEOMEPS-BODINT_PLANE2%BOX(LOW_IND,XAXIS))/DELBIN
   ILO_BIN= MAX(1, &
            CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS,EB),ABS(AVAL)) ))
   AVAL   = (XRAY+GEOMEPS-BODINT_PLANE2%BOX(LOW_IND,XAXIS))/DELBIN
   IHI_BIN= MIN(BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS, &
            CEILING( SIGN(1._EB,AVAL)*MIN(REAL(2*BODINT_PLANE2%TBAXIS(XAXIS)%N_BINS,EB),ABS(AVAL)) ))
   DO IBIN=ILO_BIN,IHI_BIN
      IF (XRAY < BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%X1_LOW-GEOMEPS) CYCLE
      IF (XRAY > BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%X1_HIGH+GEOMEPS) CYCLE
      DO IISEG=1,BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%NTL
         ISEG = BODINT_PLANE2%TBAXIS(XAXIS)%TRIBIN(IBIN)%TRI_LIST(IISEG)
         SEG(NOD1:NOD2)    = BODINT_PLANE2%SEGS(NOD1:NOD2,ISEG)
         XYZ1(IAXIS:KAXIS) = BODINT_PLANE2%XYZ(IAXIS:KAXIS,SEG(NOD1))
         XYZ2(IAXIS:KAXIS) = BODINT_PLANE2%XYZ(IAXIS:KAXIS,SEG(NOD2))

         ! x2,x3 coordinates of segment:
         X2_1 = XYZ1(X2AXIS)
         X3_1 = XYZ1(X3AXIS) ! Lower index endpoint.
         X2_2 = XYZ2(X2AXIS)
         X3_2 = XYZ2(X3AXIS) ! Upper index endpoint.

         ! First Test if the whole segment is on one side of the Ray:
         ! Test segment crosses the ray, or is in geomepsilon proximity
         ! of it:
         X2MIN = MIN(X2_1,X2_2)
         X2MAX = MAX(X2_1,X2_2)
         OUTRAY=(((XRAY-X2MAX) > GEOMEPS) .OR. ((X2MIN-XRAY) > GEOMEPS))

         IF (OUTRAY) CYCLE
         DOT1 = X2_1-XRAY;          DOT2 = X2_2-XRAY
         IF (ABS(DOT1) <= GEOMEPS)  DOT1 = 0._EB
         IF (ABS(DOT2) <= GEOMEPS)  DOT2 = 0._EB

         ! Segment tangent unit vector.
         DV12(IAXIS:JAXIS) = XYZ2( (/ X2AXIS, X3AXIS /) ) - XYZ1( (/ X2AXIS, X3AXIS /) )
         MODTI = SQRT( DV12(IAXIS)**2._EB + DV12(JAXIS)**2._EB )
         STANI(IAXIS:JAXIS)  = DV12(IAXIS:JAXIS) * MODTI**(-1._EB)
         NOMLI(IAXIS:JAXIS)  = (/ STANI(JAXIS), -STANI(IAXIS) /)
         ISSEG(LOW_IND:HIGH_IND) = BODINT_PLANE2%SEGTYPE(LOW_IND:HIGH_IND,ISEG)

         ! For x3, in local x2-x3 coords e2=(0,1):
         GAM(LOW_IND) = (1 + NINT(SIGN(1._EB,NOMLI(JAXIS)))) / 2 ! (1+SIGN(DOT_PRODUCT(NOMLI,e2)))/2;
         GAM(HIGH_IND)= (1 - NINT(SIGN(1._EB,NOMLI(JAXIS)))) / 2 ! (1-SIGN(DOT_PRODUCT(NOMLI,e2)))/2;

         ! Test if whole segment is in ray, if so add segment nodes as crossings:
         IF ( (ABS(DOT1)+ABS(DOT2)) == 0._EB ) THEN
            ! Count both points as crossings:
            ! Point 1:
            SVARI = MIN(X3_1,X3_2)
            ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_GASPHASE, IBM_SOLID, IBM_UNDEFINED /)
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            DO ICR=2,BODINT_PLANE2%NBCROSS(ISEG)-1
                SVARI = X3_1 + BODINT_PLANE2%SVAR(ICR,ISEG)*STANI(JAXIS)
                ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_SOLID, IBM_SOLID /)
                SCRSI = ISEG
                ! Insertion sort:
                CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            ENDDO
            ! Point 2:
            SVARI = MAX(X3_1,X3_2)
            ICRSI(LOW_IND:HIGH_IND+1) = (/ IBM_SOLID, IBM_GASPHASE, IBM_UNDEFINED /)
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         ! Now nodes individually:
         IF ( ABS(DOT1) == 0._EB ) THEN
            ! Point 1:
            SVARI = X3_1
            ! LOW and HIGH media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         IF ( ABS(DOT2) == 0._EB ) THEN
            ! Point 2:
            SVARI = X3_2
            ! LOW and HIGH_IND media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         ! Finally regular case:
         ! Points 1 on one side of ray, point 2 on the other:
         IF ( DOT1*DOT2 < 0._EB ) THEN
            ! Intersection Point along segment:
            ! DS    = (XRAY-X2_1) / (X2_2-X2_1)
            ! SVARI = X3_1 + DS*(X3_2-X3_1)
            SVARI = X3_1 + (XRAY-X2_1) * (X3_2-X3_1) / (X2_2-X2_1)
            ! LOW and HIGH media type, using the segment definition:
            ICRSI(LOW_IND) = GAM(LOW_IND)*ISSEG(LOW_IND) + GAM(HIGH_IND)*ISSEG(HIGH_IND)
            ICRSI(HIGH_IND)= GAM(LOW_IND)*ISSEG(HIGH_IND)+ GAM(HIGH_IND)*ISSEG(LOW_IND)
            ICRSI(HIGH_IND+1)=IBM_UNDEFINED
            SCRSI = ISEG
            ! Insertion sort:
            CALL INSERT_RAY_CROSS(SVARI,ICRSI,SCRSI,STANI)
            CYCLE
         ENDIF
         WRITE(LU_ERR,*) 'Error GET_IS_SOLID_PT NVEC(JAXIS): Missed segment=',ISEG
      ENDDO
    ENDDO

ENDIF

! Do we have any intersections?
IF ( IBM_N_CRS == 0 ) THEN
   IS_SOLID =.FALSE.
   RETURN
ENDIF
CALL COLLAPSE_CROSSINGS(BODINT_PLANE2,X1AXIS,X2AXIS,X3AXIS,XRAY,X1PLN,2)
CALL GET_IS_GASPHASE(SCEN,IS_GASPHASE)

IS_SOLID = .NOT.IS_GASPHASE

RETURN
END SUBROUTINE GET_IS_SOLID_PT


! ------------------------- INSERT_FACE_VERT ------------------------------------

SUBROUTINE INSERT_FACE_VERT(XYZV,NM,CEI,NVERT,INOD)

REAL(EB), INTENT(IN)   :: XYZV(MAX_DIM)
INTEGER,  INTENT(IN)   :: NM,CEI
INTEGER,  INTENT(INOUT):: NVERT
INTEGER,  INTENT(OUT)  :: INOD

! Local Variables:
! INTEGER  :: JNOD, JNOD2, PIVOT(LOW_IND:HIGH_IND)
! REAL(EB) :: DV(MAX_DIM)
! IF (NVERT < LINSEARCH_LIMIT) THEN
!    ! Linear Search:
!    DO JNOD=1,NVERT
!       DV(IAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(IAXIS)
!       IF( DV(IAXIS) > GEOMEPS ) THEN
!          EXIT
!       ELSEIF( ABS(DV(IAXIS)) <= GEOMEPS) THEN
!          DV(JAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(JAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(JAXIS)
!          IF ( DV(JAXIS) > GEOMEPS ) THEN
!             EXIT
!          ELSEIF ( ABS(DV(JAXIS)) <= GEOMEPS ) THEN
!             DV(KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(KAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(KAXIS)
!             IF ( DV(KAXIS) > GEOMEPS ) THEN
!                EXIT
!             ELSEIF ( ABS(DV(KAXIS)) <= GEOMEPS ) THEN
!                INOD = MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)
!                RETURN ! XYZV is in XYZVERT(IAXIS:KAXIS,NOD_PERM(JNOD))
!             ENDIF
!          ENDIF
!       ENDIF
!    ENDDO
! ELSE
!    ! Binary Search:
!    PIVOT(LOW_IND) = 0
!    PIVOT(HIGH_IND)= NVERT + 1
!    DO WHILE( (PIVOT(HIGH_IND)-PIVOT(LOW_IND)) > 1)
!       JNOD   = (PIVOT(LOW_IND)+PIVOT(HIGH_IND))/2
!       DV(IAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(IAXIS)
!       IF( DV(IAXIS) < -GEOMEPS ) THEN
!          PIVOT(LOW_IND) = JNOD
!       ELSEIF( DV(IAXIS) > GEOMEPS ) THEN
!          PIVOT(HIGH_IND)= JNOD
!       ELSE ! ABS(DV(IAXIS)) < GEOMEPS
!          DV(JAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(JAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(JAXIS)
!          IF ( DV(JAXIS) < -GEOMEPS ) THEN
!             PIVOT(LOW_IND) = JNOD
!          ELSEIF( DV(JAXIS) > GEOMEPS ) THEN
!             PIVOT(HIGH_IND)= JNOD
!          ELSE ! ABS(DV(JAXIS)) < GEOMEPS
!             DV(KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(KAXIS,MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)) - XYZV(KAXIS)
!             IF ( DV(KAXIS) < -GEOMEPS ) THEN
!                PIVOT(LOW_IND) = JNOD
!             ELSEIF( DV(KAXIS) > GEOMEPS ) THEN
!                PIVOT(HIGH_IND)= JNOD
!             ELSE ! ABS(DV(KAXIS)) < GEOMEPS
!                INOD = MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD)
!                RETURN
!             ENDIF
!          ENDIF
!       ENDIF
!    ENDDO
!    JNOD=PIVOT(HIGH_IND)
! ENDIF
! ! Insert add NOD_PERM permutation array, O(NP) operation:
! INOD  = NVERT + 1
! NVERT = INOD
! CALL REALLOCATE_EDGE_VERT(NM,CEI,NVERT)
! DO JNOD2=NVERT,JNOD+1,-1
!   MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD2) = MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD2-1)
! ENDDO
! MESHES(NM)%CUT_EDGE(CEI)%NOD_PERM(JNOD) = INOD
! MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,INOD) = XYZV(IAXIS:KAXIS)

DO INOD=1,NVERT
   IF( ABS(XYZV(IAXIS)-MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS,INOD)) > GEOMEPS ) CYCLE
   IF( ABS(XYZV(JAXIS)-MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(JAXIS,INOD)) > GEOMEPS ) CYCLE
   IF( ABS(XYZV(KAXIS)-MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(KAXIS,INOD)) > GEOMEPS ) CYCLE
   RETURN
ENDDO
NVERT = NVERT + 1
INOD  = NVERT
CALL REALLOCATE_EDGE_VERT(NM,CEI,NVERT)
MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,INOD) = XYZV(IAXIS:KAXIS)

RETURN
END SUBROUTINE INSERT_FACE_VERT

! ------------------------- INSERT_FACE_VERT_LOC(XYZ,NVERT,INOD1,XYZVERT)

SUBROUTINE INSERT_FACE_VERT_LOC(MAXVERTS,XYZV,NVERT,INOD,XYZVERT)

INTEGER,  INTENT(IN)   :: MAXVERTS
REAL(EB), INTENT(IN)   :: XYZV(MAX_DIM)
REAL(EB), INTENT(INOUT), DIMENSION(IAXIS:KAXIS,1:MAXVERTS) :: XYZVERT  ! Locations of vertices.
INTEGER,  INTENT(INOUT):: NVERT
INTEGER,  INTENT(OUT)  :: INOD

REAL(EB), PARAMETER :: VERT_PROX_FCT = 1000._EB

! Local Variables:
! INTEGER  :: JNOD, JNOD2, PIVOT(LOW_IND:HIGH_IND)
! REAL(EB) :: DV(MAX_DIM)
! INTEGER, SAVE :: NOD_PERM(IBM_MAXVERTS_CELL)
! IF (NVERT < LINSEARCH_LIMIT) THEN
!    ! Linear Search:
!    DO JNOD=1,NVERT
!       DV(IAXIS) = XYZVERT(IAXIS,NOD_PERM(JNOD)) - XYZV(IAXIS)
!       IF( DV(IAXIS) > GEOMEPS ) THEN
!          EXIT
!       ELSEIF( ABS(DV(IAXIS)) <= GEOMEPS) THEN
!          DV(JAXIS) = XYZVERT(JAXIS,NOD_PERM(JNOD)) - XYZV(JAXIS)
!          IF ( DV(JAXIS) > GEOMEPS ) THEN
!             EXIT
!          ELSEIF ( ABS(DV(JAXIS)) <= GEOMEPS ) THEN
!             DV(KAXIS) = XYZVERT(KAXIS,NOD_PERM(JNOD)) - XYZV(KAXIS)
!             IF ( DV(KAXIS) > GEOMEPS ) THEN
!                EXIT
!             ELSEIF ( ABS(DV(KAXIS)) <= GEOMEPS ) THEN
!                INOD = NOD_PERM(JNOD)
!                RETURN ! XYZV is in XYZVERT(IAXIS:KAXIS,NOD_PERM(JNOD))
!             ENDIF
!          ENDIF
!       ENDIF
!    ENDDO
! ELSE
!    ! Binary Search:
!    PIVOT(LOW_IND) = 0
!    PIVOT(HIGH_IND)= NVERT + 1
!    DO WHILE( (PIVOT(HIGH_IND)-PIVOT(LOW_IND)) > 1)
!       JNOD   = (PIVOT(LOW_IND)+PIVOT(HIGH_IND))/2
!       DV(IAXIS) = XYZVERT(IAXIS,NOD_PERM(JNOD)) - XYZV(IAXIS)
!       IF( DV(IAXIS) < -GEOMEPS ) THEN
!          PIVOT(LOW_IND) = JNOD
!       ELSEIF( DV(IAXIS) > GEOMEPS ) THEN
!          PIVOT(HIGH_IND)= JNOD
!       ELSE ! ABS(DV(IAXIS)) < GEOMEPS
!          DV(JAXIS) = XYZVERT(JAXIS,NOD_PERM(JNOD)) - XYZV(JAXIS)
!          IF ( DV(JAXIS) < -GEOMEPS ) THEN
!             PIVOT(LOW_IND) = JNOD
!          ELSEIF( DV(JAXIS) > GEOMEPS ) THEN
!             PIVOT(HIGH_IND)= JNOD
!          ELSE ! ABS(DV(JAXIS)) < GEOMEPS
!             DV(KAXIS) = XYZVERT(KAXIS,NOD_PERM(JNOD)) - XYZV(KAXIS)
!             IF ( DV(KAXIS) < -GEOMEPS ) THEN
!                PIVOT(LOW_IND) = JNOD
!             ELSEIF( DV(KAXIS) > GEOMEPS ) THEN
!                PIVOT(HIGH_IND)= JNOD
!             ELSE ! ABS(DV(KAXIS)) < GEOMEPS
!                INOD = NOD_PERM(JNOD)
!                RETURN
!             ENDIF
!          ENDIF
!       ENDIF
!    ENDDO
!    JNOD=PIVOT(HIGH_IND)
! ENDIF
! ! Insert add NOD_PERM permutation array, O(NP) operation:
! INOD  = NVERT + 1
! NVERT = INOD
! IF (NVERT>MAXVERTS) WRITE(LU_ERR,*) 'geom.f90: INSERT_FACE_VERT_LOC, NVERT',NVERT,', higher than IBM_MAXVERTS',MAXVERTS
! DO JNOD2=NVERT,JNOD+1,-1
!   NOD_PERM(JNOD2) = NOD_PERM(JNOD2-1)
! ENDDO
! NOD_PERM(JNOD) = INOD
! XYZVERT(IAXIS:KAXIS,INOD) = XYZV(IAXIS:KAXIS)

DO INOD=1,NVERT
   IF( ABS(XYZV(IAXIS)-XYZVERT(IAXIS,INOD)) > VERT_PROX_FCT*GEOMEPS ) CYCLE
   IF( ABS(XYZV(JAXIS)-XYZVERT(JAXIS,INOD)) > VERT_PROX_FCT*GEOMEPS ) CYCLE
   IF( ABS(XYZV(KAXIS)-XYZVERT(KAXIS,INOD)) > VERT_PROX_FCT*GEOMEPS ) CYCLE
   RETURN
ENDDO
NVERT = NVERT + 1
INOD  = NVERT
IF (NVERT>MAXVERTS) WRITE(LU_ERR,*) 'geom.f90: INSERT_FACE_VERT_LOC, NVERT',NVERT,', higher than IBM_MAXVERTS',MAXVERTS
XYZVERT(IAXIS:KAXIS,INOD) = XYZV(IAXIS:KAXIS)

RETURN
END SUBROUTINE INSERT_FACE_VERT_LOC

! ----------------------- GET_CARTFACE_CUTFACES ---------------------------------

SUBROUTINE GET_CARTFACE_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,BNDINT_FLAG)

INTEGER, INTENT(IN) :: NM
INTEGER, INTENT(IN) :: ISTR, IEND, JSTR, JEND, KSTR, KEND
LOGICAL, INTENT(IN) :: BNDINT_FLAG

! Local Variables:
INTEGER :: X1AXIS, X2AXIS, X3AXIS
INTEGER :: XIAXIS, XJAXIS, XKAXIS
INTEGER :: X1LO, X1HI, X2LO, X2HI, X3LO, X3HI
INTEGER :: ILO,IHI,JLO,JHI,KLO,KHI
INTEGER :: II,II2,JJ,KK, CEI
INTEGER ::  INDXI(MAX_DIM),  INDI,  INDJ,  INDK
INTEGER :: INDXI1(MAX_DIM), INDI1, INDJ1, INDK1
INTEGER :: INDXI2(MAX_DIM), INDI2, INDJ2, INDK2
INTEGER :: INDXI3(MAX_DIM), INDI3, INDJ3, INDK3
INTEGER :: INDXI4(MAX_DIM), INDI4, INDJ4, INDK4
INTEGER ::  INDLC(MAX_DIM),  IEDG,  JEDG,  KEDG
INTEGER :: NSEG, ISEG, ISEG2, NVERT, NFACE, NEDGE, IEDGE, NVERT_CART, NSEG_CART
LOGICAL :: OUTFACE1, OUTFACE2, NOTDONE

INTEGER, DIMENSION(NOD1:NOD2,1:IBM_MAXCEELEM_FACE) :: SEG_FACE, SEG_FACE_CART, SEG_FACEAUX
INTEGER, DIMENSION(NOD1:NOD3,1:IBM_MAXCEELEM_FACE) :: SEG_FACE2
REAL(EB), DIMENSION(IBM_MAXCEELEM_FACE) :: ANGSEG, ANGSEGAUX
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE)           ::     XYZVERT, XYZVERT_CART  ! Locations of vertices.

INTEGER, SAVE :: SIZE_CFACES_CFELEM, SIZE_VERTS_CFELEM
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFELEM,CFELEM2
INTEGER, ALLOCATABLE, DIMENSION(:) :: CFE, CFEL

INTEGER, SAVE :: SIZE_EDGES_NODEDG, SIZE_VERTS_NODEDG
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: NODEDG_FACE

LOGICAL :: SEG_FLAG(IBM_MAXCEELEM_FACE)
INTEGER :: NUMEDG_NODE(IBM_MAXVERTS_FACE)

INTEGER :: INOD, INOD1, INOD2, SEG(NOD1:NOD2)
REAL(EB):: X1, X2, X3, DX2, DX3, XYZV(MAX_DIM), XYZLC(MAX_DIM)
INTEGER :: NUMNOD1, NUMNOD2, NEDI, ICF, ISS, NEWSEG, COUNT, N2COUNT, CTSTART, NSEG_LEFT
REAL(EB):: ANGCOUNT, DANG, DANGI
LOGICAL :: FOUNDSEG, PTSFLAG
INTEGER :: ICF1, ICF2, ICF_PT, IPT, NP, NP1, NP2, NFACE2, NCUTFACE, NVERTFACE
REAL(EB), DIMENSION(IAXIS:JAXIS,1:IBM_MAXVERTS_FACE)           ::     XY
REAL(EB):: AREA, AREA1, AREA2, AREAH, CX2, CX3, DIST12, D12
REAL(EB), DIMENSION(IAXIS:JAXIS) :: XYC1, XYC2, XYH

REAL(EB), DIMENSION(IBM_MAXCFELEM_FACE)                        ::   AREAV  ! Cut-faces areas.
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXCFELEM_FACE)          ::  XYZCEN  ! Cut-faces centroid locations.
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXCFELEM_FACE)          ::  INXAREA, INXSQAREA
INTEGER,  DIMENSION(IBM_MAXCFELEM_FACE) :: FINFACE
INTEGER :: IBNDINT,BNDINT_LOW,BNDINT_HIGH,ILOC,BODNUM(1:IBM_MAXCEELEM_FACE),&
SEGTYPE(IBM_MAXCEELEM_FACE),SEGTYPEAUX(IBM_MAXCEELEM_FACE),VEC(2),IDUM,IBOD,STYPE
LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:,:) :: IJK_COUNTED

INTEGER :: NSSEG, NSVERT, NSFACE, NSFACE2
LOGICAL :: ASCDESC, INLIST
INTEGER :: NV,IV,V(1:IBM_MAXVERTS_FACE)
REAL(EB):: XVERT1(1:IBM_MAXVERTS_FACE),XVERT2(1:IBM_MAXVERTS_FACE)

INTEGER, PARAMETER :: NODC1(1:4) = (/ 1, 2, 1, 2 /)
INTEGER, PARAMETER :: NODC2(1:4) = (/ 1, 2, 2, 1 /)
INTEGER :: SNOD1(NOD1:NOD2), SNOD2(NOD1:NOD2)
REAL(EB) :: XYZ_SEG1(IAXIS:KAXIS,NOD1:NOD2), XYZ_SEG2(IAXIS:KAXIS,NOD1:NOD2)
LOGICAL :: DIFF(1:4)
LOGICAL :: GET_SOLID_CUTFACES = .TRUE.
LOGICAL, ALLOCATABLE, DIMENSION(:) :: DROPFACE
REAL(EB) :: TNOW


! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
INTEGER :: NCUTFCE

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   IF (BNDINT_FLAG) THEN ! Boundary and internal cartface cut-faces:
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating internal   CARTFACE_CUTFACES for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating internal   CARTFACE_CUTFACES for mesh :',NM,' ..'
   ELSE
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating ghost-cell CARTFACE_CUTFACES for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating ghost-cell CARTFACE_CUTFACES for mesh :',NM,' ..'
   ENDIF
ENDIF

TNOW=CURRENT_TIME()

! Allocate local Arrays:
SIZE_EDGES_NODEDG = DELTA_EDGE
SIZE_VERTS_NODEDG = DELTA_VERT
ALLOCATE(NODEDG_FACE(1:SIZE_EDGES_NODEDG,1:SIZE_VERTS_NODEDG))
SIZE_CFACES_CFELEM = DELTA_FACE
SIZE_VERTS_CFELEM  = DELTA_VERT
ALLOCATE(CFELEM(1:SIZE_VERTS_CFELEM,1:SIZE_CFACES_CFELEM))
ALLOCATE(CFE(1:SIZE_VERTS_CFELEM),CFEL(1:SIZE_VERTS_CFELEM))

! Build a set of regular cut-cells in the middle of the domain to do testing.
IF (PERIODIC_TEST == 103 .OR. PERIODIC_TEST == 11 .OR. PERIODIC_TEST == 7) THEN
   CALL DEFINE_REGULAR_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,BNDINT_FLAG)
   T_CC_USED(GET_CARTFACE_CUTFACES_TIME_INDEX) = T_CC_USED(GET_CARTFACE_CUTFACES_TIME_INDEX) + CURRENT_TIME() - TNOW
   RETURN
ENDIF

! Test to check cut-cell definition scaling:
IF (PERIODIC_TEST == 105) GET_SOLID_CUTFACES = .FALSE.

! Main Loop on block NM:
IF (BNDINT_FLAG) THEN
   ALLOCATE( IJK_COUNTED(ISTR:IEND,JSTR:JEND,KSTR:KEND,IAXIS:KAXIS) ); IJK_COUNTED=.FALSE.
   BNDINT_LOW  = 1
   BNDINT_HIGH = 3
ELSE
   IF (CCGUARD==0) THEN
      DEALLOCATE( IJK_COUNTED )
      RETURN
   ENDIF
   BNDINT_LOW  = 4
   BNDINT_HIGH = 4
ENDIF

IBNDINT_LOOP : DO IBNDINT=BNDINT_LOW,BNDINT_HIGH ! 1,2 refers to block boundary faces, 3 to internal faces,
                                                 ! 4 guard-cell faces.

   ! When switching to internal faces, copy number of external faces already computed.
   IF (IBNDINT == 3) MESHES(NM)%N_BBCUTFACE_MESH = MESHES(NM)%N_CUTFACE_MESH

   XIAXIS_LOOP : DO X1AXIS=IAXIS,KAXIS

      SELECT CASE(X1AXIS)
      case(IAXIS)

         X2AXIS = JAXIS
         X3AXIS = KAXIS

         ! IAXIS gasphase cut-faces:
         JLO = JLO_CELL; JHI = JHI_CELL
         KLO = KLO_CELL; KHI = KHI_CELL
         SELECT CASE(IBNDINT)
         CASE(1)
            ILO = ILO_FACE; IHI = ILO_FACE
         CASE(2)
            ILO = IHI_FACE; IHI = IHI_FACE
         CASE(3)
            ILO = ILO_FACE+1; IHI = IHI_FACE-1
         CASE(4)
            ILO = ILO_FACE-CCGUARD; IHI= IHI_FACE+CCGUARD
            JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
            KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
         END SELECT

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = IAXIS; XJAXIS = JAXIS; XKAXIS = KAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = ILO; X1HI = IHI
         X2LO = JLO; X2HI = JHI
         X3LO = KLO; X3HI = KHI

         ! Face coordinates in x1,x2,x3 axes:
         ALLOCATE(X1FACE(ISTR:IEND)); X1FACE = XFACE
         ALLOCATE(X2FACE(JSTR:JEND)); X2FACE = YFACE
         ALLOCATE(X3FACE(KSTR:KEND)); X3FACE = ZFACE

      CASE(JAXIS)

         X2AXIS = KAXIS
         X3AXIS = IAXIS

         ! JAXIS gasphase cut-faces:
         ILO = ILO_CELL; IHI = IHI_CELL
         KLO = KLO_CELL; KHI = KHI_CELL
         SELECT CASE(IBNDINT)
         CASE(1)
            JLO = JLO_FACE; JHI = JLO_FACE
         CASE(2)
            JLO = JHI_FACE; JHI = JHI_FACE
         CASE(3)
            JLO = JLO_FACE+1; JHI = JHI_FACE-1
         CASE(4)
            JLO = JLO_FACE-CCGUARD; JHI = JHI_FACE+CCGUARD
            ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
            KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
         END SELECT

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = KAXIS; XJAXIS = IAXIS; XKAXIS = JAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = JLO; X1HI = JHI
         X2LO = KLO; X2HI = KHI
         X3LO = ILO; X3HI = IHI

         ! Face coordinates in x1,x2,x3 axes:
         ALLOCATE(X1FACE(JSTR:JEND)); X1FACE = YFACE
         ALLOCATE(X2FACE(KSTR:KEND)); X2FACE = ZFACE
         ALLOCATE(X3FACE(ISTR:IEND)); X3FACE = XFACE

      CASE(KAXIS)

         X2AXIS = IAXIS
         X3AXIS = JAXIS

         ! KAXIS gasphase cut-faces:
         ILO = ILO_CELL; IHI = IHI_CELL
         JLO = JLO_CELL; JHI = JHI_CELL
         SELECT CASE(IBNDINT)
         CASE(1)
            KLO = KLO_FACE; KHI = KLO_FACE
         CASE(2)
            KLO = KHI_FACE; KHI = KHI_FACE
         CASE(3)
            KLO = KLO_FACE+1; KHI = KHI_FACE-1
         CASE(4)
            KLO = KLO_FACE-CCGUARD; KHI = KHI_FACE+CCGUARD
            ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
            JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
         END SELECT

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = JAXIS; XJAXIS = KAXIS; XKAXIS = IAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = KLO; X1HI = KHI
         X2LO = ILO; X2HI = IHI
         X3LO = JLO; X3HI = JHI

         ! Face coordinates in x1,x2,x3 axes:
         ALLOCATE(X1FACE(KSTR:KEND)); X1FACE = ZFACE
         ALLOCATE(X2FACE(ISTR:IEND)); X2FACE = XFACE
         ALLOCATE(X3FACE(JSTR:JEND)); X3FACE = YFACE

      END SELECT

      ! Loop on Cartesian faces, local x1, x2, x3 indexes:
      DO II=X1LO,X1HI
         DO KK=X3LO,X3HI
            DO JJ=X2LO,X2HI

             ! Face indexes:
             INDXI(IAXIS:KAXIS) = (/ II, JJ, KK /) ! Local x1,x2,x3
             INDI = INDXI(XIAXIS)
             INDJ = INDXI(XJAXIS)
             INDK = INDXI(XKAXIS)

             ! Drop if cut-face has already been counted:
             IF( IJK_COUNTED(INDI,INDJ,INDK,X1AXIS) ) CYCLE; IJK_COUNTED(INDI,INDJ,INDK,X1AXIS)=.TRUE.
             IF(MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) == IBM_SOLID) CYCLE

             ! Drop if face not cut-face:
             ! Test for FACE Cartesian edges being cut:
             ! If outface1 is true -> All regular edges for this face:
             ! Edge at index KK-FCELL:
             INDXI1(IAXIS:KAXIS) = (/ II, JJ, KK-FCELL /) ! Local x1,x2,x3
             INDI1 = INDXI1(XIAXIS)
             INDJ1 = INDXI1(XJAXIS)
             INDK1 = INDXI1(XKAXIS)
             ! Edge at index KK-FCELL+1:
             INDXI2(IAXIS:KAXIS) = (/ II, JJ, KK-FCELL+1 /) ! Local x1,x2,x3
             INDI2 = INDXI2(XIAXIS)
             INDJ2 = INDXI2(XJAXIS)
             INDK2 = INDXI2(XKAXIS)
             ! Edge at index JJ-FCELL:
             INDXI3(IAXIS:KAXIS) = (/ II, JJ-FCELL, KK /) ! Local x1,x2,x3
             INDI3 = INDXI3(XIAXIS)
             INDJ3 = INDXI3(XJAXIS)
             INDK3 = INDXI3(XKAXIS)
             ! Edge at index jj-FCELL+1:
             INDXI4(IAXIS:KAXIS) = (/ II, JJ-FCELL+1, KK /) ! Local x1,x2,x3
             INDI4 = INDXI4(XIAXIS)
             INDJ4 = INDXI4(XJAXIS)
             INDK4 = INDXI4(XKAXIS)

             OUTFACE1 = (MESHES(NM)%ECVAR(INDI1,INDJ1,INDK1,IBM_EGSC,X2AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI2,INDJ2,INDK2,IBM_EGSC,X2AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI3,INDJ3,INDK3,IBM_EGSC,X3AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI4,INDJ4,INDK4,IBM_EGSC,X3AXIS) /= IBM_CUTCFE)

             ! Test for face with INB edges:
             ! If outface2 is true -> no INB Edges associated with this face:
             OUTFACE2 = (MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCE,X1AXIS) <= 0)

             ! Drop if outface1 & outface2
             IF (OUTFACE1 .AND. OUTFACE2) THEN
                ! Test if IBM_FSID is SOLID:
                IF ((MESHES(NM)%ECVAR(INDI1,INDJ1,INDK1,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI2,INDJ2,INDK2,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI3,INDJ3,INDK3,IBM_EGSC,X3AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI4,INDJ4,INDK4,IBM_EGSC,X3AXIS) == IBM_SOLID) ) THEN
                   MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) = IBM_SOLID
                ENDIF
                CYCLE
             ENDIF

             MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS)   = IBM_CUTCFE

             ! Build segment list:
             NSEG      = 0
             NVERT     = 0
             NFACE     = 0

             SEG_FACE (NOD1:NOD2,1:IBM_MAXCEELEM_FACE)             = IBM_UNDEFINED
             XYZVERT(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE)              = 0._EB
             ANGSEG(1:IBM_MAXCEELEM_FACE)                          = 0._EB
             BODNUM(1:IBM_MAXCEELEM_FACE)                          = 1000000000
             SEGTYPE(1:IBM_MAXCEELEM_FACE)                         = 0


             ! 1. Cartesian IBM_GASPHASE edges, cut-edges:
             ! a. Make a list of segments:
             ! Low x2 cut-edges:
             INDLC(IAXIS:KAXIS) = INDXI3(IAXIS:KAXIS)
             IEDG=INDI3; JEDG=INDJ3; KEDG=INDK3
             CEI = MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_IDCE,X3AXIS)
             IF ( CEI == 0 ) THEN ! Regular Edge, build segment from grid:
                IF (MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_EGSC,X3AXIS) /= IBM_SOLID) THEN
                   ! x,y,z of node 1:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)), &
                                           X3FACE(INDLC(KAXIS)-FCELL+1) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)), &
                                           X3FACE(INDLC(KAXIS)-FCELL) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = - PI / 2._EB
                ENDIF
             ELSE ! Cut-edge, load CUT_EDGE(CEI) segments
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = - PI / 2._EB
                ENDDO
             ENDIF

             ! High x2 cut-edges:
             INDLC(IAXIS:KAXIS) = INDXI4(IAXIS:KAXIS)
             IEDG=INDI4; JEDG=INDJ4; KEDG=INDK4
             CEI = MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_IDCE,X3AXIS)
             IF ( CEI == 0 ) THEN ! Regular Edge, build segment from grid:
                IF (MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_EGSC,X3AXIS) /= IBM_SOLID) THEN
                   ! x,y,z of node 1:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)), &
                                           X3FACE(INDLC(KAXIS)-FCELL) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)), &
                                           X3FACE(INDLC(KAXIS)-FCELL+1) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) =   PI / 2._EB
                ENDIF
             ELSE ! Cut-edge, load CUT_EDGE(CEI) segments
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) =   PI / 2._EB
                ENDDO
             ENDIF

             ! Low  x3 cut-edges:
             INDLC(IAXIS:KAXIS) = INDXI1(IAXIS:KAXIS)
             IEDG=INDI1; JEDG=INDJ1; KEDG=INDK1
             CEI = MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_IDCE,X2AXIS)
             IF ( CEI == 0 ) THEN ! Regular Edge, build segment from grid:
                IF (MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_EGSC,X2AXIS) /= IBM_SOLID) THEN
                   ! x,y,z of node 1:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)-FCELL), &
                                           X3FACE(INDLC(KAXIS)) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)-FCELL+1), &
                                           X3FACE(INDLC(KAXIS)) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = 0._EB
                ENDIF
             ELSE ! Cut-edge, load CUT_EDGE(CEI) segments
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = 0._EB
                ENDDO
             ENDIF

             ! High x3 cut-edges:
             INDLC(IAXIS:KAXIS) = INDXI2(IAXIS:KAXIS)
             IEDG=INDI2; JEDG=INDJ2; KEDG=INDK2
             CEI = MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_IDCE,X2AXIS)
             IF ( CEI == 0 ) THEN ! Regular Edge, build segment from grid:
                IF (MESHES(NM)%ECVAR(IEDG,JEDG,KEDG,IBM_EGSC,X2AXIS) /= IBM_SOLID) THEN
                   ! x,y,z of node 1:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)-FCELL+1), &
                                           X3FACE(INDLC(KAXIS)) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDLC(IAXIS)), &
                                           X2FACE(INDLC(JAXIS)-FCELL), &
                                           X3FACE(INDLC(KAXIS)) /)
                   X1 = XYZLC(XIAXIS)
                   X2 = XYZLC(XJAXIS)
                   X3 = XYZLC(XKAXIS)
                   XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = PI
                ENDIF
             ELSE ! Cut-edge, load CUT_EDGE(CEI) segments
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSEG = NSEG + 1
                   SEG_FACE(NOD1:NOD2,NSEG) = (/ INOD1, INOD2 /)
                   ANGSEG(NSEG) = PI
                ENDDO
             ENDIF

             ! Store Segment and Vertex list from Cartesian face boundary:
             XYZVERT_CART(IAXIS:KAXIS,1:NVERT)= XYZVERT(IAXIS:KAXIS,1:NVERT)
             SEG_FACE_CART(NOD1:NOD2,1:NSEG)  = SEG_FACE(NOD1:NOD2,1:NSEG)
             NVERT_CART=NVERT; NSEG_CART = NSEG

             ! 2. IBM_INBOUNDARY cut-edges assigned to this face:
             CEI = MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCE,X1AXIS)
             IF ( CEI > 0 ) THEN ! There are inboundary cut-edges
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   IBOD           = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,IEDGE)
                   STYPE          = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(5,IEDGE)

                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   VEC(NOD1:NOD2) = (/ INOD1, INOD2 /)
                   ! Insertion ADD segment:
                   INLIST =.FALSE.
                   DO IDUM = 1,NSEG
                       IF ( (SEG_FACE(NOD1,IDUM)==VEC(NOD1)) .AND. (SEG_FACE(NOD2,IDUM)==VEC(NOD2)) ) THEN
                           IF ( (STYPE >= SEGTYPE(IDUM)) .AND. (BODNUM(IDUM) > IBOD) ) THEN
                               BODNUM(IDUM) = IBOD
                               SEGTYPE(IDUM)=STYPE
                           ENDIF
                           INLIST =.TRUE.
                           EXIT
                       ENDIF
                       IF ( (SEG_FACE(NOD2,IDUM)==VEC(NOD1)) .AND. (SEG_FACE(NOD1,IDUM)==VEC(NOD2)) ) THEN
                           IF ( (STYPE >= SEGTYPE(IDUM)) .AND. (BODNUM(IDUM) > IBOD) ) THEN
                               SEG_FACE(NOD1:NOD2,IDUM) = VEC(NOD1:NOD2)
                               BODNUM(IDUM)  = IBOD
                               SEGTYPE(IDUM) =STYPE
                           ENDIF
                           INLIST =.TRUE.
                           EXIT
                       ENDIF
                   ENDDO
                   IF (.NOT.INLIST) THEN
                       NSEG = NSEG + 1
                       SEG_FACE(NOD1:NOD2,NSEG) = VEC(NOD1:NOD2)
                       BODNUM(NSEG)             =          IBOD
                       SEGTYPE(NSEG)            =         STYPE
                       DX3 = XYZVERT(X3AXIS,INOD2)-XYZVERT(X3AXIS,INOD1)
                       DX2 = XYZVERT(X2AXIS,INOD2)-XYZVERT(X2AXIS,INOD1)
                       ANGSEG(NSEG) = ATAN2(DX3,DX2)
                   ENDIF
                ENDDO
             ENDIF


             ! IF(INDI==14 .AND. INDJ==2 .AND. INDK==5 .AND. X1AXIS==KAXIS) THEN
             !    OPEN(666,FILE='VERTS_FC0.txt',STATUS='REPLACE')
             !    DO IDUM=1,NVERT
             !       WRITE(666,*) XYZVERT(1:3,IDUM)
             !    ENDDO
             !    CLOSE(666)
             !    OPEN(666,FILE='SEGS_FC0.txt',STATUS='REPLACE')
             !    DO ISEG=1,NSEG
             !       WRITE(666,*) SEG_FACE(NOD1:NOD2,ISEG),ANGSEG(ISEG),SEGTYPE(ISEG)
             !    ENDDO
             !    CLOSE(666)
             ! ENDIF

             NOTDONE = .TRUE.
             DO WHILE(NOTDONE)
                NOTDONE = .FALSE.
                ! Counts edges that reach nodes:
                NUMEDG_NODE(1:IBM_MAXVERTS_FACE) = 0
                DO ISEG=1,NSEG
                   DO II2=NOD1,NOD2
                      INOD = SEG_FACE(II2,ISEG)
                      NUMEDG_NODE(INOD) = NUMEDG_NODE(INOD) + 1
                   ENDDO
                ENDDO

                ! Drop segments with NUMEDG_NODE(INOD)=1:
                ! The assumption here is that they are IBM_GG IBM_INBOUNDCF
                ! segments with one node inside the Cartface i.e. case Fig
                ! 9(a) in the CompGeom3D notes):
                COUNT = 0
                SEG_FACEAUX (NOD1:NOD2,1:IBM_MAXCEELEM_FACE)             = IBM_UNDEFINED
                ANGSEGAUX(1:IBM_MAXCEELEM_FACE)                          = 0._EB
                SEGTYPEAUX(1:IBM_MAXCEELEM_FACE)                         = IBM_UNDEFINED
                DO ISEG=1,NSEG
                   NUMNOD1 = NUMEDG_NODE(SEG_FACE(NOD1,ISEG))
                   NUMNOD2 = NUMEDG_NODE(SEG_FACE(NOD2,ISEG))
                   IF ((NUMNOD1 > 1) .AND. (NUMNOD2 > 1)) THEN
                      COUNT = COUNT + 1
                      SEG_FACEAUX(NOD1:NOD2,COUNT) = SEG_FACE(NOD1:NOD2,ISEG)
                      ANGSEGAUX(COUNT) = ANGSEG(ISEG)
                      SEGTYPEAUX(COUNT)= SEGTYPE(ISEG)
                   ELSE
                      NOTDONE = .TRUE.
                   ENDIF
                ENDDO
                NSEG = COUNT
                SEG_FACE = SEG_FACEAUX
                ANGSEG   = ANGSEGAUX
                SEGTYPE  = SEGTYPEAUX
             ENDDO

             ! Discard face with no conected edges:
             IF ( (NSEG==0) .OR. (NSEG==2 .AND. ( ANY(SEG_FACE(NOD1:NOD2,1)==SEG_FACE(NOD2,2)) .AND. &
                                                  ANY(SEG_FACE(NOD1:NOD2,1)==SEG_FACE(NOD1,2)) )) ) THEN
                MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) = IBM_SOLID
                CYCLE
             ENDIF

             ! Add segments which have both ends attached to more than two segs:
             count = 0
             DO ISEG=1,NSEG
                 COUNT = COUNT + 1
                 SEG_FACEAUX (NOD1:NOD2,COUNT) = SEG_FACE(NOD1:NOD2,ISEG)
                 ANGSEGAUX(COUNT) = ANGSEG(ISEG)
                 !SEGTYPEAUX(COUNT)= SEGTYPE(ISEG)
                 IF (SEGTYPE(ISEG)==1) THEN
                     COUNT = COUNT + 1
                     SEG_FACEAUX (NOD1:NOD2,COUNT) = SEG_FACE( (/ NOD2, NOD1 /),ISEG)
                     !SEGTYPEAUX(COUNT)= SEGTYPE(ISEG)
                     IF (ANGSEG(ISEG) > 0._EB) THEN
                        ANGSEGAUX(COUNT) = ANGSEG(ISEG) - PI
                     ELSE
                        ANGSEGAUX(COUNT) = ANGSEG(ISEG) + PI
                     ENDIF
                 ENDIF
             ENDDO
             NSEG     = COUNT
             SEG_FACE = SEG_FACEAUX
             ANGSEG   = ANGSEGAUX
             !SEGTYPE = SEGTYPEAUX

             ! Fill NODEDG_FACE(IEDGE,INOD), where iedge are edges
             ! that contain inod as first node. This assumes edges are
             ! ordered using the right hand rule on x2-x3 plane.
             ! Also compute the edges angles in x2-x3 plane:
             ! Reallocate NODEDG_FACE if NSEG+1 > SIZE_EDGES_NODEDG, or NVERT > SIZE_VERTS_NODEDG:
             CALL REALLOCATE_NODEDG_FACE(NSEG,NVERT)
             NODEDG_FACE(:,:) = 0
             DO ISEG=1,NSEG
               INOD1 = SEG_FACE(NOD1,ISEG)
               NEDI  = NODEDG_FACE(1,INOD1) + 1 ! Increase number of edges connected to node by 1.
               NODEDG_FACE(     1,INOD1) = NEDI
               NODEDG_FACE(NEDI+1,INOD1) = ISEG
             ENDDO

             ! Now Reorder Segments, do tests:
             SEG_FACE2(NOD1:NOD3,1:IBM_MAXCEELEM_FACE) = IBM_UNDEFINED  ! [INOD1 INOD2 ICF]
             SEG_FLAG(1:IBM_MAXCEELEM_FACE) = .TRUE.

             ICF  = 1
             ISEG = 1
             NEWSEG = ISEG
             COUNT= 1
             CTSTART=COUNT
             SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,NEWSEG), SEG_FACE(NOD2,NEWSEG), ICF /)
             SEG_FLAG(ISEG) = .FALSE.
             NSEG_LEFT      = NSEG - 1

             ! Infamous infinite loop:
             INF_LOOP : DO

                FOUNDSEG = .FALSE.
                N2COUNT  = SEG_FACE2(NOD2,COUNT) ! Node 2 of segment COUNT.
                ANGCOUNT = ANGSEG(NEWSEG)

                ! Find Segment starting on Node 2 with smaller ANGSEG respect to COUNT.
                DANG = -1._EB / GEOMEPS
                DO ISS=2,NODEDG_FACE(1,N2COUNT)+1
                   ISEG = NODEDG_FACE(ISS,N2COUNT)
                   IF ( SEG_FLAG(ISEG) ) THEN ! This seg hasn't been added to SEG_FACE2
                      ! Drop if seg is the opposite of count seg, only when 2nd node is connected to more than 2 segments:
                      IF ( (SEG_FACE2(NOD1,COUNT)==SEG_FACE(NOD2,ISEG)) .AND. (NUMEDG_NODE(N2COUNT)>2) ) CYCLE
                      DANGI = ANGSEG(ISEG) - ANGCOUNT
                      IF ( DANGI < 0._EB ) DANGI = DANGI + 2._EB * PI
                      IF ( DANGI > DANG ) THEN
                         NEWSEG   =  ISEG
                         DANG     = DANGI
                         FOUNDSEG = .TRUE.
                      ENDIF
                   ENDIF
                ENDDO

                ! Found a seg add to SEG_FACE2:
                IF ( FOUNDSEG ) THEN
                   COUNT          = COUNT + 1
                   SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,NEWSEG), SEG_FACE(NOD2,NEWSEG), ICF /)
                   SEG_FLAG(NEWSEG) = .FALSE.
                   NSEG_LEFT      = NSEG_LEFT - 1
                ENDIF

                ! Test if line has closed on point shared any other cutface:
                IF ( SEG_FACE2(NOD2,COUNT) == SEG_FACE2(NOD1,CTSTART) ) THEN
                   ! Go for new cut-face on this Cartesian face.
                ELSEIF ( FOUNDSEG ) THEN
                   CYCLE
                ENDIF

                ! Break loop:
                IF ( NSEG_LEFT == 0 ) EXIT

                ! Start a new cut-face on this Cartesian face:
                ICF = ICF + 1
                DO ISEG=1,NSEG
                   IF ( SEG_FLAG(ISEG) ) THEN
                      COUNT  = COUNT + 1
                      CTSTART= COUNT
                      SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,ISEG), SEG_FACE(NOD2,ISEG), ICF /)
                      SEG_FLAG(ISEG) = .FALSE.
                      NSEG_LEFT      = NSEG_LEFT - 1
                      EXIT
                   ENDIF
                ENDDO

             ENDDO INF_LOOP

             ! Load ordered nodes to CFELEM:
             NFACE = ICF
             ! Reallocate CFELEM ARRAY if necessary:
             CALL REALLOCATE_LOCAL_CFELEM(NSEG,NFACE)
             CFELEM(:,:) = IBM_UNDEFINED
             DO ICF=1,NFACE
                NP = 0
                DO ISEG=1,NSEG
                   IF ( SEG_FACE2(NOD3,ISEG) == ICF ) THEN
                      NP = NP + 1
                      CFELEM(1,ICF)    = NP
                      CFELEM(NP+1,ICF) = SEG_FACE2(NOD1,ISEG)
                   ENDIF
                ENDDO
             ENDDO

             ALLOCATE(CFELEM2(SIZE(CFELEM,DIM=1),SIZE(CFELEM,DIM=2))); CFELEM2 = IBM_UNDEFINED
             NP=0
             DO ICF=1,NFACE
                IF(CFELEM(1,ICF)>2) THEN
                   NP=NP+1
                   CFELEM2(:,NP) = CFELEM(:,ICF)
                ENDIF
             ENDDO
             CFELEM = CFELEM2
             DEALLOCATE(CFELEM2)
             NFACE = NP

             ! Compute area and Centroid, in local x1, x2, x3 coords:
             ALLOCATE(DROPFACE(1:NFACE)); DROPFACE=.FALSE.
             AREAV(1:NFACE)                 = 0._EB
             XYZCEN(IAXIS:KAXIS,1:NFACE)    = 0._EB
             INXAREA(IAXIS:KAXIS,1:NFACE)   = 0._EB
             INXSQAREA(IAXIS:KAXIS,1:NFACE) = 0._EB
             DO ICF=1,NFACE
                NP    = CFELEM(1,ICF)
                DO IPT=2,NP+1
                   ICF_PT = CFELEM(IPT,ICF)
                   ! Define closed Polygon centered in First Point:
                   XY(IAXIS:JAXIS,IPT-1) = (/ XYZVERT(X2AXIS,ICF_PT)-XYZVERT(X2AXIS,CFELEM(2,ICF)), &
                                              XYZVERT(X3AXIS,ICF_PT)-XYZVERT(X3AXIS,CFELEM(2,ICF)) /)
                ENDDO
                ICF_PT = CFELEM(2,ICF)
                XY(IAXIS:JAXIS,NP+1) = (/ XYZVERT(X2AXIS,ICF_PT)-XYZVERT(X2AXIS,CFELEM(2,ICF)), &
                                          XYZVERT(X3AXIS,ICF_PT)-XYZVERT(X3AXIS,CFELEM(2,ICF)) /)

                ! Get Area and Centroid properties of Cut-face:
                AREA = 0._EB
                DO II2=1,NP
                   AREA = AREA + ( XY(IAXIS,II2) * XY(JAXIS,II2+1) - &
                                   XY(JAXIS,II2) * XY(IAXIS,II2+1) )
                ENDDO
                AREA = AREA / 2._EB
                IF ( ABS(AREA) < TWO_EPSILON_EB ) THEN; DROPFACE(ICF) = .TRUE.; CYCLE; ENDIF
                IF ( (AREA<GEOMEPS**2) .AND. (MESHES(NM)%ECVAR(INDI1,INDJ1,INDK1,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                                             (MESHES(NM)%ECVAR(INDI2,INDJ2,INDK2,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                                             (MESHES(NM)%ECVAR(INDI3,INDJ3,INDK3,IBM_EGSC,X3AXIS) == IBM_SOLID) .AND. &
                                             (MESHES(NM)%ECVAR(INDI4,INDJ4,INDK4,IBM_EGSC,X3AXIS) == IBM_SOLID) ) THEN
                   DROPFACE(ICF) = .TRUE.
                   CYCLE
                ENDIF
                ! Now Centroids:
                ! In x2:
                CX2 = 0._EB
                DO II2=1,NP
                   CX2 = CX2 + ( XY(IAXIS,II2)+XY(IAXIS,II2+1)) * &
                               ( XY(IAXIS,II2)*XY(JAXIS,II2+1)  - &
                                 XY(JAXIS,II2)*XY(IAXIS,II2+1) )
                ENDDO
                CX2 = CX2 / (6._EB * AREA) + XYZVERT(X2AXIS,CFELEM(2,ICF))
                ! In x3:
                CX3 = 0._EB
                DO II2=1,NP
                   CX3 = CX3 + ( XY(JAXIS,II2)+XY(JAXIS,II2+1)) * &
                               ( XY(IAXIS,II2)*XY(JAXIS,II2+1)  - &
                                 XY(JAXIS,II2)*XY(IAXIS,II2+1) )
                ENDDO
                CX3 = CX3 / (6._EB * AREA) + XYZVERT(X3AXIS,CFELEM(2,ICF))

                ! Add to cut-face:
                AREAV(ICF) = AREA
                XYZCEN(IAXIS:KAXIS,ICF) = (/  X1FACE(II), CX2, CX3 /)

                ! Fields for cut-cell volume/centroid computation:
                ! dot(e1,nc)*int(x1)dA, where x=x1face(ii) constant and nc=e1:
                INXAREA(IAXIS,ICF) = 1._EB * X1FACE(II) * AREA
                INXAREA(JAXIS,ICF) = 0._EB
                INXAREA(KAXIS,ICF) = 0._EB
                ! dot(e1,nc)*int(x1^2)dA, where x=x1face(ii) constant and nc=e1:
                INXSQAREA(IAXIS,ICF) = 1._EB * X1FACE(II)**2._EB * AREA
                ! dot(e2,nc)*int(x2^2)dA, where nc=e1 => dot(e2,nc)=0:
                INXSQAREA(JAXIS,ICF) = 0._EB
                ! dot(e3,nc)*int(x3^2)dA, where nc=e1 => dot(e3,nc)=0:
                INXSQAREA(KAXIS,ICF) = 0._EB

             ENDDO

             ALLOCATE(CFELEM2(SIZE(CFELEM,DIM=1),SIZE(CFELEM,DIM=2))); CFELEM2 = IBM_UNDEFINED
             NP=0
             DO ICF=1,NFACE
                IF(.NOT.DROPFACE(ICF)) THEN
                   NP=NP+1
                   CFELEM2(:,NP) = CFELEM(:,ICF)
                ENDIF
             ENDDO
             CFELEM = CFELEM2
             DEALLOCATE(CFELEM2,DROPFACE)
             IF (NP==0) THEN
                 MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) = IBM_SOLID
                 CYCLE
             ENDIF
             NFACE = NP

             ! Figure out if a cut-face is completely inside any of the
             ! others (that is, it is a hole on the GASPHASE):
             FINFACE =      0
             NFACE2  =  NFACE
             DO ICF1=1,NFACE2
                ! Test that ICF1 has a negative area (case of holes)
                AREA1 = AREAV(ICF1)
                IF ( AREA1 < -GEOMEPS ) THEN
                   DO ICF2=1,NFACE2
                      ! Drop if same face:
                      IF ( ICF1 == ICF2 ) CYCLE

                      ! Centroid node for ICF1:
                      XYC1(1:2) = XYZCEN( (/ JAXIS, KAXIS /) , ICF1 ) ! [x2axis x3axis]

                      ! Polygon nodes for ICF2:
                      NP2 = CFELEM(1,ICF2)
                      DO IPT=2,NP2+1
                         ICF_PT = CFELEM(IPT,ICF2)
                         ! Define closed Polygon:
                         XY(IAXIS:JAXIS,IPT-1) = (/ XYZVERT(X2AXIS,ICF_PT), XYZVERT(X3AXIS,ICF_PT) /)
                      ENDDO

                      CALL TEST_PT_INPOLY(NP2,XY,XYC1,PTSFLAG)

                      IF ( PTSFLAG ) THEN ! Centroid of face 1 inside Face 2.

                         FINFACE(ICF1) = ICF2
                         NFACE = NFACE - 1

                         ! Redefine areas in case of faces with holes:
                         AREA2 = AREAV(ICF2)

                         ! Area with hole, AREA1 has negative sign:
                         AREAH = AREA2 + AREA1

                         IF (ABS(AREAH) < GEOMEPS) THEN ! Hole of same size as cut-face, drop both.
                            FINFACE(ICF2) = ICF1
                            CYCLE
                         ENDIF

                         ! Centroid with hole:
                         XYC2(1:2) = XYZCEN( (/ JAXIS, KAXIS /) , ICF2 )  ! [x2axis x3axis]
                         XYH(1:2)  = (AREA1 * XYC1(1:2) + AREA2 * XYC2(1:2)) / AREAH

                         ! So ICF2 has the area with hole properties:
                         AREAV(ICF2) = AREAH
                         XYZCEN(JAXIS,ICF2) = XYH(IAXIS)
                         XYZCEN(KAXIS,ICF2) = XYH(JAXIS)

                         ! Other geom variables:
                         INXAREA(IAXIS:KAXIS,ICF2)  =  INXAREA(IAXIS:KAXIS,ICF2)+  INXAREA(IAXIS:KAXIS,ICF1)
                         INXSQAREA(IAXIS:KAXIS,ICF2)=INXSQAREA(IAXIS:KAXIS,ICF2)+INXSQAREA(IAXIS:KAXIS,ICF1)

                         EXIT
                      ENDIF
                   ENDDO
                ENDIF
             ENDDO

             ! Now enhance CFELEM for faces with holes nodes:
             DO ICF1=1,NFACE2
                ICF2 = FINFACE(ICF1)
                IF ( ICF2 > 0 ) THEN ! Allows for up to one hole per IBM_GASPHASE cut-face.
                   ! Load points
                   NP1    = CFELEM(1,ICF1)
                   NP2    = CFELEM(1,ICF2)
                   NP     = (NP1+1) + (NP2+1)

                   ! Here reallocate CFELEM, CFE, CFEL if NP > SIZE_VERTS_CFELEM:
                   CALL REALLOCATE_LOCAL_VERT_CFELEM(NP+1)
                   CFE(1) = NP

                   DO II2=2,NP1+1
                      CFE(II2) = CFELEM(II2,ICF1)
                   ENDDO
                   II2 = (NP1+1) + 1
                   CFE(II2) = CFELEM(2,ICF1)

                   ! Load last point location:
                   ILOC = 2
                   DIST12 = 1._EB / GEOMEPS
                   XYC1(1:2) = (/ XYZVERT(X2AXIS,CFE(II2)), XYZVERT(X3AXIS,CFE(II2)) /)
                   DO COUNT=2,NP2+1
                      XYC2(1:2) = (/ XYZVERT(X2AXIS,CFELEM(COUNT,ICF2)), XYZVERT(X3AXIS,CFELEM(COUNT,ICF2)) /)
                      D12 = SQRT( (XYC1(1)-XYC2(1))**2._EB + (XYC1(2)-XYC2(2))**2._EB )
                      IF( D12 < DIST12 ) THEN
                         DIST12 = D12
                         ILOC = COUNT
                      ENDIF
                   ENDDO
                   IF (ILOC > 2) THEN
                      ! Rebuild CFELEM(:,ICF2) such that the first point is ILOC:
                      CFEL(2:2+(NP2+1)-ILOC)    = CFELEM(ILOC:NP2+1,ICF2)
                      CFEL(3+(NP2+1)-ILOC:NP2+1)= CFELEM(2:ILOC-1 ,ICF2)
                      CFELEM(2:NP2+1 ,ICF2)     = CFEL(2:NP2+1)
                   ENDIF

                   COUNT = 1
                   DO II2=(NP1+1)+2,(NP1+1)+1+NP2
                      COUNT    = COUNT + 1
                      CFE(II2) = CFELEM(COUNT,ICF2)
                   ENDDO
                   II2 = NP + 1
                   CFE(II2) = CFELEM(2,ICF2)

                   ! Copy CFE into CFELEM(1:np+1,icf2):
                   CFELEM(1:NP+1,ICF2) = CFE(1:NP+1)

                ENDIF
             ENDDO

             NVERTFACE = MAXVAL(CFELEM(1,1:NFACE)) + 1

             ! Area Test: Discard cut-faces with zero total area.
             IF(SUM(AREAV(1:NFACE2))<TWO_EPSILON_EB) THEN
                MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) = IBM_SOLID
                CYCLE
             ENDIF

             ! This is a cut-face, allocate space:
             NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
             IF (BNDINT_FLAG) THEN
                MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
             ELSE
                MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
             ENDIF
             MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCF,X1AXIS) = NCUTFACE

             CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

             MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
             MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
             MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ INDI, INDJ, INDK, X1AXIS /)
             MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_GASPHASE
             CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERTFACE)
             MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1:NVERT) = XYZVERT(IAXIS:KAXIS,1:NVERT)

             ! Load Ordered nodes to CFELEM and geom properties:
             COUNT = 0
             DO ICF=1,NFACE2
                IF ( FINFACE(ICF) > 0 ) CYCLE ! icf is a hole on another cut-face.
                COUNT = COUNT + 1
                ! Connectivity:
                MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERTFACE,COUNT) = &
                                                  CFELEM(1:NVERTFACE, ICF)
                ! Geom Properties:
                MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(COUNT) = AREAV(ICF)
                MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,COUNT) = &
                                                  XYZCEN( (/ XIAXIS, XJAXIS, XKAXIS /) ,ICF)

                ! Fields for cut-cell volume/centroid computation:
                ! dot(i,nc)*int(x)dA, where nc=j => dot(i,nc)=0:
                MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(COUNT)   =   INXAREA(XIAXIS,ICF)
                ! dot(i,nc)*int(x^2)dA, where nc=j => dot(i,nc)=0:
                MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(COUNT) = INXSQAREA(XIAXIS,ICF)
                ! dot(j,nc)*int(y^2)dA, where y=yface(J) constant nc=j:
                MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(COUNT) = INXSQAREA(XJAXIS,ICF)
                ! dot(k,nc)*int(z^2)dA, where nc=j => dot(k,nc)=0:
                MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(COUNT) = INXSQAREA(XKAXIS,ICF)
             ENDDO
             ! Final number of cut-faces in the gas region of the face:
             NFACE = COUNT
             MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE


             ! HERE WE LOAD CARTESIAN CUT FACES THAT BELONG TO THE SOLID REGION, FOR SLICE PLOTTING
             ! PURPOSES:
             ! ------------------------------------------------------------------------------------
             SOLID_FACE_IF : IF (GET_SOLID_CUTFACES) THEN
             ! Build segment list:
             NSSEG      = 0
             NSVERT     = 0
             NSFACE     = 0

             SEG_FACE (NOD1:NOD2,1:IBM_MAXCEELEM_FACE)             = IBM_UNDEFINED
             XYZVERT(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE)              = 0._EB
             ANGSEG(1:IBM_MAXCEELEM_FACE)                          = 0._EB

             ! First Add to vertex list INBOUNDARY vertices and SOLID Cartesian vertices:
             CEI = MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCE,X1AXIS)
             IF ( CEI > 0 ) THEN ! There are inboundary cut-edges
                NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                DO IEDGE=1,NEDGE
                   SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)

                   ! Here we use the SOLID orientation NOD1:NOD2 for right hand rule (inverse of GASPHASE cut-faces)
                   ! x,y,z of node 1:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD1,XYZVERT)

                   ! x,y,z of node 2:
                   XYZV(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                   CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD2,XYZVERT)

                   ! ADD segment:
                   NSSEG = NSSEG + 1
                   SEG_FACE(NOD1:NOD2,NSSEG) = (/ INOD1, INOD2 /)
                   DX3 = XYZVERT(X3AXIS,INOD2)-XYZVERT(X3AXIS,INOD1)
                   DX2 = XYZVERT(X2AXIS,INOD2)-XYZVERT(X2AXIS,INOD1)
                   ANGSEG(NSSEG) = ATAN2(DX3,DX2)

                ENDDO
             ENDIF

             ! Now add IBM_SOLID Type vertices:
             ! Vertex at index JJ-FCELL,KK-FCELL:
             INDXI1(IAXIS:KAXIS) = (/ II, JJ-FCELL  , KK-FCELL   /) ! Local x1,x2,x3
             INDI1 = INDXI1(XIAXIS)
             INDJ1 = INDXI1(XJAXIS)
             INDK1 = INDXI1(XKAXIS)
             ! Vertex at index JJ-FCELL+1,KK-FCELL:
             INDXI2(IAXIS:KAXIS) = (/ II, JJ-FCELL+1, KK-FCELL   /) ! Local x1,x2,x3
             INDI2 = INDXI2(XIAXIS)
             INDJ2 = INDXI2(XJAXIS)
             INDK2 = INDXI2(XKAXIS)
             ! Vertex at index JJ-FCELL+1,KK-FCELL+1:
             INDXI3(IAXIS:KAXIS) = (/ II, JJ-FCELL+1, KK-FCELL+1 /) ! Local x1,x2,x3
             INDI3 = INDXI3(XIAXIS)
             INDJ3 = INDXI3(XJAXIS)
             INDK3 = INDXI3(XKAXIS)
             ! Vertex at index JJ-FCELL,KK-FCELL+1:
             INDXI4(IAXIS:KAXIS) = (/ II, JJ-FCELL  , KK-FCELL+1 /) ! Local x1,x2,x3
             INDI4 = INDXI4(XIAXIS)
             INDJ4 = INDXI4(XJAXIS)
             INDK4 = INDXI4(XKAXIS)

             IF(MESHES(NM)%VERTVAR(INDI1,INDJ1,INDK1,IBM_VGSC) == IBM_SOLID ) THEN
                XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI1(IAXIS)), X2FACE(INDXI1(JAXIS)), X3FACE(INDXI1(KAXIS)) /)
                X1 = XYZLC(XIAXIS); X2 = XYZLC(XJAXIS); X3 = XYZLC(XKAXIS)
                XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD1,XYZVERT)
             ENDIF

             IF(MESHES(NM)%VERTVAR(INDI2,INDJ2,INDK2,IBM_VGSC) == IBM_SOLID ) THEN
                XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI2(IAXIS)), X2FACE(INDXI2(JAXIS)), X3FACE(INDXI2(KAXIS)) /)
                X1 = XYZLC(XIAXIS); X2 = XYZLC(XJAXIS); X3 = XYZLC(XKAXIS)
                XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD1,XYZVERT)
             ENDIF

             IF(MESHES(NM)%VERTVAR(INDI3,INDJ3,INDK3,IBM_VGSC) == IBM_SOLID ) THEN
                XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI3(IAXIS)), X2FACE(INDXI3(JAXIS)), X3FACE(INDXI3(KAXIS)) /)
                X1 = XYZLC(XIAXIS); X2 = XYZLC(XJAXIS); X3 = XYZLC(XKAXIS)
                XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD1,XYZVERT)
             ENDIF

             IF(MESHES(NM)%VERTVAR(INDI4,INDJ4,INDK4,IBM_VGSC) == IBM_SOLID ) THEN
                XYZLC(IAXIS:KAXIS) = (/ X1FACE(INDXI4(IAXIS)), X2FACE(INDXI4(JAXIS)), X3FACE(INDXI4(KAXIS)) /)
                X1 = XYZLC(XIAXIS); X2 = XYZLC(XJAXIS); X3 = XYZLC(XKAXIS)
                XYZV(IAXIS:KAXIS) = (/ X1, X2, X3 /)
                CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZV,NSVERT,INOD1,XYZVERT)
             ENDIF

             ! Make List of HIGH X2 vertices, in ascending X3 order. Add segments:
             ASCDESC=.TRUE.
             XVERT1(1:NSVERT) = XYZVERT(X2AXIS,1:NSVERT)
             XVERT2(1:NSVERT) = XYZVERT(X3AXIS,1:NSVERT)
             CALL SORT_VERTS(IBM_MAXVERTS_FACE,NSVERT,XVERT1,XVERT2,X2FACE(JJ-FCELL+1),ASCDESC,NV,V)
             DO IV=1,NV-1
                NSSEG=NSSEG + 1
                SEG_FACE(NOD1:NOD2,NSSEG) = (/ V(IV), V(IV+1) /)
                ANGSEG(NSSEG) = PI / 2._EB
             ENDDO

             ! Make list of HIGH X3 vertices, in descending X2 order. Add segments:
             ASCDESC=.FALSE.
             XVERT1(1:NSVERT) = XYZVERT(X3AXIS,1:NSVERT)
             XVERT2(1:NSVERT) = XYZVERT(X2AXIS,1:NSVERT)
             CALL SORT_VERTS(IBM_MAXVERTS_FACE,NSVERT,XVERT1,XVERT2,X3FACE(KK-FCELL+1),ASCDESC,NV,V)
             DO IV=1,NV-1
                NSSEG=NSSEG + 1
                SEG_FACE(NOD1:NOD2,NSSEG) = (/ V(IV), V(IV+1) /)
                ANGSEG(NSSEG) = PI
             ENDDO

             ! Make list of LOW X2 vertices, in descending X3 order. Add segments:
             ASCDESC=.FALSE.
             XVERT1(1:NSVERT) = XYZVERT(X2AXIS,1:NSVERT)
             XVERT2(1:NSVERT) = XYZVERT(X3AXIS,1:NSVERT)
             CALL SORT_VERTS(IBM_MAXVERTS_FACE,NSVERT,XVERT1,XVERT2,X2FACE(JJ-FCELL),ASCDESC,NV,V)
             DO IV=1,NV-1
                NSSEG=NSSEG + 1
                SEG_FACE(NOD1:NOD2,NSSEG) = (/ V(IV), V(IV+1) /)
                ANGSEG(NSSEG) = - PI / 2._EB
             ENDDO

             ! Make list of LOW X3 vertices, in ascending X2 order. Add segments:
             ASCDESC=.TRUE.
             XVERT1(1:NSVERT) = XYZVERT(X3AXIS,1:NSVERT)
             XVERT2(1:NSVERT) = XYZVERT(X2AXIS,1:NSVERT)
             CALL SORT_VERTS(IBM_MAXVERTS_FACE,NSVERT,XVERT1,XVERT2,X3FACE(KK-FCELL),ASCDESC,NV,V)
             DO IV=1,NV-1
                NSSEG=NSSEG + 1
                SEG_FACE(NOD1:NOD2,NSSEG) = (/ V(IV), V(IV+1) /)
                ANGSEG(NSSEG) = 0._EB
             ENDDO

             ! Use list of segments on gasphase region from CUT_EDGE:
             ! These are to discard from SEGS computed before:
             COUNT=0
             SEG_FACEAUX(NOD1:NOD2,1:NSSEG) = SEG_FACE(NOD1:NOD2,1:NSSEG)
             ANGSEGAUX(1:NSSEG)=ANGSEG(1:NSSEG)
             SEG_FLAG(1:NSSEG) = .FALSE.
             OUTER : DO ISEG=1,NSSEG
                ! Test against GASPHASE segments:
                INNER1 : DO ISEG2=1,NSEG_CART
                   SNOD1(NOD1:NOD2)= SEG_FACEAUX(NOD1:NOD2,ISEG)
                   SNOD2(NOD1:NOD2)= SEG_FACE_CART(NOD1:NOD2,ISEG2)
                   XYZ_SEG1(IAXIS:KAXIS,NOD1:NOD2) = XYZVERT(IAXIS:KAXIS,SNOD1(NOD1:NOD2))
                   XYZ_SEG2(IAXIS:KAXIS,NOD1:NOD2) = XYZVERT_CART(IAXIS:KAXIS,SNOD2(NOD1:NOD2))
                   ! Test for possible node combination:
                   DO INOD=1,4
                      INOD1=NODC1(INOD) ! [ 1 2 1 2 ]
                      INOD2=NODC2(INOD) ! [ 1 2 2 1]
                      DIFF(INOD) = SQRT((XYZ_SEG1(IAXIS,INOD1)-XYZ_SEG2(IAXIS,INOD2))**2._EB + &
                                        (XYZ_SEG1(JAXIS,INOD1)-XYZ_SEG2(JAXIS,INOD2))**2._EB + &
                                        (XYZ_SEG1(KAXIS,INOD1)-XYZ_SEG2(KAXIS,INOD2))**2._EB ) < GEOMEPS
                   ENDDO
                   IF(DIFF(1) .AND. DIFF(2)) SEG_FLAG(ISEG)=.TRUE. ! Nodes of two segs coincide, its a GASPHASE segment.
                   IF(DIFF(3) .AND. DIFF(4)) SEG_FLAG(ISEG)=.TRUE. ! Nodes of two segs coincide, its a GASPHASE segment.
                ENDDO INNER1
                ! Test against itself:
                INNER2 : DO ISEG2=1,NSSEG
                   IF (ISEG==ISEG2) CYCLE
                   SNOD1(NOD1:NOD2)= SEG_FACEAUX(NOD1:NOD2,ISEG)
                   SNOD2(NOD1:NOD2)= SEG_FACEAUX(NOD1:NOD2,ISEG2)
                   IF(SNOD1(NOD1)==SNOD2(NOD2) .AND. SNOD1(NOD2)==SNOD2(NOD1)) SEG_FLAG(ISEG)=.TRUE.
                ENDDO INNER2
             ENDDO OUTER
             DO ISEG=1,NSSEG
                IF(SEG_FLAG(ISEG)) CYCLE
                COUNT=COUNT+1
                SEG_FACE(NOD1:NOD2,COUNT)=SEG_FACEAUX(NOD1:NOD2,ISEG)
                ANGSEG(COUNT) = ANGSEGAUX(ISEG)
             ENDDO

             NSSEG=COUNT

             ! Build Solid side faces:
             NOTDONE = .TRUE.
             DO WHILE(NOTDONE)
                NOTDONE = .FALSE.
                ! Counts edges that reach nodes:
                NUMEDG_NODE(1:IBM_MAXVERTS_FACE) = 0
                DO ISEG=1,NSSEG
                   DO II2=NOD1,NOD2
                      INOD = SEG_FACE(II2,ISEG)
                      NUMEDG_NODE(INOD) = NUMEDG_NODE(INOD) + 1
                   ENDDO
                ENDDO

                ! Drop segments with NUMEDG_NODE(INOD)=1:
                ! The assumption here is that they are IBM_SS IBM_INBOUNDCF
                ! segments with one node inside the Cartface i.e. case Fig
                ! 9(a) in the CompGeom3D notes):
                COUNT = 0
                SEG_FACEAUX (NOD1:NOD2,1:IBM_MAXCEELEM_FACE)             = IBM_UNDEFINED
                ANGSEGAUX(1:IBM_MAXCEELEM_FACE)                          = 0._EB
                DO ISEG=1,NSSEG
                   NUMNOD1 = NUMEDG_NODE(SEG_FACE(NOD1,ISEG))
                   NUMNOD2 = NUMEDG_NODE(SEG_FACE(NOD2,ISEG))
                   IF ((NUMNOD1 > 1) .AND. (NUMNOD2 > 1)) THEN
                      COUNT = COUNT + 1
                      SEG_FACEAUX(NOD1:NOD2,COUNT) = SEG_FACE(NOD1:NOD2,ISEG)
                      ANGSEGAUX(COUNT) = ANGSEG(ISEG)
                   ELSE
                      NOTDONE = .TRUE.
                   ENDIF
                ENDDO
                NSSEG = COUNT
                SEG_FACE = SEG_FACEAUX
                ANGSEG   = ANGSEGAUX
             ENDDO

             ! Discard face with less than 3 edges (triangle):
             IF ( NSSEG < 3 ) CYCLE

             ! Add segments which have both ends attached to more than two segs:
             count = 0
             DO ISEG=1,NSSEG
                NUMNOD1 = NUMEDG_NODE(SEG_FACE(NOD1,ISEG))
                NUMNOD2 = NUMEDG_NODE(SEG_FACE(NOD2,ISEG))
                IF ((NUMNOD1 > 2) .AND. (NUMNOD2 > 2)) THEN
                   COUNT = COUNT + 1
                   SEG_FACE(NOD1:NOD2,NSSEG+COUNT) = SEG_FACE( (/ NOD2, NOD1 /) ,ISEG)
                   IF (ANGSEG(ISEG) >= 0._EB) THEN
                      ANGSEG(NSSEG+COUNT) = ANGSEG(ISEG) - PI
                   ELSE
                      ANGSEG(NSSEG+COUNT) = ANGSEG(ISEG) + PI
                   ENDIF
                ENDIF
             ENDDO
             NSSEG = NSSEG + COUNT

             ! Fill NODEDG_FACE(IEDGE,INOD), where iedge are edges
             ! that contain inod as first node. This assumes edges are
             ! ordered using the right hand rule on x2-x3 plane.
             ! Also compute the edges angles in x2-x3 plane
             CALL REALLOCATE_NODEDG_FACE(NSSEG,NSVERT)
             NODEDG_FACE(:,:) = 0
             DO ISEG=1,NSSEG
               INOD1 = SEG_FACE(NOD1,ISEG)
               NEDI  = NODEDG_FACE(1,INOD1) + 1 ! Increase number of edges connected to node by 1.
               NODEDG_FACE(     1,INOD1) = NEDI
               NODEDG_FACE(NEDI+1,INOD1) = ISEG
             ENDDO

             ! Now Reorder Segments, do tests:
             SEG_FACE2(NOD1:NOD3,1:IBM_MAXCEELEM_FACE) = IBM_UNDEFINED  ! [INOD1 INOD2 ICF]
             SEG_FLAG(1:IBM_MAXCEELEM_FACE) = .TRUE.

             ICF  = 1
             ISEG = 1
             NEWSEG = ISEG
             COUNT= 1
             CTSTART=COUNT
             SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,NEWSEG), SEG_FACE(NOD2,NEWSEG), ICF /)
             SEG_FLAG(ISEG) = .FALSE.
             NSEG_LEFT      = NSSEG - 1

             ! Infamous infinite loop:
             INF_LOOP2 : DO

                FOUNDSEG = .FALSE.
                N2COUNT  = SEG_FACE2(NOD2,COUNT) ! Node 2 of segment COUNT.
                ANGCOUNT = ANGSEG(NEWSEG)

                ! Find Segment starting on Node 2 with smaller ANGSEG respect to COUNT.
                DANG = -1._EB / GEOMEPS
                DO ISS=2,NODEDG_FACE(1,N2COUNT)+1
                   ISEG = NODEDG_FACE(ISS,N2COUNT)
                   IF ( SEG_FLAG(ISEG) ) THEN ! This seg hasn't been added to SEG_FACE2
                                             ! Drop if seg is the opposite of count seg:
                      IF ( SEG_FACE2(NOD1,COUNT) == SEG_FACE(NOD2,ISEG) ) CYCLE
                      DANGI = ANGSEG(ISEG) - ANGCOUNT
                      IF ( DANGI < 0._EB ) DANGI = DANGI + 2._EB * PI

                      IF ( DANGI > DANG ) THEN
                         NEWSEG   =  ISEG
                         DANG     = DANGI
                         FOUNDSEG = .TRUE.
                      ENDIF
                   ENDIF
                ENDDO

                ! Found a seg add to SEG_FACE2:
                IF ( FOUNDSEG ) THEN
                   COUNT          = COUNT + 1
                   SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,NEWSEG), SEG_FACE(NOD2,NEWSEG), ICF /)
                   SEG_FLAG(NEWSEG) = .FALSE.
                   NSEG_LEFT      = NSEG_LEFT - 1
                ENDIF

                ! Test if line has closed on point shared any other cutface:
                IF ( SEG_FACE2(NOD2,COUNT) == SEG_FACE2(NOD1,CTSTART) ) THEN
                   ! Go for new cut-face on this Cartesian face.
                ELSEIF ( FOUNDSEG ) THEN
                   CYCLE
                ENDIF

                ! Break loop:
                IF ( NSEG_LEFT == 0 ) EXIT

                ! Start a new cut-face on this Cartesian face:
                ICF = ICF + 1
                DO ISEG=1,NSSEG
                   IF ( SEG_FLAG(ISEG) ) THEN
                      COUNT  = COUNT + 1
                      CTSTART= COUNT
                      SEG_FACE2(NOD1:NOD3,COUNT) = (/ SEG_FACE(NOD1,ISEG), SEG_FACE(NOD2,ISEG), ICF /)
                      SEG_FLAG(ISEG) = .FALSE.
                      NSEG_LEFT      = NSEG_LEFT - 1
                      EXIT
                   ENDIF
                ENDDO

             ENDDO INF_LOOP2

             ! Load ordered nodes to CFELEM:
             NSFACE = ICF
             ! Reallocate CFELEM ARRAY if necessary:
             CALL REALLOCATE_LOCAL_CFELEM(NSSEG,NSFACE)
             CFELEM(:,:) = IBM_UNDEFINED
             COUNT  = 0
             DO ICF=1,NSFACE
                NP = 0
                DO ISEG=1,NSSEG
                   IF ( SEG_FACE2(NOD3,ISEG) == ICF ) NP = NP + 1
                ENDDO
                IF (NP < 3) CYCLE ! Drop face if it has less than 2 3 vertices
                COUNT=COUNT+1
                NP = 0
                DO ISEG=1,NSSEG
                   IF ( SEG_FACE2(NOD3,ISEG) == ICF ) THEN
                      NP = NP + 1
                      CFELEM(1,COUNT)    = NP
                      CFELEM(NP+1,COUNT) = SEG_FACE2(NOD1,ISEG)
                   ENDIF
                ENDDO
                ! Does Face Have zero Area? If so drop, rewind:
                DO IPT=2,NP+1
                   ICF_PT = CFELEM(IPT,COUNT)
                   ! Define closed Polygon:
                   XY(IAXIS:JAXIS,IPT-1) = (/ XYZVERT(X2AXIS,ICF_PT), XYZVERT(X3AXIS,ICF_PT) /)
                ENDDO
                ICF_PT = CFELEM(2,COUNT)
                XY(IAXIS:JAXIS,NP+1) = (/ XYZVERT(X2AXIS,ICF_PT), XYZVERT(X3AXIS,ICF_PT) /) ! Close Polygon.
                AREA = 0._EB
                DO II2=1,NP
                   AREA = AREA + ( XY(IAXIS,II2) * XY(JAXIS,II2+1) - &
                                   XY(JAXIS,II2) * XY(IAXIS,II2+1) )
                ENDDO
                IF (ABS(AREA) < GEOMEPS**2._EB) THEN
                   CFELEM(:,COUNT) = IBM_UNDEFINED
                   COUNT = COUNT - 1
                ENDIF
             ENDDO
             NSFACE = COUNT; IF(NSFACE==0) CYCLE

             ! Compute area and Centroid, in local x1, x2, x3 coords:
             ALLOCATE(DROPFACE(1:NSFACE)); DROPFACE=.FALSE.
             AREAV(1:NSFACE)                 = 0._EB
             XYZCEN(IAXIS:KAXIS,1:NSFACE)    = 0._EB
             DO ICF=1,NSFACE
                NP    = CFELEM(1,ICF)
                DO IPT=2,NP+1
                   ICF_PT = CFELEM(IPT,ICF)
                   ! Define closed Polygon centered in First Point:
                   XY(IAXIS:JAXIS,IPT-1) = (/ XYZVERT(X2AXIS,ICF_PT)-XYZVERT(X2AXIS,CFELEM(2,ICF)), &
                                              XYZVERT(X3AXIS,ICF_PT)-XYZVERT(X3AXIS,CFELEM(2,ICF)) /)
                ENDDO
                ICF_PT = CFELEM(2,ICF)
                XY(IAXIS:JAXIS,NP+1) = (/ XYZVERT(X2AXIS,ICF_PT)-XYZVERT(X2AXIS,CFELEM(2,ICF)), &
                                          XYZVERT(X3AXIS,ICF_PT)-XYZVERT(X3AXIS,CFELEM(2,ICF)) /)

                ! Get Area and Centroid properties of Cut-face:
                AREA = 0._EB
                DO II2=1,NP
                   AREA = AREA + ( XY(IAXIS,II2) * XY(JAXIS,II2+1) - &
                                   XY(JAXIS,II2) * XY(IAXIS,II2+1) )
                ENDDO
                AREA = AREA / 2._EB
                IF ( (AREA<GEOMEPS**2) ) THEN
                   DROPFACE(ICF) = .TRUE.
                   CYCLE
                ENDIF
                ! Now Centroids:
                ! In x2:
                CX2 = 0._EB
                DO II2=1,NP
                   CX2 = CX2 + ( XY(IAXIS,II2)+XY(IAXIS,II2+1)) * &
                               ( XY(IAXIS,II2)*XY(JAXIS,II2+1)  - &
                                 XY(JAXIS,II2)*XY(IAXIS,II2+1) )
                ENDDO

                CX2 = CX2 / (6._EB * AREA) + XYZVERT(X2AXIS,CFELEM(2,ICF))
                ! In x3:
                CX3 = 0._EB
                DO II2=1,NP
                   CX3 = CX3 + ( XY(JAXIS,II2)+XY(JAXIS,II2+1)) * &
                               ( XY(IAXIS,II2)*XY(JAXIS,II2+1)  - &
                                 XY(JAXIS,II2)*XY(IAXIS,II2+1) )
                ENDDO
                CX3 = CX3 / (6._EB * AREA) + XYZVERT(X3AXIS,CFELEM(2,ICF))

                ! Add to cut-face:
                AREAV(ICF) = AREA
                XYZCEN(IAXIS:KAXIS,ICF) = (/  X1FACE(II), CX2, CX3 /)

             ENDDO

             ALLOCATE(CFELEM2(SIZE(CFELEM,DIM=1),SIZE(CFELEM,DIM=2))); CFELEM2 = IBM_UNDEFINED
             NP=0
             DO ICF=1,NSFACE
                IF(.NOT.DROPFACE(ICF)) THEN
                   NP=NP+1
                   CFELEM2(:,NP) = CFELEM(:,ICF)
                ENDIF
             ENDDO
             CFELEM = CFELEM2
             DEALLOCATE(CFELEM2,DROPFACE)
             IF (NP==0) CYCLE
             NSFACE = NP

             ! Figure out if a cut-face is completely inside any of the
             ! others (that is, it is a hole on the GASPHASE):
             FINFACE =      0
             NSFACE2  =  NSFACE
             DO ICF1=1,NSFACE2
                ! Test that ICF1 has a negative area (case of holes)
                AREA1 = AREAV(ICF1)
                IF ( AREA1 < -GEOMEPS ) THEN
                   DO ICF2=1,NSFACE2
                      ! Drop if same face:
                      IF ( ICF1 == ICF2 ) CYCLE

                      ! Centroid node for ICF1:
                      XYC1(1:2) = XYZCEN( (/ JAXIS, KAXIS /) , ICF1 ) ! [x2axis x3axis]

                      ! Polygon nodes for ICF2:
                      NP2 = CFELEM(1,ICF2)
                      DO IPT=2,NP2+1
                         ICF_PT = CFELEM(IPT,ICF2)
                         ! Define closed Polygon:
                         XY(IAXIS:JAXIS,IPT-1) = (/ XYZVERT(X2AXIS,ICF_PT), XYZVERT(X3AXIS,ICF_PT) /)
                      ENDDO

                      CALL TEST_PT_INPOLY(NP2,XY,XYC1,PTSFLAG)

                      IF ( PTSFLAG ) THEN ! Centroid of face 1 inside Face 2.

                         FINFACE(ICF1) = ICF2
                         NSFACE = NSFACE - 1

                         ! Redefine areas in case of faces with holes:
                         AREA2 = AREAV(ICF2)

                         ! Area with hole, AREA1 has negative sign:
                         AREAH = AREA2 + AREA1

                         IF (ABS(AREAH) < GEOMEPS) THEN ! Hole of same size as cut-face, drop both.
                            FINFACE(ICF2) = ICF1
                            CYCLE
                         ENDIF

                         ! Centroid with hole:
                         XYC2(1:2) = XYZCEN( (/ JAXIS, KAXIS /) , ICF2 )  ! [x2axis x3axis]
                         XYH(1:2)  = (AREA1 * XYC1(1:2) + AREA2 * XYC2(1:2)) / AREAH

                         ! So ICF2 has the area with hole properties:
                         AREAV(ICF2) = AREAH
                         XYZCEN(JAXIS,ICF2) = XYH(IAXIS)
                         XYZCEN(KAXIS,ICF2) = XYH(JAXIS)
                         EXIT
                      ENDIF
                   ENDDO
                ENDIF
             ENDDO

             ! Now enhance CFELEM for faces with holes nodes:
             DO ICF1=1,NSFACE2
                ICF2 = FINFACE(ICF1)
                IF ( ICF2 > 0 ) THEN ! Allows for up to one hole per IBM_GASPHASE cut-face.
                   ! Load points
                   NP1    = CFELEM(1,ICF1)
                   NP2    = CFELEM(1,ICF2)
                   NP     = (NP1+1) + (NP2+1)

                   ! Here reallocate CFELEM, CFE, CFEL if NP > SIZE_VERTS_CFELEM:
                   CALL REALLOCATE_LOCAL_VERT_CFELEM(NP+1)

                   CFE(1) = NP

                   DO II2=2,np1+1
                      CFE(II2) = CFELEM(II2,icf1)
                   ENDDO
                   II2 = (np1+1) + 1
                   CFE(II2) = CFELEM(2,icf1)

                   COUNT = 1
                   DO II2=(NP1+1)+2,(NP1+1)+1+NP2
                      COUNT    = COUNT + 1
                      CFE(II2) = CFELEM(COUNT,ICF2)
                   ENDDO
                   II2 = NP + 1
                   CFE(II2) = CFELEM(2,ICF2)

                   ! Copy CFE into CFELEM(1:np+1,icf2):
                   CFELEM(1:NP+1,ICF2) = CFE(1:NP+1)

                ENDIF
             ENDDO

             NVERTFACE = MAXVAL(CFELEM(1,1:NSFACE2)) + 1

             ! Up to this point we have all SOLID side cut-faces in CFELEM, SOLID_SIDE nodes in XYZVERT and
             ! Area properties: Add these to Existing CUT_FACE info:
             MESHES(NM)%CUT_FACE(NCUTFACE)%NSVERT  = NSVERT
             MESHES(NM)%CUT_FACE(NCUTFACE)%NSFACE  = NSFACE
             CALL FACE_REALLOC(NM,NCUTFACE,NVERT,NFACE,NSVERT,NSFACE,NVERTFACE)
             MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,NVERT+1:NVERT+NSVERT)=XYZVERT(IAXIS:KAXIS,1:NSVERT)

             ! Load Ordered nodes to CFELEM and geom properties:
             COUNT = NFACE
             DO ICF=1,NSFACE2
                IF ( FINFACE(ICF) > 0 ) CYCLE ! icf is a hole on another cut-face.
                COUNT = COUNT + 1
                ! Connectivity:
                NV=CFELEM(1, ICF)
                CFELEM(2:NV+1,ICF)=CFELEM(2:NV+1,ICF) + NVERT ! Re-index to total number of vertices.
                MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERTFACE,COUNT) = &
                                                  CFELEM(1:NVERTFACE, ICF)
                ! Geom Properties SOLID:
                MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(COUNT) = AREAV(ICF)
                MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,COUNT) = &
                                                  XYZCEN( (/ XIAXIS, XJAXIS, XKAXIS /) ,ICF)

             ENDDO
             ! Final number of cut-faces in the solid region of the face:
             MESHES(NM)%CUT_FACE(NCUTFACE)%NSFACE  = COUNT-NFACE

             ENDIF SOLID_FACE_IF

            ENDDO ! JJ
         ENDDO ! KK
      ENDDO ! II

      DEALLOCATE(X1FACE,X2FACE,X3FACE)

   ENDDO XIAXIS_LOOP

ENDDO IBNDINT_LOOP

IF (BNDINT_FLAG) THEN
   ! Here we mark faces on the guard-cell region for the computaiton of grid aligned INBOUNDARY faces
   ! on CARTCELL_CUTFACES to work correctly:
   XIAXIS_LOOP_2 : DO X1AXIS=IAXIS,KAXIS

      SELECT CASE(X1AXIS)
      case(IAXIS)

         X2AXIS = JAXIS
         X3AXIS = KAXIS

         ! IAXIS gasphase cut-faces:
         ILO = ILO_FACE-CCGUARD; IHI = IHI_FACE+CCGUARD
         JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
         KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = IAXIS; XJAXIS = JAXIS; XKAXIS = KAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = ILO; X1HI = IHI
         X2LO = JLO; X2HI = JHI
         X3LO = KLO; X3HI = KHI

      CASE(JAXIS)

         X2AXIS = KAXIS
         X3AXIS = IAXIS

         ! JAXIS gasphase cut-faces:
         JLO = JLO_FACE-CCGUARD; JHI = JHI_FACE+CCGUARD
         ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
         KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = KAXIS; XJAXIS = IAXIS; XKAXIS = JAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = JLO; X1HI = JHI
         X2LO = KLO; X2HI = KHI
         X3LO = ILO; X3HI = IHI

      CASE(KAXIS)

         X2AXIS = IAXIS
         X3AXIS = JAXIS

         ! KAXIS gasphase cut-faces:
         KLO = KLO_FACE-CCGUARD; KHI = KHI_FACE+CCGUARD
         ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
         JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD

         ! location in I,J,K od x2,x2,x3 axes:
         XIAXIS = JAXIS; XJAXIS = KAXIS; XKAXIS = IAXIS

         ! Local indexing in x1, x2, x3:
         X1LO = KLO; X1HI = KHI
         X2LO = ILO; X2HI = IHI
         X3LO = JLO; X3HI = JHI

      END SELECT

      ! Loop on Cartesian faces, local x1, x2, x3 indexes:
      DO II=X1LO,X1HI
         DO KK=X3LO,X3HI
            DO JJ=X2LO,X2HI

             ! Face indexes:
             INDXI(IAXIS:KAXIS) = (/ II, JJ, KK /) ! Local x1,x2,x3
             INDI = INDXI(XIAXIS)
             INDJ = INDXI(XJAXIS)
             INDK = INDXI(XKAXIS)

             ! Drop if cut-face has already been counted:
             IF( IJK_COUNTED(INDI,INDJ,INDK,X1AXIS) ) CYCLE

             ! Drop if face not cut-face:
             ! Test for FACE Cartesian edges being cut:
             ! If outface1 is true -> All regular edges for this face:
             ! Edge at index KK-FCELL:
             INDXI1(IAXIS:KAXIS) = (/ II, JJ, KK-FCELL /) ! Local x1,x2,x3
             INDI1 = INDXI1(XIAXIS)
             INDJ1 = INDXI1(XJAXIS)
             INDK1 = INDXI1(XKAXIS)
             ! Edge at index KK-FCELL+1:
             INDXI2(IAXIS:KAXIS) = (/ II, JJ, KK-FCELL+1 /) ! Local x1,x2,x3
             INDI2 = INDXI2(XIAXIS)
             INDJ2 = INDXI2(XJAXIS)
             INDK2 = INDXI2(XKAXIS)
             ! Edge at index JJ-FCELL:
             INDXI3(IAXIS:KAXIS) = (/ II, JJ-FCELL, KK /) ! Local x1,x2,x3
             INDI3 = INDXI3(XIAXIS)
             INDJ3 = INDXI3(XJAXIS)
             INDK3 = INDXI3(XKAXIS)
             ! Edge at index jj-FCELL+1:
             INDXI4(IAXIS:KAXIS) = (/ II, JJ-FCELL+1, KK /) ! Local x1,x2,x3
             INDI4 = INDXI4(XIAXIS)
             INDJ4 = INDXI4(XJAXIS)
             INDK4 = INDXI4(XKAXIS)

             OUTFACE1 = (MESHES(NM)%ECVAR(INDI1,INDJ1,INDK1,IBM_EGSC,X2AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI2,INDJ2,INDK2,IBM_EGSC,X2AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI3,INDJ3,INDK3,IBM_EGSC,X3AXIS) /= IBM_CUTCFE) .AND. &
                        (MESHES(NM)%ECVAR(INDI4,INDJ4,INDK4,IBM_EGSC,X3AXIS) /= IBM_CUTCFE)

             ! Test for face with INB edges:
             ! If outface2 is true -> no INB Edges associated with this face:
             OUTFACE2 = (MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_IDCE,X1AXIS) <= 0)

             ! Drop if outface1 & outface2
             IF (OUTFACE1 .AND. OUTFACE2) THEN
                ! Test if IBM_FSID is SOLID:
                IF ((MESHES(NM)%ECVAR(INDI1,INDJ1,INDK1,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI2,INDJ2,INDK2,IBM_EGSC,X2AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI3,INDJ3,INDK3,IBM_EGSC,X3AXIS) == IBM_SOLID) .AND. &
                   (MESHES(NM)%ECVAR(INDI4,INDJ4,INDK4,IBM_EGSC,X3AXIS) == IBM_SOLID) ) THEN
                   MESHES(NM)%FCVAR(INDI,INDJ,INDK,IBM_FGSC,X1AXIS) = IBM_SOLID
                ENDIF
                CYCLE
             ENDIF

            ENDDO ! JJ
         ENDDO ! KK
      ENDDO ! II

   ENDDO XIAXIS_LOOP_2

ELSE
   DEALLOCATE(IJK_COUNTED)
ENDIF

DEALLOCATE(NODEDG_FACE)
DEALLOCATE(CFELEM,CFE,CFEL)

T_CC_USED(GET_CARTFACE_CUTFACES_TIME_INDEX) = T_CC_USED(GET_CARTFACE_CUTFACES_TIME_INDEX) + CURRENT_TIME() - TNOW

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   NCUTFCE = 0
   IF (BNDINT_FLAG) THEN
      DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
         IF (MESHES(NM)%CUT_FACE(ICF)%STATUS  /= IBM_GASPHASE) CYCLE
         NCUTFCE = NCUTFCE + MESHES(NM)%CUT_FACE(ICF)%NFACE
      ENDDO
   ELSE
      DO ICF=MESHES(NM)%N_CUTFACE_MESH+1,MESHES(NM)%N_CUTFACE_MESH+MESHES(NM)%N_GCCUTFACE_MESH
         IF (MESHES(NM)%CUT_FACE(ICF)%STATUS  /= IBM_GASPHASE) CYCLE
         NCUTFCE = NCUTFCE + MESHES(NM)%CUT_FACE(ICF)%NFACE
      ENDDO
   ENDIF
   WRITE(LU_SETCC,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-faces : ',NCUTFCE,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-faces : ',NCUTFCE,'. '
   ENDIF
ENDIF

RETURN

CONTAINS

SUBROUTINE REALLOCATE_NODEDG_FACE(N_SEG_CFACE,N_VERT_CFACE)

INTEGER, INTENT(IN) :: N_SEG_CFACE,N_VERT_CFACE
INTEGER :: DFCTE,DFCTV

IF ( (N_SEG_CFACE+1 > SIZE_EDGES_NODEDG) .OR. (N_VERT_CFACE > SIZE_VERTS_NODEDG)) THEN
   ! Allocation factors:
   DFCTE = MAX(0,CEILING(REAL(N_SEG_CFACE+1-SIZE_EDGES_NODEDG,EB)/REAL(DELTA_EDGE,EB)))
   DFCTV = MAX(0,CEILING(REAL(N_VERT_CFACE -SIZE_VERTS_NODEDG,EB)/REAL(DELTA_VERT,EB)))
   DEALLOCATE(NODEDG_FACE)
   SIZE_VERTS_NODEDG = SIZE_VERTS_NODEDG + DFCTV*DELTA_VERT
   SIZE_EDGES_NODEDG = SIZE_EDGES_NODEDG + DFCTE*DELTA_EDGE
   ALLOCATE(NODEDG_FACE(1:SIZE_EDGES_NODEDG,1:SIZE_VERTS_NODEDG))
ENDIF
RETURN
END SUBROUTINE REALLOCATE_NODEDG_FACE

SUBROUTINE REALLOCATE_LOCAL_CFELEM(N_VERT_CFACE,N_FACE_CFACE)

INTEGER, INTENT(IN) :: N_VERT_CFACE, N_FACE_CFACE
INTEGER :: DFCTF,DFCTV

IF ( (N_FACE_CFACE > SIZE_CFACES_CFELEM) .OR. (N_VERT_CFACE+1 > SIZE_VERTS_CFELEM)) THEN
   DFCTV = MAX(0,CEILING(REAL(N_VERT_CFACE+1-SIZE_VERTS_CFELEM,EB)/REAL(DELTA_VERT,EB)))
   DFCTF = MAX(0,CEILING(REAL(N_FACE_CFACE-SIZE_CFACES_CFELEM,EB)/REAL(DELTA_FACE,EB)))
   DEALLOCATE(CFELEM)
   SIZE_CFACES_CFELEM = SIZE_CFACES_CFELEM + DFCTF*DELTA_FACE
   SIZE_VERTS_CFELEM  = SIZE_VERTS_CFELEM  + DFCTV*DELTA_VERT
   ALLOCATE(CFELEM(1:SIZE_VERTS_CFELEM,1:SIZE_CFACES_CFELEM))
   DEALLOCATE(CFE,CFEL); ALLOCATE(CFE(1:SIZE_VERTS_CFELEM),CFEL(1:SIZE_VERTS_CFELEM))
ENDIF
RETURN
END SUBROUTINE REALLOCATE_LOCAL_CFELEM


SUBROUTINE REALLOCATE_LOCAL_VERT_CFELEM(N_VERT_CFACE)

INTEGER, INTENT(IN) :: N_VERT_CFACE
INTEGER :: DFCTV
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFELEM_AUX

IF( N_VERT_CFACE > SIZE_VERTS_CFELEM ) THEN
   DFCTV = MAX(0,CEILING(REAL(N_VERT_CFACE-SIZE_VERTS_CFELEM,EB)/REAL(DELTA_VERT,EB)))
   ALLOCATE(CFELEM_AUX(1:SIZE_VERTS_CFELEM+DFCTV*DELTA_VERT,1:SIZE_CFACES_CFELEM))
   CFELEM_AUX(:,:) = IBM_UNDEFINED
   CFELEM_AUX(1:SIZE_VERTS_CFELEM,1:SIZE_CFACES_CFELEM) =  &
   CFELEM(1:SIZE_VERTS_CFELEM,1:SIZE_CFACES_CFELEM)
   SIZE_VERTS_CFELEM  = SIZE_VERTS_CFELEM  + DFCTV*DELTA_VERT
   DEALLOCATE(CFELEM); ALLOCATE(CFELEM(1:SIZE_VERTS_CFELEM,1:SIZE_CFACES_CFELEM))
   CFELEM(:,:) = CFELEM_AUX(:,:)
   DEALLOCATE(CFELEM_AUX)
   ! Now Reallocate CFE, CFEL:
   DEALLOCATE(CFE,CFEL); ALLOCATE(CFE(1:SIZE_VERTS_CFELEM),CFEL(1:SIZE_VERTS_CFELEM))
ENDIF
RETURN
END SUBROUTINE REALLOCATE_LOCAL_VERT_CFELEM

END SUBROUTINE GET_CARTFACE_CUTFACES


! ---------------- DEFINE_REGULAR_CUTFACES --------------------------

SUBROUTINE DEFINE_REGULAR_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,BNDINT_FLAG)

INTEGER, INTENT(IN) :: NM
INTEGER, INTENT(IN) :: ISTR, IEND, JSTR, JEND, KSTR, KEND
LOGICAL, INTENT(IN) :: BNDINT_FLAG

! Local Variables:
INTEGER :: ILO,IHI,JLO,JHI,KLO,KHI,X1AXIS,NVERT,NFACE,I,J,K,NCUTFACE
INTEGER :: IBNDINT,BNDINT_LOW,BNDINT_HIGH

LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:,:) :: IJK_COUNTED

CALL POINT_TO_MESH(NM)

! Mesh sizes:
NXB=IBAR
NYB=JBAR
NZB=KBAR

! Test Sizes:
IF (PERIODIC_TEST == 7 ) THEN
   VAL_TESTX_LOW =-.5_EB
   VAL_TESTX_HIGH= .5_EB
   VAL_TESTY_LOW = YS
   VAL_TESTY_HIGH= YF
   VAL_TESTZ_LOW =-.5_EB
   VAL_TESTZ_HIGH= .5_EB
ELSEIF (PERIODIC_TEST == 11) THEN
   VAL_TESTX_LOW =-.5_EB
   VAL_TESTX_HIGH= .5_EB
   VAL_TESTY_LOW = YS
   VAL_TESTY_HIGH= YF
   VAL_TESTZ_LOW = ZS
   VAL_TESTZ_HIGH= ZF
ELSEIF (PERIODIC_TEST == 103) THEN
   VAL_TESTX_LOW =-1.0_EB
   VAL_TESTX_HIGH= 1.0_EB
   VAL_TESTY_LOW =-1.0_EB
   VAL_TESTY_HIGH= 1.0_EB
   VAL_TESTZ_LOW = 1.0_EB
   VAL_TESTZ_HIGH= 3.0_EB
ENDIF


! Main Loop on block NM:
IF (BNDINT_FLAG) THEN
   ALLOCATE( IJK_COUNTED(ISTR:IEND,JSTR:JEND,KSTR:KEND,IAXIS:KAXIS) ); IJK_COUNTED=.FALSE.
   BNDINT_LOW  = 1
   BNDINT_HIGH = 3
ELSE
   BNDINT_LOW  = 4
   BNDINT_HIGH = 4
ENDIF

IBNDINT_LOOP : DO IBNDINT=BNDINT_LOW,BNDINT_HIGH ! 1,2 refers to block boundary faces, 3 to internal faces,
                                                 ! 4 guard-cell faces.

   ! When switching to internal faces, copy number of external faces already computed.
   IF (IBNDINT == 3) MESHES(NM)%N_BBCUTFACE_MESH = MESHES(NM)%N_CUTFACE_MESH

   ! First tag and define Gasphase cut-faces in X,Y,Z directions.
   ! X direction:
   ! IAXIS gasphase cut-faces:
   JLO = JLO_CELL; JHI = JHI_CELL
   KLO = KLO_CELL; KHI = KHI_CELL
   SELECT CASE(IBNDINT)
   CASE(1)
      ILO = ILO_FACE; IHI = ILO_FACE
   CASE(2)
      ILO = IHI_FACE; IHI = IHI_FACE
   CASE(3)
      ILO = ILO_FACE+1; IHI = IHI_FACE-1
   CASE(4)
      ILO = ILO_FACE-CCGUARD; IHI= IHI_FACE+CCGUARD
      JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
      KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
   END SELECT
   X1AXIS=IAXIS
   NVERT = 4
   NFACE = 1
   DO I=ILO,IHI
      DO J=JLO,JHI
         DO K=KLO,KHI

            ! If cut-cell centroid is outside the test box -> drop:
            IF(XFACE(I) < (VAL_TESTX_LOW +GEOMEPS)) CYCLE; IF(XFACE(I) > (VAL_TESTX_HIGH-GEOMEPS)) CYCLE
            IF(YCELL(J) < (VAL_TESTY_LOW +GEOMEPS)) CYCLE; IF(YCELL(J) > (VAL_TESTY_HIGH-GEOMEPS)) CYCLE
            IF(ZCELL(K) < (VAL_TESTZ_LOW +GEOMEPS)) CYCLE; IF(ZCELL(K) > (VAL_TESTZ_HIGH-GEOMEPS)) CYCLE

            ! Drop if cut-face has already been counted:
            IF( IJK_COUNTED(I,J,K,X1AXIS) ) CYCLE; IJK_COUNTED(I,J,K,X1AXIS)=.TRUE.

            FCVAR(I,J,K,IBM_FGSC,X1AXIS)=IBM_CUTCFE

            NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
            IF (BNDINT_FLAG) THEN
               MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
            ELSE
               MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
            ENDIF

            FCVAR(I,J,K,IBM_IDCF,X1AXIS) = NCUTFACE

            CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

            MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
            MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
            MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, X1AXIS /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_GASPHASE
            CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERT+1)

            ! Vertices:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1) = (/ XFACE(I), YFACE(J-1), ZFACE(K-1) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,2) = (/ XFACE(I), YFACE(J  ), ZFACE(K-1) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,3) = (/ XFACE(I), YFACE(J  ), ZFACE(K  ) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,4) = (/ XFACE(I), YFACE(J-1), ZFACE(K  ) /)

            ! Centroid:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NFACE) = 0.5_EB* &
            (/ XFACE(I  )+XFACE(I  ), YFACE(J-1)+YFACE(J  ), ZFACE(K-1)+ZFACE(K  ) /)

            ! Load Ordered nodes to CFELEM and geom properties:
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERT+1,NFACE) = (/ NVERT, 1, 2, 3, 4 /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE) = DYCELL(J)*DZCELL(K)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NFACE)   =   XFACE(I)*MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE)
            ! dot(i,nc)*int(x^2)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NFACE) =   XFACE(I)**2._EB*MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE)
            ! dot(j,nc)*int(y^2)dA, where y=yface(J) constant nc=j:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NFACE) = 0._EB
            ! dot(k,nc)*int(z^2)dA, where nc=j => dot(k,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NFACE) = 0._EB
         ENDDO
      ENDDO
   ENDDO

   ! Y direction:
   ! JAXIS gasphase cut-faces:
   ILO = ILO_CELL; IHI = IHI_CELL
   KLO = KLO_CELL; KHI = KHI_CELL
   SELECT CASE(IBNDINT)
   CASE(1)
      JLO = JLO_FACE; JHI = JLO_FACE
   CASE(2)
      JLO = JHI_FACE; JHI = JHI_FACE
   CASE(3)
      JLO = JLO_FACE+1; JHI = JHI_FACE-1
   CASE(4)
      JLO = JLO_FACE-CCGUARD; JHI = JHI_FACE+CCGUARD
      ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
      KLO = KLO-CCGUARD; KHI = KHI+CCGUARD
   END SELECT
   X1AXIS=JAXIS
   NVERT = 4
   NFACE = 1
   DO I=ILO,IHI
      DO J=JLO,JHI
         DO K=KLO,KHI

            ! If cut-cell centroid is outside the test box -> drop:
            IF(XCELL(I) < (VAL_TESTX_LOW +GEOMEPS)) CYCLE; IF(XCELL(I) > (VAL_TESTX_HIGH-GEOMEPS)) CYCLE
            IF(YFACE(J) < (VAL_TESTY_LOW +GEOMEPS)) CYCLE; IF(YFACE(J) > (VAL_TESTY_HIGH-GEOMEPS)) CYCLE
            IF(ZCELL(K) < (VAL_TESTZ_LOW +GEOMEPS)) CYCLE; IF(ZCELL(K) > (VAL_TESTZ_HIGH-GEOMEPS)) CYCLE

            ! Drop if cut-face has already been counted:
            IF( IJK_COUNTED(I,J,K,X1AXIS) ) CYCLE; IJK_COUNTED(I,J,K,X1AXIS)=.TRUE.

            FCVAR(I,J,K,IBM_FGSC,X1AXIS)=IBM_CUTCFE

            NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
            IF (BNDINT_FLAG) THEN
               MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
            ELSE
               MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
            ENDIF

            FCVAR(I,J,K,IBM_IDCF,X1AXIS) = NCUTFACE

            CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

            MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
            MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
            MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, X1AXIS /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_GASPHASE
            CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERT+1)


            ! Vertices:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1) = (/ XFACE(I-1), YFACE(J), ZFACE(K-1) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,2) = (/ XFACE(I-1), YFACE(J), ZFACE(K  ) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,3) = (/ XFACE(I  ), YFACE(J), ZFACE(K  ) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,4) = (/ XFACE(I  ), YFACE(J), ZFACE(K-1) /)

            ! Centroid:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NFACE) = 0.5_EB* &
            (/ XFACE(I-1)+XFACE(I  ), YFACE(J  )+YFACE(J  ), ZFACE(K-1)+ZFACE(K  ) /)

            ! Load Ordered nodes to CFELEM and geom properties:
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERT+1,NFACE) = (/ NVERT, 1, 2, 3, 4 /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE) = DXCELL(I)*DZCELL(K)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NFACE)   = 0._EB
            ! dot(i,nc)*int(x^2)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NFACE) = 0._EB
            ! dot(j,nc)*int(y^2)dA, where y=yface(J) constant nc=j:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NFACE) = YFACE(J)**2._EB*MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE)
            ! dot(k,nc)*int(z^2)dA, where nc=j => dot(k,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NFACE) = 0._EB
         ENDDO
      ENDDO
   ENDDO

   ! Z direction:
   ! KAXIS gasphase cut-faces:
   ILO = ILO_CELL; IHI = IHI_CELL
   JLO = JLO_CELL; JHI = JHI_CELL
   SELECT CASE(IBNDINT)
   CASE(1)
      KLO = KLO_FACE; KHI = KLO_FACE
   CASE(2)
      KLO = KHI_FACE; KHI = KHI_FACE
   CASE(3)
      KLO = KLO_FACE+1; KHI = KHI_FACE-1
   CASE(4)
      KLO = KLO_FACE-CCGUARD; KHI = KHI_FACE+CCGUARD
      ILO = ILO-CCGUARD; IHI = IHI+CCGUARD
      JLO = JLO-CCGUARD; JHI = JHI+CCGUARD
   END SELECT
   X1AXIS=KAXIS
   NVERT = 4
   NFACE = 1
   DO I=ILO,IHI
      DO J=JLO,JHI
         DO K=KLO,KHI

            ! If cut-cell centroid is outside the test box -> drop:
            IF(XCELL(I) < (VAL_TESTX_LOW +GEOMEPS)) CYCLE; IF(XCELL(I) > (VAL_TESTX_HIGH-GEOMEPS)) CYCLE
            IF(YCELL(J) < (VAL_TESTY_LOW +GEOMEPS)) CYCLE; IF(YCELL(J) > (VAL_TESTY_HIGH-GEOMEPS)) CYCLE
            IF(ZFACE(K) < (VAL_TESTZ_LOW +GEOMEPS)) CYCLE; IF(ZFACE(K) > (VAL_TESTZ_HIGH-GEOMEPS)) CYCLE

            ! Drop if cut-face has already been counted:
            IF( IJK_COUNTED(I,J,K,X1AXIS) ) CYCLE; IJK_COUNTED(I,J,K,X1AXIS)=.TRUE.

            FCVAR(I,J,K,IBM_FGSC,X1AXIS)=IBM_CUTCFE

            NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
            IF (BNDINT_FLAG) THEN
               MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
            ELSE
               MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
            ENDIF

            FCVAR(I,J,K,IBM_IDCF,X1AXIS) = NCUTFACE

            CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

            MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
            MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NFACE
            MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, X1AXIS /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_GASPHASE
            CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NVERT+1)


            ! Vertices:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1) = (/ XFACE(I-1), YFACE(J-1), ZFACE(K) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,2) = (/ XFACE(I  ), YFACE(J-1), ZFACE(K) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,3) = (/ XFACE(I  ), YFACE(J  ), ZFACE(K) /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,4) = (/ XFACE(I-1), YFACE(J  ), ZFACE(K) /)

            ! Centroid:
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NFACE) = 0.5_EB* &
            (/ XFACE(I-1)+XFACE(I  ), YFACE(J-1)+YFACE(J  ), ZFACE(K  )+ZFACE(K  ) /)

            ! Load Ordered nodes to CFELEM and geom properties:
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVERT+1,NFACE) = (/ NVERT, 1, 2, 3, 4 /)
            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE) = DXCELL(I)*DYCELL(J)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NFACE)   = 0._EB
            ! dot(i,nc)*int(x^2)dA, where nc=j => dot(i,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NFACE) = 0._EB
            ! dot(j,nc)*int(y^2)dA, where y=yface(J) constant nc=j:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NFACE) = 0._EB
            ! dot(k,nc)*int(z^2)dA, where nc=j => dot(k,nc)=0:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NFACE) = ZFACE(K)**2._EB*MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NFACE)
         ENDDO
      ENDDO
   ENDDO

ENDDO IBNDINT_LOOP

IF (.NOT.BNDINT_FLAG) DEALLOCATE( IJK_COUNTED )

RETURN
END SUBROUTINE DEFINE_REGULAR_CUTFACES


! ---------------------------- SORT_VERTS ---------------------------------------

SUBROUTINE SORT_VERTS(MAXVERTS,NVERTS,VERTS1,VERTS2,XV,ASCDESC,NV,V)

INTEGER, INTENT(IN) :: MAXVERTS, NVERTS
REAL(EB),INTENT(IN) :: VERTS1(MAXVERTS),VERTS2(MAXVERTS),XV
LOGICAL, INTENT(IN) :: ASCDESC
INTEGER, INTENT(OUT):: NV,V(MAXVERTS)

! Local Variables:
INTEGER :: IV, IIV, JJV
INTEGER :: V2(MAXVERTS)
LOGICAL :: FOUND

V(:) = 0
NV   = 0
DO IV=1,NVERTS
   IF (ABS(VERTS1(IV)-XV) < GEOMEPS) THEN
      IF (NV==0) THEN
         NV=1; V(NV)=IV
      ELSE
         ! Insert add IV, using ascending X3:
         FOUND=.FALSE.
         DO IIV=1,NV
            IF ( (VERTS2(IV)-VERTS2(V(IIV))) < 0._EB ) THEN
                  FOUND=.TRUE.
                  EXIT
            ENDIF
         ENDDO
         IF (FOUND) THEN
            DO JJV=NV+1,IIV+1,-1
               V(JJV) = V(JJV-1)
            ENDDO
            V(IIV) = IV
         ELSE
            V(IIV) = IV ! Here IIV = NV+1, as loop leaves it to that value.
         ENDIF
         NV=NV+1
      ENDIF
   ENDIF
ENDDO
IF (.NOT.ASCDESC) THEN
    V2(1:NV) = V(1:NV)
    DO IV=1,NV; V(NV+1-IV)=V2(IV); ENDDO
ENDIF

RETURN
END SUBROUTINE SORT_VERTS

! ----------------------------- FACE_REALLOC -------------------------------------

SUBROUTINE FACE_REALLOC(NM,ICF,NVERT,NFACE,NSVERT,NSFACE,NVERTFACE_NEW)

INTEGER, INTENT(IN)    :: NM,ICF,NVERT,NFACE,NSVERT,NSFACE
INTEGER, INTENT(INOUT) :: NVERTFACE_NEW

! Local Variables:
INTEGER :: NVERTFACE
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE)           :: XYZVERT  ! Locations of vertices.
REAL(EB), DIMENSION(IBM_MAXCFELEM_FACE)                        ::    AREA  ! Cut-faces areas.
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXCFELEM_FACE)          ::  XYZCEN  ! Cut-faces centroid locations.
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFELEM ! Cut-faces connectivities.

NVERTFACE=SIZE(MESHES(NM)%CUT_FACE(ICF)%CFELEM,DIM=1)
NVERTFACE_NEW = MAX(NVERTFACE_NEW,NVERTFACE)

! Allocate and initialize NVERT related fields:
XYZVERT(IAXIS:KAXIS,1:NVERT)=MESHES(NM)%CUT_FACE(ICF)%XYZVERT(IAXIS:KAXIS,1:NVERT)
DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZVERT)
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZVERT(IAXIS:KAXIS,1:NVERT+NSVERT)); MESHES(NM)%CUT_FACE(ICF)%XYZVERT = 0._EB
MESHES(NM)%CUT_FACE(ICF)%XYZVERT(IAXIS:KAXIS,1:NVERT)=XYZVERT(IAXIS:KAXIS,1:NVERT)

! Allocate and initialize NFACE, NVERTFACE related fields:
ALLOCATE(CFELEM(1:NVERTFACE,1:NFACE))
CFELEM(1:NVERTFACE,1:NFACE)=MESHES(NM)%CUT_FACE(ICF)%CFELEM(1:NVERTFACE,1:NFACE)
DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFELEM)
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFELEM(1:NVERTFACE_NEW,1:NFACE+NSFACE));
MESHES(NM)%CUT_FACE(ICF)%CFELEM = IBM_UNDEFINED
MESHES(NM)%CUT_FACE(ICF)%CFELEM(1:NVERTFACE,1:NFACE)=CFELEM(1:NVERTFACE,1:NFACE)
DEALLOCATE(CFELEM)

AREA(1:NFACE)=MESHES(NM)%CUT_FACE(ICF)%AREA(1:NFACE)
XYZCEN(IAXIS:KAXIS,1:NFACE)=MESHES(NM)%CUT_FACE(ICF)%XYZCEN(IAXIS:KAXIS,1:NFACE)
DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%AREA, MESHES(NM)%CUT_FACE(ICF)%XYZCEN)
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%AREA(1:NFACE+NSFACE)); MESHES(NM)%CUT_FACE(ICF)%AREA = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZCEN(IAXIS:KAXIS,1:NFACE+NSFACE)); MESHES(NM)%CUT_FACE(ICF)%XYZCEN = 0._EB
MESHES(NM)%CUT_FACE(ICF)%AREA(1:NFACE)=AREA(1:NFACE)
MESHES(NM)%CUT_FACE(ICF)%XYZCEN(IAXIS:KAXIS,1:NFACE)=XYZCEN(IAXIS:KAXIS,1:NFACE)

! ! No need to do this for now. All reallocated faces are of type IBM_GASPHASE.
! IF (MESHES(NM)%CUT_FACE(ICF)%STATUS /= IBM_INBOUNDARY) RETURN
! ! This is to keep the size of CFACE_INDEX consistent on .
! CFACE_INDEX(1:NFACE)=MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX(1:NFACE)
! DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX)
! ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX(1:NFACE+NSFACE))
! MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX = IBM_UNDEFINED
! MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX(1:NFACE)=CFACE_INDEX(1:NFACE)

RETURN

END SUBROUTINE FACE_REALLOC


! ---------------------- CUT_FACE_ARRAY_REALLOC -------------------------------

SUBROUTINE CUT_FACE_ARRAY_REALLOC(NM,ICF)

INTEGER, INTENT(IN) :: NM,ICF

! Local Variables:
INTEGER :: ICF1, SIZE_CUT_FACE

SIZE_CUT_FACE = SIZE(MESHES(NM)%CUT_FACE,DIM=1)

IF(ICF > SIZE_CUT_FACE) THEN

   ALLOCATE(CUT_FACE_AUX(SIZE_CUT_FACE+GLOBAL_DELTA_FACE))

   DO ICF1=1,ICF-1

      CUT_FACE_AUX(ICF1)%IWC    = MESHES(NM)%CUT_FACE(ICF1)%IWC
      CUT_FACE_AUX(ICF1)%NVERT  = MESHES(NM)%CUT_FACE(ICF1)%NVERT
      CUT_FACE_AUX(ICF1)%NSVERT = MESHES(NM)%CUT_FACE(ICF1)%NSVERT
      CUT_FACE_AUX(ICF1)%NFACE  = MESHES(NM)%CUT_FACE(ICF1)%NFACE
      CUT_FACE_AUX(ICF1)%NSFACE = MESHES(NM)%CUT_FACE(ICF1)%NSFACE
      CUT_FACE_AUX(ICF1)%STATUS = MESHES(NM)%CUT_FACE(ICF1)%STATUS
      CUT_FACE_AUX(ICF1)%IJK    = MESHES(NM)%CUT_FACE(ICF1)%IJK

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%XYZVERT,             TO=CUT_FACE_AUX(ICF1)%XYZVERT)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%CFELEM,              TO=CUT_FACE_AUX(ICF1)%CFELEM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%AREA,                TO=CUT_FACE_AUX(ICF1)%AREA)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%XYZCEN,              TO=CUT_FACE_AUX(ICF1)%XYZCEN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INXAREA,             TO=CUT_FACE_AUX(ICF1)%INXAREA)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INXSQAREA,           TO=CUT_FACE_AUX(ICF1)%INXSQAREA)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%JNYSQAREA,           TO=CUT_FACE_AUX(ICF1)%JNYSQAREA)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%KNZSQAREA,           TO=CUT_FACE_AUX(ICF1)%KNZSQAREA)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%BODTRI,              TO=CUT_FACE_AUX(ICF1)%BODTRI)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%UNKH,                TO=CUT_FACE_AUX(ICF1)%UNKH)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%UNKZ,                TO=CUT_FACE_AUX(ICF1)%UNKZ)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%XCENLOW,             TO=CUT_FACE_AUX(ICF1)%XCENLOW)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%XCENHIGH,            TO=CUT_FACE_AUX(ICF1)%XCENHIGH)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%RHO,                 TO=CUT_FACE_AUX(ICF1)%RHO)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%ZZ_FACE,             TO=CUT_FACE_AUX(ICF1)%ZZ_FACE)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%RHO_D,               TO=CUT_FACE_AUX(ICF1)%RHO_D)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%TMP_FACE,            TO=CUT_FACE_AUX(ICF1)%TMP_FACE)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%RHO_D_DZDN,          TO=CUT_FACE_AUX(ICF1)%RHO_D_DZDN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%H_RHO_D_DZDN,        TO=CUT_FACE_AUX(ICF1)%H_RHO_D_DZDN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%VEL,                 TO=CUT_FACE_AUX(ICF1)%VEL)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%VELS,                TO=CUT_FACE_AUX(ICF1)%VELS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%DHDX,                TO=CUT_FACE_AUX(ICF1)%DHDX)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%FN,                  TO=CUT_FACE_AUX(ICF1)%FN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%VELNP1,              TO=CUT_FACE_AUX(ICF1)%VELNP1)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%VELINT,              TO=CUT_FACE_AUX(ICF1)%VELINT)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%JDZ,                 TO=CUT_FACE_AUX(ICF1)%JDZ)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%JDH,                 TO=CUT_FACE_AUX(ICF1)%JDH)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%CELL_LIST,           TO=CUT_FACE_AUX(ICF1)%CELL_LIST)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_IJK,          TO=CUT_FACE_AUX(ICF1)%INT_IJK)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_COEF,         TO=CUT_FACE_AUX(ICF1)%INT_COEF)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_DCOEF,        TO=CUT_FACE_AUX(ICF1)%INT_DCOEF)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_XYZBF,        TO=CUT_FACE_AUX(ICF1)%INT_XYZBF)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_NOUT,         TO=CUT_FACE_AUX(ICF1)%INT_NOUT)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_INBFC,        TO=CUT_FACE_AUX(ICF1)%INT_INBFC)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_NPE,          TO=CUT_FACE_AUX(ICF1)%INT_NPE)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_XN,           TO=CUT_FACE_AUX(ICF1)%INT_XN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_CN,           TO=CUT_FACE_AUX(ICF1)%INT_CN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_FVARS,        TO=CUT_FACE_AUX(ICF1)%INT_FVARS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_NOMIND,       TO=CUT_FACE_AUX(ICF1)%INT_NOMIND)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%INT_CVARS,           TO=CUT_FACE_AUX(ICF1)%INT_CVARS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%RHOPVN,              TO=CUT_FACE_AUX(ICF1)%RHOPVN)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%CFACE_INDEX,         TO=CUT_FACE_AUX(ICF1)%CFACE_INDEX)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_FACE(ICF1)%SURF_INDEX,          TO=CUT_FACE_AUX(ICF1)%SURF_INDEX)
      CUT_FACE_AUX(ICF1)%NOMICF = MESHES(NM)%CUT_FACE(ICF1)%NOMICF
   ENDDO
   CALL MOVE_ALLOC(FROM=CUT_FACE_AUX,TO=MESHES(NM)%CUT_FACE)
ENDIF

RETURN
END SUBROUTINE CUT_FACE_ARRAY_REALLOC

! ---------------------------- FACE_DEALLOC -------------------------------------

SUBROUTINE FACE_DEALLOC(NM,ICF,DO_BNCF)

INTEGER, INTENT(IN) :: NM,ICF
INTEGER, OPTIONAL, INTENT(IN) :: DO_BNCF

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%XYZVERT)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZVERT)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%CFELEM))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFELEM)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%AREA))    DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%AREA)
IF(.NOT.PRESENT(DO_BNCF)) THEN
   MESHES(NM)%CUT_FACE(ICF)%NFACE = 0
   IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%XYZCEN))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZCEN)
ENDIF

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INXAREA))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INXAREA)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INXSQAREA)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INXSQAREA)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%JNYSQAREA)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%JNYSQAREA)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%KNZSQAREA)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%KNZSQAREA)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%BODTRI))    DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%BODTRI)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%UNKH))      DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%UNKH)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%UNKZ))      DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%UNKZ)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%XCENLOW))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XCENLOW)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%XCENHIGH))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XCENHIGH)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%RHO))       DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%RHO_D))     DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO_D)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%RHO_D_DZDN))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO_D_DZDN)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%H_RHO_D_DZDN)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%H_RHO_D_DZDN)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%ZZ_FACE))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%ZZ_FACE)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%TMP_FACE))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%TMP_FACE)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%VEL)) &
DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%VEL,    MESHES(NM)%CUT_FACE(ICF)%VELS, &
           MESHES(NM)%CUT_FACE(ICF)%DHDX,   MESHES(NM)%CUT_FACE(ICF)%FN,   &
           MESHES(NM)%CUT_FACE(ICF)%VELNP1, MESHES(NM)%CUT_FACE(ICF)%VELINT)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%JDZ)) &
DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%JDZ,MESHES(NM)%CUT_FACE(ICF)%JDH)

IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%CELL_LIST))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CELL_LIST)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_IJK))     DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_IJK)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_COEF))    DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_COEF)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_XYZBF))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_XYZBF)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_NOUT))    DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NOUT)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_INBFC))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_INBFC)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_NPE))     DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NPE)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_XN))      DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_XN)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_CN))      DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_CN)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_FVARS))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_FVARS)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_NOMIND))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NOMIND)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%INT_DCOEF))   DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_DCOEF)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%RHOPVN))      DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHOPVN)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX)) DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX)
IF(ALLOCATED(MESHES(NM)%CUT_FACE(ICF)%SURF_INDEX))  DEALLOCATE(MESHES(NM)%CUT_FACE(ICF)%SURF_INDEX)


RETURN
END SUBROUTINE FACE_DEALLOC

! -------------------------- NEW_FACE_ALLOC -------------------------------------

SUBROUTINE NEW_FACE_ALLOC(NM,ICF,NVERT,NFACE,NVERTFACE)

INTEGER, INTENT(IN) :: NM,ICF,NVERT,NFACE,NVERTFACE


! Allocate and initialize NVERT related fields:
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZVERT(IAXIS:KAXIS,1:NVERT)); MESHES(NM)%CUT_FACE(ICF)%XYZVERT = 0._EB

! Allocate and initialize NFACE, NVERTFACE related fields:
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFELEM(1:NVERTFACE,1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%CFELEM = IBM_UNDEFINED
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%AREA(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%AREA = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XYZCEN(IAXIS:KAXIS,1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%XYZCEN = 0._EB

!Integrals to be used in cut-cell volume and centroid computations.
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INXAREA(1:NFACE));   MESHES(NM)%CUT_FACE(ICF)%INXAREA   = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INXSQAREA(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%INXSQAREA = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%JNYSQAREA(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%JNYSQAREA = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%KNZSQAREA(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%KNZSQAREA = 0._EB

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%BODTRI(1:2,1:NFACE));MESHES(NM)%CUT_FACE(ICF)%BODTRI = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%UNKH(LOW_IND:HIGH_IND,1:NFACE));MESHES(NM)%CUT_FACE(ICF)%UNKH = IBM_UNDEFINED
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%UNKZ(LOW_IND:HIGH_IND,1:NFACE));MESHES(NM)%CUT_FACE(ICF)%UNKZ = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XCENLOW(IAXIS:KAXIS,1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%XCENLOW  = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%XCENHIGH(IAXIS:KAXIS,1:NFACE));MESHES(NM)%CUT_FACE(ICF)%XCENHIGH = 0._EB

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO(LOW_IND:HIGH_IND,1:NFACE));MESHES(NM)%CUT_FACE(ICF)%RHO = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO_D(1:MAX_SPECIES,1:NFACE));    MESHES(NM)%CUT_FACE(ICF)%RHO_D     = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHO_D_DZDN(1:MAX_SPECIES,1:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%H_RHO_D_DZDN(1:MAX_SPECIES,1:NFACE))
MESHES(NM)%CUT_FACE(ICF)%RHO_D_DZDN   = 0._EB
MESHES(NM)%CUT_FACE(ICF)%H_RHO_D_DZDN = 0._EB

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%ZZ_FACE(1:MAX_SPECIES,1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%ZZ_FACE = 0._EB
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%TMP_FACE(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%TMP_FACE = 0._EB

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%VEL(1:NFACE),    MESHES(NM)%CUT_FACE(ICF)%VELS(1:NFACE), &
         MESHES(NM)%CUT_FACE(ICF)%DHDX(1:NFACE),   MESHES(NM)%CUT_FACE(ICF)%FN(1:NFACE),   &
         MESHES(NM)%CUT_FACE(ICF)%VELNP1(1:NFACE), MESHES(NM)%CUT_FACE(ICF)%VELINT(1:NFACE))
MESHES(NM)%CUT_FACE(ICF)%VEL    = 0._EB; MESHES(NM)%CUT_FACE(ICF)%VELS   = 0._EB
MESHES(NM)%CUT_FACE(ICF)%DHDX   = 0._EB; MESHES(NM)%CUT_FACE(ICF)%FN     = 0._EB
MESHES(NM)%CUT_FACE(ICF)%VELNP1 = 0._EB; MESHES(NM)%CUT_FACE(ICF)%VELINT = 0._EB

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%JDZ(1:2,1:2,1:NFACE),MESHES(NM)%CUT_FACE(ICF)%JDH(1:2,1:2,1:NFACE))
MESHES(NM)%CUT_FACE(ICF)%JDZ = IBM_UNDEFINED; MESHES(NM)%CUT_FACE(ICF)%JDH = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CELL_LIST(MAX_DIM+1,LOW_IND:HIGH_IND,1:NFACE))
MESHES(NM)%CUT_FACE(ICF)%CELL_LIST = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_IJK(IAXIS:KAXIS,(NFACE+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_COEF((NFACE+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_XYZBF(IAXIS:KAXIS,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NOUT(IAXIS:KAXIS,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_INBFC(1:3,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NPE(LOW_IND:HIGH_IND,0:KAXIS,1:INT_N_EXT_PTS,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_XN(0:INT_N_EXT_PTS,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_CN(0:INT_N_EXT_PTS,0:NFACE))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_FVARS(1:N_INT_FVARS,(NFACE+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_NOMIND(LOW_IND:HIGH_IND,(NFACE+1)*DELTA_INT))

MESHES(NM)%CUT_FACE(ICF)%INT_IJK   =  IBM_UNDEFINED
MESHES(NM)%CUT_FACE(ICF)%INT_COEF  =  0._EB
IF(MESHES(NM)%CUT_FACE(ICF)%STATUS==IBM_GASPHASE) THEN ! Derivatives of interpolation functions.
   ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%INT_DCOEF(IAXIS:KAXIS,(NFACE+1)*DELTA_INT))
   MESHES(NM)%CUT_FACE(ICF)%INT_DCOEF  =  0._EB
ENDIF
MESHES(NM)%CUT_FACE(ICF)%INT_XYZBF =  0._EB
MESHES(NM)%CUT_FACE(ICF)%INT_NOUT  =  0._EB
MESHES(NM)%CUT_FACE(ICF)%INT_INBFC =  IBM_UNDEFINED
MESHES(NM)%CUT_FACE(ICF)%INT_NPE   =  0
MESHES(NM)%CUT_FACE(ICF)%INT_XN    =  0._EB
MESHES(NM)%CUT_FACE(ICF)%INT_CN    =  0._EB
MESHES(NM)%CUT_FACE(ICF)%INT_FVARS  =  0._EB
MESHES(NM)%CUT_FACE(ICF)%INT_NOMIND=  IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%RHOPVN(-1:0,1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%RHOPVN = 0._EB

IF (MESHES(NM)%CUT_FACE(ICF)%STATUS /= IBM_INBOUNDARY) RETURN

ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX(1:NFACE)); MESHES(NM)%CUT_FACE(ICF)%CFACE_INDEX = IBM_UNDEFINED
ALLOCATE(MESHES(NM)%CUT_FACE(ICF)%SURF_INDEX(1:NFACE));  MESHES(NM)%CUT_FACE(ICF)%SURF_INDEX  = IBM_UNDEFINED

RETURN
END SUBROUTINE NEW_FACE_ALLOC

! -------------------------- TEST_PT_INPOLY -------------------------------------

SUBROUTINE TEST_PT_INPOLY(NP,XY,XY1,PTSFLAG)

INTEGER,  INTENT(IN) :: NP
REAL(EB), INTENT(INOUT) :: XY(IAXIS:JAXIS,1:IBM_MAXVERTS_FACE)
REAL(EB), INTENT(IN) :: XY1(IAXIS:JAXIS)
LOGICAL,  INTENT(OUT) :: PTSFLAG

! Local Variables:
INTEGER :: RCROSS, LCROSS, IP
REAL(EB):: XPT
LOGICAL :: RS, LS

PTSFLAG = .FALSE.
RCROSS  = 0
LCROSS  = 0

! ADD first point location at the end of XY (assumes IBM_MAXVERTS_FACE > NP):
XY(IAXIS:JAXIS,NP+1) = XY(IAXIS:JAXIS,1)

! Shift origin to XY1:
DO IP=1,NP+1
    XY(IAXIS:JAXIS,IP) = XY(IAXIS:JAXIS,IP) - XY1(IAXIS:JAXIS)
enddo

! For each edge test against rays x=0, y=0:
DO IP=1,NP
   ! Check if edges first point is vertex:
   IF ( (ABS(XY(IAXIS,IP)) < GEOMEPS) .AND. &
        (ABS(XY(JAXIS,IP)) < GEOMEPS) ) THEN
      PTSFLAG = .TRUE.
      RETURN
   ENDIF
   ! Check if edge crosses x axis:
   RS = (XY(JAXIS,IP) > 0._EB) .NEQV. (XY(JAXIS,IP+1) > 0._EB)
   LS = (XY(JAXIS,IP) < 0._EB) .NEQV. (XY(JAXIS,IP+1) < 0._EB)

   IF ( RS .OR. LS ) THEN
      ! Intersection:
      XPT = (XY(IAXIS,IP  )*XY(JAXIS,IP+1) - XY(JAXIS,IP  )*XY(IAXIS,IP+1)) / (XY(JAXIS,IP+1)-XY(JAXIS,IP))

      IF (RS .AND. (XPT > 0._EB)) RCROSS = RCROSS + 1
      IF (LS .AND. (XPT < 0._EB)) LCROSS = LCROSS + 1
   ENDIF
ENDDO

IF ( MOD(RCROSS,2) /= MOD(LCROSS,2) ) THEN ! Point on edge
       PTSFLAG = .TRUE.
       RETURN
ENDIF

IF ( MOD(RCROSS,2) == 1) THEN ! Point inside
       PTSFLAG = .TRUE.
       RETURN
ENDIF

RETURN
END SUBROUTINE TEST_PT_INPOLY


! ---------------------- GET_CARTCELL_CUTEDGES ----------------------------------

SUBROUTINE GET_CARTCELL_CUTEDGES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND)

USE TRAN, ONLY : TRANS

INTEGER, INTENT(IN) :: NM
INTEGER, INTENT(IN) :: ISTR, IEND, JSTR, JEND, KSTR, KEND

! Local Variables:
INTEGER :: II2, JJ2, KK2, IG, IWSEDG, SEG(NOD1:NOD2),X1AXIS, X1LO, X1HI, IPLN, LSTR, LEND
REAL(EB):: XYZ1(IAXIS:KAXIS), XYZ2(IAXIS:KAXIS), PLNORMAL(IAXIS:KAXIS), X1PLN, MINX, MAXX
LOGICAL :: DROPSEG, OUTPLANE, SAMEINT
REAL(EB):: DOT1, DOT2, DENOM, PLANEEQ, SVARI, XYZV1(IAXIS:KAXIS), XYZV2(IAXIS:KAXIS), SLEN, STANI(IAXIS:KAXIS)
INTEGER :: NWCROSS, IBCR, IDUM, INOD1, INOD2, NVERT, NEDGE, IEDGE, CEI, NWCROSS_SVAR, X1NOC
REAL(EB):: SVAR1, SVAR2, SVAR12, XPOS, DV(IAXIS:KAXIS)
REAL(EB), ALLOCATABLE, DIMENSION(:) :: SVAR_AUX
INTEGER :: X2AXIS, EDGE_START, COUNT, CEI2, I, J, K, I_NP, IFCELL, ITRI, IG1
REAL(EB):: XP(IAXIS:KAXIS), NP(IAXIS:KAXIS), ADD_XSEG(IAXIS:KAXIS), X1X2(IAXIS:KAXIS), X1O1(IAXIS:KAXIS), X1O2(IAXIS:KAXIS), &
           X1T1_OPNOD, X1T2_OPNOD
LOGICAL :: TWOBOD_EDG, INPL_TEST, ANG_FLG1, ANG_FLG2, ANG_FLG3
INTEGER, PARAMETER :: AXIS(1:6)=(/ IAXIS, IAXIS, JAXIS, JAXIS, KAXIS, KAXIS /)
INTEGER, PARAMETER :: IADD(1:6)=(/    -1,     0,     0,     0,     0,     0 /)
INTEGER, PARAMETER :: JADD(1:6)=(/     0,     0,    -1,     0,     0,     0 /)
INTEGER, PARAMETER :: KADD(1:6)=(/     0,     0,     0,     0,    -1,     0 /)
LOGICAL, ALLOCATABLE, DIMENSION(:) :: SOLID_EDGE
INTEGER, PARAMETER :: ON(1:3)  =(/ 3, 1, 2 /)
INTEGER :: T1, E1, ON1, T2, E2, ON2
REAL(EB) :: TNOW, EDGECUBE(LOW_IND:HIGH_IND,IAXIS:KAXIS)
TYPE(BODINT_CELL_EDGE_TYPE) :: BODINT_CELL_EDGE
LOGICAL :: FOUND_SEG

! REAL(QB) :: DVQ(IAXIS:KAXIS), SLENQ, STANIQ(IAXIS:KAXIS), DENOMQ, PLANEEQQ

! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
INTEGER :: NCUTEDG

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating            CARTCELL_CUTEDGES for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating            CARTCELL_CUTEDGES for mesh :',NM,' ..'
ENDIF

TNOW=CURRENT_TIME()

EDGE_START= MESHES(NM)%N_CUTEDGE_MESH + 1

! BODINT_CELL:
GEOM_LOOP : DO IG=1,N_GEOMETRY

   ! The IG wet surface edges will be used to obtain intersections with grid planes on
   ! increasing svar order.
   ALLOCATE(BODINT_CELL_EDGE%SVAR(IBM_DELTA_NBCROSS))

   IWSEDG_LOOP : DO IWSEDG=1,GEOMETRY(IG)%N_EDGES

      ! Seg Nodes location:
      SEG(NOD1:NOD2) = GEOMETRY(IG)%EDGES(NOD1:NOD2,IWSEDG)

      XYZ1(IAXIS:KAXIS) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD1)-1)+1:MAX_DIM*SEG(NOD1))
      XYZ2(IAXIS:KAXIS) = GEOMETRY(IG)%VERTS(MAX_DIM*(SEG(NOD2)-1)+1:MAX_DIM*SEG(NOD2))

      DO X1AXIS=IAXIS,KAXIS
         EDGECUBE( LOW_IND,X1AXIS) = MIN(XYZ1(X1AXIS),XYZ2(X1AXIS))
         EDGECUBE(HIGH_IND,X1AXIS) = MAX(XYZ1(X1AXIS),XYZ2(X1AXIS))
      ENDDO

      ! Discard if segment is outside of volume of interest:
      IF (EDGECUBE( LOW_IND,IAXIS) > X(IBAR)+REAL(NGUARD,EB)*DX(IBAR)) CYCLE
      IF (EDGECUBE(HIGH_IND,IAXIS) < X(   0)-REAL(NGUARD,EB)*DX(   1)) CYCLE
      IF (EDGECUBE( LOW_IND,JAXIS) > Y(JBAR)+REAL(NGUARD,EB)*DY(JBAR)) CYCLE
      IF (EDGECUBE(HIGH_IND,JAXIS) < Y(   0)-REAL(NGUARD,EB)*DY(   1)) CYCLE
      IF (EDGECUBE( LOW_IND,KAXIS) > Z(KBAR)+REAL(NGUARD,EB)*DZ(KBAR)) CYCLE
      IF (EDGECUBE(HIGH_IND,KAXIS) < Z(   0)-REAL(NGUARD,EB)*DZ(   1)) CYCLE

      ! Test if Segment lays on plane, If so drop, unless SOLID-SOLID with triangles off plane, it was taken care of
      ! previously: This is expensive think of switching to pointer X1FACEP.
      DROPSEG = .FALSE.
      ADD_XSEG= 0._EB
      X1AXIS_LOOP : DO X1AXIS=IAXIS,KAXIS
         SELECT CASE(X1AXIS)
           CASE(IAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 1._EB,  0._EB, 0._EB /)
              ALLOCATE(X1FACE(ISTR:IEND));   X1FACE =  XFACE
              ALLOCATE(DX1FACE(ISTR:IEND)); DX1FACE = DXFACE
              X1LO   = ILO_FACE-CCGUARD; X1HI   = IHI_FACE+CCGUARD
           CASE(JAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 0._EB,  1._EB, 0._EB /)
              ALLOCATE(X1FACE(JSTR:JEND));   X1FACE =  YFACE
              ALLOCATE(DX1FACE(JSTR:JEND)); DX1FACE = DYFACE
              X1LO   = JLO_FACE-CCGUARD; X1HI   = JHI_FACE+CCGUARD
           CASE(KAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 0._EB,  0._EB, 1._EB /)
              ALLOCATE(X1FACE(KSTR:KEND));   X1FACE = ZFACE
              ALLOCATE(DX1FACE(KSTR:KEND)); DX1FACE = DZFACE
              X1LO   = KLO_FACE-CCGUARD; X1HI   = KHI_FACE+CCGUARD
         END SELECT

         ! Optimized for UG:
         X1NOC=TRANS(NM)%NOC(X1AXIS)
         MINX = MIN(XYZ1(X1AXIS),XYZ2(X1AXIS))
         MAXX = MAX(XYZ1(X1AXIS),XYZ2(X1AXIS))

         IF (MAXX-MINX < GEOMEPS) THEN ! SEGMENT ALIGNED WITH PLANE.
            LSTR = X1LO; LEND = X1HI
            IF(X1NOC==0) THEN ! Optimized for Uniform Grid.
               LSTR = MAX(X1LO,  FLOOR((MINX-GEOMEPS-X1FACE(X1LO))/DX1FACE(X1LO)) + X1LO)
               LEND = MIN(X1HI,CEILING((MAXX+GEOMEPS-X1FACE(X1LO))/DX1FACE(X1LO)) + X1LO)
            ENDIF
            X1X2(IAXIS:KAXIS) = XYZ2(IAXIS:KAXIS)-XYZ1(IAXIS:KAXIS); X1X2=X1X2/NORM2(X1X2)
            T1 = GEOMETRY(IG)%EDGE_FACES(2,IWSEDG)
            E1 = GEOMETRY(IG)%EDGE_FACES(3,IWSEDG)
            ON1= GEOMETRY(IG)%FACES(3*(T1-1)+ON(E1))
            X1T1_OPNOD = GEOMETRY(IG)%VERTS(MAX_DIM*(ON1-1)+X1AXIS)
            T2 = GEOMETRY(IG)%EDGE_FACES(4,IWSEDG)
            E2 = GEOMETRY(IG)%EDGE_FACES(5,IWSEDG)
            ON2= GEOMETRY(IG)%FACES(3*(T2-1)+ON(E2))
            X1T2_OPNOD = GEOMETRY(IG)%VERTS(MAX_DIM*(ON2-1)+X1AXIS)

            X1O1(IAXIS:KAXIS) = GEOMETRY(IG)%VERTS(MAX_DIM*(ON1-1)+IAXIS:MAX_DIM*(ON1-1)+KAXIS)-XYZ1(IAXIS:KAXIS)
            X1O2(IAXIS:KAXIS) = GEOMETRY(IG)%VERTS(MAX_DIM*(ON2-1)+IAXIS:MAX_DIM*(ON2-1)+KAXIS)-XYZ1(IAXIS:KAXIS)
            X1O1 = X1O1/NORM2(X1O1); X1O2 = X1O2/NORM2(X1O2)
            DO IPLN=LSTR,LEND
               X1PLN = X1FACE(IPLN)
               INPL_TEST = ABS(X1PLN-MAXX) < GEOMEPS
               SPECIAL_SEG_IF : IF (INPL_TEST) THEN
                  ! Test that nodes on seg triangles not part of SEG are on
                  ! on side of X1PLN, and both normals have component in -X1AXIS dir.
                  IF ( (X1T1_OPNOD-X1PLN)<-GEOMEPS .AND. (X1T2_OPNOD-X1PLN)<-GEOMEPS ) THEN !-X1AXIS
                      ANG_FLG1 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T1)<GEOMEPS .AND. GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T2)<GEOMEPS
                      ANG_FLG2 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T2)>GEOMEPS .AND. X1O2(X1AXIS)<X1O1(X1AXIS)
                      ANG_FLG3 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T1)>GEOMEPS .AND. X1O1(X1AXIS)<X1O2(X1AXIS)
                      IF (ANG_FLG1 .OR. ANG_FLG2 .OR. ANG_FLG3) THEN
                         ADD_XSEG(X1AXIS)=-10._EB*GEOMEPS
                         INPL_TEST =.FALSE.
                      ENDIF
                  ELSEIF ( (X1T1_OPNOD-X1PLN)>GEOMEPS .AND. (X1T2_OPNOD-X1PLN)>GEOMEPS ) THEN !+X1AXIS
                      ANG_FLG1 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T1)>-GEOMEPS .AND. GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T2)>-GEOMEPS
                      ANG_FLG2 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T2)<-GEOMEPS .AND. X1O2(X1AXIS)>X1O1(X1AXIS)
                      ANG_FLG3 = GEOMETRY(IG)%FACES_NORMAL(X1AXIS,T1)<-GEOMEPS .AND. X1O1(X1AXIS)>X1O2(X1AXIS)
                      IF (ANG_FLG1 .OR. ANG_FLG2 .OR. ANG_FLG3) THEN
                         ADD_XSEG(X1AXIS)= 10._EB*GEOMEPS
                         INPL_TEST =.FALSE.
                      ENDIF
                  ENDIF
               ENDIF SPECIAL_SEG_IF
               DROPSEG=( INPL_TEST .OR. ((X1FACE(X1LO)-MAXX)>GEOMEPS) .OR. ((MAXX-X1FACE(X1HI))>GEOMEPS))
               IF (DROPSEG) EXIT
            ENDDO
         ENDIF
         IF (DROPSEG) THEN
            DEALLOCATE(X1FACE,DX1FACE)
            EXIT ! EXIT X1AXIS=IAXIS:KAXIS LOOP
         ENDIF
         DEALLOCATE(X1FACE,DX1FACE)
      ENDDO X1AXIS_LOOP
      IF (DROPSEG) CYCLE

      ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
      ! Edge length and tangent unit vector:
      DV(IAXIS:KAXIS) = XYZ2(IAXIS:KAXIS) - XYZ1(IAXIS:KAXIS)
      SLEN = SQRT( DV(IAXIS)**2._EB + DV(JAXIS)**2._EB + DV(KAXIS)**2._EB ) ! Segment length.
      STANI(IAXIS:KAXIS) = DV(IAXIS:KAXIS) * SLEN**(-1._EB)                 ! Segment tangent versor.
      ! ELSE
      !    ! Edge length and tangent unit vector:
      !    DVQ(IAXIS:KAXIS) = REAL(XYZ2(IAXIS:KAXIS),QB) - REAL(XYZ1(IAXIS:KAXIS),QB)
      !    SLENQ = SQRT( DVQ(IAXIS)**2._QB + DVQ(JAXIS)**2._QB + DVQ(KAXIS)**2._QB ) ! Segment length.
      !    STANIQ(IAXIS:KAXIS) = DVQ(IAXIS:KAXIS) * SLENQ**(-1._QB)                  ! Segment tangent versor.
      !    SLEN = REAL(SLENQ,EB)
      !    STANI(IAXIS:KAXIS)  = REAL(STANIQ(IAXIS:KAXIS),EB)
      ! ENDIF

      ! Add segment ends as intersections:
      BODINT_CELL_EDGE%NWCROSS   =    2 ! Nodes 1,2 of segment are considered intersection.
      BODINT_CELL_EDGE%SVAR(1)   =    0 ! Coordinate along stani of Node 1.
      BODINT_CELL_EDGE%SVAR(2)   = SLEN ! Coordinate along stani of Node 2.


      ! Now find intersections:
      X1AXIS_LOOP2 : DO X1AXIS=IAXIS,KAXIS
         SELECT CASE(X1AXIS)
           CASE(IAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 1._EB,  0._EB, 0._EB /)
              ALLOCATE(X1FACE(ISTR:IEND));   X1FACE =  XFACE
              ALLOCATE(DX1FACE(ISTR:IEND)); DX1FACE = DXFACE
              X1LO   = ILO_FACE-CCGUARD; X1HI   = IHI_FACE+CCGUARD
           CASE(JAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 0._EB,  1._EB, 0._EB /)
              ALLOCATE(X1FACE(JSTR:JEND));   X1FACE =  YFACE
              ALLOCATE(DX1FACE(JSTR:JEND)); DX1FACE = DYFACE
              X1LO   = JLO_FACE-CCGUARD; X1HI   = JHI_FACE+CCGUARD
           CASE(KAXIS)
              PLNORMAL(IAXIS:KAXIS) = (/ 0._EB,  0._EB, 1._EB /)
              ALLOCATE(X1FACE(KSTR:KEND));   X1FACE = ZFACE
              ALLOCATE(DX1FACE(KSTR:KEND)); DX1FACE = DZFACE
              X1LO   = KLO_FACE-CCGUARD; X1HI   = KHI_FACE+CCGUARD
         END SELECT

         ! Optimized for UG:
         X1NOC=TRANS(NM)%NOC(X1AXIS)
         MINX = MIN(XYZ1(X1AXIS),XYZ2(X1AXIS))
         MAXX = MAX(XYZ1(X1AXIS),XYZ2(X1AXIS))
         LSTR = X1LO; LEND = X1HI
         IF(X1NOC==0) THEN ! Optimized for Uniform Grid.
            LSTR = MAX(X1LO,  FLOOR((MINX-GEOMEPS-X1FACE(X1LO))/DX1FACE(X1LO)) + X1LO)
            LEND = MIN(X1HI,CEILING((MAXX+GEOMEPS-X1FACE(X1LO))/DX1FACE(X1LO)) + X1LO)
         ENDIF

         DO IPLN=LSTR,LEND
            X1PLN = X1FACE(IPLN);
            OUTPLANE = ((X1PLN-MAXX) > GEOMEPS) .OR. ((MINX-X1PLN) > GEOMEPS)
            IF (OUTPLANE) CYCLE ! Make sure to drop jstr, jend if out of segment length.

            ! Drop intersections in segment nodes:
            ! Compute: dot(plnormal, xyzv - xypl):
            DOT1 = XYZ1(X1AXIS) - X1PLN
            DOT2 = XYZ2(X1AXIS) - X1PLN
            IF (ABS(DOT1) <= GEOMEPS) CYCLE
            IF (ABS(DOT2) <= GEOMEPS) CYCLE


            ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
            ! Now regular case: Find svar and insert in BODINT_CELL%SVAR(:,IWSEDG):
            DENOM  = STANI(X1AXIS) ! dot(stani,plnormal)
            PLANEEQ= DOT1          ! dot(xyz1(IAXIS:KAXIS),plnormal) - x1pln
            SVARI  = - PLANEEQ / DENOM
            ! ELSE
            !    DENOMQ   = STANIQ(X1AXIS) ! dot(stani,plnormal)
            !    PLANEEQQ = REAL(DOT1,QB)  ! dot(xyz1(IAXIS:KAXIS),plnormal) - x1pln
            !    SVARI    = REAL(-PLANEEQQ/DENOMQ,EB)
            ! ENDIF


            ! Insertion sort, discard repeated intersections:
            NWCROSS = BODINT_CELL_EDGE%NWCROSS + 1
            NWCROSS_SVAR = SIZE(BODINT_CELL_EDGE%SVAR,DIM=1)
            IF (NWCROSS > NWCROSS_SVAR) THEN
               ALLOCATE(SVAR_AUX(NWCROSS_SVAR+IBM_DELTA_NBCROSS)); SVAR_AUX = -1._EB
               SVAR_AUX(1:NWCROSS-1) = BODINT_CELL_EDGE%SVAR(1:NWCROSS-1)
               CALL MOVE_ALLOC(FROM=SVAR_AUX,TO=BODINT_CELL_EDGE%SVAR)
            ENDIF
            BODINT_CELL_EDGE%SVAR(NWCROSS) = 1._EB / GEOMEPS
            SAMEINT = .FALSE.
            DO IBCR=1,NWCROSS
               IF (ABS(SVARI - BODINT_CELL_EDGE%SVAR(IBCR)) < GEOMEPS) THEN
                  SAMEINT = .TRUE.
                  EXIT
               ENDIF
               IF ( SVARI  < BODINT_CELL_EDGE%SVAR(IBCR) ) EXIT
            ENDDO
            IF (SAMEINT) CYCLE

            ! Here copy from the back (updated nbcross) to the ibcr location:
            DO IDUM = NWCROSS,IBCR+1,-1
               BODINT_CELL_EDGE%SVAR(IDUM) = BODINT_CELL_EDGE%SVAR(IDUM-1)
            ENDDO
            BODINT_CELL_EDGE%SVAR(IBCR) =   SVARI
            BODINT_CELL_EDGE%NWCROSS    = NWCROSS

         ENDDO
         DEALLOCATE(X1FACE,DX1FACE)
      ENDDO X1AXIS_LOOP2

      ! 3. The increasing svar intersections are used to define the INBOUNDCC type
      ! cut-edges and Cartesian Cells containing them. Add to CUT_EDGE, define the
      ! CUT_EDGE entry in CCVAR(i,j,k,IBM_IDCE):
      DO IEDGE=1,BODINT_CELL_EDGE%NWCROSS-1

         ! Location along Segment:
         SVAR1 = BODINT_CELL_EDGE%SVAR(IEDGE  )
         SVAR2 = BODINT_CELL_EDGE%SVAR(IEDGE+1)

         ! Location of midpoint of cut-edge:
         SVAR12 = 0.5_EB * (SVAR1+SVAR2)

         ! Define Cartesian cell this cut-edge belongs:
         ! Optimized for UG version:
         XPOS = XYZ1(IAXIS) + SVAR12*STANI(IAXIS) + ADD_XSEG(IAXIS)
         IF(TRANS(NM)%NOC(IAXIS)==0)THEN
            II2  = FLOOR( (XPOS-XFACE(ILO_FACE))/DXFACE(ILO_FACE) ) + ILO_CELL
            ! Discard cut-edges on faces laying on x2hi and x3hi.
            IF ( (II2 < ILO_CELL-CCGUARD) .OR. (II2 > IHI_CELL+CCGUARD) ) CYCLE
         ELSE
            FOUND_SEG=.FALSE.
            DO II2=ILO_CELL-CCGUARD,IHI_CELL+CCGUARD
               IF((XPOS-XFACE(II2-1)) >= 0._EB .AND. (XFACE(II2)-XPOS) > 0._EB) THEN
                  FOUND_SEG=.TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF(.NOT.FOUND_SEG) CYCLE
         ENDIF

         XPOS = XYZ1(JAXIS) + SVAR12*STANI(JAXIS) + ADD_XSEG(JAXIS)
         IF(TRANS(NM)%NOC(JAXIS)==0)THEN
            JJ2  = FLOOR( (XPOS-YFACE(JLO_FACE))/DYFACE(JLO_FACE) ) + JLO_CELL
            IF ( (JJ2 < JLO_CELL-CCGUARD) .OR. (JJ2 > JHI_CELL+CCGUARD) ) CYCLE
         ELSE
            FOUND_SEG=.FALSE.
            DO JJ2=JLO_CELL-CCGUARD,JHI_CELL+CCGUARD
               IF((XPOS-YFACE(JJ2-1)) >= 0._EB .AND. (YFACE(JJ2)-XPOS) > 0._EB) THEN
                  FOUND_SEG=.TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF(.NOT.FOUND_SEG) CYCLE
         ENDIF

         XPOS = XYZ1(KAXIS) + SVAR12*STANI(KAXIS) + ADD_XSEG(KAXIS)
         IF(TRANS(NM)%NOC(KAXIS)==0)THEN
            KK2  = FLOOR( (XPOS-ZFACE(KLO_FACE))/DZFACE(KLO_FACE) ) + KLO_CELL
            IF ( (KK2 < KLO_CELL-CCGUARD) .OR. (KK2 > KHI_CELL+CCGUARD) ) CYCLE
         ELSE
            FOUND_SEG=.FALSE.
            DO KK2=KLO_CELL-CCGUARD,KHI_CELL+CCGUARD
               IF((XPOS-ZFACE(KK2-1)) >= 0._EB .AND. (ZFACE(KK2)-XPOS) > 0._EB) THEN
                  FOUND_SEG=.TRUE.
                  EXIT
               ENDIF
            ENDDO
            IF(.NOT.FOUND_SEG) CYCLE
         ENDIF

         ! CCVAR edge number:
         IF ( MESHES(NM)%CCVAR(II2,JJ2,KK2,IBM_IDCE) > 0 ) THEN ! There is already
                                                                ! an entry in CUT_EDGE.
            CEI = MESHES(NM)%CCVAR(II2,JJ2,KK2,IBM_IDCE)
         ELSE ! We need a new entry in CUT_EDGE
            CEI = MESHES(NM)%N_CUTEDGE_MESH + 1
            MESHES(NM)%N_CUTEDGE_MESH           = CEI
            MESHES(NM)%CCVAR(II2,JJ2,KK2,IBM_IDCE) = CEI
            CALL CUT_EDGE_ARRAY_REALLOC(NM,CEI)
            MESHES(NM)%CUT_EDGE(CEI)%NVERT  = 0
            CALL NEW_EDGE_ALLOC(NM,CEI,IBM_ALLOC_DVERT,IBM_ALLOC_DELEM)
            MESHES(NM)%CUT_EDGE(CEI)%NEDGE  = 0
            MESHES(NM)%CUT_EDGE(CEI)%IJK(1:MAX_DIM+2) = (/ II2, JJ2, KK2, 0, IBM_GS /)
            MESHES(NM)%CUT_EDGE(CEI)%STATUS = IBM_INBOUNDCC
         ENDIF

         ! Add vertices, non repeated vertex entries at this point.
         NVERT = MESHES(NM)%CUT_EDGE(CEI)%NVERT
         ! Define vertices for this segment:
         !               xv1                 yv1                 zv1
         ! IF(.NOT.DO_QUAD_PRECISION_CUTCELLS) THEN
         XYZV1(IAXIS:KAXIS) = (/ XYZ1(IAXIS)+SVAR1*STANI(IAXIS), &
                                 XYZ1(JAXIS)+SVAR1*STANI(JAXIS), &
                                 XYZ1(KAXIS)+SVAR1*STANI(KAXIS) /)
         CALL INSERT_FACE_VERT(XYZV1,NM,CEI,NVERT,INOD1)
         !               xv2                 yv2                 zv2
         XYZV2(IAXIS:KAXIS) = (/ XYZ1(IAXIS)+SVAR2*STANI(IAXIS), &
                                 XYZ1(JAXIS)+SVAR2*STANI(JAXIS), &
                                 XYZ1(KAXIS)+SVAR2*STANI(KAXIS) /)
         CALL INSERT_FACE_VERT(XYZV2,NM,CEI,NVERT,INOD2)
         ! ELSE
         !     XYZV1(IAXIS:KAXIS) = REAL((/ REAL(XYZ1(IAXIS),QB)+REAL(SVAR1,QB)*STANIQ(IAXIS), &
         !                                  REAL(XYZ1(JAXIS),QB)+REAL(SVAR1,QB)*STANIQ(JAXIS), &
         !                                  REAL(XYZ1(KAXIS),QB)+REAL(SVAR1,QB)*STANIQ(KAXIS) /),EB)
         !     CALL INSERT_FACE_VERT(XYZV1,NM,CEI,NVERT,INOD1)
         !     !               xv2                 yv2                 zv2
         !     XYZV2(IAXIS:KAXIS) = REAL((/ REAL(XYZ1(IAXIS),QB)+REAL(SVAR2,QB)*STANIQ(IAXIS), &
         !                                  REAL(XYZ1(JAXIS),QB)+REAL(SVAR2,QB)*STANIQ(JAXIS), &
         !                                  REAL(XYZ1(KAXIS),QB)+REAL(SVAR2,QB)*STANIQ(KAXIS) /),EB)
         !     CALL INSERT_FACE_VERT(XYZV2,NM,CEI,NVERT,INOD2)
         ! ENDIF

         NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE + 1
         CALL REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE)
         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE) = (/ INOD1, INOD2 /)

         MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,NEDGE) = (/ INOD1, INOD2 /)
         MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,NEDGE) = &
                                         (/ GEOMETRY(IG)%EDGE_FACES(1,IWSEDG), &
                                            GEOMETRY(IG)%EDGE_FACES(2,IWSEDG), &
                                            GEOMETRY(IG)%EDGE_FACES(4,IWSEDG), IG /)
         MESHES(NM)%CUT_EDGE(CEI)%NVERT = NVERT
         MESHES(NM)%CUT_EDGE(CEI)%NEDGE = NEDGE
      ENDDO

   ENDDO IWSEDG_LOOP

   ! Deallocate BODINT_CELL_EDGE:
   DEALLOCATE(BODINT_CELL_EDGE%SVAR)

ENDDO GEOM_LOOP

! Now filter out IBM_INBOUNDCC cut-edges that lay within the SOLID:
DO CEI=EDGE_START,MESHES(NM)%N_CUTEDGE_MESH
   ! Here we have cut-edges on the cell belonging to two or more bodies:
   I = MESHES(NM)%CUT_EDGE(CEI)%IJK(IAXIS)
   J = MESHES(NM)%CUT_EDGE(CEI)%IJK(JAXIS)
   K = MESHES(NM)%CUT_EDGE(CEI)%IJK(KAXIS)

   ! First cut-edges in the cell:
   NEDGE     =MESHES(NM)%CUT_EDGE(CEI)%NEDGE
   TWOBOD_EDG=.FALSE.
   IF (NEDGE > 0) IG1 = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,1)
   DO IEDGE=2,NEDGE
       IF (MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,IEDGE) /= IG1) THEN
           TWOBOD_EDG =.TRUE.
           EXIT
       ENDIF
   ENDDO
   ! Low-High x,y,z face Edges:
   IF(.NOT.TWOBOD_EDG) THEN
      IFCELL_DO : DO IFCELL=1,6
         CEI2 = MESHES(NM)%FCVAR(I+IADD(IFCELL),J+JADD(IFCELL),K+KADD(IFCELL),IBM_IDCE,AXIS(IFCELL))
         IF (CEI2 < 1) CYCLE
         DO IEDGE=1,MESHES(NM)%CUT_EDGE(CEI2)%NEDGE
            IF (MESHES(NM)%CUT_EDGE(CEI2)%INDSEG(4,IEDGE) /= IG1) THEN
               TWOBOD_EDG =.TRUE.
               EXIT IFCELL_DO
            ENDIF
         ENDDO
      ENDDO IFCELL_DO
   ENDIF
   IF(.NOT.TWOBOD_EDG) CYCLE

   ! Here we have cut-edges on the cell belonging to two or more bodies:
   ! First discard if CELLRT=true, we won't be using cut-edges:
   IF (CELLRT(I,J,K)) CYCLE

   ! Now figure out which edges are inside other SOLIDS:
   ! Ray tracing in either X, Y or Z directions:
   ! 1. For the segment center point P provide:
   !    a. Its coordinates P={xp,yp,zp}.
   !    b. Direction X1 for Ray shooting (IAXIS,JAXIS,KAXIS).
   ALLOCATE(SOLID_EDGE(1:NEDGE)); SOLID_EDGE(1:NEDGE)=.FALSE.
   DO IEDGE=1,NEDGE
      ! No body associated with segment. Might not be needed.
      IG = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,IEDGE)
      IF ( IG < 1 ) CYCLE
      SEG(NOD1:NOD2)  = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)
      XP(IAXIS:KAXIS) = 0.5_EB*(MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1)) + &
                                MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2)))
      ! Direction NP:
      NP(IAXIS:KAXIS) = 0._EB
      DO I_NP=1,MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1,IEDGE)
          ITRI = MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1+I_NP,IEDGE)
          NP(IAXIS:KAXIS) = NP(IAXIS:KAXIS) + GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,ITRI)
      ENDDO
      X2AXIS = MAXLOC(ABS(NP(IAXIS:KAXIS)),DIM=1)
      CALL GET_IS_SOLID_3D(X2AXIS,XP,I,J,K,SOLID_EDGE(IEDGE))
   ENDDO

   ! Now drop SEGS with SOLID_EDGE(IEDGE)=true:
   COUNT = 0
   DO IEDGE=1,NEDGE
       IF (SOLID_EDGE(IEDGE)) CYCLE
       COUNT=COUNT+1
       MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,COUNT) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)
       MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,COUNT) = &
       MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,IEDGE)
   ENDDO

   MESHES(NM)%CUT_EDGE(CEI)%NEDGE                                          = COUNT
   MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,COUNT+1:NEDGE)                = IBM_UNDEFINED
   MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,COUNT+1:NEDGE) = IBM_UNDEFINED
   DEALLOCATE(SOLID_EDGE)
ENDDO

T_CC_USED(GET_CARTCELL_CUTEDGES_TIME_INDEX) = T_CC_USED(GET_CARTCELL_CUTEDGES_TIME_INDEX ) + CURRENT_TIME() - TNOW

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   NCUTEDG = 0
   DO CEI=1,MESHES(NM)%N_CUTEDGE_MESH
      NCUTEDG = NCUTEDG + MESHES(NM)%CUT_EDGE(CEI)%NEDGE
   ENDDO
   WRITE(LU_SETCC,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-edges in mesh : ',NCUTEDG,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-edges in mesh : ',NCUTEDG,'. '
   ENDIF
ENDIF

RETURN
END SUBROUTINE GET_CARTCELL_CUTEDGES

! ------------------------- GET_IS_SOLID_3D -------------------------------------

SUBROUTINE GET_IS_SOLID_3D(X2AXIS,XP,I,J,K,IS_SOLID)

INTEGER,  INTENT(IN) :: X2AXIS,I,J,K
REAL(EB), INTENT(IN) :: XP(IAXIS:KAXIS)
LOGICAL,  INTENT(OUT):: IS_SOLID

! Logical Variables:
INTEGER :: IJK(IAXIS:KAXIS)
REAL(EB):: NVEC(IAXIS:JAXIS)=(/ 1._EB, 0._EB /), XY(IAXIS:JAXIS), PLNORMAL(IAXIS:KAXIS), X1PLN, X3RAY
INTEGER :: X1AXIS, X3AXIS, X2LO, X2HI, X3LO, X3HI
LOGICAL :: TRI_ONPLANE_ONLY =.FALSE., RAYTRACE_X2_ONLY =.TRUE.

IJK(IAXIS:KAXIS) = (/ I, J, K /)

SELECT CASE(X2AXIS)
   CASE(JAXIS)
      X1AXIS = IAXIS; PLNORMAL(IAXIS:KAXIS) = (/ 1._EB, 0._EB, 0._EB /)
      ! x2, x3 axes parameters:
                      X2LO = JLO_FACE-CCGUARD; X2HI = JHI_FACE+CCGUARD
      X3AXIS = KAXIS; X3LO = KLO_FACE-CCGUARD; X3HI = KHI_FACE+CCGUARD
      X1PLN = XP(X1AXIS); X3RAY = XP(X3AXIS)
      ! Get intersection of body on plane defined by X1PLN, normal to X1AXIS:
      X3LO_RT = X3RAY - 10._EB*GEOMEPS; X3HI_RT = X3RAY + 10._EB*GEOMEPS
      CALL GET_BODINT_PLANE(X1AXIS,X1PLN,IJK(X1AXIS),PLNORMAL,X2AXIS,X3AXIS, &
                            X2LO,X2HI,X3LO,X3HI,YFACE,ZFACE,JLO_CELL,JHI_CELL,&
                            KLO_CELL,KHI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE2)
   CASE(KAXIS)
      X1AXIS = JAXIS; PLNORMAL(IAXIS:KAXIS) = (/ 0._EB, 1._EB, 0._EB /)
      ! x2, x3 axes parameters:
                      X2LO = KLO_FACE-CCGUARD; X2HI = KHI_FACE+CCGUARD
      X3AXIS = IAXIS; X3LO = ILO_FACE-CCGUARD; X3HI = IHI_FACE+CCGUARD
      X1PLN = XP(X1AXIS); X3RAY = XP(X3AXIS)
      ! Get intersection of body on plane defined by X1PLN, normal to X1AXIS:
      X3LO_RT = X3RAY - 10._EB*GEOMEPS; X3HI_RT = X3RAY + 10._EB*GEOMEPS
      CALL GET_BODINT_PLANE(X1AXIS,X1PLN,IJK(X1AXIS),PLNORMAL,X2AXIS,X3AXIS, &
                            X2LO,X2HI,X3LO,X3HI,ZFACE,XFACE,KLO_CELL,KHI_CELL,&
                            ILO_CELL,IHI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE2)
    CASE(IAXIS)
      X1AXIS = KAXIS; PLNORMAL(IAXIS:KAXIS) = (/ 0._EB, 0._EB, 1._EB /)
      ! x2, x3 axes parameters:
                      X2LO = ILO_FACE-CCGUARD; X2HI = IHI_FACE+CCGUARD
      X3AXIS = JAXIS; X3LO = JLO_FACE-CCGUARD; X3HI = JHI_FACE+CCGUARD
      X1PLN = XP(X1AXIS); X3RAY = XP(X3AXIS)
      ! Get intersection of body on plane defined by X1PLN, normal to X1AXIS:
      X3LO_RT = X3RAY - 10._EB*GEOMEPS; X3HI_RT = X3RAY + 10._EB*GEOMEPS
      CALL GET_BODINT_PLANE(X1AXIS,X1PLN,IJK(X1AXIS),PLNORMAL,X2AXIS,X3AXIS, &
                            X2LO,X2HI,X3LO,X3HI,XFACE,YFACE,ILO_CELL,IHI_CELL,&
                            JLO_CELL,JHI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE2)
END SELECT

IF (BODINT_PLANE2%NSEGS == 0) THEN
   IS_SOLID =.FALSE.
   RETURN
ENDIF

XY(IAXIS:JAXIS) = (/ XP(X2AXIS), X3RAY /)
CALL GET_IS_SOLID_PT(BODINT_PLANE2,X1AXIS,X2AXIS,X3AXIS,XY,NVEC,X1PLN,IS_SOLID)

RETURN
END SUBROUTINE GET_IS_SOLID_3D


! ---------------------- GET_CARTCELL_CUTFACES ----------------------------------

SUBROUTINE GET_CARTCELL_CUTFACES(NM,ISTR,IEND,JSTR,JEND,KSTR,KEND,BNDINT_FLAG)

USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

INTEGER, INTENT(IN) :: NM
INTEGER, INTENT(IN) :: ISTR, IEND, JSTR, JEND, KSTR, KEND
LOGICAL, INTENT(IN) :: BNDINT_FLAG

 ! Local Variables:
INTEGER :: ILO,IHI,JLO,JHI,KLO,KHI
INTEGER :: I,J,K, JJ, KK
INTEGER, DIMENSION(LOW_IND:HIGH_IND,IAXIS:KAXIS) :: FSID_XYZ, CEIB_XYZ
LOGICAL :: OUTCELL1
INTEGER :: X1AXIS, X2AXIS, X3AXIS
INTEGER :: XIAXIS, XJAXIS, XKAXIS
INTEGER :: X2LO, X2HI, X3LO, X3HI
INTEGER :: X2LO_CELL, X2HI_CELL, X3LO_CELL, X3HI_CELL
REAL(EB), DIMENSION(MAX_DIM) :: PLNORMAL
INTEGER,  DIMENSION(MAX_DIM) :: IJK
REAL(EB) :: X1PLN
LOGICAL  :: TRI_ONPLANE_ONLY, RAYTRACE_X2_ONLY
INTEGER  :: NVERT, NEDGE, NFACE, NSEG, NCF, FNVERT, FNEDGE, CEI, NSEG_FACE
REAL(EB) :: FVERT(IAXIS:JAXIS,NOD1:NOD4)
LOGICAL  :: INB_FLG
INTEGER  :: CEELEM(NOD1:NOD2,1:IBM_MAXCEELEM_FACE)
INTEGER  :: INDSEG(IBM_MAX_WSTRIANG_SEG+3,IBM_MAXCEELEM_FACE)
REAL(EB) :: XYVERT(IAXIS:JAXIS,1:IBM_MAXVERTS_FACE)
INTEGER  :: TRIS(NOD1:NOD3), ITRI
REAL(EB) :: XYEL(IAXIS:JAXIS,NOD1:NOD3), VAL, DUMMY(IAXIS:JAXIS)
REAL(EB) :: A_COEF, B_COEF, C_COEF, D_COEF, DENOM
INTEGER  :: INDXI(IAXIS:KAXIS), INDIF, INDJF, INDKF
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE) :: XYZVERT, XYZVERTF

INTEGER, ALLOCATABLE, DIMENSION(:,:) :: SEG_CELL,SEG_CELL_AUX
INTEGER, SAVE :: SIZE_CEELEM_SEG_CELL

INTEGER,  DIMENSION(NOD1:NOD2,1:IBM_MAXCEELEM_FACE) :: SEG_FACE, SEG_FACE2
INTEGER,  DIMENSION(1:2,1:IBM_MAXCFELEM_FACE) ::  BOD_TRI
LOGICAL  :: SEG_FLAG(1:IBM_MAXCEELEM_FACE), INLIST, EQUAL1, EQUAL2, RH_ORIENTED
INTEGER  :: COUNTR, CTR, CTSTART, FAXIS, ILH, IEDGE, SEG(NOD1:NOD2), STRI(1:IBM_MAX_WSTRIANG_SEG+2), ISEG
INTEGER  :: INOD1, INOD2, VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2), IDUM, IEQ1, IEQ2, NBODTRI
REAL(EB), DIMENSION(IAXIS:KAXIS) :: XYZ, NORMTRI, XCENI, XCEN, X1, X2, XC1, XC2, X12, VC1, V12, CROSSV
INTEGER, PARAMETER :: INDVERTBOD(1:3)  = (/ 1, 2, 6 /)
INTEGER, PARAMETER :: INDVERTBOD2(1:3) = (/ 2, 1, 6 /)
INTEGER  :: NCUTFACE, ICF, NSEG_LEFT, ISEG_FACE, IBOD, NP, IX, IBODTRI, NVSIZE
REAL(EB) :: AREAI, AREA, INXAREA, INT2
REAL(EB), DIMENSION(IAXIS:KAXIS) :: ACEN, SQAREA

LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:)  :: IJK_COUNTED
LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:,:):: IJK_COUNTF

INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CFELEM

INTEGER :: NVERT_AUX, NEDGE_OLD, IVERT, COUNT, IEOLD, INOD, NPOLY
INTEGER :: NSG_POLY(1:MAX_CELL_POLYLINES), ILO_POLY(1:MAX_CELL_POLYLINES)
LOGICAL :: FOUND
REAL(EB):: XYZV(IAXIS:KAXIS), NXP(IAXIS:KAXIS), XP(IAXIS:KAXIS), D12(IAXIS:KAXIS), D23(IAXIS:KAXIS), NNORM

INTEGER :: I_NP, IG, XAXIS, NSPCELL_LIST
LOGICAL, ALLOCATABLE, DIMENSION(:)  :: SOLID_EDGE
INTEGER, ALLOCATABLE, DIMENSION(:)  :: VERT_SEGS, SEG_POS
INTEGER, ALLOCATABLE, DIMENSION(:,:):: SPCELL_LIST
LOGICAL :: CYCLE_CELL, IFLG
REAL(EB) :: XMIN(IAXIS:KAXIS),XMAX(IAXIS:KAXIS)

REAL(EB) :: TNOW

! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
INTEGER :: NCUTFCE

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   IF (BNDINT_FLAG) THEN ! Boundary and internal cartface cut-faces:
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating internal   CARTCELL_CUTFACES for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating internal   CARTCELL_CUTFACES for mesh :',NM,' ..'
   ELSE
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating ghost-cell CARTCELL_CUTFACES for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating ghost-cell CARTCELL_CUTFACES for mesh :',NM,' ..'
   ENDIF
ENDIF

TNOW=CURRENT_TIME()

SIZE_CEELEM_SEG_CELL = DELTA_EDGE
ALLOCATE(SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL),SEG_POS(1:SIZE_CEELEM_SEG_CELL))

! Define which cells are cut-cell, and which are solid:
IF (BNDINT_FLAG) THEN
   ALLOCATE( MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,DELTA_CELL) ); MESHES(NM)%SPCELL_LIST = IBM_UNDEFINED
   ALLOCATE( IJK_COUNTED(ISTR:IEND,JSTR:JEND,KSTR:KEND) ); IJK_COUNTED=.FALSE.
   ALLOCATE( IJK_COUNTF(ISTR:IEND,JSTR:JEND,KSTR:KEND,MAX_DIM) ); IJK_COUNTF=.FALSE.
   ILO = ILO_CELL; IHI = IHI_CELL
   JLO = JLO_CELL; JHI = JHI_CELL
   KLO = KLO_CELL; KHI = KHI_CELL
ELSE
   ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
   JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
   KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD
ENDIF

! Loop on Cartesian cells, define cut cells and solid cells ISSO:
DO K=KLO,KHI
   DO J=JLO,JHI
      DO I=ILO,IHI

         IF(IJK_COUNTED(I,J,K)) CYCLE

         ! Face type of bounding Cartesian faces:
         FSID_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_FGSC,JAXIS)
         FSID_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_FGSC,JAXIS)
         FSID_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_FGSC,KAXIS)
         FSID_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_FGSC,KAXIS)

         ! For this cell check if no Cartesian boundary faces are IBM_CUTCFE:
         ! If outcell1 is true -> All regular faces for this face:
         OUTCELL1 = (FSID_XYZ(LOW_IND ,IAXIS) /= IBM_CUTCFE) .AND. &
                    (FSID_XYZ(HIGH_IND,IAXIS) /= IBM_CUTCFE) .AND. &
                    (FSID_XYZ(LOW_IND ,JAXIS) /= IBM_CUTCFE) .AND. &
                    (FSID_XYZ(HIGH_IND,JAXIS) /= IBM_CUTCFE) .AND. &
                    (FSID_XYZ(LOW_IND ,KAXIS) /= IBM_CUTCFE) .AND. &
                    (FSID_XYZ(HIGH_IND,KAXIS) /= IBM_CUTCFE)

         ! Drop if outcell1 & outcell2
         IF (OUTCELL1) THEN
            IF ( (FSID_XYZ(LOW_IND ,IAXIS) == IBM_SOLID) .AND. &
                 (FSID_XYZ(HIGH_IND,IAXIS) == IBM_SOLID) .AND. &
                 (FSID_XYZ(LOW_IND ,JAXIS) == IBM_SOLID) .AND. &
                 (FSID_XYZ(HIGH_IND,JAXIS) == IBM_SOLID) .AND. &
                 (FSID_XYZ(LOW_IND ,KAXIS) == IBM_SOLID) .AND. &
                 (FSID_XYZ(HIGH_IND,KAXIS) == IBM_SOLID) ) THEN
               MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) = IBM_SOLID
            ENDIF
            CYCLE
         ENDIF

         MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) = IBM_CUTCFE

      ENDDO
   ENDDO
ENDDO


! First add edges stemming from triangles laying on gridline planes:
! Dump triangle aligned segments as cut-cell cut-edges, on face cases:
! BNDINT_COND : IF (BNDINT_FLAG) THEN
   ! Do Loop for different x1 planes:
   X1AXIS_LOOP : DO X1AXIS=IAXIS,KAXIS

      SELECT CASE(X1AXIS)
       CASE(IAXIS)

          PLNORMAL = (/ 1._EB, 0._EB, 0._EB/)
          ILO = ILO_FACE-CCGUARD;  IHI = IHI_FACE+CCGUARD
          JLO = JLO_FACE;  JHI = JLO_FACE
          KLO = KLO_FACE;  KHI = KLO_FACE

          ! x2, x3 axes parameters:
          X2AXIS = JAXIS; X2LO = JLO_FACE-CCGUARD; X2HI = JHI_FACE+CCGUARD
          X3AXIS = KAXIS; X3LO = KLO_FACE-CCGUARD; X3HI = KHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = IAXIS; XJAXIS = JAXIS; XKAXIS = KAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(ISTR:IEND),DX1FACE(ISTR:IEND))
          X1FACE = XFACE; DX1FACE = DXFACE
          ALLOCATE(X2FACE(JSTR:JEND),DX2FACE(JSTR:JEND))
          X2FACE = YFACE; DX2FACE = DYFACE
          ALLOCATE(X3FACE(KSTR:KEND),DX3FACE(KSTR:KEND))
          X3FACE = ZFACE; DX3FACE = DZFACE

          ! x2 cell center parameters:
          X2LO_CELL = JLO_CELL-CCGUARD; X2HI_CELL = JHI_CELL+CCGUARD
          ALLOCATE(X2CELL(JSTR:JEND),DX2CELL(JSTR:JEND))
          X2CELL = YCELL; DX2CELL = DYCELL

          ! x3 cell center parameters:
          X3LO_CELL = KLO_CELL-CCGUARD; X3HI_CELL = KHI_CELL+CCGUARD
          ALLOCATE(X3CELL(KSTR:KEND),DX3CELL(KSTR:KEND))
          X3CELL = ZCELL; DX3CELL = DZCELL

       CASE(JAXIS)

          PLNORMAL = (/ 0._EB, 1._EB, 0._EB/)
          ILO = ILO_FACE;  IHI = ILO_FACE
          JLO = JLO_FACE-CCGUARD;  JHI = JHI_FACE+CCGUARD
          KLO = KLO_FACE;  KHI = KLO_FACE

          ! x2, x3 axes parameters:
          X2AXIS = KAXIS; X2LO = KLO_FACE-CCGUARD; X2HI = KHI_FACE+CCGUARD
          X3AXIS = IAXIS; X3LO = ILO_FACE-CCGUARD; X3HI = IHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = KAXIS; XJAXIS = IAXIS; XKAXIS = JAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(JSTR:JEND),DX1FACE(JSTR:JEND))
          X1FACE = YFACE; DX1FACE = DYFACE
          ALLOCATE(X2FACE(KSTR:KEND),DX2FACE(KSTR:KEND))
          X2FACE = ZFACE; DX2FACE = DZFACE
          ALLOCATE(X3FACE(ISTR:IEND),DX3FACE(ISTR:IEND))
          X3FACE = XFACE; DX3FACE = DXFACE

          ! x2 cell center parameters:
          X2LO_CELL = KLO_CELL-CCGUARD; X2HI_CELL = KHI_CELL+CCGUARD
          ALLOCATE(X2CELL(KSTR:KEND),DX2CELL(KSTR:KEND))
          X2CELL = ZCELL; DX2CELL = DZCELL

          ! x3 cell center parameters:
          X3LO_CELL = ILO_CELL-CCGUARD; X3HI_CELL = IHI_CELL+CCGUARD
          ALLOCATE(X3CELL(ISTR:IEND),DX3CELL(ISTR:IEND))
          X3CELL = XCELL; DX3CELL = DXCELL

       CASE(KAXIS)

          PLNORMAL = (/ 0._EB, 0._EB, 1._EB/)
          ILO = ILO_FACE;  IHI = ILO_FACE
          JLO = JLO_FACE;  JHI = JLO_FACE
          KLO = KLO_FACE-CCGUARD;  KHI = KHI_FACE+CCGUARD

          ! x2, x3 axes parameters:
          X2AXIS = IAXIS; X2LO = ILO_FACE-CCGUARD; X2HI = IHI_FACE+CCGUARD
          X3AXIS = JAXIS; X3LO = JLO_FACE-CCGUARD; X3HI = JHI_FACE+CCGUARD

          ! location in I,J,K of x2,x2,x3 axes:
          XIAXIS = JAXIS; XJAXIS = KAXIS; XKAXIS = IAXIS

          ! Face coordinates in x1,x2,x3 axes:
          ALLOCATE(X1FACE(KSTR:KEND),DX1FACE(KSTR:KEND))
          X1FACE = ZFACE; DX1FACE = DZFACE
          ALLOCATE(X2FACE(ISTR:IEND),DX2FACE(ISTR:IEND))
          X2FACE = XFACE; DX2FACE = DXFACE
          ALLOCATE(X3FACE(JSTR:JEND),DX3FACE(JSTR:JEND))
          X3FACE = YFACE; DX3FACE = DYFACE

          ! x2 cell center parameters:
          X2LO_CELL = ILO_CELL-CCGUARD; X2HI_CELL = IHI_CELL+CCGUARD
          ALLOCATE(X2CELL(ISTR:IEND),DX2CELL(ISTR:IEND))
          X2CELL = XCELL; DX2CELL = DXCELL

          ! x3 cell center parameters:
          X3LO_CELL = JLO_CELL-CCGUARD; X3HI_CELL = JHI_CELL+CCGUARD
          ALLOCATE(X3CELL(JSTR:JEND),DX3CELL(JSTR:JEND))
          X3CELL = YCELL; DX3CELL = DYCELL

      END SELECT

      ! Loop Slices:
      DO K=KLO,KHI
         DO J=JLO,JHI
            DO I=ILO,IHI

               IJK(IAXIS:KAXIS) = (/ I, J, K /)

               ! Plane:
               X1PLN = X1FACE(IJK(X1AXIS))

               ! Get intersection of body on plane defined by X1PLN, normal to X1AXIS:
               TRI_ONPLANE_ONLY = .TRUE.
               RAYTRACE_X2_ONLY = .FALSE.
               CALL GET_BODINT_PLANE(X1AXIS,X1PLN,IJK(X1AXIS),PLNORMAL,X2AXIS,X3AXIS,&
               X2LO,X2HI,X3LO,X3HI,X2FACE,X3FACE,X2LO_CELL,&
               X2HI_CELL,X3LO_CELL,X3HI_CELL,TRI_ONPLANE_ONLY,RAYTRACE_X2_ONLY,BODINT_PLANE)

               ! Test that there is an intersection:
               IF ((BODINT_PLANE%NTRIS) == 0) CYCLE

               ! Drop if node locations outside block plane area:
               IF ((X2FACE(X2LO)-MAXVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))) > GEOMEPS) CYCLE
               IF ((MINVAL(BODINT_PLANE%XYZ(X2AXIS,1:BODINT_PLANE%NNODS))-X2FACE(X2HI)) > GEOMEPS) CYCLE
               IF ((X3FACE(X3LO)-MAXVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))) > GEOMEPS) CYCLE
               IF ((MINVAL(BODINT_PLANE%XYZ(X3AXIS,1:BODINT_PLANE%NNODS))-X3FACE(X3HI)) > GEOMEPS) CYCLE

               ! Allocate triangles variables:
               ALLOCATE(BODINT_PLANE%X1NVEC(1:BODINT_PLANE%NTRIS),     &
                        BODINT_PLANE%AINV(1:2,1:2,1:BODINT_PLANE%NTRIS))

               ! Triangles inverses:
               DO ITRI=1,BODINT_PLANE%NTRIS

                  TRIS(NOD1:NOD3) = BODINT_PLANE%TRIS(NOD1:NOD3,ITRI)

                  ! This is local IAXIS:JAXIS
                  XYEL(IAXIS:JAXIS,NOD1) = (/ BODINT_PLANE%XYZ(X2AXIS,TRIS(NOD1)), &
                                              BODINT_PLANE%XYZ(X3AXIS,TRIS(NOD1))  /)
                  XYEL(IAXIS:JAXIS,NOD2) = (/ BODINT_PLANE%XYZ(X2AXIS,TRIS(NOD2)), &
                                              BODINT_PLANE%XYZ(X3AXIS,TRIS(NOD2))  /)
                  XYEL(IAXIS:JAXIS,NOD3) = (/ BODINT_PLANE%XYZ(X2AXIS,TRIS(NOD3)), &
                                              BODINT_PLANE%XYZ(X3AXIS,TRIS(NOD3))  /)

                  ! Test that x1-x2-x3 obeys right hand rule:
                  VAL = (XYEL(IAXIS,NOD2)-XYEL(IAXIS,NOD1)) * (XYEL(JAXIS,NOD3)-XYEL(JAXIS,NOD1))- &
                        (XYEL(JAXIS,NOD2)-XYEL(JAXIS,NOD1)) * (XYEL(IAXIS,NOD3)-XYEL(IAXIS,NOD1))
                  BODINT_PLANE%X1NVEC(ITRI) = SIGN(1._EB,VAL)

                  ! Transformation Matrix for this triangle in x2x3 plane:
                  IF (BODINT_PLANE%X1NVEC(ITRI) < 0._EB) THEN ! Rotate node 2 and 3 locations
                     DUMMY(IAXIS:JAXIS)     = XYEL(IAXIS:JAXIS,NOD2)
                     XYEL(IAXIS:JAXIS,NOD2) = XYEL(IAXIS:JAXIS,NOD3)
                     XYEL(IAXIS:JAXIS,NOD3) = DUMMY(IAXIS:JAXIS)
                  ENDIF

                  ! Inverse of Master to physical triangle transform matrix:
                  A_COEF = XYEL(IAXIS,NOD1) - XYEL(IAXIS,NOD3)
                  B_COEF = XYEL(IAXIS,NOD2) - XYEL(IAXIS,NOD3)
                  C_COEF = XYEL(JAXIS,NOD1) - XYEL(JAXIS,NOD3)
                  D_COEF = XYEL(JAXIS,NOD2) - XYEL(JAXIS,NOD3)
                  DENOM  = A_COEF * D_COEF - B_COEF * C_COEF
                  BODINT_PLANE%AINV(1,1,ITRI) =  D_COEF / DENOM
                  BODINT_PLANE%AINV(2,1,ITRI) = -C_COEF / DENOM
                  BODINT_PLANE%AINV(1,2,ITRI) = -B_COEF / DENOM
                  BODINT_PLANE%AINV(2,2,ITRI) =  A_COEF / DENOM

               ENDDO

               ! There are triangles aligned with this x1pln:
               ! Run by Face:
               ! First solid Faces: x1 Faces, Check where they lay:
               DO KK=X3LO_CELL,X3HI_CELL
                  DO JJ=X2LO_CELL,X2HI_CELL

                     ! Face indexes:
                     INDXI(IAXIS:KAXIS) = (/ IJK(X1AXIS), JJ, KK /) ! Local x1,x2,x3
                     INDIF = INDXI(XIAXIS)
                     INDJF = INDXI(XJAXIS)
                     INDKF = INDXI(XKAXIS)

                     IF (IJK_COUNTF(INDIF,INDJF,INDKF,X1AXIS)) CYCLE; IJK_COUNTF(INDIF,INDJF,INDKF,X1AXIS)=.TRUE.

                     IF (MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_FGSC,X1AXIS) /= IBM_GASPHASE ) THEN

                        FVERT(IAXIS:JAXIS,NOD1) = (/ X2FACE(JJ-FCELL  ), X3FACE(KK-FCELL  ) /)
                        FVERT(IAXIS:JAXIS,NOD2) = (/ X2FACE(JJ-FCELL+1), X3FACE(KK-FCELL  ) /)
                        FVERT(IAXIS:JAXIS,NOD3) = (/ X2FACE(JJ-FCELL+1), X3FACE(KK-FCELL+1) /)
                        FVERT(IAXIS:JAXIS,NOD4) = (/ X2FACE(JJ-FCELL  ), X3FACE(KK-FCELL+1) /)

                        ! Get triangle face intersection:
                        CEI = MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS)

                        ! Triangle - face intersection vertices and edges:
                        CALL GET_TRIANG_FACE_INT(X2AXIS,X3AXIS,FVERT,CEI,NM, &
                                                 INB_FLG,FNVERT,XYVERT,FNEDGE,CEELEM,INDSEG)

                        ! XYvert to XYZvert:
                        IF ( INB_FLG ) THEN
                           XYZVERTF = 0._EB
                           XYZVERTF(X1AXIS,1:FNVERT) = X1PLN
                           XYZVERTF(X2AXIS,1:FNVERT) = XYVERT(IAXIS,1:FNVERT)
                           XYZVERTF(X3AXIS,1:FNVERT) = XYVERT(JAXIS,1:FNVERT)

                           ! Test for edges inside SOLID Region:
                           ALLOCATE(SOLID_EDGE(1:FNEDGE)); SOLID_EDGE(1:FNEDGE)=.FALSE.
                           DO IEDGE=1,FNEDGE
                               ! No body associated with segment. Might not be needed.
                               IG = INDSEG(4,IEDGE)
                               IF ( IG < 1) CYCLE
                               SEG(NOD1:NOD2) = CEELEM(NOD1:NOD2,IEDGE)
                               XP(IAXIS:KAXIS)= 0.5_EB*(XYZVERTF(IAXIS:KAXIS,SEG(NOD1))+XYZVERTF(IAXIS:KAXIS,SEG(NOD2)))
                               ! Direction NP:
                               NXP(IAXIS:KAXIS) = 0._EB
                               DO I_NP=1,INDSEG(1,IEDGE)
                                   ITRI = INDSEG(1+I_NP,IEDGE)
                                   NXP(IAXIS:KAXIS) = NXP(IAXIS:KAXIS) + GEOMETRY(IG)%FACES_NORMAL(IAXIS:KAXIS,ITRI)
                               ENDDO
                               NXP = NXP/NORM2(NXP); XAXIS=MAXLOC(ABS(NXP(IAXIS:KAXIS)),DIM=1)
                               ! Perturb XP in the average normal NP direction:
                               IF (INDSEG(1,IEDGE) > 1) XP = XP + 10._EB*GEOMEPS*NXP
                               CALL GET_IS_SOLID_3D(XAXIS,XP,INDIF,INDJF,INDKF,SOLID_EDGE(IEDGE))
                           ENDDO
                           ! Now drop SEGS with SOLID_EDGE(IEDGE)=true:
                           COUNT = 0
                           DO IEDGE=1,FNEDGE
                               IF (SOLID_EDGE(IEDGE)) CYCLE
                               COUNT=COUNT+1
                               CEELEM(NOD1:NOD2,COUNT) = CEELEM(NOD1:NOD2,IEDGE)
                               INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,COUNT) = INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,IEDGE)
                           ENDDO
                           CEELEM(NOD1:NOD2,COUNT+1:FNEDGE)                = IBM_UNDEFINED
                           INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,COUNT+1:FNEDGE) = IBM_UNDEFINED
                           FNEDGE = COUNT
                           DEALLOCATE(SOLID_EDGE)

                           ! Here ADD nodes and vertices to what is already
                           ! there:
                           IF (CEI == 0) THEN ! We need a new entry in CUT_EDGE
                              CEI      = MESHES(NM)%N_CUTEDGE_MESH + 1
                              MESHES(NM)%N_CUTEDGE_MESH = CEI
                              MESHES(NM)%FCVAR(INDIF,INDJF,INDKF,IBM_IDCE,X1AXIS) = CEI
                              CALL CUT_EDGE_ARRAY_REALLOC(NM,CEI)
                              MESHES(NM)%CUT_EDGE(CEI)%NVERT  = FNVERT
                              MESHES(NM)%CUT_EDGE(CEI)%NEDGE  = FNEDGE
                              MESHES(NM)%CUT_EDGE(CEI)%NEDGE1 = 0
                              CALL NEW_EDGE_ALLOC(NM,CEI,FNVERT,FNEDGE)
                              MESHES(NM)%CUT_EDGE(CEI)%IJK(1:MAX_DIM+2) = &
                                                   (/ INDIF, INDJF, INDKF, X1AXIS, IBM_GS /)
                              MESHES(NM)%CUT_EDGE(CEI)%STATUS = IBM_INBOUNDCF
                              MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,1:FNVERT) = &
                                                      XYZVERTF(IAXIS:KAXIS,1:FNVERT)
                              MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:FNEDGE)    = &
                                                       CEELEM(NOD1:NOD2,1:FNEDGE)
                              MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,1:FNEDGE) = &
                                                       INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,1:FNEDGE)
                           ELSE

                              NVERT_AUX=MESHES(NM)%CUT_EDGE(CEI)%NVERT
                              NEDGE_OLD=MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                              DO IVERT=1,FNVERT
                                 XYZV(IAXIS:KAXIS) = XYZVERTF(IAXIS:KAXIS,IVERT)
                                 CALL INSERT_FACE_VERT(XYZV,NM,CEI,NVERT_AUX,INOD)
                                 DO IEDGE=1,FNEDGE
                                    IF(CEELEM(NOD1,IEDGE)==IVERT) CEELEM(NOD1,IEDGE)=INOD
                                    IF(CEELEM(NOD2,IEDGE)==IVERT) CEELEM(NOD2,IEDGE)=INOD
                                 ENDDO
                              ENDDO
                              CALL REALLOCATE_EDGE_ELEM(NM,CEI,NEDGE_OLD+FNEDGE)
                              COUNT = NEDGE_OLD
                              OUTER :DO IEDGE=1,FNEDGE
                                 FOUND=.FALSE.
                                 INNER1 : DO IEOLD=1,NEDGE_OLD
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IEOLD) /= CEELEM(NOD1,IEDGE)) CYCLE INNER1
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IEOLD) /= CEELEM(NOD2,IEDGE)) CYCLE INNER1
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,IEOLD)    /= INDSEG(4,IEDGE))    CYCLE INNER1
                                 FOUND=.TRUE.
                                 ENDDO INNER1
                                 INNER2 : DO IEOLD=1,NEDGE_OLD
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD2,IEOLD) /= CEELEM(NOD1,IEDGE)) CYCLE INNER2
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1,IEOLD) /= CEELEM(NOD2,IEDGE)) CYCLE INNER2
                                 IF(MESHES(NM)%CUT_EDGE(CEI)%INDSEG(4,IEOLD)    /= INDSEG(4,IEDGE))    CYCLE INNER2
                                 FOUND=.TRUE.
                                 ENDDO INNER2
                                 IF(FOUND) CYCLE OUTER
                                 COUNT=COUNT+1
                                 MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,COUNT) = CEELEM(NOD1:NOD2,IEDGE)
                                 MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,COUNT)=&
                                                          INDSEG(1:IBM_MAX_WSTRIANG_SEG+3,IEDGE)
                              ENDDO OUTER
                              MESHES(NM)%CUT_EDGE(CEI)%NVERT = NVERT_AUX
                              MESHES(NM)%CUT_EDGE(CEI)%NEDGE = COUNT

                           ENDIF

                           ! MESHES(NM)%CUT_EDGE(CEI)%NVERT  =    FNVERT
                           ! MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,1:FNVERT) = &
                           !                              XYZVERTF(IAXIS:KAXIS,1:FNVERT)
                           ! MESHES(NM)%CUT_EDGE(CEI)%NEDGE  =    FNEDGE
                           ! WRITE(LU_ERR,*) 'CUT_EDGE=',CEI,SIZE(MESHES(NM)%CUT_EDGE(CEI)%CEELEM,DIM=2),FNEDGE
                           ! WRITE(LU_ERR,*) 'CEELEM=',SIZE(CEELEM,DIM=2)
                           ! MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:FNEDGE)    = &
                           !                              CEELEM(NOD1,IEDGE)) CYCLE:NOD2,1:FNEDGE)
                           ! MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,1:FNEDGE) = &
                           !                              INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,1:FNEDGE)

                        ENDIF

                     ENDIF
                  ENDDO
               ENDDO

               DEALLOCATE(BODINT_PLANE%X1NVEC,BODINT_PLANE%AINV)
            ENDDO ! I
         ENDDO ! J
      ENDDO ! K

      ! Deallocate local plane arrays:
      DEALLOCATE(X1FACE,X2FACE,X3FACE,X2CELL,X3CELL)
      DEALLOCATE(DX1FACE,DX2FACE,DX3FACE,DX2CELL,DX3CELL)

   ENDDO X1AXIS_LOOP
! ENDIF BNDINT_COND

! Second: Loop over cut-cells: For cut-cell i,j,k,lb
! - From cut-cell Cartesian faces, figure out INBOUNDCF segments (CUT_EDGE)
! and the wet surface triangles related to them.
! - From CCVAR(I,J,K,IBM_IDCE), firgure out INBOUNDCC segments in CUT_EDGE
! and triangles they belong to.
! - Working by triangle -> reorient segments using triangle normal outside
! of body (no disjoint areas are expected)
! - Load into CUT_FACE <=> CCVAR(I,J,K,IBM_IDCF).
IF (BNDINT_FLAG) THEN
   ILO = ILO_CELL; IHI = IHI_CELL
   JLO = JLO_CELL; JHI = JHI_CELL
   KLO = KLO_CELL; KHI = KHI_CELL
ELSE
   ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
   JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
   KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD
ENDIF
! Loop on Cartesian cells, define cut cells and solid cells IBM_CGSC:
DO K=KLO,KHI
   DO J=JLO,JHI
      DO I=ILO,IHI

         IF ( MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) /= IBM_CUTCFE ) CYCLE

         IF (CELLRT(I,J,K)) CYCLE ! Special cell with bod-bod or self intersection.

         IF(IJK_COUNTED(I,J,K)) CYCLE; IJK_COUNTED(I,J,K)=.TRUE.

         ! Face type of bounding Cartesian faces:
         FSID_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_FGSC,JAXIS)
         FSID_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_FGSC,JAXIS)
         FSID_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_FGSC,KAXIS)
         FSID_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_FGSC,KAXIS)

         ! Start cut-cell INB cut-faces computation:
         ! Loop local arrays to cell:
         NSEG      = 0
         SEG_CELL  = IBM_UNDEFINED

         NVERT     = 0
         NFACE     = 0
         XYZVERT   = 0._EB

         ! CUT_EDGE index of bounding Cartesian faces:
         CEIB_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_IDCE,IAXIS)
         CEIB_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_IDCE,IAXIS)
         CEIB_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_IDCE,JAXIS)
         CEIB_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_IDCE,JAXIS)
         CEIB_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_IDCE,KAXIS)
         CEIB_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_IDCE,KAXIS)

         ! Cartesian Faces INBOUNDARY segments:
         DO FAXIS=IAXIS,KAXIS
            DO ILH=LOW_IND,HIGH_IND
               ! By segment: Add Vertices/Segments to local arrays:
               CEI = CEIB_XYZ(ILH,FAXIS)
               IF ( CEI > 0 ) THEN ! There are inboundary cut-edges
                  NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
                  DO IEDGE=1,NEDGE

                     SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)
                     STRI(1:IBM_MAX_WSTRIANG_SEG+2) = &
                     MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,IEDGE)

                     ! x,y,z of node 1:
                     XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                     CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD1,XYZVERT)
                     ! x,y,z of node 2:
                     XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                     CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD2,XYZVERT)

                     VEC(NOD1:NOD2) = (/ INOD1, INOD2 /)
                     VEC(NOD2+1:NOD2+IBM_MAX_WSTRIANG_SEG+2) = STRI(1:IBM_MAX_WSTRIANG_SEG+2)
                     ! Insertion ADD segment:
                     INLIST = .FALSE.
                     DO IDUM = 1,NSEG
                        DO IEQ1=1,3
                           EQUAL1 = SEG_CELL(INDVERTBOD(IEQ1),IDUM) == VEC(INDVERTBOD(IEQ1))
                           IF (.NOT.EQUAL1) EXIT
                        ENDDO
                        DO IEQ2=1,3
                           EQUAL2 = SEG_CELL(INDVERTBOD(IEQ2),IDUM) == VEC(INDVERTBOD2(IEQ2))
                           IF (.NOT.EQUAL2) EXIT
                        ENDDO
                        IF ( EQUAL1 .OR. EQUAL2 ) THEN
                           IF ( SEG_CELL(3,IDUM) > VEC(3) ) THEN
                              ! DO NOTHING:
                           ELSEIF (SEG_CELL(3,IDUM) < VEC(3)) THEN
                              SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,IDUM) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
                           ELSEIF (SEG_CELL(4,IDUM) /= VEC(4)) THEN
                              SEG_CELL(3,IDUM) = SEG_CELL(3,IDUM) + 1
                              SEG_CELL(5,IDUM) = VEC(4)
                           ENDIF
                           INLIST = .TRUE.
                           EXIT
                        ENDIF
                     ENDDO
                     IF (.NOT.INLIST) THEN
                         NSEG = NSEG + 1
                         CALL REALLOCATE_SEG_CELL
                         SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,NSEG) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
                     ENDIF
                  ENDDO
               ENDIF
            ENDDO
         ENDDO

         ! Cells INBOUNDARY segments:
         CEI = MESHES(NM)%CCVAR(I,J,K,IBM_IDCE)
         IF ( CEI > 0 ) THEN ! There are inboundary cut-edges
            NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE
            DO IEDGE=1,NEDGE

               SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)
               STRI(1:IBM_MAX_WSTRIANG_SEG+2) = &
               MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,IEDGE)

               ! x,y,z of node 1:
               XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
               CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD1,XYZVERT)
               ! x,y,z of node 2:
               XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
               CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD2,XYZVERT)

               IF (INOD1 == INOD2) CYCLE

               VEC(NOD1:NOD2) = (/ INOD1, INOD2 /)
               VEC(NOD2+1:NOD2+IBM_MAX_WSTRIANG_SEG+2) = STRI(1:IBM_MAX_WSTRIANG_SEG+2)
               ! Insertion ADD segment:
               INLIST = .FALSE.
               DO IDUM = 1,NSEG
                  DO IEQ1=1,3
                     EQUAL1 = SEG_CELL(INDVERTBOD(IEQ1),IDUM) == VEC(INDVERTBOD(IEQ1))
                     IF (.NOT.EQUAL1) EXIT
                  ENDDO
                  DO IEQ2=1,3
                     EQUAL2 = SEG_CELL(INDVERTBOD(IEQ2),IDUM) == VEC(INDVERTBOD2(IEQ2))
                     IF (.NOT.EQUAL2) EXIT
                  ENDDO
                  IF ( EQUAL1 .OR. EQUAL2 ) THEN
                     IF ( SEG_CELL(3,IDUM) > VEC(3) ) THEN
                        ! DO NOTHING:
                     ELSEIF (SEG_CELL(3,IDUM) < VEC(3)) THEN
                        SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,IDUM) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
                     ELSEIF (SEG_CELL(4,IDUM) /= VEC(4)) THEN
                        SEG_CELL(3,IDUM) = SEG_CELL(3,IDUM) + 1
                        SEG_CELL(5,IDUM) = VEC(4)
                     ENDIF
                     INLIST = .TRUE.
                     EXIT
                  ENDIF
               ENDDO
               IF (.NOT.INLIST) THEN
                   NSEG = NSEG + 1
                   CALL REALLOCATE_SEG_CELL
                   SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,NSEG) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
               ENDIF
            ENDDO
         ENDIF

         ! Drop segments that are unconnected:
         ALLOCATE(VERT_SEGS(1:NVERT)); VERT_SEGS(1:NVERT)=0
         DO IDUM = 1,NSEG
            IF (SEG_CELL(NOD1,IDUM) == SEG_CELL(NOD2,IDUM)) CYCLE
            VERT_SEGS(SEG_CELL(NOD1,IDUM)) = VERT_SEGS(SEG_CELL(NOD1,IDUM)) + 1
            VERT_SEGS(SEG_CELL(NOD2,IDUM)) = VERT_SEGS(SEG_CELL(NOD2,IDUM)) + 1
         ENDDO
         ALLOCATE(SEG_CELL_AUX(SIZE(SEG_CELL,DIM=1),SIZE(SEG_CELL,DIM=2)))
         SEG_CELL_AUX = SEG_CELL
         COUNT = 0
         DO IDUM = 1,NSEG
         IF ( (SEG_CELL_AUX(NOD1,IDUM) /= SEG_CELL_AUX(NOD2,IDUM)) .AND. &
              (VERT_SEGS(SEG_CELL_AUX(NOD1,IDUM))>1) .AND. (VERT_SEGS(SEG_CELL_AUX(NOD2,IDUM))>1) ) THEN
            COUNT = COUNT + 1
            SEG_CELL(:,COUNT) = SEG_CELL_AUX(:,IDUM)
            CYCLE
         ENDIF
         ENDDO
         NSEG = COUNT
         DEALLOCATE(SEG_CELL_AUX,VERT_SEGS)

         ! Now obtain body-triangle combinations present:
         BOD_TRI = IBM_UNDEFINED
         NBODTRI = 0
         DO ISEG=1,NSEG

            ! First triangle location (Assume one body and at
            ! most two triangs per seg).
            INLIST = .FALSE.
            DO IBODTRI=1,NBODTRI
               IF ( (BOD_TRI(1,IBODTRI) == SEG_CELL(6,ISEG)) .AND. &
                    (BOD_TRI(2,IBODTRI) == SEG_CELL(4,ISEG)) ) THEN
                  ! Body/triang already on list.
                  INLIST = .TRUE.
                  CYCLE
               ENDIF
            enddo
            IF (.NOT.INLIST) THEN
               ! Add first triang to list:
               NBODTRI = NBODTRI + 1
               BOD_TRI(1:2,NBODTRI) = SEG_CELL( (/ 6, 4 /) , ISEG)
            ENDIF

            ! No second triangle associated:
            IF ( SEG_CELL(3,ISEG) < 2 ) CYCLE

            ! Second triangle location
            INLIST = .FALSE.
            DO IBODTRI=1,NBODTRI
               IF ( (BOD_TRI(1,IBODTRI) == SEG_CELL(6,ISEG)) .AND. &
                    (BOD_TRI(2,IBODTRI) == SEG_CELL(5,ISEG)) ) THEN
                  ! Body/triang already on list.
                  INLIST = .TRUE.
                  CYCLE
               ENDIF
            ENDDO
            IF (.NOT.INLIST) THEN
               ! Add first triang to list:
               NBODTRI = NBODTRI + 1
               BOD_TRI(1:2,NBODTRI) = SEG_CELL( (/ 6, 5 /) , ISEG)
            ENDIF
         ENDDO ! ISEG.

         ! Do Test for cycling when all body-triangle combinations produce two or less segments:
         SEG_FLAG(1)=.TRUE.
         DO ICF=1,NBODTRI
            IBOD = BOD_TRI(1,ICF)
            ITRI = BOD_TRI(2,ICF)
            NSEG_FACE = 0
            DO ISEG=1,NSEG
               IF ((SEG_CELL(6,ISEG) == IBOD) .AND. &
                  ((SEG_CELL(4,ISEG) == ITRI) .OR. (SEG_CELL(5,ISEG) == ITRI)) ) THEN
                  NSEG_FACE = NSEG_FACE + 1
               ENDIF
            ENDDO
            ! If only one or two seg => continue:
            IF ( NSEG_FACE <= 2 ) CYCLE
            SEG_FLAG(1)=.FALSE.
            EXIT
         ENDDO
         IF (SEG_FLAG(1)) CYCLE ! CYCLES I,J,K loop.

         ! This is a cut-face, allocate space:
         NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
         IF (BNDINT_FLAG) THEN
            MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
         ELSE
            MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
         ENDIF
         MESHES(NM)%CCVAR(I,J,K,IBM_IDCF) = NCUTFACE

         CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

         MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
         MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = 0
         MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, 0 /) ! No axis = 0
         MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_INBOUNDARY
         CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NBODTRI,IBM_MAXVERT_CUTFACE)
         MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1:NVERT) = XYZVERT(IAXIS:KAXIS,1:NVERT)

         ! Running by body-triangle combination, define list of
         ! segments that belong to each pair.
         ICF_LOOP : DO ICF=1,NBODTRI

            IBOD = BOD_TRI(1,ICF)
            ITRI = BOD_TRI(2,ICF)

            SEG_FACE  = IBM_UNDEFINED
            NSEG_FACE = 0
            DO ISEG=1,NSEG
               IF ((SEG_CELL(6,ISEG) == IBOD) .AND. &
                  ((SEG_CELL(4,ISEG) == ITRI) .OR. (SEG_CELL(5,ISEG) == ITRI)) ) THEN
                  NSEG_FACE = NSEG_FACE + 1
                  SEG_FACE(NOD1:NOD2,NSEG_FACE) = SEG_CELL(NOD1:NOD2,ISEG)
               ENDIF
            ENDDO

            ! If only one or two seg => continue:
            IF ( NSEG_FACE <= 2 ) CYCLE

            ! Now build sequential list of segments:
            SEG_FACE2 = IBM_UNDEFINED !zeros(nseg_face,2); %[nod1 nod2]
            SEG_FLAG  = .TRUE.        !ones(1,nseg_face);
            ISEG_FACE = 1
            COUNTR    = 1
            CTSTART   = COUNTR
            SEG_FACE2(NOD1:NOD2,COUNTR) = SEG_FACE(NOD1:NOD2,ISEG_FACE)
            SEG_FLAG(ISEG_FACE) = .FALSE.
            NSEG_LEFT = NSEG_FACE - 1
            CTR = 0
            CYCLE_CELL= .FALSE.
            ! Infinite Loop:
            INF_LOOP : DO
               DO ISEG_FACE=1,NSEG_FACE

                  IF (SEG_FLAG(ISEG_FACE)) THEN ! This seg hasn't been added to seg_face2
                     ! Test for common node:
                     IF ( SEG_FACE2(NOD2,COUNTR) == SEG_FACE(NOD1,ISEG_FACE) ) THEN
                        COUNTR = COUNTR + 1
                        SEG_FACE2(NOD1:NOD2,COUNTR) = SEG_FACE(NOD1:NOD2,ISEG_FACE)
                        SEG_FLAG(ISEG_FACE) = .FALSE.
                        NSEG_LEFT = NSEG_LEFT - 1
                        EXIT
                     ELSEIF ( SEG_FACE2(NOD2,COUNTR) == SEG_FACE(NOD2,ISEG_FACE) ) THEN

                        IF ( SEG_FACE2(NOD1,COUNTR) == SEG_FACE(NOD1,ISEG_FACE) ) &
                        PRINT*, "Building INBOUND faces, repeated index."
                        COUNTR = COUNTR + 1
                        SEG_FACE2(NOD1:NOD2,COUNTR) = SEG_FACE( (/ NOD2, NOD1 /) ,ISEG_FACE)
                        SEG_FLAG(ISEG_FACE) = .FALSE.
                        NSEG_LEFT = NSEG_LEFT - 1
                        EXIT
                     ENDIF
                  ENDIF
               ENDDO
               ! Break loop:
               IF ( NSEG_LEFT == 0 ) EXIT
               CTR = CTR + 1

               ! Plot cell and cut-faces if there is no convergence:
               IF ( CTR > NSEG_FACE**3 ) THEN
                  CYCLE_CELL = .TRUE.
                  MESHES(NM)%N_SPCELL = MESHES(NM)%N_SPCELL + 1
                  NSPCELL_LIST        = SIZE(MESHES(NM)%SPCELL_LIST,DIM=2)
                  IF (NSPCELL_LIST < MESHES(NM)%N_SPCELL) THEN
                     ALLOCATE(SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST)); SPCELL_LIST(:,:)=MESHES(NM)%SPCELL_LIST(:,:)
                     DEALLOCATE(MESHES(NM)%SPCELL_LIST)
                     ALLOCATE(MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST+DELTA_CELL));
                     MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,1:NSPCELL_LIST)=SPCELL_LIST(IAXIS:KAXIS,1:NSPCELL_LIST)
                     MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST+1:NSPCELL_LIST+DELTA_CELL) = IBM_UNDEFINED
                     DEALLOCATE(SPCELL_LIST)
                  ENDIF
                  MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,MESHES(NM)%N_SPCELL) = (/ I, J, K /)
                  EXIT INF_LOOP

                  IF (DEBUG_SET_CUTCELLS) THEN
                     WRITE(LU_ERR,*) "Error GET_CARTCELL_CUTFACES: ctr > nseg_face^3 ,",BNDINT_FLAG,I,J,K,NCUTFACE,&
                     MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE
                     WRITE(LU_ERR,*) "Cannot build boundary cut faces in cell (NM,I,J,K):",NM,I,J,K
                     WRITE(LU_ERR,*) "Located in position:",XCELL(I),YCELL(J),ZCELL(K)
                     WRITE(LU_ERR,*) "Check for Geometry surface inconsistencies at said location."
                     WRITE(LU_ERR,*) 'Cartesian CELL:',BNDINT_FLAG,MESHES(NM)%CCVAR(I,J,K,IBM_CGSC),IBM_CUTCFE,I,J,K
                     LU_DB_SETCC = GET_FILE_NUMBER()
                     OPEN(UNIT=LU_DB_SETCC,FILE="./Cartcell_cutfaces.dat", STATUS='REPLACE')
                     ! Info pertaining to the Cartesian Cell:
                     WRITE(LU_DB_SETCC,*) 'I,J,K:'
                     WRITE(LU_DB_SETCC,*) I,J,K,GEOMEPS
                     WRITE(LU_DB_SETCC,*) 'XC(I),DX(I),YC(J),DY(J),ZC(K),DZ(K):'
                     WRITE(LU_DB_SETCC,*) XCELL(I),DXCELL(I) ! MESHES(NM)%XC(I),MESHES(NM)%DX(I)
                     WRITE(LU_DB_SETCC,*) YCELL(J),DYCELL(J) ! MESHES(NM)%YC(J),MESHES(NM)%DY(J)
                     WRITE(LU_DB_SETCC,*) ZCELL(K),DZCELL(K) ! MESHES(NM)%ZC(K),MESHES(NM)%DZ(K)
                     WRITE(LU_DB_SETCC,*) 'NVERT,NSEG,NSEG_FACE,COUNTR,NSEG_LEFT:'
                     WRITE(LU_DB_SETCC,*) NVERT,NSEG,NSEG_FACE,COUNTR,NSEG_LEFT
                     WRITE(LU_DB_SETCC,*) 'XYZVERT(IAXIS:KAXIS,1:NVERT):'
                     DO IDUM=1,NVERT
                        WRITE(LU_DB_SETCC,*) IDUM,XYZVERT(IAXIS:KAXIS,IDUM)
                     ENDDO
                     WRITE(LU_DB_SETCC,*) 'SEG_CELL(NOD1:NOD2,1:NSEG),SEG_CELL(3:6,1:NSEG):'
                     DO IDUM=1,NSEG
                        WRITE(LU_DB_SETCC,*) IDUM,SEG_CELL(NOD1:NOD2,IDUM),SEG_CELL(3:6,IDUM)
                     ENDDO
                     WRITE(LU_DB_SETCC,*) 'SEG_FACE(NOD1:NOD2,1:NSEG_FACE):'
                     DO IDUM=1,NSEG_FACE
                        WRITE(LU_DB_SETCC,*) IDUM,SEG_FACE(NOD1:NOD2,IDUM)
                     ENDDO
                     WRITE(LU_DB_SETCC,*) 'SEG_FACE2(NOD1:NOD21:COUNTR):'
                     DO IDUM=1,COUNTR
                        WRITE(33,*) IDUM,SEG_FACE2(NOD1:NOD2,IDUM)
                     ENDDO
                     WRITE(LU_DB_SETCC,*) 'ICF,BOD_TRI:'
                     WRITE(LU_DB_SETCC,*) ICF,NBODTRI
                     DO IDUM=1,NBODTRI
                        WRITE(LU_DB_SETCC,*) BOD_TRI(1:2,IDUM)
                     ENDDO
                     CLOSE(LU_DB_SETCC)
                     CALL DEBUG_WAIT
                  ENDIF

               ENDIF

            ENDDO INF_LOOP
            IF (CYCLE_CELL) EXIT ICF_LOOP

            IF ( COUNTR /= NSEG_FACE) &
                    PRINT*, "Building INBOUND faces: ~isequal(countr,nseg)"

            ! Using triangles normal, reorder nodes as in right hand rule.
            NORMTRI(IAXIS:KAXIS) = GEOMETRY(IBOD)%FACES_NORMAL(IAXIS:KAXIS,ITRI)

            ! First test if INB face is on Cartesian face and pointing
            ! outside of Cartesian cell. If so drop:
            ! Get min max in face for VERTS x,y,z:
            XMIN(IAXIS:KAXIS)= 1._EB/TWO_EPSILON_EB
            XMAX(IAXIS:KAXIS)=-1._EB/TWO_EPSILON_EB
            DO ISEG_FACE=1,NSEG_FACE
                XMIN(IAXIS) = MIN(XMIN(IAXIS), XYZVERT(IAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
                XMIN(JAXIS) = MIN(XMIN(JAXIS), XYZVERT(JAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
                XMIN(KAXIS) = MIN(XMIN(KAXIS), XYZVERT(KAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
                XMAX(IAXIS) = MAX(XMAX(IAXIS), XYZVERT(IAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
                XMAX(JAXIS) = MAX(XMAX(JAXIS), XYZVERT(JAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
                XMAX(KAXIS) = MAX(XMAX(KAXIS), XYZVERT(KAXIS,SEG_FACE2(NOD1,ISEG_FACE)))
            ENDDO
            ! IAXIS:
            IF ( (ABS(NORMTRI(IAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(XFACE(I-FCELL  )-XMIN(IAXIS)) < GEOMEPS)  .AND. &
                 (ABS(XFACE(I-FCELL  )-XMAX(IAXIS)) < GEOMEPS)) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(IAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(XFACE(I-FCELL+1)-XMIN(IAXIS)) < GEOMEPS)  .AND. &
                 (ABS(XFACE(I-FCELL+1)-XMAX(IAXIS)) < GEOMEPS)) CYCLE ! High Face
            ! JAXIS:
            IF ( (ABS(NORMTRI(JAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(YFACE(J-FCELL  )-XMIN(JAXIS)) < GEOMEPS)  .AND. &
                 (ABS(YFACE(J-FCELL  )-XMAX(JAXIS)) < GEOMEPS)) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(JAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(YFACE(J-FCELL+1)-XMIN(JAXIS)) < GEOMEPS)  .AND. &
                 (ABS(YFACE(J-FCELL+1)-XMAX(JAXIS)) < GEOMEPS)) CYCLE ! High Face
            ! KAXIS:
            IF ( (ABS(NORMTRI(KAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(ZFACE(K-FCELL  )-XMIN(KAXIS)) < GEOMEPS)  .AND. &
                 (ABS(ZFACE(K-FCELL  )-XMAX(KAXIS)) < GEOMEPS)) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(KAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(ZFACE(K-FCELL+1)-XMIN(KAXIS)) < GEOMEPS)  .AND. &
                 (ABS(ZFACE(K-FCELL+1)-XMAX(KAXIS)) < GEOMEPS)) CYCLE ! High Face

            ! Face Vertices average location:
            XCEN(IAXIS:KAXIS) = 0._EB
            DO ISEG_FACE=1,NSEG_FACE
                XCEN(IAXIS:KAXIS) = XCEN(IAXIS:KAXIS) + XYZVERT(IAXIS:KAXIS,SEG_FACE2(NOD1,ISEG_FACE))
            ENDDO
            XCEN(IAXIS:KAXIS) = XCEN(IAXIS:KAXIS) / REAL(NSEG_FACE,EB)

            ISEG_FACE = 1
            VC1(IAXIS:KAXIS) = XYZVERT(IAXIS:KAXIS,SEG_FACE2(NOD1,ISEG_FACE  )) - XCEN(IAXIS:KAXIS)
            V12(IAXIS:KAXIS) = XYZVERT(IAXIS:KAXIS,SEG_FACE2(NOD1,ISEG_FACE+1)) - &
                               XYZVERT(IAXIS:KAXIS,SEG_FACE2(NOD1,ISEG_FACE  ))

            CROSSV(IAXIS) = VC1(JAXIS)*V12(KAXIS) - VC1(KAXIS)*V12(JAXIS)
            CROSSV(JAXIS) = VC1(KAXIS)*V12(IAXIS) - VC1(IAXIS)*V12(KAXIS)
            CROSSV(KAXIS) = VC1(IAXIS)*V12(JAXIS) - VC1(JAXIS)*V12(IAXIS)

            RH_ORIENTED = ( NORMTRI(IAXIS)*CROSSV(IAXIS) + &
                            NORMTRI(JAXIS)*CROSSV(JAXIS) + &
                            NORMTRI(KAXIS)*CROSSV(KAXIS) ) > 0._EB

            NP  = NSEG_FACE
            NCF = MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE + 1
            NVSIZE=SIZE(MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM,DIM=1)
            IF(NP+1 > NVSIZE) THEN
               ! REALLOCATE CFELEM:
               ALLOCATE(CFELEM(1:NVSIZE,1:NBODTRI))
               CFELEM(1:NVSIZE,1:NBODTRI) = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVSIZE,1:NBODTRI)
               DEALLOCATE(MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM)
               ALLOCATE(MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NP+1+DELTA_VERT,1:NBODTRI))
               MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(:,:) = IBM_UNDEFINED
               MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:NVSIZE,1:NBODTRI) = CFELEM(1:NVSIZE,1:NBODTRI)
               DEALLOCATE(CFELEM)
            ENDIF
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1,NCF) = NP
            IF (RH_ORIENTED) THEN
                DO IDUM=1,NP
                   MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(IDUM+1,NCF) = SEG_FACE2(NOD1,IDUM)
                ENDDO
            ELSE
                DO IDUM=1,NP
                   MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(IDUM+1,NCF) = SEG_FACE2(NOD1,NP+1-IDUM)
                ENDDO
            ENDIF
            MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = NCF

            ! Compute Sections area and centroid:
            AREA                = 0._EB
            ACEN(IAXIS:KAXIS)   = 0._EB
            INXAREA             = 0._EB
            SQAREA(IAXIS:KAXIS) = 0._EB
            DO ISEG_FACE=1,NSEG_FACE-1

               IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+ISEG_FACE,NCF)
               X1(IAXIS:KAXIS)  = XYZVERT(IAXIS:KAXIS,IDUM)
               IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(2+ISEG_FACE,NCF)
               X2(IAXIS:KAXIS)  = XYZVERT(IAXIS:KAXIS,IDUM)
               VC1(IAXIS:KAXIS) = X1(IAXIS:KAXIS) - XCEN(IAXIS:KAXIS)
               V12(IAXIS:KAXIS) = X2(IAXIS:KAXIS) - X1(IAXIS:KAXIS)
               XCENI(IAXIS:KAXIS) = (XCEN(IAXIS:KAXIS) + X1(IAXIS:KAXIS) + X2(IAXIS:KAXIS)) / 3._EB

               CROSSV(IAXIS) = VC1(JAXIS)*V12(KAXIS) - VC1(KAXIS)*V12(JAXIS)
               CROSSV(JAXIS) = VC1(KAXIS)*V12(IAXIS) - VC1(IAXIS)*V12(KAXIS)
               CROSSV(KAXIS) = VC1(IAXIS)*V12(JAXIS) - VC1(JAXIS)*V12(IAXIS)

               AREAI = 0.5_EB * SQRT( CROSSV(IAXIS)**2._EB + CROSSV(JAXIS)**2._EB + CROSSV(KAXIS)**2._EB )
               AREA  = AREA + AREAI
               ACEN(IAXIS:KAXIS)  = ACEN(IAXIS:KAXIS) + AREAI * XCENI(IAXIS:KAXIS)
               ! volume computation variables:
               XC1(IAXIS:KAXIS) = 0.5_EB*(XCEN(IAXIS:KAXIS) + X1(IAXIS:KAXIS))
               XC2(IAXIS:KAXIS) = 0.5_EB*(XCEN(IAXIS:KAXIS) + X2(IAXIS:KAXIS))
               X12(IAXIS:KAXIS) = 0.5_EB*(  X1(IAXIS:KAXIS) + X2(IAXIS:KAXIS))
               ! dot(i,nc) int(x)dA
               INXAREA = INXAREA + NORMTRI(IAXIS)*XCENI(IAXIS)*AREAI ! Single Gauss pt integration.
               ! dot(i,nc) int(x^2)dA, dot(j,nc) int(y^2)dA, dot(k,nc) int(z^2)dA
               DO IX=IAXIS,KAXIS
                  INT2 = (XC1(IX)**2._EB + XC2(IX)**2._EB + X12(IX)**2._EB) / 3._EB
                  SQAREA(IX) = SQAREA(IX) + NORMTRI(IX)*INT2*AREAI  ! Midpoint rule.
               ENDDO
            ENDDO
            ! Final seg:
            IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+NSEG_FACE,NCF)
            X1(IAXIS:KAXIS) = XYZVERT(IAXIS:KAXIS,IDUM)
            IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+1        ,NCF)
            X2(IAXIS:KAXIS) = XYZVERT(IAXIS:KAXIS,IDUM)

            VC1(IAXIS:KAXIS) = X1(IAXIS:KAXIS) - XCEN(IAXIS:KAXIS)
            V12(IAXIS:KAXIS) = X2(IAXIS:KAXIS) - X1(IAXIS:KAXIS)
            XCENI(IAXIS:KAXIS) = (XCEN(IAXIS:KAXIS) + X1(IAXIS:KAXIS) + X2(IAXIS:KAXIS)) / 3._EB

            CROSSV(IAXIS) = VC1(JAXIS)*V12(KAXIS) - VC1(KAXIS)*V12(JAXIS)
            CROSSV(JAXIS) = VC1(KAXIS)*V12(IAXIS) - VC1(IAXIS)*V12(KAXIS)
            CROSSV(KAXIS) = VC1(IAXIS)*V12(JAXIS) - VC1(JAXIS)*V12(IAXIS)

            AREAI = 0.5_EB * SQRT( CROSSV(IAXIS)**2._EB + CROSSV(JAXIS)**2._EB + CROSSV(KAXIS)**2._EB )
            AREA  = AREA + AREAI
            ! IF(AREA<TWO_EPSILON_EB) THEN
            !    WRITE(LU_ERR,*) 'NM,I,J,K,AREA,GEOMEPS=',NM,I,J,K,AREA,GEOMEPS
            !    WRITE(LU_ERR,*) 'NBODTRI, NCF, NSEG_FACE=',NBODTRI,NCF,NSEG_FACE
            !    DO ISEG_FACE=1,NSEG_FACE-1
            !       IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+ISEG_FACE,NCF)
            !       X1(IAXIS:KAXIS)  = XYZVERT(IAXIS:KAXIS,IDUM)
            !       IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(2+ISEG_FACE,NCF)
            !       X2(IAXIS:KAXIS)  = XYZVERT(IAXIS:KAXIS,IDUM)
            !       WRITE(LU_ERR,*) ISEG_FACE,&
            !       MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+ISEG_FACE,NCF),IDUM,&
            !       ':',X1(IAXIS:KAXIS),'-',X2(IAXIS:KAXIS)
            !    ENDDO
            !    ! Final seg:
            !    IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+NSEG_FACE,NCF)
            !    x1(IAXIS:KAXIS) = XYZvert(IAXIS:KAXIS,IDUM)
            !    IDUM = MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+1        ,NCF)
            !    x2(IAXIS:KAXIS) = XYZvert(IAXIS:KAXIS,IDUM)
            !    WRITE(LU_ERR,*) NSEG_FACE,&
            !    MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1+NSEG_FACE,NCF),IDUM,&
            !    ':',X1(IAXIS:KAXIS),'-',X2(IAXIS:KAXIS)
            ! ENDIF
            ACEN(IAXIS:KAXIS)  = (ACEN(IAXIS:KAXIS) + AREAI * XCENI(IAXIS:KAXIS))/AREA
            ! volume computation variables:
            XC1(IAXIS:KAXIS) = 0.5_EB*(XCEN(IAXIS:KAXIS) + X1(IAXIS:KAXIS))
            XC2(IAXIS:KAXIS) = 0.5_EB*(XCEN(IAXIS:KAXIS) + X2(IAXIS:KAXIS))
            X12(IAXIS:KAXIS) = 0.5_EB*(  X1(IAXIS:KAXIS) + X2(IAXIS:KAXIS))
            ! dot(i,nc) int(x)dA
            INXAREA = INXAREA + NORMTRI(IAXIS)*XCENI(IAXIS)*AREAI ! Single Gauss pt integration.
            ! dot(i,nc) int(x^2)dA, dot(j,nc) int(y^2)dA, dot(k,nc) int(z^2)dA
            DO IX=IAXIS,KAXIS
               INT2 = (XC1(IX)**2._EB + XC2(IX)**2._EB + X12(IX)**2._EB) / 3._EB
               SQAREA(IX) = SQAREA(IX) + NORMTRI(IX)*INT2*AREAI  ! Midpoint rule.
            ENDDO

            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NCF) = AREA
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NCF) = ACEN(IAXIS:KAXIS)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NCF)   = INXAREA
            ! dot(i,nc)*int(x^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NCF) = SQAREA(IAXIS)
            ! dot(j,nc)*int(y^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NCF) = SQAREA(JAXIS)
            ! dot(k,nc)*int(z^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NCF) = SQAREA(KAXIS)

            ! Define Body-triangle reference:
            MESHES(NM)%CUT_FACE(NCUTFACE)%BODTRI(1:2,NCF)= (/ IBOD, ITRI /)

            ! Assign surf-index: Depending on GEOMETRY:
            MESHES(NM)%CUT_FACE(NCUTFACE)%SURF_INDEX(NCF) = GEOMETRY(IBOD)%SURFS(ITRI)

         ENDDO ICF_LOOP

         ! Here if CFACES could not be built, flag the cell as SPECIAL & reduce NCUTFACE by one:
         IF (CYCLE_CELL) THEN
             CELLRT(I,J,K)     =.TRUE.
             IJK_COUNTED(I,J,K)=.FALSE.
             MESHES(NM)%CCVAR(I,J,K,IBM_IDCF) = IBM_UNDEFINED;
             MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT            = 0
             MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE            = 0
             MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = 0 ! No axis = 0
             MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS           = IBM_UNDEFINED
             CALL FACE_DEALLOC(NM,NCUTFACE)
             ! This is a cut-face, allocate space:
             NCUTFACE = NCUTFACE-1
             IF (BNDINT_FLAG) THEN
                MESHES(NM)%N_CUTFACE_MESH   = NCUTFACE
             ELSE
                MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH - 1
             ENDIF
         ENDIF

      ENDDO ! I
   ENDDO ! J
ENDDO ! K

! Now process special cells of type CELLRT=T:
! Loop on Cartesian cells, define cut cells and solid cells IBM_CGSC:
DO K=KLO,KHI
   DO J=JLO,JHI
      DO I=ILO,IHI

         IF ( MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) /= IBM_CUTCFE ) CYCLE

         IF (.NOT.CELLRT(I,J,K)) CYCLE ! Special cell with bod-bod or self intersection.

         IF (IJK_COUNTED(I,J,K)) CYCLE; IJK_COUNTED(I,J,K)=.TRUE.

         ! Start cut-cell INB cut-faces computation:
         ! Loop local arrays to cell:
         NSEG      = 0
         SEG_CELL  = IBM_UNDEFINED

         NVERT     = 0
         NFACE     = 0
         XYZVERT   = 0._EB

         ! CUT_EDGE index of bounding Cartesian faces:
         CEIB_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_IDCE,IAXIS)
         CEIB_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_IDCE,IAXIS)
         CEIB_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_IDCE,JAXIS)
         CEIB_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_IDCE,JAXIS)
         CEIB_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_IDCE,KAXIS)
         CEIB_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_IDCE,KAXIS)

         ! Cartesian Faces INBOUNDARY segments:
         DO FAXIS=IAXIS,KAXIS
            DO ILH=LOW_IND,HIGH_IND
               ! By segment: Add Vertices/Segments to local arrays:
               CEI = CEIB_XYZ(ILH,FAXIS)
               IF ( CEI > 0 ) THEN ! There are inboundary cut-edges
                  NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE1
                  DO IEDGE=1,NEDGE

                     SEG(NOD1:NOD2) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,IEDGE)
                     STRI(1:IBM_MAX_WSTRIANG_SEG+2) = &
                     MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,IEDGE)

                     ! x,y,z of node 1:
                     XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD1))
                     CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD1,XYZVERT)
                     ! x,y,z of node 2:
                     XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(IAXIS:KAXIS,SEG(NOD2))
                     CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_FACE,XYZ,NVERT,INOD2,XYZVERT)

                     VEC(NOD1:NOD2) = (HIGH_IND-ILH)*(/ INOD1, INOD2 /) + (ILH-LOW_IND)*(/ INOD2, INOD1 /)
                     VEC(NOD2+1:NOD2+IBM_MAX_WSTRIANG_SEG+2) = STRI(1:IBM_MAX_WSTRIANG_SEG+2)

                     ! Insertion ADD segment:
                     INLIST = .FALSE.
                     DO IDUM = 1,NSEG
                        DO IEQ1=1,3
                           EQUAL1 = SEG_CELL(INDVERTBOD(IEQ1),IDUM) == VEC(INDVERTBOD(IEQ1))
                           IF (.NOT.EQUAL1) EXIT
                        ENDDO
                        DO IEQ2=1,3
                           EQUAL2 = SEG_CELL(INDVERTBOD(IEQ2),IDUM) == VEC(INDVERTBOD2(IEQ2))
                           IF (.NOT.EQUAL2) EXIT
                        ENDDO
                        IF ( EQUAL1 .OR. EQUAL2 ) THEN
                           IF ( SEG_CELL(3,IDUM) > VEC(3) ) THEN
                              ! DO NOTHING:
                           ELSEIF (SEG_CELL(3,IDUM) < VEC(3)) THEN
                              SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,IDUM) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
                           ELSEIF (SEG_CELL(4,IDUM) /= VEC(4)) THEN
                              SEG_CELL(3,IDUM) = SEG_CELL(3,IDUM) + 1
                              SEG_CELL(5,IDUM) = VEC(4)
                           ENDIF
                           INLIST = .TRUE.
                           EXIT
                        ENDIF
                     ENDDO
                     IF (.NOT.INLIST) THEN
                         NSEG = NSEG + 1
                         CALL REALLOCATE_SEG_CELL
                         SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,NSEG) = VEC(1:NOD2+IBM_MAX_WSTRIANG_SEG+2)
                         SEG_POS(NSEG) = (2*ILH-3)*FAXIS
                     ENDIF
                  ENDDO
               ENDIF
            ENDDO
         ENDDO

         ! Drop segments that are unconnected:
         ALLOCATE(VERT_SEGS(1:NVERT)); VERT_SEGS(1:NVERT)=0
         DO IDUM = 1,NSEG
            VERT_SEGS(SEG_CELL(NOD1,IDUM)) = VERT_SEGS(SEG_CELL(NOD1,IDUM)) + 1
            VERT_SEGS(SEG_CELL(NOD2,IDUM)) = VERT_SEGS(SEG_CELL(NOD2,IDUM)) + 1
         ENDDO
         ALLOCATE(SEG_CELL_AUX(SIZE(SEG_CELL,DIM=1),SIZE(SEG_CELL,DIM=2)))
         SEG_CELL_AUX = SEG_CELL
         COUNT = 0
         DO IDUM = 1,NSEG
         IF ( (VERT_SEGS(SEG_CELL_AUX(NOD1,IDUM))>1) .AND. (VERT_SEGS(SEG_CELL_AUX(NOD2,IDUM))>1) ) THEN
            COUNT = COUNT + 1
            SEG_CELL(:,COUNT) = SEG_CELL_AUX(:,IDUM)
            CYCLE
         ENDIF
         ENDDO
         NSEG = COUNT
         DEALLOCATE(SEG_CELL_AUX,VERT_SEGS)

         IF (NSEG < 3 ) CYCLE

         ! Ear clipping algorithm by TRIANGLE and BODY:
         ! 1. Define closed 3D polyline:
         CALL GET_CLOSED_POLYLINES(SIZE_CEELEM_SEG_CELL,NSEG,SEG_CELL,SEG_POS,IFLG,NPOLY,ILO_POLY,NSG_POLY)
         IF (IFLG .AND. GET_CUTCELLS_VERBOSE) WRITE(LU_ERR,*) 'IFLG ~=0, could not close polyline, ',BNDINT_FLAG,': ',NM,I,J,K

         ! 2. Define triangles by Body and triangle, all triangles generated
         !    point outside of solid region:
         ALLOCATE(CFELEM(4,3*NSEG)); CFELEM = IBM_UNDEFINED; BOD_TRI(1:2,1:3*NSEG) = IBM_UNDEFINED
         CALL EAR_CLIP_CFACES(SIZE_CEELEM_SEG_CELL,NSEG,SEG_CELL,XYZVERT, &
                              I,J,K,NPOLY,ILO_POLY,NSG_POLY,NFACE,CFELEM,BOD_TRI)

         ! This is a cut-face, allocate space:
         NCUTFACE = MESHES(NM)%N_CUTFACE_MESH + MESHES(NM)%N_GCCUTFACE_MESH + 1
         IF (BNDINT_FLAG) THEN
            MESHES(NM)%N_CUTFACE_MESH = NCUTFACE
         ELSE
            MESHES(NM)%N_GCCUTFACE_MESH = MESHES(NM)%N_GCCUTFACE_MESH + 1
         ENDIF
         MESHES(NM)%CCVAR(I,J,K,IBM_IDCF) = NCUTFACE

         CALL CUT_FACE_ARRAY_REALLOC(NM,NCUTFACE)

         MESHES(NM)%CUT_FACE(NCUTFACE)%NVERT  = NVERT
         MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE  = 0
         MESHES(NM)%CUT_FACE(NCUTFACE)%IJK(1:MAX_DIM+1) = (/ I, J, K, 0 /) ! No axis = 0
         MESHES(NM)%CUT_FACE(NCUTFACE)%STATUS = IBM_INBOUNDARY

         ! Allocate cointainer arrays for cut-face NCUTFACE:
         CALL NEW_FACE_ALLOC(NM,NCUTFACE,NVERT,NFACE,NOD3+1)
         MESHES(NM)%CUT_FACE(NCUTFACE)%XYZVERT(IAXIS:KAXIS,1:NVERT) = XYZVERT(IAXIS:KAXIS,1:NVERT)

         ! Assign surf-index: Depending on GEOMETRY:
         NCF = 0
         DO ICF=1,NFACE
            IBOD = BOD_TRI(1,ICF); ITRI = BOD_TRI(2,ICF)

            ! Area properties for special cfaces:
            ! Computed from the cross product:
            D23 = XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD3,ICF)) - XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD2,ICF))
            D12 = XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD2,ICF)) - XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD1,ICF))
            CALL CROSS_PRODUCT(NORMTRI,D12,D23)
            NNORM                = NORM2(NORMTRI)
            IF (NNORM < 2._EB*GEOMEPS**2._EB) CYCLE
            NORMTRI(IAXIS:KAXIS) = NORMTRI(IAXIS:KAXIS) / NNORM

            ! First test if INB face is on Cartesian face and pointing
            ! outside of Cartesian cell. If so drop:
            XYZ(IAXIS:KAXIS) = XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD1,ICF))
            ! IAXIS:
            IF ( (ABS(NORMTRI(IAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(XFACE(I-FCELL  )-XYZ(IAXIS)) < GEOMEPS) ) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(IAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(XFACE(I-FCELL+1)-XYZ(IAXIS)) < GEOMEPS) ) CYCLE ! High Face
            ! JAXIS:
            IF ( (ABS(NORMTRI(JAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(YFACE(J-FCELL  )-XYZ(JAXIS)) < GEOMEPS) ) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(JAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(YFACE(J-FCELL+1)-XYZ(JAXIS)) < GEOMEPS) ) CYCLE ! High Face
            ! KAXIS:
            IF ( (ABS(NORMTRI(KAXIS)+1._EB) < GEOMEPS) .AND. &
                 (ABS(ZFACE(K-FCELL  )-XYZ(KAXIS)) < GEOMEPS) ) CYCLE ! Low Face
            IF ( (ABS(NORMTRI(KAXIS)-1._EB) < GEOMEPS) .AND. &
                 (ABS(ZFACE(K-FCELL+1)-XYZ(KAXIS)) < GEOMEPS) ) CYCLE ! High Face

            ! Area:
            AREA  = 0.5_EB*NNORM

            ! Face Vertices average location:
            ACEN(IAXIS:KAXIS) = 1._EB/3._EB*(XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD1,ICF)) + &
                                             XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD2,ICF)) + &
                                             XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD3,ICF)))

            ! dot(i,nc) int(x)dA
            INXAREA = NORMTRI(IAXIS)*ACEN(IAXIS)*AREA ! Single Gauss pt integration.

            XC1(IAXIS:KAXIS) = 0.5_EB*(XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD2,ICF)) + &
                                       XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD3,ICF)))  ! X23
            XC2(IAXIS:KAXIS) = 0.5_EB*(XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD1,ICF)) + &
                                       XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD3,ICF)))
            X12(IAXIS:KAXIS) = 0.5_EB*(XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD1,ICF)) + &
                                       XYZVERT(IAXIS:KAXIS,CFELEM(1+NOD2,ICF)))
            ! dot(i,nc) int(x^2)dA, dot(j,nc) int(y^2)dA, dot(k,nc) int(z^2)dA
            SQAREA(IAXIS:KAXIS) = 0._EB
            DO IX=IAXIS,KAXIS
                INT2 = (XC1(IX)**2._EB + XC2(IX)**2._EB + X12(IX)**2._EB) / 3._EB
                SQAREA(IX) = SQAREA(IX) + NORMTRI(IX)*INT2*AREA  ! Midpoint rule.
            ENDDO

            NCF = NCF + 1
            MESHES(NM)%CUT_FACE(NCUTFACE)%AREA(NCF) = AREA
            MESHES(NM)%CUT_FACE(NCUTFACE)%XYZCEN(IAXIS:KAXIS,NCF) = ACEN(IAXIS:KAXIS)

            ! Fields for cut-cell volume/centroid computation:
            ! dot(i,nc)*int(x)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXAREA(NCF)   = INXAREA
            ! dot(i,nc)*int(x^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%INXSQAREA(NCF) = SQAREA(IAXIS)
            ! dot(j,nc)*int(y^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%JNYSQAREA(NCF) = SQAREA(JAXIS)
            ! dot(k,nc)*int(z^2)dA:
            MESHES(NM)%CUT_FACE(NCUTFACE)%KNZSQAREA(NCF) = SQAREA(KAXIS)

            ! Define Body-triangle reference:
            MESHES(NM)%CUT_FACE(NCUTFACE)%BODTRI(1:2,NCF)= (/ IBOD, ITRI /)

            MESHES(NM)%CUT_FACE(NCUTFACE)%SURF_INDEX(NCF) = GEOMETRY(IBOD)%SURFS(ITRI)

            ! All faces connectivities:
            MESHES(NM)%CUT_FACE(NCUTFACE)%CFELEM(1:1+NOD3,NCF) = CFELEM(1:1+NOD3,ICF)

         ENDDO
         DEALLOCATE(CFELEM)
         MESHES(NM)%CUT_FACE(NCUTFACE)%NFACE = NCF
      ENDDO ! I
   ENDDO ! J
ENDDO ! K

IF (.NOT.BNDINT_FLAG) DEALLOCATE(IJK_COUNTED,IJK_COUNTF)
DEALLOCATE(SEG_CELL,SEG_POS)

T_CC_USED(GET_CARTCELL_CUTFACES_TIME_INDEX) = T_CC_USED(GET_CARTCELL_CUTFACES_TIME_INDEX) + CURRENT_TIME() - TNOW

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   NCUTFCE = 0
   IF (BNDINT_FLAG) THEN
      DO ICF=1,MESHES(NM)%N_CUTFACE_MESH
         IF (MESHES(NM)%CUT_FACE(ICF)%STATUS  /= IBM_INBOUNDARY) CYCLE
         NCUTFCE = NCUTFCE + MESHES(NM)%CUT_FACE(ICF)%NFACE
      ENDDO
   ELSE
      DO ICF=MESHES(NM)%N_CUTFACE_MESH+1,MESHES(NM)%N_CUTFACE_MESH+MESHES(NM)%N_GCCUTFACE_MESH
         IF (MESHES(NM)%CUT_FACE(ICF)%STATUS  /= IBM_INBOUNDARY) CYCLE
         NCUTFCE = NCUTFCE + MESHES(NM)%CUT_FACE(ICF)%NFACE
      ENDDO
   ENDIF
   WRITE(LU_SETCC,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-faces : ',NCUTFCE,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-faces : ',NCUTFCE,'. '
   ENDIF
ENDIF

RETURN

CONTAINS

SUBROUTINE REALLOCATE_SEG_CELL

IF(NSEG > SIZE_CEELEM_SEG_CELL) THEN
   ! First SEG_CELL
   ALLOCATE(SEG_CELL_AUX(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL+DELTA_EDGE)); SEG_CELL_AUX = IBM_UNDEFINED
   SEG_CELL_AUX(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL) = &
       SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL)
   DEALLOCATE(SEG_CELL); ALLOCATE(SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL+DELTA_EDGE))
   SEG_CELL(:,:) = SEG_CELL_AUX(:,:)
   ! Then SEG_POS:
   SEG_CELL_AUX(1,1:SIZE_CEELEM_SEG_CELL) = SEG_POS(1:SIZE_CEELEM_SEG_CELL)
   DEALLOCATE(SEG_POS); ALLOCATE(SEG_POS(1:SIZE_CEELEM_SEG_CELL+DELTA_EDGE))
   SEG_POS(:) = SEG_CELL_AUX(1,:)
   SIZE_CEELEM_SEG_CELL = SIZE_CEELEM_SEG_CELL + DELTA_EDGE
   DEALLOCATE(SEG_CELL_AUX)
ENDIF

RETURN
END SUBROUTINE REALLOCATE_SEG_CELL

END SUBROUTINE GET_CARTCELL_CUTFACES


! ------------------------ GET_CLOSED_POLYLINES ---------------------------------

SUBROUTINE GET_CLOSED_POLYLINES(SIZE_CEELEM_SEG_CELL,NSEG,SEG_CELL,SEG_POS,IFLG,NPOLY,ILO_POLY,NSG_POLY)

INTEGER, INTENT(IN)    :: SIZE_CEELEM_SEG_CELL
INTEGER, INTENT(INOUT) :: NSEG
INTEGER, INTENT(INOUT) :: SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL)
INTEGER, INTENT(INOUT) :: SEG_POS(1:SIZE_CEELEM_SEG_CELL)
LOGICAL, INTENT(OUT):: IFLG
INTEGER, INTENT(OUT):: NPOLY,ILO_POLY(1:MAX_CELL_POLYLINES),NSG_POLY(1:MAX_CELL_POLYLINES)

! Local Variables:
INTEGER :: ISEG, ISEG2, CISEG, MIBOD, NBOD, NEWSEG, SEG_LEFT, ILO, IHI, CT, IBOD, IPOLY, PIVNOD, STNOD, COUNT
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: SEG_CELL2
INTEGER, ALLOCATABLE, DIMENSION(:)   :: SEG_POS2, COUNTED, BOD, SEG_POLY, CTBOD
LOGICAL :: FOUNDSEG, FOUND_CHG, INLIST

IFLG=.TRUE.
ALLOCATE(SEG_CELL2(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:NSEG),SEG_POS2(1:NSEG),COUNTED(1:NSEG),&
         BOD(1:N_GEOMETRY),SEG_POLY(1:NSEG))
SEG_CELL2 = 0; SEG_POS2 =0; COUNTED = 0; BOD=0

! First collapse segments to most frequent body:
NBOD      = 1
BOD(NBOD) = SEG_CELL(6,1)
DO ISEG=2,NSEG
    INLIST =.FALSE.
    DO IBOD=1,NBOD
        IF (SEG_CELL(6,ISEG) == BOD(IBOD)) THEN
           INLIST=.TRUE.
           EXIT
        ENDIF
    ENDDO
    IF (.NOT.INLIST) THEN
        NBOD=NBOD+1
        BOD(NBOD)=SEG_CELL(6,ISEG)
    ENDIF
ENDDO
ALLOCATE(CTBOD(1:NBOD)); CTBOD = 0
DO IBOD=1,NBOD
    DO ISEG=1,NSEG
        IF (SEG_CELL(6,ISEG) == BOD(IBOD)) CTBOD(IBOD) = CTBOD(IBOD) + 1
    ENDDO
ENDDO
MIBOD=MAXLOC(CTBOD(1:NBOD),DIM=1); DEALLOCATE(CTBOD)

DO ISEG=1,NSEG
   IF (COUNTED(ISEG)/=0) CYCLE
   CISEG = 0
   DO ISEG2=1,NSEG
      IF (COUNTED(ISEG2)/=0) CYCLE
      IF ( ISEG2==ISEG ) CYCLE
      IF ( (SEG_CELL(NOD1,ISEG)==SEG_CELL(NOD1,ISEG2)) .AND. (SEG_CELL(NOD2,ISEG)==SEG_CELL(NOD2,ISEG2)) ) THEN
         IF (SEG_CELL(6,ISEG)==BOD(MIBOD)) THEN
            ! ISEG should be COUNTED +1; ISEG2 -1.
            COUNTED(ISEG) = 1
            COUNTED(ISEG2)=-1
            CISEG         = 1
         ELSE
            ! ISEG should be COUNTED -1; ISEG2 +1.
            COUNTED(ISEG) =-1
            COUNTED(ISEG2)= 1
            CISEG         = 1
         ENDIF
      ENDIF
   ENDDO
   IF (CISEG==0) COUNTED(ISEG) = 1
ENDDO

NEWSEG = 0
DO ISEG=1,NSEG
   IF (COUNTED(ISEG)/=1) CYCLE
   NEWSEG              = NEWSEG + 1
   SEG_CELL2(:,NEWSEG) = SEG_CELL(:,ISEG)
   SEG_POS2(NEWSEG)    = SEG_POS(ISEG)
ENDDO
NSEG     = NEWSEG
SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:NSEG) = SEG_CELL2(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:NSEG)
SEG_POS(1:NSEG)  = SEG_POS2(1:NSEG)

! Now make closed polylines:
SEG_CELL2 = 0; SEG_POS2 =0; COUNTED = 0;
NPOLY     = 0; ILO_POLY  = 0; NSG_POLY  = 0; SEG_POLY  = 0; ! Polyline number for the segment.
SEG_LEFT  = NSEG
DO ! This exterior while loop defined closed polylines in the cell.
   ! Count one more polyline:
   NPOLY = NPOLY + 1
   IF (NPOLY==1) THEN
      ILO_POLY(NPOLY) = 0
   ELSE
      ILO_POLY(NPOLY) = ILO_POLY(NPOLY-1) + NSG_POLY(NPOLY-1)
   ENDIF

   ! Find first segment of next polyline:
   FOUNDSEG = .FALSE.
   DO ISEG=1,NSEG
      IF (COUNTED(ISEG) == 0) THEN
         FOUNDSEG = .TRUE.
         EXIT
      ENDIF
   ENDDO
   IF (.NOT.FOUNDSEG) EXIT ! Escape if there are no new segments.

   ! Create new closed polyline:
   NEWSEG              = ILO_POLY(NPOLY) + 1
   SEG_CELL2(:,NEWSEG) = SEG_CELL(:,ISEG)
   SEG_POS2(NEWSEG)    = SEG_POS(ISEG)
   COUNTED(ISEG)       = 1
   STNOD               = SEG_CELL2(NOD1,NEWSEG)
   PIVNOD              = SEG_CELL2(NOD2,NEWSEG) ! Pivot Vertex, used to find next segment.
   NSG_POLY(NPOLY)     = NSG_POLY(NPOLY) + 1
   SEG_POLY(NEWSEG)    = NPOLY
   SEG_LEFT            = SEG_LEFT - 1
   DO NEWSEG = ILO_POLY(NPOLY)+2,NSEG
      FOUNDSEG = .FALSE.
      DO ISEG=1,NSEG
         IF (COUNTED(ISEG) > 0) CYCLE
         IF (SEG_CELL(NOD1,ISEG)==PIVNOD) THEN ! Found the next segment
            FOUNDSEG            = .TRUE.
            SEG_CELL2(:,NEWSEG) = SEG_CELL(:,ISEG)
            SEG_POS2(NEWSEG)    = SEG_POS(ISEG)
            COUNTED(ISEG)       = 1
            PIVNOD              = SEG_CELL2(NOD2,NEWSEG); ! Pivot Vertex, used to find next segment.
            NSG_POLY(NPOLY)     = NSG_POLY(NPOLY) + 1
            SEG_POLY(NEWSEG)    = NPOLY;
            SEG_LEFT            = SEG_LEFT - 1
            EXIT
         ELSEIF (SEG_CELL(NOD2,ISEG)==PIVNOD) THEN ! Found the next segment
            FOUNDSEG            = .TRUE.
            SEG_CELL2(:,NEWSEG) = (/ SEG_CELL(NOD2,ISEG), SEG_CELL(NOD1,ISEG), SEG_CELL(3:6,ISEG) /)
            SEG_POS2(NEWSEG)    = SEG_POS(ISEG)
            COUNTED(ISEG)       = 1
            PIVNOD              = SEG_CELL2(NOD2,NEWSEG) ! Pivot Vertex, used to find next segment.
            NSG_POLY(NPOLY)     = NSG_POLY(NPOLY) + 1
            SEG_POLY(NEWSEG)    = NPOLY
            SEG_LEFT            = SEG_LEFT - 1
            EXIT
         ENDIF
      ENDDO
      ! Check if for this NEWSEG we didn't find an ISEG:
      IF (.NOT.FOUNDSEG) EXIT
   ENDDO
   ! Finally, test if polyline is closed:
   IF ( SEG_CELL2(NOD2,ILO_POLY(NPOLY)+NSG_POLY(NPOLY)) /= STNOD ) RETURN

   ! End of new polyline creation.
   ! Here if we have less that 3 segments not counted exit while loop.
   IF (SEG_LEFT < 3) EXIT
ENDDO

! Per polyline, move last SEG if SEG-1 is different body number:
DO IPOLY=1,NPOLY
   FOUND_CHG=.FALSE.
   ILO      =ILO_POLY(IPOLY)+1
   IHI      =ILO_POLY(IPOLY)+NSG_POLY(IPOLY)
   CT       =0
   DO ISEG=ILO,IHI-1
      CT=CT+1
      IF (SEG_CELL2(6,ISEG) /= SEG_CELL2(6,ISEG+1)) THEN
         FOUND_CHG=.TRUE.
         EXIT
      ENDIF
   ENDDO
   IF (FOUND_CHG) THEN
      SEG_CELL(:,ILO:IHI-CT)      = SEG_CELL2(:,ISEG+1:IHI)
      SEG_POS(ILO:IHI-CT)         = SEG_POS2(ISEG+1:IHI)
      SEG_CELL(:,IHI-CT+1:IHI)    = SEG_CELL2(:,ILO:ISEG)
      SEG_POS(IHI-CT+1:IHI)       = SEG_POS2(ILO:ISEG)
   ELSE
      SEG_CELL(:,ILO:IHI)         = SEG_CELL2(:,ILO:IHI)
      SEG_POS(ILO:IHI)            = SEG_POS2(ILO:IHI)
   ENDIF
ENDDO

! Finally cycle segments to redefine polylines (case of two or more polys
! sharing one point.
STNOD=SEG_CELL(NOD1,1)
NPOLY=1; COUNT=1
DO ISEG=2,NSEG
   COUNT=COUNT+1
   SEG_POLY(ISEG)=NPOLY
   IF (SEG_CELL(NOD2,ISEG)==STNOD) THEN
       NSG_POLY(NPOLY) = COUNT
       IF (ISEG==NSEG) EXIT
       NPOLY=NPOLY+1
       ILO_POLY(NPOLY) = ILO_POLY(NPOLY-1) + NSG_POLY(NPOLY-1)
       COUNT=0; STNOD=SEG_CELL(NOD1,ISEG+1)
   ENDIF
ENDDO

DEALLOCATE(SEG_CELL2,SEG_POS2,COUNTED,BOD,SEG_POLY)

IFLG=.FALSE.

RETURN
END SUBROUTINE GET_CLOSED_POLYLINES


! --------------------------- EAR_CLIP_CFACES -----------------------------------

SUBROUTINE EAR_CLIP_CFACES(SIZE_CEELEM_SEG_CELL,NSEG,SEG_CELL,XYZVERT,&
                           INDIF,INDJF,INDKF,NPOLY,ILO_POLY,NSG_POLY,NFACE,CFELEM,BOD_TRI)

INTEGER, INTENT(IN) :: SIZE_CEELEM_SEG_CELL
INTEGER, INTENT(IN) :: NSEG, INDIF, INDJF, INDKF, NPOLY
INTEGER, INTENT(IN) :: ILO_POLY(1:MAX_CELL_POLYLINES),NSG_POLY(1:MAX_CELL_POLYLINES)
INTEGER, INTENT(IN) :: SEG_CELL(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:SIZE_CEELEM_SEG_CELL)
REAL(EB),INTENT(IN) :: XYZVERT(IAXIS:KAXIS,1:IBM_MAXVERTS_FACE)
INTEGER, INTENT(OUT):: NFACE,CFELEM(4,3*NSEG),BOD_TRI(1:2,1:IBM_MAXCFELEM_FACE)


! Local Variables:
REAL(EB) :: DV(IAXIS:KAXIS), NP(IAXIS:KAXIS), XP(IAXIS:KAXIS)
REAL(EB), ALLOCATABLE, DIMENSION(:)   :: LEN_SEG
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: N
INTEGER,  ALLOCATABLE, DIMENSION(:,:) :: SEG_CELL2
LOGICAL :: SEG_FLAG(1:MAX_CELL_POLYLINES), FOUND_ISEG1, IS_SOLID, TWOTRI
INTEGER :: ILO, IHI, NSGP, LEFT_SEGS, COUNTEXT, COUNT, BOD, TRI, ISEG, ISEG1, IPOLY, XAXIS
INTEGER :: CONN(1:3)

ALLOCATE(LEN_SEG(1:3*NSEG));                                   LEN_SEG = 0._EB
ALLOCATE(N(IAXIS:KAXIS,1:3*NSEG));                                   N = 0._EB
ALLOCATE(SEG_CELL2(1:NOD2+IBM_MAX_WSTRIANG_SEG+2,1:3*NSEG)); SEG_CELL2 = 0

! Compute segments director unit vectors and normals:
DO ISEG=1,NSEG
   DV  = XYZVERT(IAXIS:KAXIS,SEG_CELL(NOD2,ISEG)) - XYZVERT(IAXIS:KAXIS,SEG_CELL(NOD1,ISEG))
   LEN_SEG(ISEG) = NORM2(DV)
   N(IAXIS:KAXIS,ISEG) = 1._EB/LEN_SEG(ISEG) * DV
ENDDO

! First sweep across segments defining triangles for all consecutive segments with same triangle and body:
NFACE     = 0
! Ear clipping algorithm by polyline:
DO IPOLY=1,NPOLY
   ILO                 = ILO_POLY(IPOLY)+1
   NSGP                = NSG_POLY(IPOLY)
   IHI                 = ILO_POLY(IPOLY)+NSGP
   SEG_CELL2(:,1:NSGP) = SEG_CELL(:,ILO:IHI)
   SEG_FLAG(1:NSGP)    = .FALSE.
   LEFT_SEGS           = NSGP
   DO COUNTEXT=1,3  ! Search segmets first that belong to same triangle (1),
                    ! second that belong to same body (2), third all the rest.
      DO COUNT=1,2 ! Search first last uncounted segment (1), second the rest.
        IF (LEFT_SEGS < 3) EXIT ! should break out of COUNTEXT loop.
        IF (COUNT==1) THEN
           ISEG  = NSGP-1
           DO ISEG1=1,NSGP
              IF (.NOT.SEG_FLAG(ISEG1)) EXIT
           ENDDO
        ELSE
           ISEG  = 0
        ENDIF
        DO WHILE (ISEG < NSGP)
           ISEG = ISEG + 1
           IF (SEG_FLAG(ISEG)) CYCLE
           FOUND_ISEG1 =.FALSE.
           IF (COUNT==1) THEN
              IF (.NOT.SEG_FLAG(ISEG1)) FOUND_ISEG1 =.TRUE.
           ELSE
              DO ISEG1=ISEG+1,NSGP
                 IF (.NOT.SEG_FLAG(ISEG1)) THEN
                    FOUND_ISEG1 =.TRUE.
                    EXIT
                 ENDIF
              ENDDO
           ENDIF
           IF(.NOT.FOUND_ISEG1) CYCLE

           TRI   = 0
           ! Test if triangle given by ISEG ISEG+1 DIAG is valid.
           ! First, drop if Body not the same:
           IF ( (COUNTEXT<3) .AND. (SEG_CELL2(6,ISEG)/=SEG_CELL2(6,ISEG1)) ) CYCLE

           ! Second, drop if segments are on the same line:
           IF (ABS(ABS(DOT_PRODUCT(N(IAXIS:KAXIS,ISEG),N(IAXIS:KAXIS,ISEG1)))-1._EB) < 1.e-12_EB) CYCLE

           ! Now drop if triangles don't match:
           TWOTRI = .FALSE.
           IF (COUNTEXT<3) THEN
              IF( (SEG_CELL2(4,ISEG)/=0) .AND. (SEG_CELL2(4,ISEG)==SEG_CELL2(4,ISEG1) .OR. &
                                                SEG_CELL2(4,ISEG)==SEG_CELL2(5,ISEG1)) ) THEN
                 TWOTRI = .TRUE.
                 TRI    = SEG_CELL2(4,ISEG)
                 BOD    = SEG_CELL2(6,ISEG)
              ELSEIF ( (SEG_CELL2(5,ISEG)/=0) .AND. (SEG_CELL2(5,ISEG)==SEG_CELL2(4,ISEG1) .OR. &
                                                     SEG_CELL2(5,ISEG)==SEG_CELL2(5,ISEG1)) ) THEN
                 TWOTRI = .TRUE.
                 TRI    = SEG_CELL2(5,ISEG)
                 BOD    = SEG_CELL2(6,ISEG)
              ENDIF
           ENDIF
           IF ( (COUNTEXT/=1) .AND. (TRI==0) ) THEN
              ! Define TRI as the longest seg one:
              IF ( LEN_SEG(ISEG) >= LEN_SEG(ISEG1) ) THEN
                 TRI = SEG_CELL2(4,ISEG)
                 BOD = SEG_CELL2(6,ISEG)
              ELSE
                 TRI = SEG_CELL2(4,ISEG1)
                 BOD = SEG_CELL2(6,ISEG1)
              ENDIF
           ENDIF

           IF ( TRI == 0 ) THEN
              CYCLE
           ELSE ! Found two segments with matching triangle.

              ! Test that triangle found is not internal to GEOMs:
              CONN(1:3) = (/ SEG_CELL2(1:2,ISEG), SEG_CELL2(2,ISEG1) /)
              IF (TWOTRI) THEN
                 NP(IAXIS:KAXIS)=GEOMETRY(BOD)%FACES_NORMAL(IAXIS:KAXIS,TRI)
                 XP(IAXIS:KAXIS)=1._EB/3._EB*(XYZVERT(IAXIS:KAXIS,CONN(NOD1))  + &
                                              XYZVERT(IAXIS:KAXIS,CONN(NOD2))  + &
                                              XYZVERT(IAXIS:KAXIS,CONN(NOD3))) + 10._EB*GEOMEPS*NP(IAXIS:KAXIS)
                 XAXIS = MAXLOC(ABS(NP(IAXIS:KAXIS)),DIM=1)
                 CALL GET_IS_SOLID_3D(XAXIS,XP,INDIF,INDJF,INDKF,IS_SOLID)
                 IF (IS_SOLID) CYCLE
              ENDIF

              NFACE = NFACE + 1
              CFELEM(1:4,NFACE)   = (/ 3, CONN(1:3) /)
              BOD_TRI(1:2,NFACE)   = (/ BOD, TRI /)
              SEG_CELL2(1:6,ISEG) = (/ SEG_CELL2(1,ISEG), SEG_CELL2(2,ISEG1), 1, TRI, 0, BOD /)
              DV   = XYZVERT(IAXIS:KAXIS,SEG_CELL2(2,ISEG))-XYZVERT(IAXIS:KAXIS,SEG_CELL2(1,ISEG))
              LEN_SEG(ISEG) = NORM2(DV)
              IF(LEN_SEG(ISEG) < GEOMEPS) CYCLE
              N(IAXIS:KAXIS,ISEG) = 1._EB/LEN_SEG(ISEG) * DV

              ! Erase Segment ISEG1:
              SEG_CELL2(:,ISEG1)  = 0
              SEG_FLAG(ISEG1)     = .TRUE.
              N(IAXIS:KAXIS,ISEG1)= 0._EB
              LEFT_SEGS           = LEFT_SEGS - 1
              IF (COUNT/=1)  ISEG = ISEG - 1
            ENDIF
         ENDDO
      ENDDO
   ENDDO
ENDDO
DEALLOCATE(LEN_SEG,N,SEG_CELL2)

RETURN
END SUBROUTINE EAR_CLIP_CFACES

! ----------------------- GET_CARTCELL_CUTCELLS ---------------------------------

SUBROUTINE GET_CARTCELL_CUTCELLS(NM)

INTEGER, INTENT(IN) :: NM

! Local Variables:
INTEGER  :: I, II, J, JJ, K, ILO, IHI, JLO, JHI, KLO, KHI
INTEGER, DIMENSION(LOW_IND:HIGH_IND,IAXIS:KAXIS) :: FSID_XYZ, IDCF_XYZ
INTEGER  :: NVERT_CELL, NSEG_CELL, NFACE_CELL, NCELL
INTEGER  :: IED, JED, KED, MYAXIS, SIDE
REAL(EB), DIMENSION(IAXIS:KAXIS,NOD1:NOD4,LOW_IND:HIGH_IND) :: XYZLH
REAL(EB) :: AREAI, AREAVARSI(1:MAX_DIM+1,LOW_IND:HIGH_IND), FCT, XYZ(IAXIS:KAXIS), XYZC(IAXIS:KAXIS)
INTEGER  :: CEI_AXIS(LOW_IND:HIGH_IND)
INTEGER  :: IP, NP, ICF, CEI, INOD, FNOD
REAL(EB), DIMENSION(IAXIS:KAXIS,1:IBM_MAXVERTS_CELL)            ::   XYZVERT

INTEGER, ALLOCATABLE, DIMENSION(:,:) :: SEG_CELL,SEG_CELL_AUX,EDGFAC_CELL,EDGFAC_CELL_AUX
INTEGER, SAVE :: SIZE_CEELEM_EDGFAC, SIZE_CFELEM_EDGFAC
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: FACEDG_CELL,FACEDG_CELL_AUX
INTEGER, SAVE :: SIZE_CEELEM_FACEDG, SIZE_CFELEM_FACEDG

INTEGER, ALLOCATABLE, DIMENSION(:,:) :: FACE_CELL,FACE_CELL_AUX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: FACE_LIST,FACE_LIST_AUX,SPCELL_LIST
REAL(EB), ALLOCATABLE, DIMENSION(:,:):: AREAVARS,AREAVARS_AUX
INTEGER, ALLOCATABLE, DIMENSION(:) :: FACECELL_NUM
INTEGER, ALLOCATABLE, DIMENSION(:) :: FACE_CELL_DUM
INTEGER, SAVE :: SIZE_VERTS_FC, SIZE_CFELEM_FC

INTEGER, ALLOCATABLE, DIMENSION(:) :: IPTS

INTEGER, SAVE :: SIZE_FACE_CCELEM, SIZE_CELL_CCELEM
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: CCELEM
REAL(EB),ALLOCATABLE, DIMENSION(:,:) :: XYZCEN
REAL(EB),ALLOCATABLE, DIMENSION(:)   :: VOL ! Cut-cell volumes.

INTEGER :: IFACE, IEDGE, ISEG, SEG(NOD1:NOD2), ICELL, NFACEI
LOGICAL :: INLIST, TEST1, TEST2, NEWFACE
INTEGER :: NIEDGE, NEF, LOCSEG, JFACE, KFACE, NFACEK, NUM_FACE, NCUTCELL, NCFACE_CUTCELL
INTEGER :: DFCT, CFELEM(5), CTVAL, CTVAL2, IBOD, ITRI, IDCF, MAXSEG, N_GAS_CFACES, NIBFACE, THRES, NSPCELL_LIST
LOGICAL :: CYCLE_CELL

INTEGER :: IBNDINT
LOGICAL, ALLOCATABLE, SAVE, DIMENSION(:,:,:) :: IJK_COUNT
REAL(EB) :: TNOW

! GET_CUTCELLS_VERBOSE variables:
REAL(EB) :: CPUTIME, CPUTIME_START
INTEGER :: NCUTCEL

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME_START)
   WRITE(LU_SETCC,'(A,I10,A)',advance='no') ' Generating            CARTCELL_CUTCELLS for mesh :',NM,' ..'
   IF (MY_RANK==0) WRITE(LU_ERR,'(A,I10,A)',advance='no') ' Generating            CARTCELL_CUTCELLS for mesh :',NM,' ..'
ENDIF

TNOW=CURRENT_TIME()

! Allocate work arrays for this mesh:
SIZE_CEELEM_EDGFAC = DELTA_EDGE
SIZE_CFELEM_EDGFAC = DELTA_FACE
ALLOCATE(EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC))
ALLOCATE(SEG_CELL(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC))

SIZE_CEELEM_FACEDG = DELTA_EDGE
SIZE_CFELEM_FACEDG = DELTA_FACE
ALLOCATE(FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG))
ALLOCATE(IPTS(1:SIZE_CEELEM_FACEDG+1)) ! Note that SIZE_CEELEM_FACEDG should be ~= SIZE_VERTS_FC.
                                       ! (we have equal number of vertices and edges for a closed polygon.)

SIZE_VERTS_FC  = DELTA_VERT
SIZE_CFELEM_FC = DELTA_FACE
ALLOCATE(FACE_CELL(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC))
ALLOCATE(FACE_LIST(1:IBM_NPARAM_CCFACE,1:SIZE_CFELEM_FC))
ALLOCATE(AREAVARS(1:MAX_DIM+1,1:SIZE_CFELEM_FC))
ALLOCATE(FACECELL_NUM(1:SIZE_CFELEM_FC))
ALLOCATE(FACE_CELL_DUM(1:SIZE_VERTS_FC))

SIZE_FACE_CCELEM = DELTA_FACE
SIZE_CELL_CCELEM = DELTA_CELL
ALLOCATE(CCELEM(1:SIZE_FACE_CCELEM+1,1:SIZE_CELL_CCELEM))
ALLOCATE(VOL(1:SIZE_CELL_CCELEM),XYZCEN(IAXIS:KAXIS,1:SIZE_CELL_CCELEM))

! Definition of cut-cells:
! For each cartesian cell being cut into one or several cut-cells (NCELL), fill
! entries on a MESHES(NM)%CUT_CELL struct. On each local entry ICC:
! - Add number of faces that are boundary of cut-cell.
!    MESHES(NM)%CUT_CELL(ICELL)%CCELEM(1:NFACE_CELL+1,ICC), ICC=1,...,MESHES(NM)%CUT_CELL(ICELL)%NCELL
! - Add list of corresponding regular faces, or cut-faces in CUT_FACE:
!    + 5 Indexes:
!    MESHES(NM)%CUT_CELL(ICELL)%FACES_LIST = [ FACE_TYPE      LOW/HIGH      AXIS       cei      icf   ]
!                                                  where in MESHES(NM)%CUT_FACE(CEI), which icf.
! - Compute Volume properties for each disjoint volume, add an unknown
!   number for scalars, pressure, etc.

IBNDINT_LOOP : DO IBNDINT=LOW_IND,HIGH_IND    ! 1 refers to blocks internal cells, 2 refers to block guard cells.

SELECT CASE(IBNDINT)
CASE(LOW_IND)
   ALLOCATE(IJK_COUNT(ILO_CELL-NGUARD:IHI_CELL+NGUARD,JLO_CELL-NGUARD:JHI_CELL+NGUARD,KLO_CELL-NGUARD:KHI_CELL+NGUARD))
   IJK_COUNT = .FALSE.
   ILO = ILO_CELL; IHI = IHI_CELL
   JLO = JLO_CELL; JHI = JHI_CELL
   KLO = KLO_CELL; KHI = KHI_CELL
CASE(HIGH_IND)
   ILO = ILO_CELL-CCGUARD; IHI = IHI_CELL+CCGUARD
   JLO = JLO_CELL-CCGUARD; JHI = JHI_CELL+CCGUARD
   KLO = KLO_CELL-CCGUARD; KHI = KHI_CELL+CCGUARD
END SELECT

! Loop on Cartesian cells, define cut cells and solid cells IBM_CGSC:
DO K=KLO,KHI
   DO J=JLO,JHI
      DO I=ILO,IHI

         IF( MESHES(NM)%CCVAR(I,J,K,IBM_CGSC) /= IBM_CUTCFE ) CYCLE

         IF( IJK_COUNT(I,J,K) ) CYCLE; IJK_COUNT(I,J,K) = .TRUE.

         ! Start with Cartesian Faces:
         ! Face type of bounding Cartesian faces:
         FSID_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_FGSC,IAXIS)
         FSID_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_FGSC,JAXIS)
         FSID_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_FGSC,JAXIS)
         FSID_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_FGSC,KAXIS)
         FSID_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_FGSC,KAXIS)

         ! Cut-face number of bounding Cartesian faces:
         IDCF_XYZ(LOW_IND ,IAXIS) = MESHES(NM)%FCVAR(I-FCELL  ,J,K,IBM_IDCF,IAXIS)
         IDCF_XYZ(HIGH_IND,IAXIS) = MESHES(NM)%FCVAR(I-FCELL+1,J,K,IBM_IDCF,IAXIS)
         IDCF_XYZ(LOW_IND ,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL  ,K,IBM_IDCF,JAXIS)
         IDCF_XYZ(HIGH_IND,JAXIS) = MESHES(NM)%FCVAR(I,J-FCELL+1,K,IBM_IDCF,JAXIS)
         IDCF_XYZ(LOW_IND ,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL  ,IBM_IDCF,KAXIS)
         IDCF_XYZ(HIGH_IND,KAXIS) = MESHES(NM)%FCVAR(I,J,K-FCELL+1,IBM_IDCF,KAXIS)

         ! Local variables:
         ! Geometric entities related to the Cartesian cell:
         NVERT_CELL = 0
         NSEG_CELL  = 0
         NFACE_CELL = 0
         SEG_CELL   = IBM_UNDEFINED
         FACE_CELL  = IBM_UNDEFINED
         FACE_LIST  = IBM_UNDEFINED
         XYZVERT    = 0._EB
         AREAVARS   = 0._EB

         ! Add Cartesian Regular faces + GASPHASE cut-faces + vertices:
         IED = I-FCELL; JED = J-FCELL; KED = K-FCELL
         MYAXIS_LOOP : DO MYAXIS=IAXIS,KAXIS
            SELECT CASE(MYAXIS)
            CASE(IAXIS)

               XYZLH(IAXIS:KAXIS,NOD1,LOW_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD2,LOW_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD3,LOW_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD4,LOW_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)

               XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)

               AREAI    = DYCELL(J) * DZCELL(K)
               AREAVARSI(1:MAX_DIM+1,LOW_IND) =(/-XFACE(IED  )*AREAI, -XFACE(IED  )**2._EB*AREAI, 0._EB, 0._EB /)
               AREAVARSI(1:MAX_DIM+1,HIGH_IND)=(/ XFACE(IED+1)*AREAI,  XFACE(IED+1)**2._EB*AREAI, 0._EB, 0._EB /)
            CASE(JAXIS)

               XYZLH(IAXIS:KAXIS,NOD1,LOW_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD2,LOW_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD3,LOW_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD4,LOW_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)

               XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND)= (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND)= (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)

               AREAI    = DXCELL(I) * DZCELL(K)
               AREAVARSI(1:MAX_DIM+1,LOW_IND) =(/ 0._EB, 0._EB, -YFACE(JED  )**2._EB*AREAI, 0._EB /)
               AREAVARSI(1:MAX_DIM+1,HIGH_IND)=(/ 0._EB, 0._EB,  YFACE(JED+1)**2._EB*AREAI, 0._EB /)
            CASE(KAXIS)

               XYZLH(IAXIS:KAXIS,NOD1,LOW_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD2,LOW_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD3,LOW_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)
               XYZLH(IAXIS:KAXIS,NOD4,LOW_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)

               XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND)= (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND)= (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
               XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND)= (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)

               AREAI    = DXCELL(I) * DYCELL(J)
               AREAVARSI(1:MAX_DIM+1,LOW_IND) =(/ 0._EB, 0._EB, 0._EB, -ZFACE(KED  )**2._EB*AREAI /)
               AREAVARSI(1:MAX_DIM+1,HIGH_IND)=(/ 0._EB, 0._EB, 0._EB,  ZFACE(KED+1)**2._EB*AREAI /)
            END SELECT

            CEI_AXIS(LOW_IND:HIGH_IND) = IDCF_XYZ(LOW_IND:HIGH_IND,MYAXIS)

            DO SIDE=LOW_IND,HIGH_IND
               ! Low High face:
               IF ( FSID_XYZ(SIDE,MYAXIS) == IBM_GASPHASE ) THEN

                  ! Regular Face, build 4 vertices + face:
                  NP = 0
                  NFACE_CELL = NFACE_CELL + 1

                  ! Here, reallocate FACE_LIST, AREAVARS, FACE_CELL if NFACE_CELL > SIZE_CFELEM_FC:
                  ! Also no need to reallocate FACE_CELL vert dimension, as for regular cells vert size = 5.
                  CALL REALLOCATE_LOCAL_FC_VARS
                  FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_RGGAS, SIDE, MYAXIS, 0, 0 /)
                  ! IBM_FTYPE_RGGAS=0, regular face.
                  AREAVARS(1:MAX_DIM+1,NFACE_CELL) = AREAVARSI(1:MAX_DIM+1,SIDE)

                  ! Vertices arranged normal out of cartesian cell:
                  DO IP=NOD1,NOD4
                     ! xl,yl,zl
                     XYZ(IAXIS:KAXIS) = XYZLH(IAXIS:KAXIS,IP,SIDE)
                     CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_CELL,XYZ,NVERT_CELL,INOD,XYZVERT)

                     NP = NP + 1
                     FACE_CELL(1,NFACE_CELL)    =   NP
                     FACE_CELL(NP+1,NFACE_CELL) = INOD
                  ENDDO

               ELSEIF (FSID_XYZ(SIDE,MYAXIS) == IBM_CUTCFE ) THEN

                  FCT = REAL(2*SIDE-3,EB) !2*(side-3/2);
                  ! GasPhase CUT_FACE, add all cut-faces on these Cartesian cell + nodes:
                  CEI = CEI_AXIS(SIDE)
                  DO ICF=1,MESHES(NM)%CUT_FACE(CEI)%NFACE
                     NFACE_CELL = NFACE_CELL + 1
                     ! Here, reallocate FACE_LIST, AREAVARS, FACE_CELL if NFACE_CELL > SIZE_CFELEM_FC:
                     CALL REALLOCATE_LOCAL_FC_VARS
                     ! Also reallocate FACE_CELL vert dimension, if needed.
                     NP = MESHES(NM)%CUT_FACE(CEI)%CFELEM(1,ICF)
                     CALL REALLOCATE_FACE_CELL_VERTS

                     FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_CFGAS, SIDE, MYAXIS, CEI, ICF /)
                     ! IBM_FTYPE_CFGAS=1
                     AREAVARS(1:MAX_DIM+1,NFACE_CELL) =(/ MESHES(NM)%CUT_FACE(CEI)%INXAREA(ICF),   &
                                                          MESHES(NM)%CUT_FACE(CEI)%INXSQAREA(ICF), &
                                                          MESHES(NM)%CUT_FACE(CEI)%JNYSQAREA(ICF), &
                                                          MESHES(NM)%CUT_FACE(CEI)%KNZSQAREA(ICF) /)*FCT
                                                          ! FCT considers Normal out.
                     FACE_CELL(1,NFACE_CELL) = NP
                     DO IP=2,NP+1
                        FNOD             = MESHES(NM)%CUT_FACE(CEI)%CFELEM(IP,ICF)
                        XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_FACE(CEI)%XYZVERT(IAXIS:KAXIS,FNOD)
                        CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_CELL,XYZ,NVERT_CELL,INOD,XYZVERT)
                        FACE_CELL(IP,NFACE_CELL) = INOD
                     ENDDO
                  ENDDO
               ENDIF
            ENDDO
         ENDDO MYAXIS_LOOP

         N_GAS_CFACES = NFACE_CELL

         ! Now add INBOUNDARY faces of the cell:
         CEI = MESHES(NM)%CCVAR(I,J,K,IBM_IDCF)
         IF ( CEI > 0 ) THEN
            FCT = -1._EB
            DO ICF=1,MESHES(NM)%CUT_FACE(CEI)%NFACE
               NFACE_CELL = NFACE_CELL + 1
               ! Here, reallocate FACE_LIST, AREAVARS, FACE_CELL if NFACE_CELL > SIZE_CFELEM_FC:
               CALL REALLOCATE_LOCAL_FC_VARS
               ! Also reallocate FACE_CELL, FACE_CELL_DUM vert dimension, if needed.
               NP = MESHES(NM)%CUT_FACE(CEI)%CFELEM(1,ICF)
               CALL REALLOCATE_FACE_CELL_VERTS
               FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_CFINB, 0, 0, CEI, ICF /)
               ! IBM_FTYPE_CFINB in Cart-cell.
               AREAVARS(1:MAX_DIM+1,NFACE_CELL) = (/ MESHES(NM)%CUT_FACE(CEI)%INXAREA(ICF),   &
                                                     MESHES(NM)%CUT_FACE(CEI)%INXSQAREA(ICF), &
                                                     MESHES(NM)%CUT_FACE(CEI)%JNYSQAREA(ICF), &
                                                     MESHES(NM)%CUT_FACE(CEI)%KNZSQAREA(ICF) /)*FCT
                                                     ! Normal out of cut-cell.
               FACE_CELL(1,NFACE_CELL) = NP
               DO IP=2,NP+1
                  FNOD             = MESHES(NM)%CUT_FACE(CEI)%CFELEM(IP,ICF)
                  XYZ(IAXIS:KAXIS) = MESHES(NM)%CUT_FACE(CEI)%XYZVERT(IAXIS:KAXIS,FNOD)
                  CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_CELL,XYZ,NVERT_CELL,INOD,XYZVERT)
                  FACE_CELL(IP,NFACE_CELL) = INOD
               ENDDO
               ! At this point the face in face cell is ordered
               ! throught the normal outside the body. Reorganize
               ! to normal outside cut-cell (inside body).
               FACE_CELL_DUM(1:NP+1) = FACE_CELL(1:NP+1,NFACE_CELL)
               DO IP=2,NP+1
                  FACE_CELL(IP,NFACE_CELL) = FACE_CELL_DUM( (NP+1)+2-IP )
               ENDDO
            ENDDO
         ENDIF

         ! IF(I==14 .AND. J==2 .AND. K==6) THEN
         !    WRITE(LU_ERR,*) 'CC 1 I,J,K,INB NFACE,NFACE_CELL=',I,J,K,&
         !    MESHES(NM)%CUT_FACE(CEI)%NFACE,NFACE_CELL
         !    OPEN(666,FILE='VERTS.txt',STATUS='REPLACE')
         !    DO IP=1,NVERT_CELL
         !       WRITE(666,*) XYZVERT(1:3,IP)
         !    ENDDO
         !    CLOSE(666)
         !    IFACE=MAXVAL(FACE_CELL(1,1:NFACE_CELL))
         !    OPEN(666,FILE='FACES.txt',STATUS='REPLACE')
         !    DO IP=1,NFACE_CELL
         !       WRITE(666,*) FACE_CELL(1:IFACE+1,IP),FACE_LIST(1,IP)
         !    ENDDO
         !    CLOSE(666)
         ! ENDIF

         ! Here we have in XYZvert all the vertices that define the
         ! cut-cells within Cartesian cell I,J,K. We have the faces,
         ! boundary of said cut-cells in face_cell.
         ! We have in face_list the list of cut-cell boundary faces
         ! and if they are regular or cut-face.
         ! We want to reorder face list, such that we have the
         ! subgroups of faces that make cut-cells.

         ! Make list of edges:
         EDGFAC_CELL(:,:) = IBM_UNDEFINED
         FACEDG_CELL(:,:) = IBM_UNDEFINED

         ! Here reallocate FACEDG_CELL if NFACE_CELL > SIZE_CFELEM_FACEDG:
         IF (NFACE_CELL > SIZE_CFELEM_FACEDG) THEN
            DFCT = CEILING(REAL(NFACE_CELL-SIZE_CFELEM_FACEDG,EB)/REAL(DELTA_FACE,EB))
            ALLOCATE(FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG+DFCT*DELTA_FACE));
            FACEDG_CELL_AUX = IBM_UNDEFINED
            ! Copy data into FACEDG_CELL_AUX:
            FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG) = &
                FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG)
            ! New SIZE_CFELEM_FACEDG:
            SIZE_CFELEM_FACEDG = SIZE_CFELEM_FACEDG + DFCT*DELTA_FACE
            DEALLOCATE(FACEDG_CELL); ALLOCATE(FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG))
            ! Dump data back into FACEDG_CELL:
            FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG) = &
            FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG)
            DEALLOCATE(FACEDG_CELL_AUX)
         ENDIF

         DO IFACE=1,NFACE_CELL
            NIEDGE = FACE_CELL(1,IFACE)

            ! Here reallocate if NIEDGE > SIZE_CEELEM_FACEDG:
            IF (NIEDGE > SIZE_CEELEM_FACEDG) THEN
               DFCT = CEILING(REAL(NIEDGE-SIZE_CEELEM_FACEDG,EB)/REAL(DELTA_EDGE,EB))
               ALLOCATE(FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG+DFCT*DELTA_EDGE,1:SIZE_CFELEM_FACEDG));
               FACEDG_CELL_AUX = IBM_UNDEFINED
               ! Copy data into FACEDG_CELL_AUX:
               FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG) = &
                   FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG)
               ! New SIZE_CEELEM_FACEDG:
               SIZE_CEELEM_FACEDG = SIZE_CEELEM_FACEDG + DFCT*DELTA_EDGE
               DEALLOCATE(FACEDG_CELL); ALLOCATE(FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG))
               ! Dump data back into FACEDG_CELL:
               FACEDG_CELL(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG) = &
               FACEDG_CELL_AUX(1:SIZE_CEELEM_FACEDG,1:SIZE_CFELEM_FACEDG)
               DEALLOCATE(FACEDG_CELL_AUX)
               DEALLOCATE(IPTS); ALLOCATE(IPTS(1:SIZE_CEELEM_FACEDG+1))
            ENDIF

            IPTS(1:NIEDGE) = FACE_CELL(2:NIEDGE+1,IFACE); IPTS(NIEDGE+1) = FACE_CELL(2,IFACE)
            DO IEDGE=1,NIEDGE
               SEG(NOD1:NOD2)= (/ IPTS(IEDGE), IPTS(IEDGE+1) /)
               INLIST = .FALSE.
               DO ISEG=1,NSEG_CELL
                  TEST1 = (SEG_CELL(NOD1,ISEG) == SEG(NOD1)) .AND. (SEG_CELL(NOD2,ISEG) == SEG(NOD2))
                  TEST2 = (SEG_CELL(NOD2,ISEG) == SEG(NOD1)) .AND. (SEG_CELL(NOD1,ISEG) == SEG(NOD2))

                  IF ( TEST1 .OR. TEST2 ) THEN
                     INLIST = .TRUE.
                     EXIT
                  ENDIF
               enddo
               IF (.NOT.INLIST) THEN
                  NSEG_CELL = NSEG_CELL + 1

                  ! Test the NSEG_CELL doesn't overrun SIZE_CEELEM_EDGFAC, if so reallocate EDGFAC_CELL:
                  IF(NSEG_CELL > SIZE_CEELEM_EDGFAC) THEN
                     ! 1. EDGFAC_CELL:
                     ALLOCATE(EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC+DELTA_EDGE));
                     EDGFAC_CELL_AUX = IBM_UNDEFINED
                     ! Copy data into EDGFAC_CELL_AUX:
                     EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC) = &
                         EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC)
                     ! 1. SEG_CELL:
                     ALLOCATE(SEG_CELL_AUX(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC+DELTA_EDGE)); SEG_CELL_AUX = IBM_UNDEFINED
                     ! Copy data to SEG_CELL_AUX:
                     SEG_CELL_AUX(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC) = SEG_CELL(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC)

                     ! New SIZE_CEELEM_EDGFAC:
                     SIZE_CEELEM_EDGFAC = SIZE_CEELEM_EDGFAC + DELTA_EDGE

                     ! 2. EDGFAC_CELL:
                     DEALLOCATE(EDGFAC_CELL); ALLOCATE(EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC))
                     ! Dump data back into EDGFAC_CELL:
                     EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC) = &
                     EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC)
                     DEALLOCATE(EDGFAC_CELL_AUX)
                     ! 2. SEG_CELL:
                     DEALLOCATE(SEG_CELL); ALLOCATE(SEG_CELL(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC))
                     ! Dump data back into SEG_CELL:
                     SEG_CELL(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC) = SEG_CELL_AUX(NOD1:NOD2,1:SIZE_CEELEM_EDGFAC)
                     DEALLOCATE(SEG_CELL_AUX)
                  ENDIF
                  SEG_CELL(NOD1:NOD2,NSEG_CELL) = SEG(NOD1:NOD2)
                  NEF = 1
                  EDGFAC_CELL(1,NSEG_CELL)    =       NEF
                  EDGFAC_CELL(NEF+1,NSEG_CELL)=     IFACE
                  FACEDG_CELL(IEDGE,IFACE)    = NSEG_CELL
               ELSE
                  NEF = EDGFAC_CELL(1,ISEG) + 1
                  ! Test NEF+1 doesn't overrun SIZE_CFELEM_EDGFAC, if so reallocate EDGFAC_CELL:
                  IF(NEF+1 > SIZE_CFELEM_EDGFAC) THEN
                     ALLOCATE(EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC+DELTA_FACE,1:SIZE_CEELEM_EDGFAC));
                     EDGFAC_CELL_AUX = IBM_UNDEFINED
                     ! Copy data into EDGFAC_CELL_AUX:
                     EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC) = &
                         EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC)
                     ! New SIZE_CFELEM_EDGFAC:
                     SIZE_CFELEM_EDGFAC = SIZE_CFELEM_EDGFAC + DELTA_FACE
                     DEALLOCATE(EDGFAC_CELL); ALLOCATE(EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC))
                     ! Dump data back into EDGFAC_CELL:
                     EDGFAC_CELL(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC) = &
                     EDGFAC_CELL_AUX(1:SIZE_CFELEM_EDGFAC,1:SIZE_CEELEM_EDGFAC)
                     DEALLOCATE(EDGFAC_CELL_AUX)
                  ENDIF
                  EDGFAC_CELL(1,ISEG)         =   NEF
                  EDGFAC_CELL(NEF+1,ISEG)     = IFACE
                  FACEDG_CELL(IEDGE,IFACE)    =  ISEG
               ENDIF
            ENDDO
         ENDDO

         ! Then  loop is on faces that have all regular edges,
         ! that is, edges shared with only one another face:
         ! Reallocate FACECELL_NUM if NFACE_CELL > SIZE(FACECELL_NUM,DIM=1):
         NUM_FACE = SIZE(FACECELL_NUM,DIM=1)
         IF (NFACE_CELL > NUM_FACE) THEN
            DFCT = CEILING(REAL(NFACE_CELL-NUM_FACE,EB)/REAL(DELTA_FACE,EB))
            DEALLOCATE(FACECELL_NUM); ALLOCATE(FACECELL_NUM(1:NFACE_CELL+DFCT*DELTA_FACE))
         ENDIF

         FACECELL_NUM = 0
         ICELL        = 1
         IFACE        = 1
         NUM_FACE     = NFACE_CELL
         CTVAL2       = 0
         MAXSEG       = MAXVAL(FACE_CELL(1,1:NFACE_CELL))
         THRES        = (MAXSEG*NFACE_CELL)**2
         CYCLE_CELL   = .FALSE.
         ! Now double infinite loops:
         INF_LOOP1 : DO
            CTVAL = 0
            INF_LOOP2 : DO

               NEWFACE = .FALSE.
               NFACEI  = FACE_CELL(1,IFACE)

               ! Now loop to find new face:
               DO ISEG=1,NFACEI
                  LOCSEG = FACEDG_CELL(ISEG,IFACE)
                  IF ( EDGFAC_CELL(1,LOCSEG) == 2 ) THEN ! Found a regular edge
                     DO JJ=2,EDGFAC_CELL(1,LOCSEG)+1
                        JFACE = EDGFAC_CELL(JJ,LOCSEG)
                        ! Drop for same face:
                        IF ( IFACE == JFACE ) CYCLE
                        ! Drop if face already counted:
                        IF ( FACECELL_NUM(JFACE) > 0 ) CYCLE

                        ! New face, not counted:
                        FACECELL_NUM(JFACE) =  ICELL
                        NEWFACE             = .TRUE.
                        NUM_FACE            = NUM_FACE-1
                        EXIT
                     ENDDO
                  ENDIF
                  IF (NEWFACE) THEN
                     IFACE = JFACE
                     EXIT
                  ENDIF
               ENDDO

               ! Test for all faces that have regular edges with faces that belong to icell:
               IF (.NOT.NEWFACE) THEN
                  KFACE_LOOP : DO KFACE=1,NFACE_CELL
                     IF ( FACECELL_NUM(KFACE) == 0 ) THEN ! Not associated yet
                        NFACEK = FACE_CELL(1,KFACE)
                        DO ISEG=1,NFACEK
                           LOCSEG = FACEDG_CELL(ISEG,KFACE)
                           IF ( EDGFAC_CELL(1,LOCSEG) == 2) THEN ! Found a regular edge
                              DO JJ=2,EDGFAC_CELL(1,LOCSEG)+1
                                 JFACE = EDGFAC_CELL(JJ,LOCSEG)
                                 IF ( KFACE == JFACE ) CYCLE
                                 IF ( FACECELL_NUM(JFACE) /= ICELL) CYCLE
                                 ! New face, not counted:
                                 FACECELL_NUM(KFACE) = FACECELL_NUM(JFACE)
                                 NEWFACE             = .TRUE.
                                 IFACE               = KFACE
                                 NUM_FACE            = NUM_FACE-1
                                 EXIT KFACE_LOOP
                              ENDDO
                           ENDIF
                        ENDDO
                     ENDIF
                  ENDDO KFACE_LOOP
               ENDIF

               ! Haven't found new face, either num_face=0, or we need a new icell:
               IF (.NOT.NEWFACE) EXIT INF_LOOP2
               CTVAL = CTVAL + 1
               IF (CTVAL > THRES) THEN
                   CYCLE_CELL = .TRUE.
                   EXIT INF_LOOP2
               ENDIF

            ENDDO INF_LOOP2
            ! Test if there are any faces left:
            IF ( NUM_FACE <= 0 ) THEN
               EXIT
            ELSE ! New cell, find new face set iface
               DO IFACE=1,NFACE_CELL
                  IF (FACECELL_NUM(IFACE) == 0) THEN ! NOT COUNTED YET.
                       ! ASSUMES IT HAS AT LEAST ONE REGULAR EDGE.
                       ICELL = ICELL + 1
                       EXIT
                   ENDIF
               ENDDO
               IF(IFACE > NFACE_CELL) EXIT INF_LOOP1 ! Case all faces associated.
            ENDIF
            CTVAL2 = CTVAL2 + 1
            IF (CTVAL2 > THRES) CYCLE_CELL = .TRUE.
            IF (CYCLE_CELL) EXIT INF_LOOP1
         ENDDO INF_LOOP1

         CYCLE_CELL_COND : IF (CYCLE_CELL) THEN
            CELLRT(I,J,K) = .TRUE.
            MESHES(NM)%N_SPCELL = MESHES(NM)%N_SPCELL + 1
            ! Here if needed reallocate SPCELL_LIST:
            NSPCELL_LIST        = SIZE(MESHES(NM)%SPCELL_LIST,DIM=2)
            IF (NSPCELL_LIST < MESHES(NM)%N_SPCELL) THEN
               ALLOCATE(SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST)); SPCELL_LIST(:,:)=MESHES(NM)%SPCELL_LIST(:,:)
               DEALLOCATE(MESHES(NM)%SPCELL_LIST)
               ALLOCATE(MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST+DELTA_CELL));
               MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,1:NSPCELL_LIST)=SPCELL_LIST(IAXIS:KAXIS,1:NSPCELL_LIST)
               MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,NSPCELL_LIST+1:NSPCELL_LIST+DELTA_CELL) = IBM_UNDEFINED
               DEALLOCATE(SPCELL_LIST)
            ENDIF
            MESHES(NM)%SPCELL_LIST(IAXIS:KAXIS,MESHES(NM)%N_SPCELL) = (/ I, J, K /)

            IDCF = MESHES(NM)%CCVAR(I,J,K,IBM_IDCF)
            NIBFACE    = 0
            NFACE_CELL = N_GAS_CFACES + NIBFACE
            IDCF_COND : IF (IDCF > 0) THEN
                IBOD = 1; ITRI = 1
                IF (MESHES(NM)%CUT_FACE(IDCF)%NFACE > 0) THEN
                  IBOD = MESHES(NM)%CUT_FACE(IDCF)%BODTRI(1,1)
                  ITRI = MESHES(NM)%CUT_FACE(IDCF)%BODTRI(2,1)
                ENDIF
                CALL FACE_DEALLOC(NM,IDCF)
                CALL NEW_FACE_ALLOC(NM,IDCF,8,6,4+1) ! Reallocate CUT_FACE entry with 8 vertices, 6 faces, 4 verts per face.
                NIBFACE    = 0
                XYZVERT    = 0._EB
                NVERT_CELL = 0
                CFELEM     = 0
                ! Define from SOLID FACES CFACES for the cell:
                IED = I-FCELL; JED = J-FCELL; KED = K-FCELL
                AXIS_LOOP : DO MYAXIS=IAXIS,KAXIS
                    SELECT CASE(MYAXIS)
                    CASE(IAXIS)
                       XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD1,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD2,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD3,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD4,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)
                       AREAI    = DYCELL(J) * DZCELL(K)
                    CASE(JAXIS)
                       XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD1,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD2,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD3,LOW_IND)  = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD4,LOW_IND)  = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)
                       AREAI    = DXCELL(I) * DZCELL(K)
                    CASE(KAXIS)
                       XYZLH(IAXIS:KAXIS,NOD1,HIGH_IND) = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD2,HIGH_IND) = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD3,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD4,HIGH_IND) = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED+1) /)
                       XYZLH(IAXIS:KAXIS,NOD1,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED  ), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD2,LOW_IND)  = (/ XFACE(IED+1), YFACE(JED  ), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD3,LOW_IND)  = (/ XFACE(IED+1), YFACE(JED+1), ZFACE(KED  ) /)
                       XYZLH(IAXIS:KAXIS,NOD4,LOW_IND)  = (/ XFACE(IED  ), YFACE(JED+1), ZFACE(KED  ) /)
                       AREAI    = DXCELL(I) * DYCELL(J)
                    END SELECT

                    SIDE_LOOP : DO SIDE=LOW_IND,HIGH_IND
                       IF (FSID_XYZ(SIDE ,MYAXIS) /= IBM_SOLID) CYCLE SIDE_LOOP
                       NIBFACE = NIBFACE + 1
                       ! Define vertices of CFACE and insert add to MESHES(NM)%CUT_FACE(IDCF)%XYZVERT
                       NP = 0
                       XYZC(IAXIS:KAXIS) = 0._EB
                       DO IP=NOD1,NOD4
                          ! xl,yl,zl
                          XYZ(IAXIS:KAXIS) = XYZLH(IAXIS:KAXIS,IP,SIDE)
                          XYZC(IAXIS:KAXIS)= XYZC(IAXIS:KAXIS) + XYZ(IAXIS:KAXIS)
                          CALL INSERT_FACE_VERT_LOC(IBM_MAXVERTS_CELL,XYZ,NVERT_CELL,INOD,XYZVERT)
                          NP           = NP + 1
                          CFELEM(1)    = NP
                          CFELEM(NP+1) = INOD
                       ENDDO

                       ! Define CFELEM connectivity, also CFACE area and Centroid add to corresponding CUT_FACE(IDCF) entries.
                       MESHES(NM)%CUT_FACE(IDCF)%CFELEM(1:5,NIBFACE) = CFELEM(1:5)
                       MESHES(NM)%CUT_FACE(IDCF)%AREA(NIBFACE) = AREAI
                       MESHES(NM)%CUT_FACE(IDCF)%XYZCEN(IAXIS:KAXIS,NIBFACE) = 0.25_EB*XYZC(IAXIS:KAXIS)
                       ! Fields for cut-cell volume/centroid computation:
                       MESHES(NM)%CUT_FACE(IDCF)%INXAREA(NIBFACE)   = 0._EB
                       MESHES(NM)%CUT_FACE(IDCF)%INXSQAREA(NIBFACE) = 0._EB
                       MESHES(NM)%CUT_FACE(IDCF)%JNYSQAREA(NIBFACE) = 0._EB
                       MESHES(NM)%CUT_FACE(IDCF)%KNZSQAREA(NIBFACE) = 0._EB

                       ! Define Body-triangle reference:
                       MESHES(NM)%CUT_FACE(IDCF)%BODTRI(1:2,NIBFACE)= (/ IBOD, ITRI /)

                       ! Assign surf-index: Depending on GEOMETRY:
                       ! Here we might just add the INERT SURF_ID:
                       MESHES(NM)%CUT_FACE(IDCF)%SURF_INDEX(NIBFACE) = GEOMETRY(IBOD)%SURFS(ITRI)

                       ! Finally add to FACE_LIST from N_GAS_CFACES on:
                       NFACE_CELL = N_GAS_CFACES + NIBFACE
                       FACE_LIST(1:IBM_NPARAM_CCFACE,NFACE_CELL) = (/ IBM_FTYPE_CFINB, 0, 0, IDCF, NIBFACE /)
                    ENDDO SIDE_LOOP
                ENDDO AXIS_LOOP
                MESHES(NM)%CUT_FACE(IDCF)%NFACE = NIBFACE
                MESHES(NM)%CUT_FACE(IDCF)%XYZVERT(IAXIS:KAXIS,1:NVERT_CELL) = XYZVERT(IAXIS:KAXIS,1:NVERT_CELL)
            ENDIF IDCF_COND

            ! Now define a coarse cut-cell (no INBOUNDARY cut-faces):
            NCELL      = 1
            ! Test NFACE_CELL not > SIZE_FACE_CCELEM:
            IF (NFACE_CELL > SIZE_FACE_CCELEM) THEN
               DFCT = CEILING(REAL(NFACE_CELL-SIZE_FACE_CCELEM,EB)/REAL(DELTA_FACE,EB))
               SIZE_FACE_CCELEM = SIZE_FACE_CCELEM + DFCT*DELTA_FACE
               DEALLOCATE(CCELEM)
               ALLOCATE(CCELEM(1:SIZE_FACE_CCELEM+1,1:SIZE_CELL_CCELEM))
            ENDIF
            CCELEM(1:NFACE_CELL+1,NCELL) = (/ NFACE_CELL, (IFACE, IFACE=1,NFACE_CELL) /)
            VOL(NCELL) = DXCELL(I)*DYCELL(J)*DZCELL(K)
            XYZCEN(IAXIS:KAXIS,NCELL) = (/ XCELL(I), YCELL(J), ZCELL(K) /)

         ELSE CYCLE_CELL_COND

            ! Create CCELEM array:
            NCELL = MAXVAL(FACECELL_NUM(:))
            ! Test NCELL not > SIZE_CELL_CCELEM; NFACE_CELL not > SIZE_FACE_CCELEM:
            IF (NFACE_CELL > SIZE_FACE_CCELEM) THEN
               DFCT = CEILING(REAL(NFACE_CELL-SIZE_FACE_CCELEM,EB)/REAL(DELTA_FACE,EB))
               SIZE_FACE_CCELEM = SIZE_FACE_CCELEM + DFCT*DELTA_FACE
               DEALLOCATE(CCELEM)
               ALLOCATE(CCELEM(1:SIZE_FACE_CCELEM+1,1:SIZE_CELL_CCELEM))
            ENDIF
            IF (NCELL > SIZE_CELL_CCELEM) THEN
               DFCT = CEILING(REAL(NCELL-SIZE_CELL_CCELEM,EB)/REAL(DELTA_CELL,EB))
               SIZE_CELL_CCELEM = SIZE_CELL_CCELEM + DFCT*DELTA_CELL
               DEALLOCATE(CCELEM,VOL,XYZCEN)
               ALLOCATE(CCELEM(1:SIZE_FACE_CCELEM+1,1:SIZE_CELL_CCELEM))
               ALLOCATE(VOL(1:SIZE_CELL_CCELEM),XYZCEN(IAXIS:KAXIS,1:SIZE_CELL_CCELEM))
            ENDIF
            CCELEM= IBM_UNDEFINED
            DO ICELL=1,NCELL
               NP = 0
               DO IFACE=1,NFACE_CELL
                  IF ( FACECELL_NUM(IFACE) == ICELL ) THEN
                     NP = NP + 1
                     CCELEM(1,ICELL)    =    NP
                     CCELEM(NP+1,ICELL) = IFACE
                  ENDIF
               ENDDO
            ENDDO

            ! Compute volumes and centroids for the found cut-cells:
            VOL(1:NCELL) = 0._EB
            XYZCEN(IAXIS:KAXIS,1:NCELL) = 0._EB
            DO ICELL=1,NCELL
               NP = CCELEM(1,ICELL)
               DO II=2,NP+1
                  IFACE = CCELEM(II,ICELL)
                  ! Volume:
                  VOL(ICELL) = VOL(ICELL) + AREAVARS(1,IFACE)
                  ! xyzcen:
                  XYZCEN(IAXIS:KAXIS,ICELL) = XYZCEN(IAXIS:KAXIS,ICELL)+AREAVARS(2:4,IFACE)
               ENDDO
               IF(VOL(ICELL) < GEOMEPS) THEN ! Volume too small for correct calculation of XYZCEN-> take cartcell centroid.
                  JJ = 0
                  VOL(ICELL) = ABS(VOL(ICELL))
                  IF (VOL(ICELL)<TWO_EPSILON_EB) VOL(ICELL) = DX(I)*DY(J)*DZ(K)
                  XYZCEN(IAXIS:KAXIS,ICELL) = (/ XCELL(I), YCELL(J), ZCELL(K) /)
               ELSE
                  ! divide xyzcen by 2*vol:
                  XYZCEN(IAXIS:KAXIS,ICELL) = XYZCEN(IAXIS:KAXIS,ICELL) / (2._EB*VOL(ICELL))
               ENDIF
            ENDDO

         ENDIF CYCLE_CELL_COND

         ! Load into CUT_CELL data structure
         NCUTCELL = MESHES(NM)%N_CUTCELL_MESH + MESHES(NM)%N_GCCUTCELL_MESH + 1
         IF (IBNDINT==LOW_IND) THEN
            MESHES(NM)%N_CUTCELL_MESH   = NCUTCELL
         ELSE
            MESHES(NM)%N_GCCUTCELL_MESH = MESHES(NM)%N_GCCUTCELL_MESH + 1
         ENDIF
         MESHES(NM)%CCVAR(I,J,K,IBM_IDCC)            = NCUTCELL

         ! Resize array MESHES(NM)%CUT_CELL if necessary:
         CALL CUT_CELL_ARRAY_REALLOC(NM,NCUTCELL)

         ! Add cut-cell NCUTCELL entry:
         MESHES(NM)%CUT_CELL(NCUTCELL)%IJK(IAXIS:KAXIS) = (/ I, J, K /)
         MESHES(NM)%CUT_CELL(NCUTCELL)%NCELL     = NCELL
         MESHES(NM)%CUT_CELL(NCUTCELL)%NFACE_CELL= NFACE_CELL
         NCFACE_CUTCELL = MAXVAL(CCELEM(1,1:NCELL)) + 1
         CALL NEW_CELL_ALLOC(NM,NCUTCELL,NCELL,NFACE_CELL,NCFACE_CUTCELL)
         MESHES(NM)%CUT_CELL(NCUTCELL)%CCELEM(1:NCFACE_CUTCELL,1:NCELL) = CCELEM(1:NCFACE_CUTCELL,1:NCELL)
         MESHES(NM)%CUT_CELL(NCUTCELL)%FACE_LIST(1:IBM_NPARAM_CCFACE,1:NFACE_CELL) = &
         FACE_LIST(1:IBM_NPARAM_CCFACE,1:NFACE_CELL)
         MESHES(NM)%CUT_CELL(NCUTCELL)%VOLUME(1:NCELL)                  = VOL(1:NCELL)
         MESHES(NM)%CUT_CELL(NCUTCELL)%XYZCEN(IAXIS:KAXIS,1:NCELL)      = XYZCEN(IAXIS:KAXIS,1:NCELL)

      ENDDO ! I
   ENDDO ! J
ENDDO ! K

ENDDO IBNDINT_LOOP

DEALLOCATE(IJK_COUNT)
DEALLOCATE(EDGFAC_CELL, SEG_CELL)
DEALLOCATE(FACEDG_CELL, IPTS)
DEALLOCATE(CCELEM,VOL,XYZCEN)
DEALLOCATE(FACE_CELL,FACE_LIST,AREAVARS,FACECELL_NUM,FACE_CELL_DUM)

T_CC_USED(GET_CARTCELL_CUTCELLS_TIME_INDEX) = T_CC_USED(GET_CARTCELL_CUTCELLS_TIME_INDEX) + CURRENT_TIME() - TNOW

IF (GET_CUTCELLS_VERBOSE) THEN
   CALL CPU_TIME(CPUTIME)
   NCUTCEL = 0
   DO ICELL=1,MESHES(NM)%N_CUTCELL_MESH+MESHES(NM)%N_GCCUTCELL_MESH
      NCUTCEL = NCUTCEL + MESHES(NM)%CUT_CELL(ICELL)%NCELL
   ENDDO
   WRITE(LU_SETCC,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-cells mesh/gc : ',NCUTCEL,'. '
   IF (MY_RANK==0) THEN
   WRITE(LU_ERR ,'(A,F8.3,A,I8,A)') ' done. Time taken : ',CPUTIME-CPUTIME_START, &
   ' sec. Cut-cells mesh/gc : ',NCUTCEL,'. '
   ENDIF
ENDIF

RETURN

CONTAINS

SUBROUTINE REALLOCATE_LOCAL_FC_VARS

IF (NFACE_CELL > SIZE_CFELEM_FC) THEN
   ! FACE_LIST, AREAVARS, FACE_CELL
   ALLOCATE(FACE_LIST_AUX(1:IBM_NPARAM_CCFACE,1:SIZE_CFELEM_FC+DELTA_FACE));
   FACE_LIST_AUX=IBM_UNDEFINED
   ALLOCATE(AREAVARS_AUX(1:MAX_DIM+1,1:SIZE_CFELEM_FC+DELTA_FACE)); AREAVARS_AUX = 0._EB
   ALLOCATE(FACE_CELL_AUX(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC+DELTA_FACE));
   FACE_CELL_AUX=IBM_UNDEFINED
   ! Assign:
   FACE_LIST_AUX(1:IBM_NPARAM_CCFACE,1:SIZE_CFELEM_FC)= &
      FACE_LIST(1:IBM_NPARAM_CCFACE,1:SIZE_CFELEM_FC)
   AREAVARS_AUX(1:MAX_DIM+1,1:SIZE_CFELEM_FC) = AREAVARS(1:MAX_DIM+1,1:SIZE_CFELEM_FC)
   FACE_CELL_AUX(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC) = &
       FACE_CELL(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC)
   ! Reallocate:
   SIZE_CFELEM_FC = SIZE_CFELEM_FC + DELTA_FACE
   DEALLOCATE(FACE_LIST,AREAVARS,FACE_CELL);
   ALLOCATE(FACE_LIST(1:IBM_NPARAM_CCFACE,1:SIZE_CFELEM_FC))
   ALLOCATE(AREAVARS(1:MAX_DIM+1,1:SIZE_CFELEM_FC))
   ALLOCATE(FACE_CELL(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC))
   ! Dump back data:
   FACE_LIST(:,:) = FACE_LIST_AUX(:,:)
   AREAVARS(:,:)  = AREAVARS_AUX(:,:)
   FACE_CELL(:,:) = FACE_CELL_AUX(:,:)
   DEALLOCATE(FACE_LIST_AUX,AREAVARS_AUX,FACE_CELL_AUX)
ENDIF
RETURN
END SUBROUTINE REALLOCATE_LOCAL_FC_VARS

SUBROUTINE REALLOCATE_FACE_CELL_VERTS

IF (NP+1 > SIZE_VERTS_FC) THEN
   DFCT=CEILING(REAL(NP+1-SIZE_VERTS_FC,EB)/REAL(DELTA_VERT,EB))
   ALLOCATE(FACE_CELL_AUX(1:SIZE_VERTS_FC+DFCT*DELTA_VERT,1:SIZE_CFELEM_FC));
   FACE_CELL_AUX=IBM_UNDEFINED
   ! Assign:
   FACE_CELL_AUX(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC) = &
       FACE_CELL(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC)
   ! Reallocate:
   SIZE_VERTS_FC = SIZE_VERTS_FC + DFCT*DELTA_VERT
   DEALLOCATE(FACE_CELL); ALLOCATE(FACE_CELL(1:SIZE_VERTS_FC,1:SIZE_CFELEM_FC))
   FACE_CELL(:,:) = FACE_CELL_AUX(:,:)
   DEALLOCATE(FACE_CELL_AUX)
   ! Now FACE_CELL_DUM:
   DEALLOCATE(FACE_CELL_DUM); ALLOCATE(FACE_CELL_DUM(1:SIZE_VERTS_FC))
ENDIF

RETURN
END SUBROUTINE REALLOCATE_FACE_CELL_VERTS

END SUBROUTINE GET_CARTCELL_CUTCELLS


! -------------------------CUT_CELL_ARRAY_REALLOC------------------------------------

SUBROUTINE CUT_CELL_ARRAY_REALLOC(NM,ICC)

INTEGER, INTENT(IN) :: NM,ICC

! Local Variables:
INTEGER :: ICC1,SIZE_CUT_CELL

! Here test if we need to reallocate cut-cell:
SIZE_CUT_CELL = SIZE(MESHES(NM)%CUT_CELL,DIM=1)
IF (ICC > SIZE_CUT_CELL) THEN
   ALLOCATE(CUT_CELL_AUX(SIZE_CUT_CELL+GLOBAL_DELTA_CELL))
   DO ICC1=1,ICC-1
      CUT_CELL_AUX(ICC1)%NCELL      = MESHES(NM)%CUT_CELL(ICC1)%NCELL
      CUT_CELL_AUX(ICC1)%NFACE_CELL = MESHES(NM)%CUT_CELL(ICC1)%NFACE_CELL
      CUT_CELL_AUX(ICC1)%IJK        = MESHES(NM)%CUT_CELL(ICC1)%IJK

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%CCELEM           ,TO=CUT_CELL_AUX(ICC1)%CCELEM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%FACE_LIST        ,TO=CUT_CELL_AUX(ICC1)%FACE_LIST)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%VOLUME           ,TO=CUT_CELL_AUX(ICC1)%VOLUME)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%XYZCEN           ,TO=CUT_CELL_AUX(ICC1)%XYZCEN)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%RHO              ,TO=CUT_CELL_AUX(ICC1)%RHO)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%RHOS             ,TO=CUT_CELL_AUX(ICC1)%RHOS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%RSUM             ,TO=CUT_CELL_AUX(ICC1)%RSUM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%TMP              ,TO=CUT_CELL_AUX(ICC1)%TMP)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%D                ,TO=CUT_CELL_AUX(ICC1)%D)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%DS               ,TO=CUT_CELL_AUX(ICC1)%DS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%DVOL             ,TO=CUT_CELL_AUX(ICC1)%DVOL)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%Q                ,TO=CUT_CELL_AUX(ICC1)%Q)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%QR               ,TO=CUT_CELL_AUX(ICC1)%QR)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%D_SOURCE         ,TO=CUT_CELL_AUX(ICC1)%D_SOURCE)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%CHI_R            ,TO=CUT_CELL_AUX(ICC1)%CHI_R)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%MIX_TIME         ,TO=CUT_CELL_AUX(ICC1)%MIX_TIME)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%Q_REAC           ,TO=CUT_CELL_AUX(ICC1)%Q_REAC)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%REAC_SOURCE_TERM ,TO=CUT_CELL_AUX(ICC1)%REAC_SOURCE_TERM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%ZZ               ,TO=CUT_CELL_AUX(ICC1)%ZZ)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%ZZS              ,TO=CUT_CELL_AUX(ICC1)%ZZS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%M_DOT_PPP        ,TO=CUT_CELL_AUX(ICC1)%M_DOT_PPP)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%UNKH             ,TO=CUT_CELL_AUX(ICC1)%UNKH)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%UNKZ             ,TO=CUT_CELL_AUX(ICC1)%UNKZ)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%H                ,TO=CUT_CELL_AUX(ICC1)%H)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%HS               ,TO=CUT_CELL_AUX(ICC1)%HS)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%RTRM             ,TO=CUT_CELL_AUX(ICC1)%RTRM)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%R_H_G            ,TO=CUT_CELL_AUX(ICC1)%R_H_G)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%RHO_0            ,TO=CUT_CELL_AUX(ICC1)%RHO_0)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%WVEL             ,TO=CUT_CELL_AUX(ICC1)%WVEL)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_IJK         ,TO=CUT_CELL_AUX(ICC1)%INT_IJK   )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_COEF        ,TO=CUT_CELL_AUX(ICC1)%INT_COEF  )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_XYZBF       ,TO=CUT_CELL_AUX(ICC1)%INT_XYZBF )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_NOUT        ,TO=CUT_CELL_AUX(ICC1)%INT_NOUT  )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_INBFC       ,TO=CUT_CELL_AUX(ICC1)%INT_INBFC )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_NPE         ,TO=CUT_CELL_AUX(ICC1)%INT_NPE   )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_XN          ,TO=CUT_CELL_AUX(ICC1)%INT_XN    )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_CN          ,TO=CUT_CELL_AUX(ICC1)%INT_CN    )
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_CCVARS      ,TO=CUT_CELL_AUX(ICC1)%INT_CCVARS)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%INT_NOMIND      ,TO=CUT_CELL_AUX(ICC1)%INT_NOMIND)

      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%DEL_RHO_D_DEL_Z_VOL  ,TO=CUT_CELL_AUX(ICC1)%DEL_RHO_D_DEL_Z_VOL)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%U_DOT_DEL_RHO_Z_VOL  ,TO=CUT_CELL_AUX(ICC1)%U_DOT_DEL_RHO_Z_VOL)
      CALL MOVE_ALLOC(FROM=MESHES(NM)%CUT_CELL(ICC1)%USE_CC_VOL       ,TO=CUT_CELL_AUX(ICC1)%USE_CC_VOL)

      CUT_CELL_AUX(ICC1)%DIVVOL_BC       = MESHES(NM)%CUT_CELL(ICC1)%DIVVOL_BC

   ENDDO
   CALL MOVE_ALLOC(FROM=CUT_CELL_AUX,TO=MESHES(NM)%CUT_CELL)
ENDIF

RETURN
END SUBROUTINE CUT_CELL_ARRAY_REALLOC

! ------------------------- CELL_DEALLOC -----------------------------------

SUBROUTINE CELL_DEALLOC(NM,ICC)

INTEGER, INTENT(IN) :: NM,ICC

MESHES(NM)%CUT_CELL(ICC)%NCELL = 0
IF (.NOT.ALLOCATED(MESHES(NM)%CUT_CELL(ICC)%CCELEM)) RETURN

! Deallocate ICC entries:
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%CCELEM)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%FACE_LIST)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%VOLUME,   MESHES(NM)%CUT_CELL(ICC)%RHO,      &
           MESHES(NM)%CUT_CELL(ICC)%RHOS,     MESHES(NM)%CUT_CELL(ICC)%RSUM,     &
           MESHES(NM)%CUT_CELL(ICC)%TMP,      MESHES(NM)%CUT_CELL(ICC)%D,        &
           MESHES(NM)%CUT_CELL(ICC)%DVOL,     MESHES(NM)%CUT_CELL(ICC)%Q,        &
           MESHES(NM)%CUT_CELL(ICC)%QR,       MESHES(NM)%CUT_CELL(ICC)%D_SOURCE, &
           MESHES(NM)%CUT_CELL(ICC)%CHI_R,    MESHES(NM)%CUT_CELL(ICC)%DS,       &
           MESHES(NM)%CUT_CELL(ICC)%MIX_TIME, MESHES(NM)%CUT_CELL(ICC)%H,        &
           MESHES(NM)%CUT_CELL(ICC)%HS,       MESHES(NM)%CUT_CELL(ICC)%RTRM,     &
           MESHES(NM)%CUT_CELL(ICC)%R_H_G,    MESHES(NM)%CUT_CELL(ICC)%RHO_0,    &
           MESHES(NM)%CUT_CELL(ICC)%WVEL,     MESHES(NM)%CUT_CELL(ICC)%USE_CC_VOL)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%XYZCEN)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%Q_REAC)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%REAC_SOURCE_TERM, &
           MESHES(NM)%CUT_CELL(ICC)%ZZ,               &
           MESHES(NM)%CUT_CELL(ICC)%ZZS,              &
           MESHES(NM)%CUT_CELL(ICC)%M_DOT_PPP)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%UNKH,MESHES(NM)%CUT_CELL(ICC)%UNKZ)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_IJK)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_COEF)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_XYZBF)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NOUT)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_INBFC)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NPE)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_XN)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_CN)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_CCVARS)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NOMIND)
DEALLOCATE(MESHES(NM)%CUT_CELL(ICC)%DEL_RHO_D_DEL_Z_VOL, &
           MESHES(NM)%CUT_CELL(ICC)%U_DOT_DEL_RHO_Z_VOL)
RETURN

END SUBROUTINE CELL_DEALLOC

! -------------------------- NEW_CELL_ALLOC -------------------------------------

SUBROUTINE NEW_CELL_ALLOC(NM,ICC,NCELL,NFACE_CELL,NCFACE_CUTCELL)

INTEGER, INTENT(IN) :: NM,ICC,NCELL,NFACE_CELL,NCFACE_CUTCELL

! Allocate ICC entries:
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%CCELEM(1:NCFACE_CUTCELL,1:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%FACE_LIST(1:IBM_NPARAM_CCFACE,1:NFACE_CELL))
MESHES(NM)%CUT_CELL(ICC)%CCELEM    = IBM_UNDEFINED
MESHES(NM)%CUT_CELL(ICC)%FACE_LIST = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%VOLUME(1:NCELL),   MESHES(NM)%CUT_CELL(ICC)%RHO(1:NCELL),      &
         MESHES(NM)%CUT_CELL(ICC)%RHOS(1:NCELL),     MESHES(NM)%CUT_CELL(ICC)%RSUM(1:NCELL),     &
         MESHES(NM)%CUT_CELL(ICC)%TMP(1:NCELL),      MESHES(NM)%CUT_CELL(ICC)%D(1:NCELL),        &
         MESHES(NM)%CUT_CELL(ICC)%DVOL(1:NCELL),     MESHES(NM)%CUT_CELL(ICC)%Q(1:NCELL),        &
         MESHES(NM)%CUT_CELL(ICC)%QR(1:NCELL),       MESHES(NM)%CUT_CELL(ICC)%D_SOURCE(1:NCELL), &
         MESHES(NM)%CUT_CELL(ICC)%CHI_R(1:NCELL),    MESHES(NM)%CUT_CELL(ICC)%DS(1:NCELL),       &
         MESHES(NM)%CUT_CELL(ICC)%MIX_TIME(1:NCELL), MESHES(NM)%CUT_CELL(ICC)%H(1:NCELL),        &
         MESHES(NM)%CUT_CELL(ICC)%HS(1:NCELL),       MESHES(NM)%CUT_CELL(ICC)%RTRM(1:NCELL),     &
         MESHES(NM)%CUT_CELL(ICC)%R_H_G(1:NCELL),    MESHES(NM)%CUT_CELL(ICC)%RHO_0(1:NCELL),    &
         MESHES(NM)%CUT_CELL(ICC)%WVEL(1:NCELL),     MESHES(NM)%CUT_CELL(ICC)%USE_CC_VOL(1:NCELL))

MESHES(NM)%CUT_CELL(ICC)%VOLUME   = 0._EB
MESHES(NM)%CUT_CELL(ICC)%RHO      = 0._EB
MESHES(NM)%CUT_CELL(ICC)%RHOS     = 0._EB
MESHES(NM)%CUT_CELL(ICC)%RSUM     = 0._EB
MESHES(NM)%CUT_CELL(ICC)%TMP      = 0._EB
MESHES(NM)%CUT_CELL(ICC)%D        = 0._EB
MESHES(NM)%CUT_CELL(ICC)%DS       = 0._EB
MESHES(NM)%CUT_CELL(ICC)%DVOL     = 0._EB
MESHES(NM)%CUT_CELL(ICC)%Q        = 0._EB
MESHES(NM)%CUT_CELL(ICC)%QR       = 0._EB
MESHES(NM)%CUT_CELL(ICC)%D_SOURCE = 0._EB
MESHES(NM)%CUT_CELL(ICC)%CHI_R    = 0._EB
MESHES(NM)%CUT_CELL(ICC)%MIX_TIME = 0._EB
MESHES(NM)%CUT_CELL(ICC)%H        = 0._EB
MESHES(NM)%CUT_CELL(ICC)%HS       = 0._EB
MESHES(NM)%CUT_CELL(ICC)%RTRM     = 0._EB
MESHES(NM)%CUT_CELL(ICC)%R_H_G    = 0._EB
MESHES(NM)%CUT_CELL(ICC)%RHO_0    = 0._EB
MESHES(NM)%CUT_CELL(ICC)%WVEL     = 0._EB

MESHES(NM)%CUT_CELL(ICC)%USE_CC_VOL = .TRUE.

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%XYZCEN(IAXIS:KAXIS,1:NCELL))
MESHES(NM)%CUT_CELL(ICC)%XYZCEN = 0._EB

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%Q_REAC(1:MAX_REACTIONS,1:NCELL))
MESHES(NM)%CUT_CELL(ICC)%Q_REAC = 0._EB

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%REAC_SOURCE_TERM(1:MAX_SPECIES,1:NCELL), &
         MESHES(NM)%CUT_CELL(ICC)%ZZ(1:MAX_SPECIES,1:NCELL),               &
         MESHES(NM)%CUT_CELL(ICC)%ZZS(1:MAX_SPECIES,1:NCELL),              &
         MESHES(NM)%CUT_CELL(ICC)%M_DOT_PPP(1:MAX_SPECIES,1:NCELL))
MESHES(NM)%CUT_CELL(ICC)%REAC_SOURCE_TERM = 0._EB
MESHES(NM)%CUT_CELL(ICC)%ZZ               = 0._EB
MESHES(NM)%CUT_CELL(ICC)%ZZS              = 0._EB
MESHES(NM)%CUT_CELL(ICC)%M_DOT_PPP        = 0._EB

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%UNKH(1:NCELL),MESHES(NM)%CUT_CELL(ICC)%UNKZ(1:NCELL))
MESHES(NM)%CUT_CELL(ICC)%UNKH = IBM_UNDEFINED
MESHES(NM)%CUT_CELL(ICC)%UNKZ = IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_IJK(IAXIS:KAXIS,(NCELL+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_COEF((NCELL+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_XYZBF(IAXIS:KAXIS,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NOUT(IAXIS:KAXIS,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_INBFC(1:3,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NPE(LOW_IND:HIGH_IND,0:KAXIS,1:INT_N_EXT_PTS,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_XN(0:INT_N_EXT_PTS,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_CN(0:INT_N_EXT_PTS,0:NCELL))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_CCVARS(1:N_INT_FVARS,(NCELL+1)*DELTA_INT))
ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%INT_NOMIND(LOW_IND:HIGH_IND,(NCELL+1)*DELTA_INT))

MESHES(NM)%CUT_CELL(ICC)%INT_IJK   =  IBM_UNDEFINED
MESHES(NM)%CUT_CELL(ICC)%INT_COEF  =  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_XYZBF =  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_NOUT  =  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_INBFC =  IBM_UNDEFINED
MESHES(NM)%CUT_CELL(ICC)%INT_NPE   =  0
MESHES(NM)%CUT_CELL(ICC)%INT_XN    =  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_CN    =  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_CCVARS=  0._EB
MESHES(NM)%CUT_CELL(ICC)%INT_NOMIND=  IBM_UNDEFINED

ALLOCATE(MESHES(NM)%CUT_CELL(ICC)%DEL_RHO_D_DEL_Z_VOL(1:MAX_SPECIES,1:NCELL), &
         MESHES(NM)%CUT_CELL(ICC)%U_DOT_DEL_RHO_Z_VOL(1:MAX_SPECIES,1:NCELL))
MESHES(NM)%CUT_CELL(ICC)%DEL_RHO_D_DEL_Z_VOL = 0._EB; MESHES(NM)%CUT_CELL(ICC)%U_DOT_DEL_RHO_Z_VOL = 0._EB

RETURN

END SUBROUTINE NEW_CELL_ALLOC

! ------------------------ GET_TRIANG_FACE_INT ----------------------------------

SUBROUTINE GET_TRIANG_FACE_INT(X2AXIS,X3AXIS,FVERT,CEI,NM, &
                               INB_FLG,NVERT,XYVERT,NEDGE,CEELEM,INDSEG)

INTEGER,  INTENT(IN) :: X2AXIS, X3AXIS, CEI, NM
REAL(EB), INTENT(IN) :: FVERT(IAXIS:JAXIS,NOD1:NOD4)
LOGICAL,  INTENT(OUT):: INB_FLG
INTEGER,  INTENT(OUT):: NVERT,NEDGE,CEELEM(NOD1:NOD2,1:IBM_MAXCEELEM_FACE)
INTEGER,  INTENT(OUT):: INDSEG(IBM_MAX_WSTRIANG_SEG+3,IBM_MAXCEELEM_FACE)
REAL(EB), INTENT(OUT):: XYVERT(IAXIS:JAXIS,1:IBM_MAXVERTS_FACE)

! Local Variables:
REAL(EB) :: X2FMIN, X2FMAX, X3FMIN, X3FMAX, DUMMY(IAXIS:JAXIS)
INTEGER  :: SEG(NOD1:NOD2), TRI(NOD1:NOD3), ITRI, INOD
LOGICAL  :: INTEST, OUTX2, OUTX3, OUTFACE, TRUETHAT, XIALIGNED, OUTSEG, SEG_IN_SIDE
INTEGER  :: TSEGS(NOD1:NOD2,EDG1:EDG3)
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: FVERT_IN_TRIANG, TRIVERT_IN_FACE
INTEGER  :: NFVERT, NTVERT, NINTP
INTEGER  :: TRINODS(IBM_MAXVERTS_FACE)
REAL(EB) :: ATANTRI(1:IBM_MAXVERTS_FACE+1), ATTRI
INTEGER  :: II(1:IBM_MAXVERTS_FACE+1), INTP, IINS, IDUM, INP, NINTP_TRI, IPT, JPL, IEDGE, IPF, ISEG
INTEGER  :: LOCTRI, LOCBOD, EDGETRI(NOD1:NOD2,1:IBM_MAXCEELEM_FACE), VEC3(1:3)
REAL(EB) :: XY1(IAXIS:JAXIS), XY2(IAXIS:JAXIS), XP1(IAXIS:JAXIS), XP2(IAXIS:JAXIS)
REAL(EB) :: XP(IAXIS:JAXIS), FD(1:2), VEC(IAXIS:JAXIS)
INTEGER  :: MYAXIS, XIAXIS, XJAXIS
REAL(EB) :: XIPLNS(LOW_IND:HIGH_IND), XJPLNS(LOW_IND:HIGH_IND), DOT1, DOT2
REAL(EB) :: MINXI, MAXXI, MINXJ, MAXXJ, DS, SVARI, XJPLN, XCEN(IAXIS:JAXIS)
REAL(EB) :: VECS(IAXIS:JAXIS), VECP1(IAXIS:JAXIS), VECP2(IAXIS:JAXIS), CROSSP1, CROSSP2
REAL(EB) :: XYEL(IAXIS:JAXIS,NOD1:NOD3)
LOGICAL  :: INLIST, OUTPLANE1, OUTPLANE2
INTEGER  :: EDGE_TRI

REAL(EB), ALLOCATABLE, SAVE, DIMENSION(:,:) :: X2X3VERT
INTEGER, SAVE :: SIZE_X2X3VERT

INTEGER :: IWSSEG,NSVERT,NINTP_SEG,SEGNODS(NOD1:NOD2)

! Default return values:
INB_FLG = .FALSE.
NVERT = 0
NEDGE = 0
IF(.NOT.ALLOCATED(X2X3VERT)) THEN
   SIZE_X2X3VERT = DELTA_VERT
   ALLOCATE(X2X3VERT(IAXIS:JAXIS,1:SIZE_X2X3VERT))
ENDIF
X2X3VERT = 0._EB
CEELEM   = IBM_UNDEFINED
INDSEG   = IBM_UNDEFINED
IF ( CEI /= 0 ) THEN
   NVERT = MESHES(NM)%CUT_EDGE(CEI)%NVERT
   NEDGE = MESHES(NM)%CUT_EDGE(CEI)%NEDGE

   IF (NVERT > SIZE_X2X3VERT) THEN
      DEALLOCATE(X2X3VERT)
      SIZE_X2X3VERT = NVERT + DELTA_VERT
      ALLOCATE(X2X3VERT(IAXIS:JAXIS,1:SIZE_X2X3VERT)); X2X3VERT = 0._EB
   ENDIF

   X2X3VERT(IAXIS,1:NVERT)   = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(X2AXIS,1:NVERT)
   X2X3VERT(JAXIS,1:NVERT)   = MESHES(NM)%CUT_EDGE(CEI)%XYZVERT(X3AXIS,1:NVERT)

   CEELEM(NOD1:NOD2,1:NEDGE) = MESHES(NM)%CUT_EDGE(CEI)%CEELEM(NOD1:NOD2,1:NEDGE)
   INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,1:NEDGE) = &
   MESHES(NM)%CUT_EDGE(CEI)%INDSEG(1:IBM_MAX_WSTRIANG_SEG+2,1:NEDGE)
   MESHES(NM)%CUT_EDGE(CEI)%NEDGE1=NEDGE
ENDIF

! Quick discard test:
X2FMIN = MINVAL(FVERT(IAXIS,NOD1:NOD4)); X2FMAX = MAXVAL(FVERT(IAXIS,NOD1:NOD4))
X3FMIN = MINVAL(FVERT(JAXIS,NOD1:NOD4)); X3FMAX = MAXVAL(FVERT(JAXIS,NOD1:NOD4))

! Loop in-plane Surface Elements:
INTEST = .FALSE.
DO ITRI=1,BODINT_PLANE%NTRIS
    ! Elements nodes location, in x2-x3 coordinates:
    TRI(NOD1:NOD3) = BODINT_PLANE%TRIS(NOD1:NOD3,ITRI)
    DO INOD=NOD1,NOD3
       XYEL(IAXIS:JAXIS,INOD) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) ,TRI(INOD))
    ENDDO
    OUTX2= ((X2FMIN-MAXVAL(XYEL(IAXIS,NOD1:NOD3))) > GEOMEPS) .OR. &
           ((MINVAL(XYEL(IAXIS,NOD1:NOD3))-X2FMAX) > GEOMEPS) ! Triang out of Face in x2 dir
    OUTX3= ((X3FMIN-MAXVAL(XYEL(JAXIS,NOD1:NOD3))) > GEOMEPS) .OR. &
           ((MINVAL(XYEL(JAXIS,NOD1:NOD3))-X3FMAX) > GEOMEPS) ! Triang out of Face in x3 dir
    OUTFACE = OUTX2 .OR. OUTX3
    IF (.NOT.OUTFACE) THEN
        INTEST = .TRUE.
        EXIT
    ENDIF
ENDDO
! Run on Triangle edges found:
DO ISEG=1,BODINT_PLANE%NSEGS
   SEG(NOD1:NOD2) = BODINT_PLANE%SEGS(NOD1:NOD2,ISEG)
   DO INOD=NOD1,NOD2
      XYEL(IAXIS:JAXIS,INOD) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) ,SEG(INOD))
   ENDDO
   OUTX2= ((X2FMIN-MAXVAL(XYEL(IAXIS,NOD1:NOD2))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(IAXIS,NOD1:NOD2))-X2FMAX) > GEOMEPS) ! Segment out of Face in x2 dir
   OUTX3= ((X3FMIN-MAXVAL(XYEL(JAXIS,NOD1:NOD2))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(JAXIS,NOD1:NOD2))-X3FMAX) > GEOMEPS) ! Segment out of Face in x3 dir
   OUTFACE = OUTX2 .OR. OUTX3
   IF (.NOT.OUTFACE) THEN
       INTEST = .TRUE.
       EXIT
   ENDIF
ENDDO
IF (.NOT.INTEST) RETURN

! Now if intest is true figure out if there are triangles-face intersection
! Polygons:
NFVERT = 4
NTVERT = 3
NSVERT = 2

! First Vertices:
ALLOCATE(FVERT_IN_TRIANG(1:NFVERT,BODINT_PLANE%NTRIS)); FVERT_IN_TRIANG = 0
ALLOCATE(TRIVERT_IN_FACE(1:NTVERT,BODINT_PLANE%NTRIS)); TRIVERT_IN_FACE = 0

NINTP = NVERT

! Loop in-plane Surface Elements:
DO ITRI=1,BODINT_PLANE%NTRIS

   NINTP_TRI =             0
   TRINODS   = IBM_UNDEFINED

   ! Elements nodes location, in x2-x3 coordinates:
   TRI(NOD1:NOD3) = BODINT_PLANE%TRIS(NOD1:NOD3,ITRI)
   DO INOD=NOD1,NOD3
      XYEL(IAXIS:JAXIS,INOD) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) ,TRI(INOD))
   ENDDO

   ! Cycle if Triangles BBOX not intersecting face:
   OUTX2= ((X2FMIN-MAXVAL(XYEL(IAXIS,NOD1:NOD3))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(IAXIS,NOD1:NOD3))-X2FMAX) > GEOMEPS) ! Triang out of Face in x2 dir
   OUTX3= ((X3FMIN-MAXVAL(XYEL(JAXIS,NOD1:NOD3))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(JAXIS,NOD1:NOD3))-X3FMAX) > GEOMEPS) ! Triang out of Face in x3 dir
   OUTFACE = OUTX2 .OR. OUTX3
   IF (OUTFACE) CYCLE

   IF (BODINT_PLANE%X1NVEC(ITRI) < 0) THEN ! ROTATE NODE 2 AND 3 LOCATIONS
      DUMMY(IAXIS:JAXIS)     = XYEL(IAXIS:JAXIS,NOD2)
      XYEL(IAXIS:JAXIS,NOD2) = XYEL(IAXIS:JAXIS,NOD3)
      XYEL(IAXIS:JAXIS,NOD3) = DUMMY(IAXIS:JAXIS)

      TSEGS(NOD1:NOD2,EDG1) = BODINT_PLANE%TRIS( (/ 2, 1 /) ,ITRI)
      TSEGS(NOD1:NOD2,EDG2) = BODINT_PLANE%TRIS( (/ 3, 2 /) ,ITRI)
      TSEGS(NOD1:NOD2,EDG3) = BODINT_PLANE%TRIS( (/ 1, 3 /) ,ITRI)
   ELSE
      TSEGS(NOD1:NOD2,EDG1) = BODINT_PLANE%TRIS( (/ 1, 2 /) ,ITRI)
      TSEGS(NOD1:NOD2,EDG2) = BODINT_PLANE%TRIS( (/ 2, 3 /) ,ITRI)
      TSEGS(NOD1:NOD2,EDG3) = BODINT_PLANE%TRIS( (/ 3, 1 /) ,ITRI)
   ENDIF

   ! a. Test if Triangles vertices Lay on Faces area, including face boundary:
   DO IPT=1,NTVERT
      OUTX2= ((X2FMIN-XYEL(IAXIS,IPT)) > GEOMEPS) .OR. &
             ((XYEL(IAXIS,IPT)-X2FMAX) > GEOMEPS)  ! Triang out of Face in x2 dir
      OUTX3= ((X3FMIN-XYEL(JAXIS,IPT)) > GEOMEPS) .OR. &
             ((XYEL(JAXIS,IPT)-X3FMAX) > GEOMEPS)  ! Triang out of Face in x3 dir
      OUTFACE = OUTX2 .OR. OUTX3

      IF ( OUTFACE ) CYCLE

      ! Insertion add point to intersection list:
      XP(IAXIS:JAXIS) = XYEL(IAXIS:JAXIS,IPT)
      CALL INSERT_POINT_2D(XP,NINTP,SIZE_X2X3VERT,X2X3VERT,INOD)

      ! Insert sort node to triangles local list
      TRUETHAT = .TRUE.
      DO INP=1,NINTP_TRI
         IF (TRINODS(INP) == INOD) THEN
            TRUETHAT = .FALSE.
            EXIT
         ENDIF
      ENDDO
      IF ( TRUETHAT ) THEN ! new inod entry on list
         NINTP_TRI = NINTP_TRI + 1
         TRINODS(NINTP_TRI) = INOD
      ENDIF

      TRIVERT_IN_FACE(IPT,ITRI) = 1

   ENDDO

   ! b. Test if Face vertices lay on triangle, including triangle edges:
   DO IPF=1,NFVERT
      ! Transform back to master Element coordinates
      ! location of point i,j in x2-x3 coordinates:
      FD(1:2) = (/ FVERT(IAXIS,IPF)-XYEL(IAXIS,NOD3), FVERT(JAXIS,IPF)-XYEL(JAXIS,NOD3) /)
      ! Here xi in vec(1) and eta in vec(2)
      VEC(IAXIS) = BODINT_PLANE%AINV(1,1,ITRI)*FD(1) + BODINT_PLANE%AINV(1,2,ITRI)*FD(2)
      VEC(JAXIS) = BODINT_PLANE%AINV(2,1,ITRI)*FD(1) + BODINT_PLANE%AINV(2,2,ITRI)*FD(2)

      ! Test for vertex point within triangle, considers Triangle Edges:
      IF ( (VEC(IAXIS) >= (0._EB-GEOMEPS)) .AND. &
           (VEC(JAXIS) >= (0._EB-GEOMEPS)) .AND. &
           (1._EB-VEC(IAXIS)-VEC(JAXIS) >= (0._EB-GEOMEPS)) ) THEN

         ! Insertion add point to intersection list:
         XP(IAXIS:JAXIS) = FVERT(IAXIS:JAXIS,IPF)
         CALL INSERT_POINT_2D(XP,NINTP,SIZE_X2X3VERT,X2X3VERT,INOD)

         ! Insert sort node to triangles local list
         TRUETHAT = .TRUE.
         DO INP=1,NINTP_TRI
            IF (TRINODS(INP) == INOD) THEN
               TRUETHAT = .FALSE.
               EXIT
            ENDIF
         ENDDO
         IF ( TRUETHAT ) THEN ! new inod entry on list
            NINTP_TRI = NINTP_TRI + 1
            TRINODS(NINTP_TRI) = INOD
         ENDIF

         FVERT_IN_TRIANG(IPF,ITRI) = 1

      ENDIF
   ENDDO

   ! Now add face edge - triangle edge intersection points:
   ! x2 segments:
   DO MYAXIS=IAXIS,JAXIS
      SELECT CASE(MYAXIS)
         CASE(IAXIS)
            XIAXIS = IAXIS
            XJAXIS = JAXIS
            XIPLNS(LOW_IND:HIGH_IND) = (/ X2FMIN, X2FMAX /)
            XJPLNS(LOW_IND:HIGH_IND) = (/ X3FMIN, X3FMAX /)
         CASE(JAXIS)
            XIAXIS = JAXIS
            XJAXIS = IAXIS
            XIPLNS(LOW_IND:HIGH_IND) = (/ X3FMIN, X3FMAX /)
            XJPLNS(LOW_IND:HIGH_IND) = (/ X2FMIN, X2FMAX /)
      END SELECT

      DO JPL=LOW_IND,HIGH_IND

         XJPLN = XJPLNS(JPL)

         DO IPT=1,NTVERT

            XY1(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , TSEGS(NOD1,IPT) )
            XY2(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , TSEGS(NOD2,IPT) )

            ! Drop if Triangle edge on one side of segment ray:
            MAXXJ = MAX(XY1(XJAXIS),XY2(XJAXIS))
            MINXJ = MIN(XY1(XJAXIS),XY2(XJAXIS))
            OUTPLANE1 = ((XJPLN-MAXXJ) > GEOMEPS) .OR. ((MINXJ-XJPLN) > GEOMEPS)
            IF ( OUTPLANE1 ) CYCLE

            ! Also drop if Triangle edge ouside of face edge limits:
            MAXXI = MAX(XY1(XIAXIS),XY2(XIAXIS))
            MINXI = MIN(XY1(XIAXIS),XY2(XIAXIS))
            OUTPLANE2 = ((XIPLNS(LOW_IND)-MAXXI) > GEOMEPS) .OR. ((MINXI-XIPLNS(HIGH_IND)) > GEOMEPS)
            IF ( OUTPLANE2 ) CYCLE

            ! Test if segment aligned with xi
            XIALIGNED = ((MAXXJ-MINXJ) < GEOMEPS)
            IF ( XIALIGNED ) CYCLE ! Aligned and on top of xjpln: Intersection points already added.

            ! Drop intersections in triangle segment nodes: already added.
            ! Compute: dot(plnormal, xyzv - xypl):
            DOT1 = XY1(XJAXIS) - XJPLN
            DOT2 = XY2(XJAXIS) - XJPLN

            IF ( ABS(DOT1) <= GEOMEPS ) CYCLE
            IF ( ABS(DOT2) <= GEOMEPS ) CYCLE

            ! Finally regular case:
            ! Points 1 on one side of x2 segment, point 2 on the other:
            !IF ((DOT1 > 0._EB & DOT2 < 0._EB) .OR. (DOT1 < 0._EB & DOT2 > 0._EB))
            IF ( DOT1*DOT2 < 0._EB ) THEN

               ! Intersection Point along segment:
               DS    = (XJPLN-XY1(XJAXIS))/(XY2(XJAXIS)-XY1(XJAXIS))
               SVARI = XY1(XIAXIS) + DS*(XY2(XIAXIS)-XY1(XIAXIS))

               OUTSEG= ((XIPLNS(LOW_IND)-SVARI) > -GEOMEPS) .OR. ((SVARI-XIPLNS(HIGH_IND)) > -GEOMEPS)
               IF ( OUTSEG ) CYCLE

               ! Insertion add point to intersection list:
               XP(XIAXIS) = SVARI
               XP(XJAXIS) = XJPLN
               CALL INSERT_POINT_2D(XP,NINTP,SIZE_X2X3VERT,X2X3VERT,INOD)

               ! Insert sort node to triangles local list
               TRUETHAT = .TRUE.
               DO INP=1,NINTP_TRI
                  IF (TRINODS(INP) == INOD) THEN
                     TRUETHAT = .FALSE.
                     EXIT
                  ENDIF
               ENDDO
               IF (TRUETHAT) THEN ! new inod entry on list
                  NINTP_TRI = NINTP_TRI + 1
                  TRINODS(NINTP_TRI) = INOD
               ENDIF
               CYCLE
            ENDIF
         ENDDO
      ENDDO
   ENDDO

   IF ( NINTP_TRI == 0 ) CYCLE

   ! Reorder points given normal on x1 direction:
   ! Centroid:
   XCEN(IAXIS:JAXIS) = 0._EB
   DO INTP=1,NINTP_TRI
      XCEN(IAXIS:JAXIS) = XCEN(IAXIS:JAXIS) + X2X3VERT(IAXIS:JAXIS,TRINODS(INTP))
   ENDDO
   XCEN(IAXIS:JAXIS)= XCEN(IAXIS:JAXIS) * REAL(NINTP_TRI,EB)**(-1._EB)

   ATANTRI(1:IBM_MAXVERTS_FACE+1) = 1._EB / GEOMEPS
   II(1:IBM_MAXVERTS_FACE+1) = IBM_UNDEFINED
   DO INTP=1,NINTP_TRI
      ATTRI = ATAN2(X2X3VERT(JAXIS,TRINODS(INTP))-XCEN(JAXIS), &
                    X2X3VERT(IAXIS,TRINODS(INTP))-XCEN(IAXIS)) + PI
      ! Insertion sort:
      DO IINS=1,INTP+1
         IF (ATTRI < ATANTRI(IINS)) EXIT
      ENDDO
      ! copy from the back:
      DO IDUM=INTP+1,IINS+1,-1
         ATANTRI(IDUM) = ATANTRI(IDUM-1)
         II(IDUM)      = II(IDUM-1)
      ENDDO
      ATANTRI(IINS) = ATTRI
      II(IINS)      = INTP
   ENDDO

   ! Reorder nodes:
   TRINODS(1:NINTP_TRI) = TRINODS(II(1:NINTP_TRI))

   ! Define and Insertion add segments to CFELEM, indseg
   EDGETRI = IBM_UNDEFINED
   DO IEDGE=1,NINTP_TRI-1
        EDGETRI(NOD1:NOD2,IEDGE) = (/ TRINODS(IEDGE), TRINODS(IEDGE+1) /)
   ENDDO
   EDGETRI(NOD1:NOD2,NINTP_TRI) = (/ TRINODS(NINTP_TRI), TRINODS(1) /)

   LOCTRI = BODINT_PLANE%INDTRI(1,ITRI)
   LOCBOD = BODINT_PLANE%INDTRI(2,ITRI)

   DO IEDGE=1,NINTP_TRI

      IF ( EDGETRI(NOD1,IEDGE) == EDGETRI(NOD2,IEDGE) ) CYCLE

      ! Test if Edge already on list:
      INLIST = .FALSE.
      DO ISEG=1,NEDGE

         IF ( (EDGETRI(NOD1,IEDGE) == CEELEM(NOD1,ISEG)) .AND. & ! same inod1
              (EDGETRI(NOD2,IEDGE) == CEELEM(NOD2,ISEG)) .AND. & ! same inod2
              (LOCBOD              == INDSEG(4,ISEG)) ) THEN     ! same ibod

            SELECT CASE(INDSEG(1,ISEG))
               ! Only one triangle in list:
               CASE(1)
                  IF ( LOCTRI /= INDSEG(2,ISEG) ) THEN
                     INDSEG(1,ISEG) = 2
                     INDSEG(3,ISEG) = LOCTRI ! add triangle 2nd.
                  ENDIF
                  INLIST = .TRUE.
                  EXIT
               ! Two triangles in list:
               CASE(2)
                  IF ( (LOCTRI == INDSEG(2,ISEG)) .OR. &
                       (LOCTRI == INDSEG(3,ISEG)) ) THEN
                     INLIST = .TRUE.
                     EXIT
                  ENDIF
            END SELECT
         ENDIF
      ENDDO

      IF ( .NOT.INLIST ) THEN ! Edge not in list.
         NEDGE = NEDGE + 1
         CEELEM(NOD1:NOD2,NEDGE) =  EDGETRI(NOD1:NOD2,IEDGE)

         ! Here we have to figure out if segment belongs to a triangles side:
         SEG_IN_SIDE = .FALSE.
         DO IPT=1,NTVERT

            ! Triangle side nodes:
            XY1(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , TSEGS(NOD1,IPT) )
            XY2(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , TSEGS(NOD2,IPT) )

            ! Segment points:
            XP1(IAXIS:JAXIS) = X2X3VERT(IAXIS:JAXIS,CEELEM(NOD1,NEDGE))
            XP2(IAXIS:JAXIS) = X2X3VERT(IAXIS:JAXIS,CEELEM(NOD2,NEDGE))

            VECS(IAXIS:JAXIS)  = XY2(IAXIS:JAXIS) - XY1(IAXIS:JAXIS)
            VECP1(IAXIS:JAXIS) = XP1(IAXIS:JAXIS) - XY1(IAXIS:JAXIS)
            VECP2(IAXIS:JAXIS) = XP2(IAXIS:JAXIS) - XY1(IAXIS:JAXIS)

            CROSSP1 = ABS(VECS(IAXIS)*VECP1(JAXIS)-VECS(JAXIS)*VECP1(IAXIS))
            CROSSP2 = ABS(VECS(IAXIS)*VECP2(JAXIS)-VECS(JAXIS)*VECP2(IAXIS))

            IF ( (CROSSP1+CROSSP2) < GEOMEPS ) THEN
               SEG_IN_SIDE = .TRUE.
               EXIT
            ENDIF
         ENDDO
         IF ( SEG_IN_SIDE ) THEN
            EDGE_TRI = GEOMETRY(LOCBOD)%FACE_EDGES(IPT,LOCTRI) ! WSTRIED
            VEC3(1)  = GEOMETRY(LOCBOD)%EDGE_FACES(1,EDGE_TRI) ! WSEDTRI
            VEC3(2)  = GEOMETRY(LOCBOD)%EDGE_FACES(2,EDGE_TRI)
            VEC3(3)  = GEOMETRY(LOCBOD)%EDGE_FACES(4,EDGE_TRI)
            INDSEG(1:4,NEDGE) = (/ VEC3(1), VEC3(2), VEC3(3), LOCBOD /)
         ELSE
            INDSEG(1:4,NEDGE) = (/ 1, LOCTRI, 0, LOCBOD /)
         ENDIF
      ENDIF
   ENDDO

ENDDO

! Now define cut-edges from solid-solid segments:
DO IWSSEG=1,BODINT_PLANE%NSEGS

   NINTP_SEG = 0
   SEGNODS   = IBM_UNDEFINED

   SEG(NOD1:NOD2) = BODINT_PLANE%SEGS(NOD1:NOD2,IWSSEG)
   DO INOD=NOD1,NOD2
      XYEL(IAXIS:JAXIS,INOD) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) ,SEG(INOD))
   ENDDO
   ! Cycle if Edges BBOX not intersecting face:
   OUTX2= ((X2FMIN-MAXVAL(XYEL(IAXIS,NOD1:NOD2))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(IAXIS,NOD1:NOD2))-X2FMAX) > GEOMEPS) ! Segment out of Face in x2 dir
   OUTX3= ((X3FMIN-MAXVAL(XYEL(JAXIS,NOD1:NOD2))) > GEOMEPS) .OR. &
          ((MINVAL(XYEL(JAXIS,NOD1:NOD2))-X3FMAX) > GEOMEPS) ! Segment out of Face in x3 dir
   OUTFACE = OUTX2 .OR. OUTX3
   IF (OUTFACE) CYCLE

   ! Now define nodes for this CEELEM:
   ! a-1. Test if Segments vertices Lay on Faces area, including face boundary:
   DO IPT=1,NSVERT
      OUTX2= ((X2FMIN-XYEL(IAXIS,IPT)) > GEOMEPS) .OR. &
             ((XYEL(IAXIS,IPT)-X2FMAX) > GEOMEPS)  ! Triang out of Face in x2 dir
      OUTX3= ((X3FMIN-XYEL(JAXIS,IPT)) > GEOMEPS) .OR. &
             ((XYEL(JAXIS,IPT)-X3FMAX) > GEOMEPS)  ! Triang out of Face in x3 dir
      OUTFACE = OUTX2 .OR. OUTX3
      IF ( OUTFACE ) CYCLE

      ! Insertion add point to intersection list:
      XP(IAXIS:JAXIS) = XYEL(IAXIS:JAXIS,IPT)
      CALL INSERT_POINT_2D(XP,NINTP,SIZE_X2X3VERT,X2X3VERT,INOD)

      ! Insert sort node to triangles local list
      TRUETHAT = .TRUE.
      DO INP=1,NINTP_SEG
         IF (SEGNODS(INP) == INOD) THEN
            TRUETHAT = .FALSE.
            EXIT
         ENDIF
      ENDDO
      IF ( TRUETHAT ) THEN ! new inod entry on list
         NINTP_SEG = NINTP_SEG + 1
         SEGNODS(NINTP_SEG) = INOD
      ENDIF
   ENDDO

   IF(NINTP_SEG < 2) THEN
      ! b. Now add face edge - SS edge intersection points:
      ! x2 segments:
      DO MYAXIS=IAXIS,JAXIS
         SELECT CASE(MYAXIS)
            CASE(IAXIS)
               XIAXIS = IAXIS
               XJAXIS = JAXIS
               XIPLNS(LOW_IND:HIGH_IND) = (/ X2FMIN, X2FMAX /)
               XJPLNS(LOW_IND:HIGH_IND) = (/ X3FMIN, X3FMAX /)
            CASE(JAXIS)
               XIAXIS = JAXIS
               XJAXIS = IAXIS
               XIPLNS(LOW_IND:HIGH_IND) = (/ X3FMIN, X3FMAX /)
               XJPLNS(LOW_IND:HIGH_IND) = (/ X2FMIN, X2FMAX /)
         END SELECT

         DO JPL=LOW_IND,HIGH_IND

            XJPLN = XJPLNS(JPL)

            XY1(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , SEG(NOD1) )
            XY2(IAXIS:JAXIS) = BODINT_PLANE%XYZ( (/ X2AXIS, X3AXIS /) , SEG(NOD2) )

            ! b-1. Drop if Edge on one side of segment ray:
            MAXXJ = MAX(XY1(XJAXIS),XY2(XJAXIS))
            MINXJ = MIN(XY1(XJAXIS),XY2(XJAXIS))
            OUTPLANE1 = ((XJPLN-MAXXJ) > GEOMEPS) .OR. ((MINXJ-XJPLN) > GEOMEPS)
            IF ( OUTPLANE1 ) CYCLE

            ! b-2. Also drop if Edge ouside of face edge limits:
            MAXXI = MAX(XY1(XIAXIS),XY2(XIAXIS))
            MINXI = MIN(XY1(XIAXIS),XY2(XIAXIS))
            OUTPLANE2 = ((XIPLNS(LOW_IND)-MAXXI) > GEOMEPS) .OR. ((MINXI-XIPLNS(HIGH_IND)) > GEOMEPS)
            IF ( OUTPLANE2 ) CYCLE

            ! Test if segment aligned with xi
            XIALIGNED = ((MAXXJ-MINXJ) < GEOMEPS)
            IF ( XIALIGNED ) CYCLE ! Aligned and on top of xjpln: Intersection points already added.

            ! Drop intersections in EDGE nodes: already added.
            ! Compute: dot(plnormal, xyzv - xypl):
            DOT1 = XY1(XJAXIS) - XJPLN
            DOT2 = XY2(XJAXIS) - XJPLN

            IF ( ABS(DOT1) <= GEOMEPS ) CYCLE
            IF ( ABS(DOT2) <= GEOMEPS ) CYCLE

            ! Finally regular case:
            ! Points 1 on one side of x2 segment, point 2 on the other:
            IF ( DOT1*DOT2 < 0._EB ) THEN

               ! Intersection Point along segment:
               DS    = (XJPLN-XY1(XJAXIS))/(XY2(XJAXIS)-XY1(XJAXIS))
               SVARI = XY1(XIAXIS) + DS*(XY2(XIAXIS)-XY1(XIAXIS))

               OUTSEG= ((XIPLNS(LOW_IND)-SVARI) > -GEOMEPS) .OR. ((SVARI-XIPLNS(HIGH_IND)) > -GEOMEPS)
               IF ( OUTSEG ) CYCLE

               ! Insertion add point to intersection list:
               XP(XIAXIS) = SVARI
               XP(XJAXIS) = XJPLN
               CALL INSERT_POINT_2D(XP,NINTP,SIZE_X2X3VERT,X2X3VERT,INOD)

               ! Insert sort node to EDGES local list
               TRUETHAT = .TRUE.
               DO INP=1,NINTP_SEG
                  IF (SEGNODS(INP) == INOD) THEN
                     TRUETHAT = .FALSE.
                     EXIT
                  ENDIF
               ENDDO
               IF (TRUETHAT) THEN ! new inod entry on list
                  NINTP_SEG = NINTP_SEG + 1
                  SEGNODS(NINTP_SEG) = INOD
               ENDIF
               CYCLE
            ENDIF
         ENDDO
      ENDDO
   ENDIF

   IF ( (NINTP_SEG < 2) .OR. (SEGNODS(NOD1) == SEGNODS(NOD2)) ) CYCLE

   ! Test if Edge already on list:
   INLIST = .FALSE.
   DO ISEG=1,NEDGE

      IF ( (SEGNODS(NOD1) == CEELEM(NOD1,ISEG)) .AND. & ! same inod1
           (SEGNODS(NOD2) == CEELEM(NOD2,ISEG)) .AND. & ! same inod2
           (BODINT_PLANE%INDSEG(4,IWSSEG) == INDSEG(4,ISEG)) ) THEN     ! same ibod

         IF (ANY(BODINT_PLANE%INDSEG(2:3,IWSSEG) == INDSEG(2,ISEG))) THEN
            ! Edge already in list, Use SS Edge INDSEG:
            INDSEG(1:4,ISEG) = BODINT_PLANE%INDSEG(1:4,IWSSEG)
            INLIST = .TRUE.
            EXIT
         ELSE
            WRITE(LU_ERR,*) "Error in GET_TRIANG_FACE_INT: SS EDGE Triangles not on 2 WS triang list INDSEG."
         ENDIF
      ENDIF
   ENDDO

   IF ( .NOT.INLIST ) THEN ! Edge not in list.
      NEDGE = NEDGE + 1
      CEELEM(NOD1:NOD2,NEDGE) =  SEGNODS(NOD1:NOD2)
      INDSEG(1:4,NEDGE)       = BODINT_PLANE%INDSEG(1:4,IWSSEG)
   ENDIF
ENDDO

! Populate XYVERT points array:
IF(SIZE_X2X3VERT > SIZE(XYVERT,DIM=2)) THEN
   WRITE(LU_ERR,*) 'Error in GET_TRIANG_FACE_INT : SIZE_X2X3VERT in greater than SIZE(XYVERT,DIM=2).'
   CALL SHUTDOWN('Shutting down..')
ENDIF
XYVERT = 0._EB
XYVERT(IAXIS:JAXIS,1:SIZE_X2X3VERT) = X2X3VERT(IAXIS:JAXIS,1:SIZE_X2X3VERT)
NVERT = NINTP
IF (NVERT > 0) INB_FLG = .TRUE.

DEALLOCATE(FVERT_IN_TRIANG, TRIVERT_IN_FACE)

RETURN
END SUBROUTINE GET_TRIANG_FACE_INT

! ------------------------- INSERT_POINT_2D -------------------------------------

SUBROUTINE INSERT_POINT_2D(XP,NVERT,SIZE_XYVERT,XYVERT,INOD)

REAL(EB), INTENT(IN)    :: XP(IAXIS:JAXIS)
INTEGER,  INTENT(INOUT) :: NVERT
INTEGER, INTENT(INOUT) :: SIZE_XYVERT
REAL(EB), ALLOCATABLE, INTENT(INOUT) :: XYVERT(:,:)
INTEGER,  INTENT(OUT)   :: INOD

! Local Variables:
LOGICAL :: INLIST
REAL(EB):: DV(IAXIS:JAXIS), DVNORM
REAL(EB),  ALLOCATABLE, DIMENSION(:,:) :: XYVERT_AUX

INLIST = .FALSE.
DO INOD=1,NVERT
   DV(IAXIS:JAXIS) = XP(IAXIS:JAXIS) - XYVERT(IAXIS:JAXIS,INOD)
   DVNORM = SQRT( DV(IAXIS)**2._EB + DV(JAXIS)**2._EB )
   IF ( DVNORM < GEOMEPS ) THEN
      INLIST = .TRUE.
      EXIT
   ENDIF
ENDDO
IF ( .NOT.INLIST ) THEN
   NVERT = NVERT + 1
   INOD  = NVERT
   ! If NVERT > SIZE(XYVERT,DIM=2) reallocate:
   IF(NVERT > SIZE_XYVERT) THEN
       ALLOCATE(XYVERT_AUX(IAXIS:JAXIS,1:SIZE_XYVERT)); XYVERT_AUX(:,:) = XYVERT(:,:)
       DEALLOCATE(XYVERT); ALLOCATE(XYVERT(IAXIS:JAXIS,SIZE_XYVERT+DELTA_VERT)); XYVERT = 0._EB
       XYVERT(IAXIS:JAXIS,1:SIZE_XYVERT) = XYVERT_AUX(IAXIS:JAXIS,1:SIZE_XYVERT)
       SIZE_XYVERT = SIZE_XYVERT + DELTA_VERT
   ENDIF
   XYVERT(IAXIS:JAXIS,INOD) = XP(IAXIS:JAXIS)
ENDIF

RETURN
END SUBROUTINE INSERT_POINT_2D

! ---------------------------- DEBUG_WAIT ---------------------------------------

SUBROUTINE DEBUG_WAIT
USE COMP_FUNCTIONS, ONLY: FDS_SLEEP
INTEGER I
INTEGER, PARAMETER :: N_SEG=20
WRITE(LU_ERR,'(A,I6,A,I2,A)') 'Process ID=',MY_RANK,'; execution halted for ',N_SEG,' seconds : '
DO I=1,N_SEG
   CALL FDS_SLEEP(1)
   IF (I<N_SEG) THEN
      WRITE(LU_ERR,'(I2,A)',ADVANCE="no") I,', '
   ELSE
      WRITE(LU_ERR,'(I2,A)') I,'.'
   ENDIF
ENDDO
RETURN
END SUBROUTINE DEBUG_WAIT

! ------------------------------------------------------------------------------------
! ---------------------------- GET_TRNF_INDEX ----------------------------------------

SUBROUTINE GET_TRNF_INDEX(TRNF_ID, TRNF_INDEX)
   CHARACTER(LABEL_LENGTH), INTENT(IN) :: TRNF_ID
   INTEGER, INTENT(OUT) :: TRNF_INDEX

   INTEGER :: I
   TYPE(TRANSFORM_TYPE), POINTER :: T=>NULL()
   TRNF_INDEX = -1
TRAN_LOOP: DO I=1,N_TRNF
      T=>TRANSFORM(I,1)
      IF (TRIM(T%ID)==TRIM(TRNF_ID)) THEN
        TRNF_INDEX = I
        RETURN
      ENDIF
   ENDDO TRAN_LOOP
END SUBROUTINE GET_TRNF_INDEX

! -------------------------------------------------------------------------------
! ---------------------------- GET_GEOM_INDEX ----------------------------------------

SUBROUTINE GET_GEOM_INDEX(GEOM_ID, GEOM_INDEX)
   CHARACTER(LABEL_LENGTH), INTENT(IN) :: GEOM_ID
   INTEGER, INTENT(OUT) :: GEOM_INDEX

   INTEGER :: I
   TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()

   GEOM_INDEX = -1
READ_GEOM_LOOP: DO I=1,N_GEOMETRY
      G=>GEOMETRY(I)
      IF (TRIM(G%ID)==TRIM(GEOM_ID)) THEN
        GEOM_INDEX = I
        RETURN
      ENDIF
   ENDDO READ_GEOM_LOOP
END SUBROUTINE GET_GEOM_INDEX

! -------------------------------------------------------------------------------
! ---------------------------- READ_TRAN ----------------------------------------

SUBROUTINE READ_TRNF
CHARACTER(LABEL_LENGTH) :: GEOM_ID, ID

INTEGER :: IOS, IZERO, N, NM, I, GEOM_INDEX
INTEGER :: N_VERTS, N_FACES

REAL(EB) :: Z_OFFSET, Z_DEFAULT=-1000000.0

TYPE(TRANSFORM_TYPE), POINTER :: T=>NULL()
TYPE(GEOMETRY_TYPE), POINTER :: GIN=>NULL(), GOUT=>NULL()

NAMELIST /TRNF/ GEOM_ID, ID, Z_OFFSET

! first pass - count number of &TRNF lines

N_TRNF=0
REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0
COUNT_TRNF_LOOP: DO
   CALL CHECKREAD('TRNF',LU_INPUT,IOS)  ; IF (STOP_STATUS==SETUP_STOP) RETURN
   IF (IOS==1) EXIT COUNT_TRNF_LOOP
   READ(LU_INPUT,NML=TRNF,END=11,ERR=12,IOSTAT=IOS)
   N_TRNF=N_TRNF+1
   12 IF (IOS>0) CALL SHUTDOWN('ERROR: problem with &TRNF namelist')
ENDDO COUNT_TRNF_LOOP
11 REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0
IF (N_TRNF==0) RETURN

IF (N_GEOMETRY == 0) THEN
   WRITE(MESSAGE,'(A)') 'ERROR: A &TRNF namelist requires at least one &GEOM namelist to transform'
   CALL SHUTDOWN(MESSAGE); RETURN
ENDIF

! Allocate GEOMETRY_TRNF and TRANSFORM arrays

ALLOCATE(GEOMETRY_TRANSFORM(N_TRNF,NMESHES),STAT=IZERO)
CALL ChkMemErr('READ_TRNF','GEOMETRY_TRANSFORM',IZERO)

ALLOCATE(TRANSFORM(N_TRNF,NMESHES),STAT=IZERO)
CALL ChkMemErr('READ_TRNF','TRANSFORM',IZERO)

! second pass - read TRNF data

READ_TRNF_LOOP: DO N=1,N_TRNF
      CALL CHECKREAD('TRNF',LU_INPUT,IOS)  ; IF (STOP_STATUS==SETUP_STOP) RETURN
      IF (IOS==1) EXIT READ_TRNF_LOOP

      Z_OFFSET   = Z_DEFAULT;
      ID         = 'null'
      GEOM_ID    = 'null'

      READ(LU_INPUT,TRNF,END=21)
      IF (ID=='null') THEN
         WRITE(MESSAGE,'(A)') 'ERROR: ID keyword not defined on &TRNF namelist'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      IF (GEOM_ID=='null') THEN
         WRITE(MESSAGE,'(A)') 'ERROR: GEOM_ID keyword not defined on &TRNF namelist'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      IF (Z_OFFSET-1.0<Z_DEFAULT) THEN
         WRITE(MESSAGE,'(A)') 'ERROR: Z_OFFSET keyword not defined on &TRNF namelist'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      CALL GET_GEOM_INDEX(GEOM_ID, GEOM_INDEX)
      IF (GEOM_INDEX<1) THEN
         WRITE(MESSAGE,'(A,A,A)') 'ERROR: The GEOM id,',TRIM(GEOM_ID),' specified on a &TRNF line was not found'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF

      MESH_LOOP: DO NM = 1, NMESHES
         T=>TRANSFORM(N,NM)
         T%ID          = ID
         T%GEOM_ID     = GEOM_ID
         T%GEOM_INDEX  = GEOM_INDEX
         T%Z_OFFSET    = Z_OFFSET
         WRITE(T%FILE,'(A,A,I2.2,A,I2.2,A)') TRIM(CHID),'_tran_',N,'_',NM,'.ge'
      ENDDO MESH_LOOP
ENDDO READ_TRNF_LOOP
21 REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0

! transform the &GEOM data specified on each &TRNF namelist

READ_TRNF_LOOP2: DO N=1, N_TRNF
   MESH_LOOP2: DO NM = 1, NMESHES
      T=>TRANSFORM(N,NM)
      GIN=>GEOMETRY(T%GEOM_INDEX)
      GOUT=>GEOMETRY_TRANSFORM(N,NM)
      Z_OFFSET = T%Z_OFFSET

      N_VERTS      = GIN%N_VERTS
      N_FACES      = GIN%N_FACES
      GOUT%N_VERTS = N_VERTS
      GOUT%N_FACES = N_FACES

      ALLOCATE(GOUT%FACES(3*N_FACES),STAT=IZERO)
      CALL ChkMemErr('READ_TRNF','GOUT%FACES',IZERO)
      GOUT%FACES(1:3*N_FACES) = GIN%FACES(1:3*N_FACES)

      ALLOCATE(GOUT%VERTS(3*N_VERTS),STAT=IZERO)
      CALL ChkMemErr('READ_TRNF','GOUT%VERTS',IZERO)
      DO I = 1, N_VERTS
        GOUT%VERTS(3*I-2) = GIN%VERTS(3*I-2)
        GOUT%VERTS(3*I-1) = GIN%VERTS(3*I-1)
        GOUT%VERTS(3*I)   = GIN%VERTS(3*I) + Z_OFFSET
      END DO
   ENDDO MESH_LOOP2
ENDDO READ_TRNF_LOOP2

END SUBROUTINE READ_TRNF

! -------------------------------------------------------------------------------
! ---------------------------- READ_GEOM ----------------------------------------

SUBROUTINE READ_GEOM
USE BOXTETRA_ROUTINES, ONLY: TETRAHEDRON_VOLUME, REMOVE_DUPLICATE_VERTS
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT
USE MPI_F08
USE OUTPUT_DATA, ONLY: COLOR2RGB

CHARACTER(LABEL_LENGTH) :: ID,MATL_ID,TEXTURE_MAPPING, &
                           DEVC_ID,PROP_ID,CTRL_ID,SURF_IDS(3),SURF_ID6(6),MOVE_ID
CHARACTER(MESSAGE_LENGTH) :: BUFFER, BIN_GEOM_FILENAME,BINARY_FILE
CHARACTER(LABEL_LENGTH),  ALLOCATABLE, DIMENSION(:) :: SURF_ID
REAL(EB), ALLOCATABLE, DIMENSION(:) :: ZVALS,TFACES
REAL(EB), ALLOCATABLE, TARGET, DIMENSION(:) :: VERTS, VERTS_AUX
INTEGER, ALLOCATABLE, DIMENSION(:) :: SURF_ID_IND, POLY
INTEGER, ALLOCATABLE, TARGET, DIMENSION(:) :: FACES,FACES_AUX,VOLUS,OFACES,SURFS,SURFS2
LOGICAL, ALLOCATABLE, DIMENSION(:) :: IS_EXTERNAL

REAL(EB) :: SPHERE_ORIGIN(3),SPHERE_RADIUS,TEXTURE_ORIGIN(3),TEXTURE_SCALE(2),XB(6),DX,BOX_XYZ(3),&
            ZMIN,VOLUME,TXMIN,TXMAX,TYMIN,TYMAX,TX,TY,DV1(MAX_DIM),DV2(MAX_DIM),&
            NVECI(MAX_DIM),DXCEN(MAX_DIM),DOTI,TRANSPARENCY,CYLINDER_ORIGIN(3),CYLINDER_AXIS(3),&
            CYLINDER_RADIUS,CYLINDER_LENGTH,EXTRUDE

INTEGER :: MAX_IDS=0,MAX_SURF_IDS=0,MAX_ZVALS=0,MAX_VERTS=0,MAX_FACES=0,MAX_VOLUS=0,MAX_POLY_VERTS=0,&
           N_VERTS,N_FACES,N_FACES_TEMP,N_VOLUS,N_ZVALS,N_SURF_ID,N_SURF_ID2,N_POLY_VERTS,&
           MATL_INDEX,IOS,IZERO,N,I,J,K,IJ,FIRST_FACE_INDEX,I1,I2,I3,I4,&
           GEOM_TYPE,NXB,IJK(3),N_LEVELS,N_LAT,N_LONG,SPHERE_TYPE,BOXVERTLIST(8),NI,NIJ,IVOL,SORT_FACES,II,II1,II2,II3,&
           X1AXIS,NNN,CYLINDER_NSEG_THETA,CYLINDER_NSEG_AXIS,CYL_FIND(LOW_IND:HIGH_IND,1:3)

LOGICAL :: AUTO_TEXTURE,HAVE_SURF,HAVE_MATL,IN_LIST,SURF_INDEX_PER_FACE,BNDF_GEOM,LOGTEST
REAL(EB), POINTER, DIMENSION(:) :: V1,V2,V3,V4
INTEGER, POINTER, DIMENSION(:) :: FACEI,FACEJ,FACE_FROM,FACE_TO,VOL
TYPE(MESH_TYPE), POINTER :: M=>NULL()
TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()

INTEGER,  PARAMETER :: CAD_GEOM_TYPE=1,TERRAIN_GEOM_TYPE=2,&
                       BOX_GEOM_TYPE=3,SPHERE_GEOM_TYPE=4,CYLINDER_GEOM_TYPE=5,EXTPOLY_GEOM_TYPE=6 ! These 4 are for internal use.

REAL(EB), PARAMETER :: MAX_VAL=1.0E20_EB

LOGICAL :: READ_BINARY

INTEGER :: IJF, IJB, IJE, NM
INTEGER, ALLOCATABLE, DIMENSION(:) :: B_IND,E_IND,F_IND
REAL(EB) :: XLOW,XHI,YLOW,YHI,ZLOW,ZHI,DELX,DELY,DELTZ

LOGICAL :: IS_TERRAIN,EXTEND_TERRAIN,WRITE_WARNING
REAL(EB):: ZVAL_HORIZON, ZVAL_FACTOR

INTEGER :: START_FACE_LO, START_FACE_MID, START_FACE_HI

INTEGER :: N_EDGES,N_BEDGES,N_FACES_ORIG,N_VERTS_ORIG,N_VOLUS_ORIG,ICPT,CLOSE_PT(NOD1:NOD4+1), RGB(3)=-1
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: EDGES,FACE_EDGES,EDGE_FACES,BOUND_EDGES,BOUND_EDGES2
INTEGER, ALLOCATABLE, DIMENSION(:) :: NBND_EDGE,COUNTED_EDGES
REAL(EB) :: X_CEN,Y_CEN,ZMIN2,CORNER_PT(IAXIS:JAXIS,NOD1:NOD4+1),DIST,DISTI
REAL(EB), PARAMETER :: VERXY(IAXIS:JAXIS,NOD1:NOD4) = &
                       RESHAPE((/0._EB,1._EB,-1._EB,0._EB,0._EB,-1._EB,1._EB,0._EB/),(/ 2, 4 /))
CHARACTER(25) :: COLOR='null'

REAL(EB) :: XBP(IAXIS:KAXIS,NOD1:NOD2),XBP2(IAXIS:KAXIS,NOD1:NOD2),XXX,YYY,ZZZ

LOGICAL :: SNAP_TO_GRID=.FALSE., DONE

INTEGER :: INOD, ILINE, IERR

INTEGER :: IG, IVERT

INTEGER, ALLOCATABLE, DIMENSION(:) :: GEOM_LINE,GEOM_LINE2
INTEGER, PARAMETER :: DELTA_GEOM_LINE=1000
INTEGER :: GEOM_LINE_SIZE

NAMELIST /GEOM/ AUTO_TEXTURE,BNDF_GEOM,BINARY_FILE,COLOR,CYLINDER_ORIGIN,CYLINDER_AXIS,&
                CYLINDER_RADIUS,CYLINDER_LENGTH,CYLINDER_NSEG_THETA,CYLINDER_NSEG_AXIS,&
                EXTRUDE,EXTEND_TERRAIN,FACES,ID,IJK,IS_TERRAIN,MOVE_ID,MATL_ID,N_LAT,N_LEVELS,N_LONG,POLY,PROP_ID,&
                RGB,SNAP_TO_GRID,SPHERE_ORIGIN,SPHERE_RADIUS,SPHERE_TYPE,SURF_ID,SURF_IDS,SURF_ID6,&
                TEXTURE_MAPPING,TEXTURE_ORIGIN,TEXTURE_SCALE,TRANSPARENCY,&
                VERTS,VOLUS,XB,ZMIN,ZVALS,ZVAL_HORIZON

! first pass - count number of &GEOM lines.

N_GEOMETRY=0
ALLOCATE(GEOM_LINE(DELTA_GEOM_LINE)); GEOM_LINE = 0
GEOM_LINE_SIZE = SIZE(GEOM_LINE,DIM=1)
REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0
COUNT_GEOM_LOOP: DO
   CALL CHECKREAD('GEOM',LU_INPUT,IOS)  ; IF (STOP_STATUS==SETUP_STOP) RETURN
   IF (IOS==1) EXIT COUNT_GEOM_LOOP
   IF(N_GEOMETRY+1 > GEOM_LINE_SIZE) THEN
      ALLOCATE(GEOM_LINE2(GEOM_LINE_SIZE))
      GEOM_LINE2(1:GEOM_LINE_SIZE) = GEOM_LINE(1:GEOM_LINE_SIZE)
      DEALLOCATE(GEOM_LINE)
      ALLOCATE(GEOM_LINE(GEOM_LINE_SIZE+DELTA_GEOM_LINE)); GEOM_LINE = 0
      GEOM_LINE(1:GEOM_LINE_SIZE) = GEOM_LINE2(1:GEOM_LINE_SIZE)
      GEOM_LINE_SIZE = SIZE(GEOM_LINE,DIM=1)
      DEALLOCATE(GEOM_LINE2)
   ENDIF
   READ(LU_INPUT,'(A)')BUFFER
   N_GEOMETRY=N_GEOMETRY+1
   GEOM_LINE(N_GEOMETRY) = INPUT_FILE_LINE_NUMBER
ENDDO COUNT_GEOM_LOOP
REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0
IF (N_GEOMETRY==0) RETURN

! Allocate GEOMETRY array

ALLOCATE(GEOMETRY(0:N_GEOMETRY),STAT=IZERO)
CALL ChkMemErr('READ_GEOM','GEOMETRY',IZERO)

! third pass - read GEOM data

READ_GEOM_LOOP: DO N=1,N_GEOMETRY
   G=>GEOMETRY(N)

   CALL CHECKREAD('GEOM',LU_INPUT,IOS)  ; IF (STOP_STATUS==SETUP_STOP) RETURN
   IF (IOS==1) EXIT READ_GEOM_LOOP

   IF(MAX_ZVALS/=MAXIMUM_GEOMETRY_ZVALS) THEN ! Reset to default GEOMETRY values and allocate ARRAYS.
      MAX_ZVALS=0; MAX_VERTS=0; MAX_FACES=0; MAX_VOLUS=0; MAX_IDS=0; MAX_SURF_IDS=0; MAX_POLY_VERTS=0
      CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
      CALL ALLOCATE_BUFFERS
   ENDIF

   GEO_RESIZE_DO : DO
      DONE=.TRUE.
      CALL SET_GEOM_DEFAULTS
      READ(LU_INPUT,GEOM,END=35,ERR=22,IOSTAT=IOS)
      22 IF (IOS>0) THEN
         IF (  (ZVALS(MAX_ZVALS+1)   < MAX_VAL) .OR. (VERTS(3*MAX_VERTS+1) < MAX_VAL) .OR.&
             (FACES(4*MAX_FACES+1)   >       0) .OR. (VOLUS(4*MAX_VOLUS+1) >       0)) THEN
            ! Resize MAX_ZVALS, MAX_VERTS, MAX_FACES, MAX_VOLUS:
            MAX_ZVALS = MAX_ZVALS + 25000
            CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
            CALL ALLOCATE_BUFFERS
            DONE=.FALSE.
         ELSE
            WRITE(BUFFER,'(A,A,A)') 'ERROR: GEOM ID=',TRIM(ID),'. Check &GEOM input line.'
            CALL SHUTDOWN(TRIM(BUFFER))
            RETURN
         ENDIF
         REWIND(LU_INPUT); DO ILINE=1,GEOM_LINE(N)-1; READ(LU_INPUT,'(A)') BUFFER; ENDDO
      ENDIF
      IF (DONE) EXIT GEO_RESIZE_DO
   ENDDO GEO_RESIZE_DO

   IF (COLOR/='null') THEN
      CALL COLOR2RGB(RGB,COLOR)
   ENDIF
   G%RGB = RGB
   G%TRANSPARENCY = TRANSPARENCY
   N_VERTS=0
   N_FACES=0
   TFACES(1:6*MAX_FACES) = -1.0_EB
   N_VOLUS=0
   N_ZVALS=0
   N_POLY_VERTS=0
   IF(TRIM(BINARY_FILE)/='null') READ_BINARY = .TRUE. ! In case a binary name is provided, read the binary.
   G%READ_BINARY = READ_BINARY

   ! Get number of SURF_IDs defined for the GEOM:
   N_SURF_ID = 0
   DO I = 1, MAX_SURF_IDS
      IF( SURF_ID(I)=='null' ) EXIT ! First 'null'
      N_SURF_ID = N_SURF_ID + 1
   ENDDO

   READ_BIN_COND : IF (.NOT.READ_BINARY) THEN
      ! count VERTS
      DO I = 1, MAX_VERTS
         IF (ANY(VERTS(3*I-2:3*I)>=MAX_VAL)) EXIT
         N_VERTS = N_VERTS+1
      ENDDO

      ! count POLY Verts:
      DO I = 1,MAX_POLY_VERTS
         IF (POLY(I)==0) EXIT
         N_POLY_VERTS = N_POLY_VERTS+1
      ENDDO

      ! count FACES
      DO I = 1, MAX_FACES
         IF (ALL(FACES(4*(I-1)+1:4*(I-1)+3)==0)) EXIT
         N_FACES = N_FACES+1
      ENDDO

      ! Now split FACES array into FACES (connectivity), and SURFS, i.e. local surf ID:
      IF(N_FACES > 0) THEN
         IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS); ALLOCATE(SURFS(N_FACES))
         DO I = 1, N_FACES
            FACES(3*(I-1)+1:3*(I-1)+3) = FACES(4*(I-1)+1:4*(I-1)+3)
            SURFS(I)                   = FACES(4*(I-1)+4)
            IF(SURFS(I) > N_SURF_ID) THEN
               WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: problem with GEOM ',TRIM(ID),&
                                           ', local SURF_ID index for FACE ',I,'out of bounds.'
               CALL SHUTDOWN(MESSAGE); RETURN
            ENDIF
         ENDDO
      ENDIF

      ! count VOLUS
      DO I = 1, MAX_VOLUS
         IF (ANY(VOLUS(4*I-3:4*I)==0)) EXIT
         N_VOLUS = N_VOLUS+1
      ENDDO

      ! count ZVALS
      DO I = 1, MAX_ZVALS
         IF (ZVALS(I)>MAX_VAL) EXIT
         N_ZVALS=N_ZVALS+1
      ENDDO

   ELSE READ_BIN_COND
      ! Read Binary file, reset values of other geometry types to default:
      ! Defaults for terrain, sphere, cylinder, box, etc.
      XB=1.001_EB*MAX_VAL
      SPHERE_ORIGIN = 1.001_EB*MAX_VAL
      SPHERE_RADIUS = 1.001_EB*MAX_VAL
      CYLINDER_LENGTH = 1.001_EB*MAX_VAL
      CYLINDER_RADIUS = 1.001_EB*MAX_VAL
      CYLINDER_ORIGIN = 1.001_EB*MAX_VAL
      CYLINDER_AXIS   = 1.001_EB*MAX_VAL
      CYLINDER_NSEG_THETA = -1
      CYLINDER_NSEG_AXIS  = -1
      N_LEVELS=-1
      N_LAT=-1
      N_LONG=-1
      SPHERE_TYPE=-1

      ! This is to add the SURF_IDS to SURF_ID for analytical geometries being read from bingeom:
      IF (TRIM(SURF_ID(1))=='null' .AND. TRIM(SURF_IDS(1))/='null') THEN ! Case of cylinders.
         SURF_ID(1:3) = SURF_IDS(1:3)
         N_SURF_ID    = 3
         DO I=2,3
           IF (TRIM(SURF_ID(I))=='null') THEN
              WRITE(MESSAGE,'(A,A,A)') 'ERROR: problem with GEOM ',TRIM(ID),&
                                       ', SURF_IDS not defined properly.'
              CALL SHUTDOWN(MESSAGE); RETURN
           ENDIF
         ENDDO
      ENDIF

      ! Read Binary
      OPEN(UNIT=731,FILE=TRIM(BINARY_FILE),STATUS='OLD',FORM='UNFORMATTED',ACTION='READ',ERR=221,IOSTAT=IOS)
      IF (IOS==0) THEN
         READ(731) GEOM_TYPE
         READ(731) N_VERTS,N_FACES,N_SURF_ID2,N_VOLUS
         IF(GEOM_TYPE==TERRAIN_GEOM_TYPE) THEN
            IS_TERRAIN=.TRUE.
         ELSE ! If GEOM is of any type other than terrains, set it to CAD type.
            GEOM_TYPE=CAD_GEOM_TYPE
         ENDIF
         ! Now reallocate if necessary, twice size is to make sure terrains have sufficient array size allocated:
         IF (2*N_VERTS > MAX_VERTS) THEN; MAX_VERTS=2*N_VERTS; DEALLOCATE(VERTS); ALLOCATE(VERTS(1:3*MAX_VERTS)); ENDIF
         IF (2*N_FACES > MAX_FACES) THEN
            MAX_FACES=2*N_FACES
            DEALLOCATE(FACES); ALLOCATE(FACES(1:3*MAX_FACES))
            DEALLOCATE(TFACES); ALLOCATE(TFACES(1:6*MAX_FACES))
         ENDIF
         IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS); ALLOCATE(SURFS(MAX_FACES))
         IF (2*N_VOLUS > MAX_VOLUS) THEN; MAX_VOLUS=2*N_VOLUS; DEALLOCATE(VOLUS); ALLOCATE(VOLUS(1:4*N_VOLUS)); ENDIF
         ! Read Vertices, Faces, Surfs and Volus:
         IF (N_VERTS > 0 ) READ(731) VERTS(1:3*N_VERTS)
         IF (N_FACES > 0 ) THEN
            READ(731) FACES(1:3*N_FACES)
            READ(731) SURFS(1:N_FACES)
         ENDIF
         IF (N_VOLUS > 0 ) READ(731) VOLUS(1:4*N_VOLUS)
         CLOSE(731)
         IF (ANY(SURFS(1:N_FACES)>0) .AND. TRIM(SURF_ID(1))=='null') THEN
          WRITE(MESSAGE,'(A,A,A,A,A)') 'ERROR: missing SURF_ID in &GEOM line ',TRIM(ID),&
                                       ' for binary file ',TRIM(BINARY_FILE),&
                                       '. Add SURF_ID in said &GEOM line.'
          CALL SHUTDOWN(MESSAGE); RETURN
         ENDIF
         IF(N_SURF_ID2 /= N_SURF_ID) THEN
            WRITE(MESSAGE,'(A,A,A,I8,A,I8,A,A,A)') 'ERROR: problem with GEOM ',TRIM(ID),&
                                      ', number of surfaces in SURF_ID field (',N_SURF_ID, &
                                      ') not equal to number of surfaces (',N_SURF_ID2,&
                                      ') defined in bingeom ',TRIM(BINARY_FILE),'.'
            CALL SHUTDOWN(MESSAGE); RETURN
         ENDIF
         DO I = 1, N_FACES
            IF(SURFS(I) > N_SURF_ID) THEN
               WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: problem with GEOM ',TRIM(ID),&
                                           ', local SURF_ID index for FACE ',I,'out of bounds.'
               CALL SHUTDOWN(MESSAGE); RETURN
            ENDIF
         ENDDO
      ENDIF
221   IF(IOS > 0) THEN
         WRITE(MESSAGE,'(A,A,A,A,A)') 'ERROR: could not read binary connectivity for GEOM ',TRIM(ID),&
                                      ' in binary file ',TRIM(BINARY_FILE),&
                                      '. Check file exists.'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
   ENDIF READ_BIN_COND

   N_VERTS_ORIG  = N_VERTS
   N_FACES_ORIG  = N_FACES
   N_VOLUS_ORIG  = N_VOLUS

   !--- setup a 2D surface (terrain) object (ZVALS keyword )
   ZVALS_IF: IF (N_ZVALS>0) THEN
      GEOM_TYPE   = TERRAIN_GEOM_TYPE
      TERRAIN_CASE= .TRUE.
      CALL CHECK_XB(XB)
      IF (N_ZVALS/=IJK(1)*IJK(2) ) THEN
         WRITE(MESSAGE,'(A,I4,A,I4)') 'ERROR: Expected ',IJK(1)*IJK(2),' Z values, found ',N_ZVALS
         CALL SHUTDOWN(MESSAGE)
      ENDIF
      IF (IJK(1)<2 .OR. IJK(2)<2) THEN
         CALL SHUTDOWN('ERROR: IJK(1) and IJK(2) on &GEOM line  needs to be at least 2')
      ENDIF
      NXB=0
      DO I = 1, 4 ! first 4 XB values must be set, don't care about 5th and 6th
        IF (XB(I)<MAX_VAL) NXB=NXB+1
      ENDDO
      IF (NXB<4) THEN
         CALL SHUTDOWN('ERROR: At least 4 XB values (xmin, xmax, ymin, ymax) required when using ZVALS')
      ENDIF

      IF (EXTEND_TERRAIN) THEN
         ! Find XLOW,XHI,YLOW,YHI for the set of NM meshes defined:
         XLOW = 1.E10_EB
         XHI  =-1.E10_EB
         YLOW = 1.E10_EB
         YHI  =-1.E10_EB
         DO NM=1,NMESHES
            XLOW = MIN(XLOW,MESHES(NM)%XS)
            XHI  = MAX(XHI ,MESHES(NM)%XF)
            YLOW = MIN(YLOW,MESHES(NM)%YS)
            YHI  = MAX(YHI ,MESHES(NM)%YF)
         ENDDO
         WRITE_WARNING=.FALSE.
         IF((XB(1)<=XLOW) .OR. (XB(2)>=XHI)) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF((XB(3)<=YLOW) .OR. (XB(4)>=YHI)) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF(MY_RANK==0 .AND. WRITE_WARNING) WRITE(LU_ERR,'(A,A,A)') 'Warning : Terrain &GEOM ',TRIM(ID),&
         ' cannot be extended. When setting EXTEND_TERRAIN=T, make sure it lays entirely within the computational domain.'
      ENDIF

      ! Move Low Z position of terrain to less that number od cutcells, s.t. they don't get computed on the bottom.
      ZMIN2= 1.E10_EB
      DO NM=1,NMESHES
         ZMIN2 = MIN( ZMIN2 , MESHES(NM)%ZS-REAL(NGUARD,EB)/REAL(MESHES(NM)%KBAR,EB)*(MESHES(NM)%ZF-MESHES(NM)%ZS) )
      ENDDO
      ZHI  = MAXVAL(ZVALS(1:N_ZVALS))
      ZLOW = MINVAL(ZVALS(1:N_ZVALS))
      ZLOW = MIN(REAL(FLOOR(ZLOW-0.1_EB*(ZHI-ZLOW)),EB),ZMIN,ZMIN2)

      ZVAL_FACTOR = 1._EB
      IF(ZVAL_HORIZON > MAX_VAL) ZVAL_FACTOR = 0._EB ! Not defined, use boundary polygon heights.

      N_VOLUS = 0; N_VOLUS_ORIG  = N_VOLUS

      ALLOCATE(B_IND(2*(IJK(1)+IJK(2))-3)); B_IND=-1
      ALLOCATE(E_IND(2*(IJK(1)+IJK(2))-3)); E_IND=-1
      ALLOCATE(F_IND(2*(IJK(1)+IJK(2))-3)); F_IND=-1

      ! First add terrain IJK(1)*IJK(2) vertices:
      IJ = 1
      DO J = 1, IJK(2)
         DO I = 1, IJK(1)
            VERTS(3*IJ-2) = (XB(1)*REAL(IJK(1)-I,EB) + XB(2)*REAL(I-1,EB))/REAL(IJK(1)-1,EB)
            VERTS(3*IJ-1) = (XB(3)*REAL(IJK(2)-J,EB) + XB(4)*REAL(J-1,EB))/REAL(IJK(2)-1,EB)
            VERTS(3*IJ) = ZVALS(IJ)
            IJ = IJ + 1
         ENDDO
      ENDDO
      N_VERTS_ORIG  = IJ-1

      ! Boundary indexes:
      IJB = 1
      DO J=1,1
      DO I=1,IJK(1)
         B_IND(IJB)=(J-1)*IJK(1)+I
         IJB = IJB + 1
      ENDDO
      ENDDO
      DO J=2,IJK(2)
      DO I=IJK(1),IJK(1)
         B_IND(IJB)=(J-1)*IJK(1)+I
         IJB = IJB + 1
      ENDDO
      ENDDO
      DO J=IJK(2),IJK(2)
      DO I=IJK(1)-1,1,-1
         B_IND(IJB)=(J-1)*IJK(1)+I
         IJB = IJB + 1
      ENDDO
      ENDDO
      DO J=IJK(2)-1,2,-1
      DO I=1,1
         B_IND(IJB)=(J-1)*IJK(1)+I
         IJB = IJB + 1
      ENDDO
      ENDDO
      B_IND(IJB)= B_IND(1) ! Last point equal to first.

      ! Now add terrain 2*(IJK(1)-1)*(IJK(2)-1) faces:
      IJF = 1
      DO J = 1, IJK(2) - 1
         DO I = 1, IJK(1) - 1
            I1 = (J-1)*IJK(1) + I
            I2 = I1 + 1
            I3 = I2 + IJK(1)
            I4 = I3 - 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
         ENDDO
      ENDDO
      N_FACES_ORIG  = IJF-1

      IF (EXTEND_TERRAIN) THEN
       ! Then add 2*(IJK(1)+IJK(2))-4 extended points:
         DELX = (XHI - XLOW)/REAL(IJK(1)-1,EB)
         DELY = (YHI - YLOW)/REAL(IJK(2)-1,EB)

         IJE = 1
         ! Low Y along X: from IJK(1)*IJK(2)+1 : IJK(1)*IJK(2) + IJK(1)
         DO J=1,1
         DO I=1,IJK(1)
            VERTS(3*IJ-2) = XLOW + DELX*REAL(I-1,EB)
            VERTS(3*IJ-1) = YLOW + DELY*REAL(J-1,EB)
            VERTS(3*IJ)   = (1._EB-ZVAL_FACTOR)*ZVALS((J-1)*IJK(1)+I) + ZVAL_FACTOR*ZVAL_HORIZON
            E_IND(IJE) = IJ
            IJE= IJE + 1
            IJ = IJ  + 1
         ENDDO
         ENDDO

         ! Hi X along Y: from IJK(1)*IJK(2) + IJK(1) + 1  : IJK(1)*IJK(2) + IJK(1) + IJK(2) - 2
         DO J=2,IJK(2)
         DO I=IJK(1),IJK(1)
            VERTS(3*IJ-2) = XLOW + DELX*REAL(I-1,EB)
            VERTS(3*IJ-1) = YLOW + DELY*REAL(J-1,EB)
            VERTS(3*IJ)   = (1._EB-ZVAL_FACTOR)*ZVALS((J-1)*IJK(1)+I) + ZVAL_FACTOR*ZVAL_HORIZON
            E_IND(IJE) = IJ
            IJE= IJE + 1
            IJ = IJ  + 1
         ENDDO
         ENDDO

         ! Hi Y along X: from IJK(1)*IJK(2) + IJK(1) + IJK(2) - 1 : IJK(1)*IJK(2) + 2*IJK(1) + IJK(2) - 2
         DO J=IJK(2),IJK(2)
         DO I=IJK(1)-1,1,-1
            VERTS(3*IJ-2) = XLOW + DELX*REAL(I-1,EB)
            VERTS(3*IJ-1) = YLOW + DELY*REAL(J-1,EB)
            VERTS(3*IJ)   = (1._EB-ZVAL_FACTOR)*ZVALS((J-1)*IJK(1)+I) + ZVAL_FACTOR*ZVAL_HORIZON
            E_IND(IJE) = IJ
            IJE= IJE + 1
            IJ = IJ  + 1
         ENDDO
         ENDDO

         ! Low X Along Y: from IJK(1)*IJK(2) + 2*IJK(1) + IJK(2) - 1 : IJK(1)*IJK(2) + 2*(IJK(1)+IJK(2)) - 4
         DO J=IJK(2)-1,2,-1
         DO I=1,1
            VERTS(3*IJ-2) = XLOW + DELX*REAL(I-1,EB)
            VERTS(3*IJ-1) = YLOW + DELY*REAL(J-1,EB)
            VERTS(3*IJ)   = (1._EB-ZVAL_FACTOR)*ZVALS((J-1)*IJK(1)+I) + ZVAL_FACTOR*ZVAL_HORIZON
            E_IND(IJE) = IJ
            IJE= IJE + 1
            IJ = IJ  + 1
         ENDDO
         ENDDO
         E_IND(IJE) = E_IND(1) ! Last point equal to first.

         DO I=1,IJE-1
            VERTS(3*IJ-2) = VERTS(3*E_IND(I)-2)
            VERTS(3*IJ-1) = VERTS(3*E_IND(I)-1)
            VERTS(3*IJ)   = ZLOW
            F_IND(I)      = IJ
            IJ            = IJ + 1
         ENDDO
         F_IND(IJE) = F_IND(1) ! Last lower point equal to the first.

         ! Remaining Faces:
         ! Extension faces:
         DO I=1,2*(IJK(1)+IJK(2))-4
            I1 = E_IND(I)
            I2 = E_IND(I+1)
            I3 = B_IND(I+1)
            I4 = B_IND(I)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
         ENDDO

         ! Side faces:
         DO I=1,2*(IJK(1)+IJK(2))-4
            I1 = F_IND(I)
            I2 = F_IND(I+1)
            I3 = E_IND(I+1)
            I4 = E_IND(I)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
         ENDDO

      ELSE
         ! Do not Extend to domain boundary:
         DO I=1,IJB-1
            VERTS(3*IJ-2) = VERTS(3*B_IND(I)-2)
            VERTS(3*IJ-1) = VERTS(3*B_IND(I)-1)
            VERTS(3*IJ)   = ZLOW
            F_IND(I)      = IJ
            IJ            = IJ + 1
         ENDDO
         F_IND(IJB) = F_IND(1) ! Last lower point equal to the first.

         ! Side faces:
         DO I=1,2*(IJK(1)+IJK(2))-4
            I1 = F_IND(I)
            I2 = F_IND(I+1)
            I3 = B_IND(I+1)
            I4 = B_IND(I)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
         ENDDO

      ENDIF

      ! Bottom Faces:
      ! First Face:
      I  = 1
      I1 = F_IND(I)
      I2 = F_IND(I+1)
      I3 = F_IND(2*(IJK(1)+IJK(2))-3-I)
      FACES(3*IJF-2) = I2
      FACES(3*IJF-1) = I1
      FACES(3*IJF) = I3
      IJF = IJF + 1

      DO I=2,(2*(IJK(1)+IJK(2))-6)/2
         I1 = F_IND(I)
         I2 = F_IND(I+1)
         I3 = F_IND(2*(IJK(1)+IJK(2))-3-I)
         I4 = F_IND(2*(IJK(1)+IJK(2))-2-I)

         FACES(3*IJF-2) = I2
         FACES(3*IJF-1) = I1
         FACES(3*IJF) = I4
         IJF = IJF + 1

         FACES(3*IJF-2) = I2
         FACES(3*IJF-1) = I4
         FACES(3*IJF) = I3
         IJF = IJF + 1
      ENDDO

      ! Last Face:
      I  = (2*(IJK(1)+IJK(2))-4)/2
      I1 = F_IND(I)
      I2 = F_IND(I+1)
      I3 = F_IND(I+2)
      FACES(3*IJF-2) = I2
      FACES(3*IJF-1) = I1
      FACES(3*IJF) = I3
      IJF = IJF + 1

      N_VERTS = IJ  - 1
      N_FACES = IJF - 1

      DEALLOCATE(B_IND,E_IND,F_IND)

   ELSEIF(IS_TERRAIN) THEN ZVALS_IF

      GEOM_TYPE   = TERRAIN_GEOM_TYPE
      TERRAIN_CASE= .TRUE.

      ! Here estimate final number of Faces and if necessary reallocate FACE, VERTS, SURFS arrays:
      IF ( (2*N_FACES>MAX_FACES) .AND. .NOT.READ_BINARY) THEN
         ALLOCATE(VERTS_AUX(3*N_VERTS)); VERTS_AUX(1:3*N_VERTS)= VERTS(1:3*N_VERTS)
         ALLOCATE(FACES_AUX(4*N_FACES)); FACES_AUX(1:4*N_FACES)= FACES(1:4*N_FACES)
         ALLOCATE(SURFS2(N_FACES));      SURFS2(1:N_FACES)     = SURFS(1:N_FACES)
         MAX_FACES = 2*N_FACES ! Enough for square structured triangulations of more that 200 triangs with domain extension.
         CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
         DEALLOCATE(VERTS,FACES,TFACES);
         ALLOCATE(VERTS(3*MAX_VERTS+1)); ALLOCATE(TFACES(6*MAX_FACES+1)); ALLOCATE(FACES(4*MAX_FACES+1))
         VERTS=1.001_EB*MAX_VAL; FACES=0
         VERTS(1:3*N_VERTS) = VERTS_AUX(1:3*N_VERTS)
         FACES(1:4*N_FACES) = FACES_AUX(1:4*N_FACES)
         DEALLOCATE(SURFS); ALLOCATE(SURFS(MAX_FACES));
         IF(SURF_INDEX_PER_FACE) THEN
            SURFS(:) = 1 ! All external faces point to only entry SURF_ID(1).
         ELSE
            SURFS(:) = 0 ! All external faces point to default surf ID.
         ENDIF
         SURFS(1:N_FACES) = SURFS2(1:N_FACES)
         DEALLOCATE(VERTS_AUX,FACES_AUX,SURFS2)
      ENDIF


      ! First get EDGES arrays to find edges attached to only one face:
      I = SIZE(FACES,DIM=1)
      ALLOCATE(EDGES(NOD1:NOD2,3*N_FACES),FACE_EDGES(EDG1:EDG3,N_FACES),EDGE_FACES(5,3*N_FACES))
      CALL GET_GEOM_EDGES(N_VERTS,N_FACES,I,FACES,N_EDGES,EDGES,FACE_EDGES,EDGE_FACES)

      ! FIND SET OF EDGES:
      ALLOCATE(NBND_EDGE(1:N_EDGES)); NBND_EDGE(1:N_EDGES) = 2 - EDGE_FACES(1,1:N_EDGES) ! 0 if interior edge, 1 bnd.
      N_BEDGES = SUM(NBND_EDGE(1:N_EDGES))
      ALLOCATE(BOUND_EDGES(2,N_BEDGES),BOUND_EDGES2(2,N_BEDGES)); BOUND_EDGES = 0; BOUND_EDGES2 = 0
      ALLOCATE(COUNTED_EDGES(1:N_BEDGES)); COUNTED_EDGES = 0
      ! Reorder Edges in counter-clockwise (x-y plane) direction:
      ! First copy edges in correct counter-clockwise outside node order:
      J=0
      DO I=1,N_EDGES
         IF(NBND_EDGE(I)/=1) CYCLE
         J=J+1
         IF(EDGE_FACES(2,I)>0) THEN
            BOUND_EDGES(NOD1:NOD2,J) = EDGES( (/ NOD1,NOD2 /) , I )
         ELSEIF(EDGE_FACES(4,I)>0) THEN
            BOUND_EDGES(NOD1:NOD2,J) = EDGES( (/ NOD2,NOD1 /) , I )
         ENDIF
      ENDDO

      ! Then reorder-copy edges:
      J = 1; I = 1
      BOUND_EDGES2(NOD1:NOD2,J) = BOUND_EDGES(NOD1:NOD2,I); COUNTED_EDGES(I) = 1
      DO J=2,N_BEDGES
         DO I=1,N_BEDGES
            IF(COUNTED_EDGES(I)==1) CYCLE
            IF(BOUND_EDGES2(NOD2,J-1)==BOUND_EDGES(NOD1,I)) THEN ! Found new edge:
               BOUND_EDGES2(NOD1:NOD2,J) = BOUND_EDGES(NOD1:NOD2,I); COUNTED_EDGES(I) = 1
               EXIT
            ENDIF
         ENDDO
         IF(I>N_BEDGES) THEN ! Error
          WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: For terrain GEOM ',TRIM(ID),&
                                       ' unconnected boundary edge at node number,',BOUND_EDGES2(NOD2,J-1),'.'
          CALL SHUTDOWN(MESSAGE); RETURN
         ENDIF
      ENDDO
      DO I=1,N_BEDGES
         IF (COUNTED_EDGES(I) /= 1) THEN
            WRITE(MESSAGE,'(A,A,A,2I8,A)') 'ERROR: For terrain GEOM ',TRIM(ID),&
                                          ' unconnected boundary edge at nodes,',BOUND_EDGES(NOD1:NOD2,I),'.'
            CALL SHUTDOWN(MESSAGE); RETURN
         ENDIF
      ENDDO
      ! Here all edges are counted and SUM(COUNTED_EDGES(1:N_BEDGES)==N_BEDGES):
      BOUND_EDGES(NOD1:NOD2,1:N_BEDGES) = BOUND_EDGES2(NOD1:NOD2,1:N_BEDGES);
      DEALLOCATE(NBND_EDGE,COUNTED_EDGES,BOUND_EDGES2)

      IF (EXTEND_TERRAIN) THEN
         ! Find XLOW,XHI,YLOW,YHI for the set of NM meshes defined:
         XLOW = 1.E10_EB
         XHI  =-1.E10_EB
         YLOW = 1.E10_EB
         YHI  =-1.E10_EB
         DO NM=1,NMESHES
            XLOW = MIN(XLOW,MESHES(NM)%XS)
            XHI  = MAX(XHI ,MESHES(NM)%XF)
            YLOW = MIN(YLOW,MESHES(NM)%YS)
            YHI  = MAX(YHI ,MESHES(NM)%YF)
         ENDDO
         WRITE_WARNING=.FALSE.
         IF(ANY(VERTS(1:3:3*N_VERTS-2) <= XLOW)) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF(ANY(VERTS(1:3:3*N_VERTS-2) >= XHI )) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF(ANY(VERTS(2:3:3*N_VERTS-1) <= YLOW)) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF(ANY(VERTS(2:3:3*N_VERTS-1) >= YHI )) THEN; WRITE_WARNING =.TRUE.; EXTEND_TERRAIN=.FALSE.; ENDIF
         IF(MY_RANK==0 .AND. WRITE_WARNING) WRITE(LU_ERR,'(A,A,A)') 'Warning : Terrain &GEOM ',TRIM(ID),&
         ' cannot be extended. When setting EXTEND_TERRAIN=T, make sure it lays entirely within the computational domain.'
      ENDIF
      ! Move Low Z position of terrain to less that number od cutcells, s.t. they don't get computed on the bottom.
      ZMIN2= 1.E10_EB
      DELTZ= 0._EB
      DO NM=1,NMESHES
         DELTZ = MAX( DELTZ ,               REAL(NGUARD,EB)/REAL(MESHES(NM)%KBAR,EB)*(MESHES(NM)%ZF-MESHES(NM)%ZS) )
         ZMIN2 = MIN( ZMIN2 , MESHES(NM)%ZS-REAL(NGUARD,EB)/REAL(MESHES(NM)%KBAR,EB)*(MESHES(NM)%ZF-MESHES(NM)%ZS) )
      ENDDO
      ZHI  =-1.E10_EB
      ZLOW = 1.E10_EB
      DO I=1,N_VERTS
         ZLOW = MIN(ZLOW,VERTS(3*I))
         ZHI  = MAX(ZHI ,VERTS(3*I))
      ENDDO
      ! Take the min of LOWZ_VERTS-NGUARD*DZ, ZMIN from input, ZMIN_MESH-NGUARD*DZ:
      ZLOW = MIN(ZLOW-DELTZ,ZMIN,ZMIN2)

      ZVAL_FACTOR = 1._EB
      IF(ZVAL_HORIZON > MAX_VAL) ZVAL_FACTOR = 0._EB ! Not defined, use boundary polygon heights.

      N_VOLUS = 0

      ALLOCATE(B_IND(2*N_BEDGES+1)); B_IND=-1
      ALLOCATE(E_IND(2*N_BEDGES+1)); E_IND=-1
      ALLOCATE(F_IND(2*N_BEDGES+1)); F_IND=-1

      B_IND(1:N_BEDGES) = BOUND_EDGES(NOD1,1:N_BEDGES); B_IND(N_BEDGES+1) = B_IND(1) ! Last equal to first

      ! All vertices in counter-clockwise dir are in BOUND_EDGES(NOD1,1:N_BEDGES)
      ! IF EXTEND_TERRAIN, of this vertex list find the 4 points SW, SE, NW, NE closest to the boundary of the domain.
      IF (EXTEND_TERRAIN) THEN

         B_IND(N_BEDGES+1:2*N_BEDGES) = B_IND(1:N_BEDGES)
         B_IND(2*N_BEDGES+1)          = B_IND(1)

         ! Find the 4 points closest to SE, NE, NW, SW corners.
         CORNER_PT(IAXIS:JAXIS,NOD1)  = (/ XHI , YLOW /) ! SE
         CORNER_PT(IAXIS:JAXIS,NOD2)  = (/ XHI , YHI  /) ! NE
         CORNER_PT(IAXIS:JAXIS,NOD3)  = (/ XLOW, YHI  /) ! NW
         CORNER_PT(IAXIS:JAXIS,NOD4)  = (/ XLOW, YLOW /) ! SW
         CORNER_PT(IAXIS:JAXIS,NOD4+1)= CORNER_PT(IAXIS:JAXIS,NOD1) ! SE
         CLOSE_PT(:) = 0
         DO ICPT=NOD1,NOD4
            ! Search in B_IND vertices which is closest:
            DIST=1.E10_EB
            DO I=1,N_BEDGES
               DISTI = SQRT( ( CORNER_PT(IAXIS,ICPT)-VERTS(3*B_IND(I)-2) )**2._EB + &
                             ( CORNER_PT(JAXIS,ICPT)-VERTS(3*B_IND(I)-1) )**2._EB )
               IF(DISTI >= DIST) CYCLE
               CLOSE_PT(ICPT) = I
               DIST = DISTI
            ENDDO
         ENDDO
         DO ICPT=NOD2,NOD4
            IF(CLOSE_PT(ICPT) < CLOSE_PT(ICPT-1)) CLOSE_PT(ICPT) = CLOSE_PT(ICPT) + N_BEDGES ! Pad corner nodes.
         ENDDO
         CLOSE_PT(NOD4+1) = CLOSE_PT(NOD1) + N_BEDGES

         ! These points are mapped to domain external corners, rest of the points are mapped to corresponding domain
         ! External boundaries.
         IJ = N_VERTS + 1
         DO ICPT=NOD1,NOD4
            IJE = CLOSE_PT(ICPT+1) - CLOSE_PT(ICPT);
            IF (IJE <= 0) THEN
               WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: For terrain GEOM ',TRIM(ID),&
                             ' same boundary vertex ',B_IND(CLOSE_PT(ICPT)),' closest to 2 domain corners.'
               CALL SHUTDOWN(MESSAGE); RETURN
            ENDIF
            DISTI = SQRT( ( CORNER_PT(IAXIS,ICPT+1)-CORNER_PT(IAXIS,ICPT) )**2._EB + &
                          ( CORNER_PT(JAXIS,ICPT+1)-CORNER_PT(JAXIS,ICPT) )**2._EB ) / REAL(IJE,EB)
            ! Place points in extended domain:
            J = 0
            DO I=CLOSE_PT(ICPT),CLOSE_PT(ICPT+1)-1
               VERTS(3*IJ-2) = CORNER_PT(IAXIS,ICPT) + DISTI*VERXY(IAXIS,ICPT)*REAL(J,EB)
               VERTS(3*IJ-1) = CORNER_PT(JAXIS,ICPT) + DISTI*VERXY(JAXIS,ICPT)*REAL(J,EB)
               VERTS(3*IJ)   = (1._EB-ZVAL_FACTOR)*VERTS(3*B_IND(I)) + ZVAL_FACTOR*ZVAL_HORIZON
               E_IND(I) = IJ
               IJ = IJ  + 1
               J  = J   + 1
            ENDDO
         ENDDO
         E_IND(CLOSE_PT(NOD4+1)) =  E_IND(CLOSE_PT(NOD1))

         ! Add the floor F_IND Vertices:
         X_CEN = 0
         Y_CEN = 0
         DO ICPT=NOD1,NOD4
            DO I=CLOSE_PT(ICPT),CLOSE_PT(ICPT+1)-1
               VERTS(3*IJ-2) = VERTS(3*E_IND(I)-2)
               VERTS(3*IJ-1) = VERTS(3*E_IND(I)-1)
               VERTS(3*IJ)   = ZLOW
               F_IND(I)      = IJ
               X_CEN = X_CEN + VERTS(3*E_IND(I)-2)
               Y_CEN = Y_CEN + VERTS(3*E_IND(I)-1)
               IJ = IJ + 1
            ENDDO
         ENDDO
         F_IND(CLOSE_PT(NOD4+1)) =  F_IND(CLOSE_PT(NOD1))

         ! Add center point:
         VERTS(3*IJ-2) = X_CEN / REAL(N_BEDGES,EB)
         VERTS(3*IJ-1) = Y_CEN / REAL(N_BEDGES,EB)
         VERTS(3*IJ)   = ZLOW
         IJ = IJ + 1

         ! Add extend faces:
         IJF = N_FACES + 1
         DO ICPT=NOD1,NOD4
            DO I=CLOSE_PT(ICPT),CLOSE_PT(ICPT+1)-1
            I1 = E_IND(I)
            I2 = E_IND(I+1)
            I3 = B_IND(I+1)
            I4 = B_IND(I)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
            ENDDO
         ENDDO

         ! Add side faces:
         DO ICPT=NOD1,NOD4
            DO I=CLOSE_PT(ICPT),CLOSE_PT(ICPT+1)-1
             I1 = F_IND(I)
             I2 = F_IND(I+1)
             I3 = E_IND(I+1)
             I4 = E_IND(I)

             FACES(3*IJF-2) = I1
             FACES(3*IJF-1) = I2
             FACES(3*IJF) = I3
             IJF = IJF + 1

             FACES(3*IJF-2) = I1
             FACES(3*IJF-1) = I3
             FACES(3*IJF) = I4
             IJF = IJF + 1
             ENDDO
          ENDDO

          ! Add bottom faces:
          DO ICPT=NOD1,NOD4
             DO I=CLOSE_PT(ICPT),CLOSE_PT(ICPT+1)-1
                I1 = F_IND(I)
                I2 = IJ - 1 ! ZLOW center vert.
                I3 = F_IND(I+1)

                FACES(3*IJF-2) = I1
                FACES(3*IJF-1) = I2
                FACES(3*IJF) = I3
                IJF = IJF + 1
             ENDDO
          ENDDO

      ELSE

         ! Add the floor F_IND Vertices:
         IJ = N_VERTS + 1
         X_CEN = 0
         Y_CEN = 0
         DO I=1,N_BEDGES
            VERTS(3*IJ-2) = VERTS(3*B_IND(I)-2)
            VERTS(3*IJ-1) = VERTS(3*B_IND(I)-1)
            VERTS(3*IJ)   = ZLOW
            F_IND(I)      = IJ
            X_CEN = X_CEN + VERTS(3*B_IND(I)-2)
            Y_CEN = Y_CEN + VERTS(3*B_IND(I)-1)
            IJ = IJ + 1
         ENDDO
         F_IND(N_BEDGES+1) = F_IND(1) ! Last lower point equal to the first.

         ! Add center point:
         VERTS(3*IJ-2) = X_CEN / REAL(N_BEDGES,EB)
         VERTS(3*IJ-1) = Y_CEN / REAL(N_BEDGES,EB)
         VERTS(3*IJ)   = ZLOW
         IJ = IJ + 1

         ! Add side faces:
         IJF = N_FACES + 1
         DO I=1,N_BEDGES
            I1 = F_IND(I)
            I2 = F_IND(I+1)
            I3 = B_IND(I+1)
            I4 = B_IND(I)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I3
            FACES(3*IJF) = I4
            IJF = IJF + 1
         ENDDO

         ! Add bottom faces:
         DO I=1,N_BEDGES
            I1 = F_IND(I)
            I2 = IJ - 1 ! ZLOW center vert.
            I3 = F_IND(I+1)

            FACES(3*IJF-2) = I1
            FACES(3*IJF-1) = I2
            FACES(3*IJF) = I3
            IJF = IJF + 1
         ENDDO

      ENDIF

      N_VERTS      = IJ  - 1
      N_FACES      = IJF - 1

      DEALLOCATE(B_IND,E_IND,F_IND,BOUND_EDGES)

   ENDIF ZVALS_IF

   !--- setup a block object (XB keyword )

   NXB=0
   DO I = 1, 6
      IF (XB(I)<MAX_VAL) NXB=NXB+1
   ENDDO
   NXB_IF: IF (NXB==6 .AND. N_ZVALS==0) THEN
      GEOM_TYPE = BOX_GEOM_TYPE
      CALL CHECK_XB(XB)

      ! Test that high values are larger than low vals in every dimension:
      IF ( (XB(2)-XB(1)) < GEOMEPS ) THEN
         XB(1) = XB(1) - GEOM_DEFAULT_THICKNESS/2._EB
         XB(2) = XB(2) + GEOM_DEFAULT_THICKNESS/2._EB
         ! WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: For BOX GEOM ',TRIM(ID),&
         !            ' geometry number ',N,' zero thickness found in X direction.'
         !CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      IF ( (XB(4)-XB(3)) < GEOMEPS ) THEN
         XB(3) = XB(3) - GEOM_DEFAULT_THICKNESS/2._EB
         XB(4) = XB(4) + GEOM_DEFAULT_THICKNESS/2._EB
         ! WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: For BOX GEOM ',TRIM(ID),&
         !             ' geometry number ',N,' zero thickness found in Y direction.'
         ! CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      IF ( (XB(6)-XB(5)) < GEOMEPS ) THEN
         XB(5) = XB(5) - GEOM_DEFAULT_THICKNESS/2._EB
         XB(6) = XB(6) + GEOM_DEFAULT_THICKNESS/2._EB

         ! WRITE(MESSAGE,'(A,A,A,I8,A)') 'ERROR: For BOX GEOM ',TRIM(ID),&
         !             ' geometry number ',N,' zero thickness found in Z direction.'
         ! CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF

      ! Here all processes have read the GEOM with SNAP_TO_GRID:
      G%XB_ORIG = XB
      IF (SNAP_TO_GRID) THEN
         XBP(IAXIS,NOD1) = XB(1)
         XBP(IAXIS,NOD2) = XB(2)
         XBP(JAXIS,NOD1) = XB(3)
         XBP(JAXIS,NOD2) = XB(4)
         XBP(KAXIS,NOD1) = XB(5)
         XBP(KAXIS,NOD2) = XB(6)

         ! Search meshes:
         XBP2(IAXIS:KAXIS,NOD1) = 1.001_EB*MAX_VAL
         XBP2(IAXIS:KAXIS,NOD2) =-1.001_EB*MAX_VAL
         DO INOD=NOD1,NOD2
            XXX = XBP(IAXIS,INOD)
            YYY = XBP(JAXIS,INOD)
            ZZZ = XBP(KAXIS,INOD)
            DO NM=LOWER_MESH_INDEX,UPPER_MESH_INDEX
               ! X planes:
               IF(XXX>MESHES(NM)%XS .AND. XXX<MESHES(NM)%XF) THEN
                  ! Find closest grid plane:
                  DO I=1,MESHES(NM)%IBAR
                     IF(XXX < MESHES(NM)%X(I)) THEN
                        XBP(IAXIS,INOD) = MESHES(NM)%X(I-2+INOD) ! If INOD==1 tale low side face, else take high side.
                        EXIT
                     ENDIF
                  ENDDO
               ENDIF
               ! Y planes:
               IF(YYY>MESHES(NM)%YS .AND. YYY<MESHES(NM)%YF) THEN
                  ! Find closest grid plane:
                  DO J=1,MESHES(NM)%JBAR
                     IF(YYY < MESHES(NM)%Y(J)) THEN
                        XBP(JAXIS,INOD) = MESHES(NM)%Y(J-2+INOD) ! If INOD==1 tale low side face, else take high side.
                        EXIT
                     ENDIF
                  ENDDO
               ENDIF
               ! Z planes:
               IF(ZZZ>MESHES(NM)%ZS .AND. ZZZ<MESHES(NM)%ZF) THEN
                  ! Find closest grid plane:
                  DO K=1,MESHES(NM)%KBAR
                     IF(ZZZ < MESHES(NM)%Z(K)) THEN
                        XBP(KAXIS,INOD) = MESHES(NM)%Z(K-2+INOD) ! If INOD==1 tale low side face, else take high side.
                        EXIT
                     ENDIF
                  ENDDO
               ENDIF
            ENDDO
         ENDDO
         ! At this point in XBP contains the plane snapped values or 1.001*MAX_VAL. We do an All reduce in place for
         ! the geometry to get the minimum values. After the all reduce if we still have X > MAX_VEL in some location
         ! we load the XB value for that axis and are left with thickened plane matched Box.
         XBP2 = XBP
         IF (N_MPI_PROCESSES > 1) THEN
            CALL MPI_ALLREDUCE(XBP(1,NOD1),XBP2(1,NOD1),3,MPI_DOUBLE_PRECISION,MPI_MIN,MPI_COMM_WORLD,IERR)
            CALL MPI_ALLREDUCE(XBP(1,NOD2),XBP2(1,NOD2),3,MPI_DOUBLE_PRECISION,MPI_MAX,MPI_COMM_WORLD,IERR)
         ENDIF

         ! Finally load snapped to grid and thickened XB values back to XB:
         XB(1:2) = XBP2(IAXIS,NOD1:NOD2)
         XB(3:4) = XBP2(JAXIS,NOD1:NOD2)
         XB(5:6) = XBP2(KAXIS,NOD1:NOD2)

         G%SNAP_TO_GRID = .TRUE.

      ENDIF

      G%XB=XB

      ! Reallocate VOLUS, FACES and VERTS:
      N_VOLUS = 6*(IJK(3)-1)*(IJK(2)-1)*(IJK(1)-1)+1 ! NOTE : Number larger than actual value.
      IF (N_VOLUS > MAX_VOLUS) THEN
         MAX_VOLUS = N_VOLUS
         CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
         DEALLOCATE(VERTS,FACES,TFACES,VOLUS);
         ALLOCATE(VERTS(3*MAX_VERTS+1),TFACES(6*MAX_FACES+1),FACES(4*MAX_FACES+1),VOLUS(4*MAX_VOLUS+1))
         VERTS=1.001_EB*MAX_VAL; FACES=0; VOLUS = 0;
      ENDIF

      ! define verts in box

      N_VERTS = 0
      DO K = 0, IJK(3)-1
         BOX_XYZ(3) = (REAL(IJK(3)-1-K,EB)*XB(5) + REAL(K,EB)*XB(6))/REAL(IJK(3)-1,EB)
         DO J = 0, IJK(2)-1
            BOX_XYZ(2) = (REAL(IJK(2)-1-J,EB)*XB(3) + REAL(J,EB)*XB(4))/REAL(IJK(2)-1,EB)
            DO I = 0, IJK(1)-1
               BOX_XYZ(1) = (REAL(IJK(1)-1-I,EB)*XB(1) + REAL(I,EB)*XB(2))/REAL(IJK(1)-1,EB)
               VERTS(3*N_VERTS+1:3*N_VERTS+3) =  BOX_XYZ(1:3)
               N_VERTS = N_VERTS + 1
            ENDDO
         ENDDO
      ENDDO

      ! define tetrahedrons in box

      N_VOLUS = 0
      NI = IJK(1)
      NIJ = IJK(1)*IJK(2)
      DO K = 0, IJK(3)-2
         DO J = 0, IJK(2)-2
            DO I = 0, IJK(1)-2

               !     8-------7
               !   / .     / |
               ! 5-------6   |
               ! |   .   |   |
               ! |   .   |   |
               ! |   4-------3
               ! | /     | /
               ! 1-------2
               BOXVERTLIST(1) = K*NIJ + J*NI + I + 1
               BOXVERTLIST(2) = BOXVERTLIST(1) + 1
               BOXVERTLIST(3) = BOXVERTLIST(2) + NI
               BOXVERTLIST(4) = BOXVERTLIST(3) - 1
               BOXVERTLIST(5) = BOXVERTLIST(1) + NIJ
               BOXVERTLIST(6) = BOXVERTLIST(2) + NIJ
               BOXVERTLIST(7) = BOXVERTLIST(3) + NIJ
               BOXVERTLIST(8) = BOXVERTLIST(4) + NIJ
               CALL BOX2TETRA(BOXVERTLIST,VOLUS(4*N_VOLUS+1:4*N_VOLUS+24))
               N_VOLUS = N_VOLUS + 6
            ENDDO
         ENDDO
      ENDDO
      N_FACES=0
   ENDIF NXB_IF

   ! setup a sphere object (SPHERE_RADIUS and SPHERE_ORIGIN keywords)

   IF (SPHERE_RADIUS<MAX_VAL .AND. SPHERE_ORIGIN(1)<MAX_VAL .AND. SPHERE_ORIGIN(2)<MAX_VAL .AND. SPHERE_ORIGIN(3)<MAX_VAL) THEN
      GEOM_TYPE = SPHERE_GEOM_TYPE

      M => MESHES(1)
      DX = M%DXMIN

      ! 2*PI*R/(5*2^N_LEVELS) ~= DX,   solve for N_LEVELS

      IF (SPHERE_RADIUS<100.0_EB*TWO_EPSILON_EB) SPHERE_RADIUS = 100.0_EB*TWO_EPSILON_EB

      IF (SPHERE_TYPE/=2) SPHERE_TYPE = 1
      IF (N_LEVELS<0 .AND. N_LAT>0 .AND. N_LONG>0) SPHERE_TYPE = 2
      IF (SPHERE_TYPE==1) THEN
         IF (N_LEVELS==-1) N_LEVELS = INT(LOG(2.0_EB*PI*SPHERE_RADIUS/(5.0_EB*DX))/LOG(2.0_EB))
         N_LEVELS = MIN(7,MAX(0,N_LEVELS))
         N_FACES  = 20*(4**N_LEVELS+1) ! NOTE : Number larger than actual value.
      ELSE
         IF (N_LONG<6) N_LONG = MAX(6,INT(2.0_EB*PI*SPHERE_RADIUS/DX)+1)
         IF (N_LAT<3)  N_LAT = MAX(3,INT(PI*SPHERE_RADIUS/DX)+1)
         N_FACES  = 2*N_LAT*N_LONG ! NOTE : Number larger than actual value.
      ENDIF
      IF (N_FACES > MAX_FACES) THEN
         MAX_FACES = N_FACES
         CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
         DEALLOCATE(VERTS,FACES,TFACES);
         ALLOCATE(VERTS(3*MAX_VERTS+1)); ALLOCATE(TFACES(6*MAX_FACES+1)); ALLOCATE(FACES(4*MAX_FACES+1))
         VERTS=1.001_EB*MAX_VAL; FACES=0
      ENDIF
      IF (SPHERE_TYPE==1) THEN
         CALL INIT_SPHERE(N_LEVELS,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,VERTS,FACES)
      ELSE
         CALL INIT_SPHERE2(N_VERTS,N_FACES,N_LAT,N_LONG,VERTS,FACES)
      ENDIF
      DO I = 0, N_VERTS-1
         VERTS(3*I+1:3*I+3) = SPHERE_ORIGIN(1:3) + SPHERE_RADIUS*VERTS(3*I+1:3*I+3)
      ENDDO
      IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS); ALLOCATE(SURFS(N_FACES)); SURFS = 0
      IF (TRIM(SURF_ID(1))/='null') SURFS = 1 ! First single SURF_ID entry takes precedence.
   ENDIF

   ! Setup a cylinder object (CYLINDER_RADIUS, CYLINDER_LENGTH, CYLINDER_ORIGIN, CYLINDER_AXIS keywords):
   IF (CYLINDER_LENGTH<MAX_VAL .AND. CYLINDER_RADIUS<MAX_VAL .AND. &
   CYLINDER_ORIGIN(1)<MAX_VAL .AND. CYLINDER_ORIGIN(2)<MAX_VAL .AND. CYLINDER_ORIGIN(3)<MAX_VAL .AND. &
   CYLINDER_AXIS(1)<MAX_VAL .AND. CYLINDER_AXIS(2)<MAX_VAL .AND. CYLINDER_AXIS(3)<MAX_VAL) THEN

      GEOM_TYPE = CYLINDER_GEOM_TYPE

      IF (CYLINDER_NSEG_THETA ==-1) CYLINDER_NSEG_THETA =  8
      IF (CYLINDER_NSEG_AXIS  ==-1) CYLINDER_NSEG_AXIS  =  1

      N_FACES = 2*CYLINDER_NSEG_THETA*(CYLINDER_NSEG_AXIS+2) ! NOTE : Number larger than actual value.
      IF (N_FACES > MAX_FACES) THEN
         MAX_FACES = N_FACES
         CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
         DEALLOCATE(VERTS,FACES,TFACES); ALLOCATE(VERTS(3*MAX_VERTS+1),TFACES(6*MAX_FACES+1),FACES(4*MAX_FACES+1))
         VERTS=1.001_EB*MAX_VAL; FACES=0
      ENDIF

      ! Call routine to create cylinder:
      CALL DEFINE_CYLINDER(VERTS,MAX_VERTS,N_VERTS,FACES,MAX_FACES,N_FACES,VOLUS,MAX_VOLUS,N_VOLUS,CYL_FIND)

      IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS); ALLOCATE(SURFS(N_FACES)); SURFS = 0

      IF (TRIM(SURF_ID(1))/='null') THEN ! First single SURF_ID entry takes precedence.
         SURFS = 1
      ELSEIF (TRIM(SURF_IDS(1))/='null' .AND. TRIM(SURF_IDS(2))/='null' .AND. TRIM(SURF_IDS(3))/='null') THEN
         SURF_ID(1:3) = SURF_IDS(1:3)
         ! Then SURF_IDS(1:3), where (1) is top, (2) sides (3) bottom.
         SURFS(CYL_FIND(LOW_IND,1):CYL_FIND(HIGH_IND,1)) = 1
         SURFS(CYL_FIND(LOW_IND,2):CYL_FIND(HIGH_IND,2)) = 2
         SURFS(CYL_FIND(LOW_IND,3):CYL_FIND(HIGH_IND,3)) = 3
      ENDIF

   ENDIF

   ! Setup an extruded POLYGON object:
   POLY_COND : IF (N_POLY_VERTS > 0) THEN
      IF ( ABS(EXTRUDE) < GEOMEPS ) THEN
         WRITE(MESSAGE,'(A,A,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),&
                       ' : extrusion distance in EXTRUDE field not defined or zero. Define EXTRUDE value in &GEOM.'
         CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF

      ! Do some tests in POLY, Repeated vertex, etc.:
      IF (N_POLY_VERTS > N_VERTS) THEN
          WRITE(MESSAGE,'(A,A,A,I6,A,I6,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),&
          ' : Number of POLY indexes ',N_POLY_VERTS,' greater than Number of VERTS ',N_VERTS,'.'
          CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
      DO J=1,N_POLY_VERTS
          DO I=J+1,N_POLY_VERTS
              IF (POLY(I)==POLY(J)) THEN
                  WRITE(MESSAGE,'(A,A,A,I6,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),&
                  ' : Repeated vertex ',POLY(I),' in Polyline.'
                  CALL SHUTDOWN(MESSAGE); RETURN
              ENDIF
              IF (NORM2(VERTS(3*POLY(I)-2:3*POLY(I))-VERTS(3*POLY(J)-2:3*POLY(J))) < GEOMEPS) THEN
                  WRITE(MESSAGE,'(A,A,A,I6,A,I6,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),&
                  ' : Vertices ',POLY(I),' and ',POLY(J),' have same position.'
                  CALL SHUTDOWN(MESSAGE); RETURN
              ENDIF
          ENDDO
      ENDDO

      N_FACES = 5*N_POLY_VERTS ! NOTE : Number larger than actual value.
      IF (N_FACES > MAX_FACES) THEN
         MAX_FACES = N_FACES
         CALL GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS)
         DEALLOCATE(VERTS,FACES,TFACES); ALLOCATE(VERTS(3*MAX_VERTS+1),TFACES(6*MAX_FACES+1),FACES(4*MAX_FACES+1))
         VERTS=1.001_EB*MAX_VAL; FACES=0
      ENDIF

      CALL DEFINE_EXTRUDED_POLY(MAX_VERTS,N_VERTS,VERTS,MAX_POLY_VERTS,N_POLY_VERTS,POLY,&
                                EXTRUDE,MAX_FACES,N_FACES,START_FACE_LO,START_FACE_HI,START_FACE_MID,FACES,IERR)

      IF(IERR /= 0) RETURN

      IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS); ALLOCATE(SURFS(N_FACES)); SURFS = 0

      IF (TRIM(SURF_ID(1))/='null') THEN ! First single SURF_ID entry takes precedence.
         SURFS = 1
      ELSEIF (TRIM(SURF_IDS(1))/='null' .AND. TRIM(SURF_IDS(2))/='null' .AND. TRIM(SURF_IDS(3))/='null') THEN
         SURF_ID(1:3) = SURF_IDS(1:3)
         ! Then SURF_IDS(1:3), where (1) is top, (2) sides (3) bottom.
         SURFS(START_FACE_HI +1:START_FACE_HI+START_FACE_MID) = 1
         SURFS(START_FACE_MID+1:N_FACES)                      = 2
         SURFS(START_FACE_LO +1:START_FACE_LO+START_FACE_HI)  = 3
      ENDIF

   ENDIF POLY_COND

   G%N_LEVELS = N_LEVELS
   G%SPHERE_ORIGIN = SPHERE_ORIGIN
   G%SPHERE_RADIUS = SPHERE_RADIUS
   G%CYLINDER_LENGTH = CYLINDER_LENGTH
   G%CYLINDER_RADIUS = CYLINDER_RADIUS
   G%CYLINDER_ORIGIN = CYLINDER_ORIGIN
   G%CYLINDER_AXIS   = CYLINDER_AXIS
   G%IJK = IJK
   G%GEOM_TYPE = GEOM_TYPE

   LOGTEST = GEOM_TYPE==CAD_GEOM_TYPE .OR. GEOM_TYPE==TERRAIN_GEOM_TYPE
   IF (.NOT.LOGTEST) THEN
      ! The geometry has been constructed from predefined object : Terrain, cube, sphere, etc.
      ! This requires removing duplicate verts.
      ! For geometries where VERTS, FACES are being read, GEOM_TYPE=CAD_GEOM_TYPE, it is assumed duplicate vertices
      ! have already been removed.
      FIRST_FACE_INDEX=1
      CALL REMOVE_DUPLICATE_VERTS(N_VERTS,N_FACES,N_VOLUS,MAX_VERTS,MAX_FACES,MAX_VOLUS,FIRST_FACE_INDEX,&
                                  VERTS,FACES,VOLUS,GEOMEPS)
   ENDIF

   ! wrap up

   G%ID = ID
   G%N_VOLUS_BASE = N_VOLUS
   G%N_FACES_BASE = N_FACES
   G%N_VERTS_BASE = N_VERTS

   ! Check if SURF_ID(1) has been defined:
   N_SURF_ID = 0
   IF (TRIM(SURF_ID(1))=='null') THEN
      SURF_INDEX_PER_FACE = .FALSE.
      HAVE_SURF = .FALSE.
      ALLOCATE(G%SURF_ID(1))
      G%SURF_ID(1) = 'null'
   ELSE
      SURF_INDEX_PER_FACE = .TRUE.
      ! Check that elements of the list of SURF_IDs are in list of SURFS:
      ! How many SURF_ID entries are different than Null, where in SURFACE they belong:
      DO I = 1, MAX_SURF_IDS
         IF( SURF_ID(I)=='null' ) EXIT ! First 'null'
         N_SURF_ID = N_SURF_ID + 1
      ENDDO
      ALLOCATE(G%SURF_ID(1:N_SURF_ID))
      G%SURF_ID(1:N_SURF_ID) = SURF_ID(1:N_SURF_ID)

      ! Now find correspondence with SURFACE(N)%ID:
      IF (ALLOCATED(SURF_ID_IND)) DEALLOCATE(SURF_ID_IND)
      ALLOCATE(SURF_ID_IND(N_SURF_ID))
      DO I = 1, N_SURF_ID
          ! Get Surf Index:
          IN_LIST = .FALSE.
          DO J = 0, N_SURF
             IF (TRIM(SURF_ID(I))/=TRIM(SURFACE(J)%ID)) CYCLE
             SURF_ID_IND(I)=J
             IN_LIST = .TRUE.
             EXIT
          ENDDO
          IF(.NOT.IN_LIST) THEN
             WRITE(MESSAGE,'(A,I4,3A)') 'ERROR: problem with GEOM, the surface IDV(',I,') =',TRIM(SURF_ID(I)),' is not defined.'
             CALL SHUTDOWN(MESSAGE)
          ENDIF
      ENDDO
   ENDIF
   G%HAVE_SURF = HAVE_SURF

   IF (MATL_ID=='null') THEN
      HAVE_MATL = .FALSE.
   ENDIF
   G%MATL_ID = MATL_ID
   G%HAVE_MATL = HAVE_MATL

   IF (.NOT.AUTO_TEXTURE .AND. N_VERTS>0) THEN

      TXMIN = VERTS(1)
      TXMAX = TXMIN
      TYMIN = VERTS(2)
      TYMAX = TYMIN
      DO I = 1, N_VERTS
         TX = VERTS(3*I-2)
         TY = VERTS(3*I-1)
         IF (TX<TXMIN)TXMIN=TX
         IF (TX>TXMAX)TXMAX=TX
         IF (TY<TYMIN)TYMIN=TY
         IF (TY>TYMAX)TYMAX=TY
      ENDDO
      TEXTURE_ORIGIN(1)=TXMIN
      TEXTURE_ORIGIN(2)=TYMIN
      TEXTURE_SCALE(1)=TXMAX-TXMIN
      TEXTURE_SCALE(2)=TYMAX-TYMIN
   ENDIF

   G%TEXTURE_ORIGIN = TEXTURE_ORIGIN
   G%TEXTURE_SCALE = TEXTURE_SCALE
   G%AUTO_TEXTURE = AUTO_TEXTURE
   IF ( TRIM(TEXTURE_MAPPING)/='SPHERICAL' .AND. TRIM(TEXTURE_MAPPING)/='RECTANGULAR') TEXTURE_MAPPING = 'RECTANGULAR'
   G%TEXTURE_MAPPING = TEXTURE_MAPPING
   G%IS_TERRAIN = IS_TERRAIN

   ! setup volumes

   N_VOLUS_IF: IF (N_VOLUS>0) THEN
      ALLOCATE(G%VOLUS(4*N_VOLUS),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%VOLUS',IZERO)
      DO I = 0, N_VOLUS-1
         VOL(1:4)=> VOLUS(4*I+1:4*I+4)
         V1(1:3) => VERTS(3*VOL(1)-2:3*VOL(1))
         V2(1:3) => VERTS(3*VOL(2)-2:3*VOL(2))
         V3(1:3) => VERTS(3*VOL(3)-2:3*VOL(3))
         V4(1:3) => VERTS(3*VOL(4)-2:3*VOL(4))
         VOLUME = TETRAHEDRON_VOLUME(V3,V4,V2,V1)
         IF ( VOLUME<0.0_EB ) THEN ! reorder vertices if tetrahedron volume is negative
            IVOL=VOL(3)
            VOL(3)=VOL(4)
            VOL(4)=IVOL
         ENDIF
      ENDDO
      G%VOLUS(1: 4*N_VOLUS) = VOLUS(1:4*N_VOLUS)
      IF (ANY(VOLUS(1:4*N_VOLUS)<1 .OR. VOLUS(1:4*N_VOLUS)>N_VERTS)) THEN
         CALL SHUTDOWN('ERROR: problem with GEOM, vertex index out of bounds')
      ENDIF

      ALLOCATE(G%MATLS(N_VOLUS),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%MATLS',IZERO)
      MATL_INDEX = GET_MATL_INDEX(MATL_ID)
      ! The following constraint is removed for the time being. When Tetrahedrons are actually used for heat transfer
      ! and pyrolysis this will be needed.
      !IF (MATL_INDEX==0) THEN
      !   IF (TRIM(MATL_ID)=='null') THEN
      !     WRITE(MESSAGE,'(A)') 'ERROR: problem with GEOM, the material keyword, MATL_ID, is not defined.'
      !   ELSE
      !     WRITE(MESSAGE,'(3A)') 'ERROR: problem with GEOM, the material ',TRIM(MATL_ID),' is not defined.'
      !   ENDIF
      !   CALL SHUTDOWN(MESSAGE)
      !ENDIF
      G%MATLS(1:N_VOLUS) = MATL_INDEX

      ! construct an array of external faces

      ! determine which tetrahedron faces are external

      IF (N_FACES==0) THEN
         N_FACES = 4*N_VOLUS
         IF(ALLOCATED(IS_EXTERNAL)) DEALLOCATE(IS_EXTERNAL)
         ALLOCATE(IS_EXTERNAL(0:N_FACES-1),STAT=IZERO)
         CALL ChkMemErr('READ_GEOM','IS_EXTERNAL',IZERO)

         IS_EXTERNAL(0:N_FACES-1)=.TRUE.  ! start off by assuming all faces are external

         ! reorder face indices so the the first index is always the smallest

         !              1
         !             /|\                       .
         !            / | \                      .
         !           /  |  \                     .
         !          /   |   \                    .
         !         /    |    \                   .
         !        /     4     \                  .
         !       /     . .     \                 .
         !      /     .    .    \                .
         !     /    .        .   \               .
         !    /   .            .  \              .
         !   /  .               .  \             .
         !  / .                    .\            .
         ! 2-------------------------3

         DO I = 0, N_VOLUS-1
            FACES(12*I+1) = VOLUS(4*I+1)
            FACES(12*I+2) = VOLUS(4*I+2)
            FACES(12*I+3) = VOLUS(4*I+3)
            CALL REORDER_VERTS(FACES(12*I+1:12*I+3))

            FACES(12*I+4) = VOLUS(4*I+1)
            FACES(12*I+5) = VOLUS(4*I+3)
            FACES(12*I+6) = VOLUS(4*I+4)
            CALL REORDER_VERTS(FACES(12*I+4:12*I+6))

            FACES(12*I+7) = VOLUS(4*I+1)
            FACES(12*I+8) = VOLUS(4*I+4)
            FACES(12*I+9) = VOLUS(4*I+2)
            CALL REORDER_VERTS(FACES(12*I+7:12*I+9))

            FACES(12*I+10) = VOLUS(4*I+2)
            FACES(12*I+11) = VOLUS(4*I+4)
            FACES(12*I+12) = VOLUS(4*I+3)
            CALL REORDER_VERTS(FACES(12*I+10:12*I+12))
         ENDDO

         ! find faces that match

         SORT_FACES=2
         IF (GEOM_TYPE == SPHERE_GEOM_TYPE) SORT_FACES = 3 ! Case of sphere.

         SORT_FACES_IF: IF (SORT_FACES==1 ) THEN  ! O(n*log(n)) algorithm for determining external faces
            ALLOCATE(OFACES(N_FACES),STAT=IZERO)
            CALL ChkMemErr('READ_GEOM','OFACES',IZERO)
            CALL ORDER_FACES(OFACES,N_FACES)
            DO I = 1, N_FACES-1
               FACEI=>FACES(3*OFACES(I)-2:3*OFACES(I))
               FACEJ=>FACES(3*OFACES(I)+1:3*OFACES(I)+3)
               IF (FACEI(1)==FACEJ(1) .AND. &
                  MIN(FACEI(2),FACEI(3))==MIN(FACEJ(2),FACEJ(3)) .AND. &
                  MAX(FACEI(2),FACEI(3))==MAX(FACEJ(2),FACEJ(3))) THEN
                  IS_EXTERNAL(OFACES(I))=.FALSE.
                  IS_EXTERNAL(OFACES(I-1))=.FALSE.
                  IF (FACEI(2)==FACEJ(2) .AND. FACEI(3)==FACEJ(3)) THEN
                     WRITE(LU_ERR,*) 'WARNING: duplicate faces found:', FACEI(1),FACEI(2),FACEI(3)
                  ENDIF
               ENDIF
            ENDDO
            DEALLOCATE(OFACES)
         ELSEIF(SORT_FACES==2 ) THEN
            DO I = 0, N_FACES-1  ! O(n^2) algorithm for determining external faces
               FACEI=>FACES(3*I+1:3*I+3)
               ! Sort FACEI:
               DO J = 0, N_FACES-1
                  IF (I==J) CYCLE
                  FACEJ=>FACES(3*J+1:3*J+3)
                  IF (FACEI(1)==FACEJ(1)) THEN
                     IF ((FACEI(2)==FACEJ(2) .AND. FACEI(3)==FACEJ(3)) .OR. &
                        (FACEI(2)==FACEJ(3) .AND. FACEI(3)==FACEJ(2))) THEN
                        IS_EXTERNAL(I) = .FALSE.
                        IS_EXTERNAL(J) = .FALSE.
                     ENDIF
                  ELSEIF (FACEI(1)==FACEJ(2)) THEN
                     IF ((FACEI(2)==FACEJ(1) .AND. FACEI(3)==FACEJ(3)) .OR. &
                         (FACEI(2)==FACEJ(3) .AND. FACEI(3)==FACEJ(1))) THEN
                        IS_EXTERNAL(I) = .FALSE.
                        IS_EXTERNAL(J) = .FALSE.
                     ENDIF
                  ELSEIF (FACEI(1)==FACEJ(3)) THEN
                     IF ((FACEI(2)==FACEJ(1) .AND. FACEI(3)==FACEJ(2)) .OR. &
                         (FACEI(2)==FACEJ(2) .AND. FACEI(3)==FACEJ(1))) THEN
                        IS_EXTERNAL(I) = .FALSE.
                        IS_EXTERNAL(J) = .FALSE.
                     ENDIF
                  ENDIF
               ENDDO
            ENDDO
         ELSEIF(SORT_FACES==3 ) THEN
            DO I = 0,N_FACES-1
               ! Check that no verts are at the spheres center:
               DO II=1,3
                  II1=FACES(3*I+II)
                  IF ( SQRT((VERTS(3*II1-2)-SPHERE_ORIGIN(IAXIS))**2 + &
                            (VERTS(3*II1-1)-SPHERE_ORIGIN(JAXIS))**2 + &
                            (VERTS(3*II1  )-SPHERE_ORIGIN(KAXIS))**2) < GEOMEPS) &
                       IS_EXTERNAL(I) = .FALSE.
               ENDDO
            ENDDO
         ENDIF SORT_FACES_IF

         ! create new FACES index array keeping only external faces

         N_FACES_TEMP = N_FACES
         N_FACES=0
         DO I = 0, N_FACES_TEMP-1
            FACE_FROM=>FACES(3*I+1:3*I+3)
            ! Drop triangles with zero area:
            IF ( (FACE_FROM(1)==FACE_FROM(2)).OR.(FACE_FROM(1)==FACE_FROM(3)).OR.(FACE_FROM(2)==FACE_FROM(3)) ) CYCLE
            IF (IS_EXTERNAL(I)) THEN
               FACE_TO=>FACES(3*N_FACES+1:3*N_FACES+3)
               FACE_TO(1:3) = FACE_FROM(1:3)
               N_FACES=N_FACES+1
            ENDIF
         ENDDO
         G%N_FACES_BASE = N_FACES

         IF (GEOM_TYPE == SPHERE_GEOM_TYPE) THEN
            DO I = 0,N_FACES-1
               ! Check that no verts are at the spheres center:
               DO II=1,3
                  II1=FACES(3*I+II)
                  IF ( SQRT((VERTS(3*II1-2)-SPHERE_ORIGIN(IAXIS))**2 + &
                            (VERTS(3*II1-1)-SPHERE_ORIGIN(JAXIS))**2 + &
                            (VERTS(3*II1  )-SPHERE_ORIGIN(KAXIS))**2) < GEOMEPS) &
                     WRITE(LU_ERR,*) 'On External Faces, face/vertex ',I,II,II1,' located at center.'
               ENDDO
               II1=FACES(3*I+1)
               II2=FACES(3*I+2)
               II3=FACES(3*I+3)
               DV1(IAXIS:KAXIS)= VERTS(3*II2-2:3*II2) - VERTS(3*II1-2:3*II1)
               DV2(IAXIS:KAXIS)= VERTS(3*II3-2:3*II3) - VERTS(3*II1-2:3*II1)
               CALL CROSS_PRODUCT(NVECI,DV1,DV2)
               DXCEN= 1._EB/3._EB*(VERTS(3*II1-2:3*II1)+VERTS(3*II2-2:3*II2)+VERTS(3*II3-2:3*II3)) - &
                                   SPHERE_ORIGIN(IAXIS:KAXIS)
               DOTI = NVECI(IAXIS)*DXCEN(IAXIS) + NVECI(JAXIS)*DXCEN(JAXIS) + NVECI(KAXIS)*DXCEN(KAXIS)

               IF (SIGN(1._EB,DOTI) < 0._EB) THEN
                  WRITE(LU_ERR,*) I,' has (-) sign normal.'
                  FACES(3*I+2) = II3
                  FACES(3*I+3) = II2
               ENDIF
            ENDDO
         ENDIF
         CALL COMPUTE_TEXTURES(VERTS,FACES,TFACES,MAX_VERTS,MAX_FACES,N_FACES)

         ! Surf IDs for generated GEOM:
         IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS)
         ALLOCATE(SURFS(N_FACES))
         IF(SURF_INDEX_PER_FACE) THEN
            SURFS(:) = 1 ! All external faces point to only entry SURF_ID(1).
         ELSE
            SURFS(:) = 0 ! All external faces point to default surf ID.
         ENDIF
      ENDIF
   ENDIF N_VOLUS_IF

   ! Terrain case built with ZVALS, optimized way, define SURFS(:):
   IF (N_ZVALS > 0) THEN
      ! Surf IDs for generated GEOM:
      IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS)
      ALLOCATE(SURFS(N_FACES))
      IF(SURF_INDEX_PER_FACE) THEN
         SURFS(:) = 1 ! All external faces point to only entry SURF_ID(1).
      ELSE
         SURFS(:) = 0 ! All external faces point to default surf ID.
      ENDIF
   ELSEIF(IS_TERRAIN) THEN
      ! Finally Enhance SURFS to accomodate new faces.
      ALLOCATE(SURFS2(N_FACES));
      ! Here define what SURF to assign to added faces.
      IF(SURF_INDEX_PER_FACE) THEN
         SURFS2(:) = 1 ! All external faces point to only entry SURF_ID(1).
      ELSE
         SURFS2(:) = 0 ! All external faces point to default surf ID.
      ENDIF
      SURFS2(1:N_FACES_ORIG) = SURFS(1:N_FACES_ORIG)
      CALL MOVE_ALLOC(FROM=SURFS2,TO=SURFS)
   ENDIF

   N_FACES_IF: IF (N_FACES>0) THEN
      ALLOCATE(G%FACES(3*N_FACES),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%FACES',IZERO)
      G%FACES(1:3*N_FACES) = FACES(1:3*N_FACES)

      ! Check FACES for out of bounds indexes:
      I = MINVAL(FACES(1:3*N_FACES)); II= MINLOC(FACES(1:3*N_FACES),DIM=1)
      IF (I < 1) THEN
         WRITE(MESSAGE,'(3A,I8,A,I8,A)') 'ERROR: Out of Bounds. GEOM: ',TRIM(ID), ', FACE=',&
         II/3+1,', has vertex index ',I,' less than 1.'
         CALL SHUTDOWN(MESSAGE)
         RETURN
      ENDIF
      I = MAXVAL(FACES(1:3*N_FACES)); II= MAXLOC(FACES(1:3*N_FACES),DIM=1)
      IF (I > N_VERTS) THEN
         WRITE(MESSAGE,'(3A,I8,A,I8,A,I8,A)') 'ERROR: Out of Bounds. GEOM: ',TRIM(ID), ', FACE=',&
         II/3+1,', has vertex index ',I,', higher than number of vertices defined ',N_VERTS,'.'
         CALL SHUTDOWN(MESSAGE)
         RETURN
      ENDIF

      ALLOCATE(G%TFACES(6*N_FACES),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%TFACES',IZERO)
      G%TFACES(1:6*N_FACES) = TFACES(1:6*N_FACES)

      ALLOCATE(G%SURFS(N_FACES),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%SURFS',IZERO)

      PER_FACE_IF: IF (SURF_INDEX_PER_FACE) THEN
         DO I=1,N_FACES
            IF ( SURFS(I) <= 0 ) THEN
               G%SURFS(I) = DEFAULT_SURF_INDEX ! If local SURF ID index <= 0, use default surf ID.
            ELSE
               G%SURFS(I) = SURF_ID_IND(SURFS(I))
            ENDIF
         ENDDO
         DEALLOCATE(SURF_ID_IND)
      ELSE
         G%SURFS(1:N_FACES) = DEFAULT_SURF_INDEX
         BOX_TYPE_IF: IF ( GEOM_TYPE==BOX_GEOM_TYPE .AND. &
            (SURF_ID(1)/='null' .OR. ALL(SURF_IDS/='null') .OR. ALL(SURF_ID6/='null')) )THEN
            ! This loop allows GEOM to behave similarly to OBST
            FACE_LOOP: DO I=1,N_FACES
               II1=G%FACES(3*(I-1)+1)
               II2=G%FACES(3*(I-1)+2)
               II3=G%FACES(3*(I-1)+3)
               DV1(IAXIS:KAXIS)= VERTS(3*II2-2:3*II2) - VERTS(3*II1-2:3*II1)
               DV2(IAXIS:KAXIS)= VERTS(3*II3-2:3*II3) - VERTS(3*II1-2:3*II1)
               CALL CROSS_PRODUCT(NVECI,DV1,DV2)
               SURF_LOOP: DO NNN=0,N_SURF
                  IF (SURF_ID(1)==SURFACE(NNN)%ID  .AND. ANY(ABS(NVECI(:))>TWO_EPSILON_EB)) G%SURFS(I) = NNN ! all sides
                  IF (SURF_IDS(2)==SURFACE(NNN)%ID .AND. (ABS(NVECI(1))>TWO_EPSILON_EB .OR. ABS(NVECI(2))>TWO_EPSILON_EB) ) &
                     G%SURFS(I) = NNN ! sides
                  IF (SURF_IDS(1)==SURFACE(NNN)%ID .AND. NVECI(3)> TWO_EPSILON_EB) G%SURFS(I) = NNN ! top
                  IF (SURF_IDS(3)==SURFACE(NNN)%ID .AND. NVECI(3)<-TWO_EPSILON_EB) G%SURFS(I) = NNN ! bottom
                  IF (SURF_ID6(1)==SURFACE(NNN)%ID .AND. NVECI(1)<-TWO_EPSILON_EB) G%SURFS(I) = NNN ! X1
                  IF (SURF_ID6(2)==SURFACE(NNN)%ID .AND. NVECI(1)> TWO_EPSILON_EB) G%SURFS(I) = NNN ! X2
                  IF (SURF_ID6(3)==SURFACE(NNN)%ID .AND. NVECI(2)<-TWO_EPSILON_EB) G%SURFS(I) = NNN ! Y1
                  IF (SURF_ID6(4)==SURFACE(NNN)%ID .AND. NVECI(2)> TWO_EPSILON_EB) G%SURFS(I) = NNN ! Y2
                  IF (SURF_ID6(5)==SURFACE(NNN)%ID .AND. NVECI(3)<-TWO_EPSILON_EB) G%SURFS(I) = NNN ! Z1
                  IF (SURF_ID6(6)==SURFACE(NNN)%ID .AND. NVECI(3)> TWO_EPSILON_EB) G%SURFS(I) = NNN ! Z2
               ENDDO SURF_LOOP
            ENDDO FACE_LOOP
         ENDIF BOX_TYPE_IF
      ENDIF PER_FACE_IF
   ENDIF N_FACES_IF

   IF (N_VERTS>0) THEN
      ALLOCATE(G%VERTS_BASE(3*N_VERTS),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%VERTS_BASE',IZERO)
      G%VERTS_BASE(1:3*N_VERTS) = VERTS(1:3*N_VERTS)

      ALLOCATE(G%VERTS(3*N_VERTS),STAT=IZERO)
      CALL ChkMemErr('READ_GEOM','G%VERTS',IZERO)
   ENDIF

   G%MOVE_ID    = MOVE_ID
   G%IS_DYNAMIC = .FALSE.

   ! Prevent drawing of boundary info if desired

   G%SHOW_BNDF = BNDF_GEOM

   ! Case of false READ_BINARY, Process 0 writes a binary file with the geom:
   IF(MY_RANK == 0 .AND. .NOT.READ_BINARY) THEN
      WRITE(BIN_GEOM_FILENAME,'(A,A,A,A,A)') './',TRIM(CHID),'_',TRIM(ID),'.bingeom'
      OPEN(UNIT=731,FILE=TRIM(BIN_GEOM_FILENAME),STATUS='UNKNOWN',ACTION='WRITE',FORM='UNFORMATTED')
      WRITE(731) GEOM_TYPE
      IF (GEOM_TYPE==TERRAIN_GEOM_TYPE) THEN
         WRITE(731) N_VERTS_ORIG,N_FACES_ORIG,N_SURF_ID,N_VOLUS_ORIG
         WRITE(731) VERTS(1:3*N_VERTS_ORIG)
         WRITE(731) FACES(1:3*N_FACES_ORIG)
         WRITE(731) SURFS(1:N_FACES_ORIG)
         WRITE(731) VOLUS(1:4*N_VOLUS_ORIG)
      ELSE
         WRITE(731) N_VERTS,N_FACES,N_SURF_ID,N_VOLUS
         WRITE(731) VERTS(1:3*N_VERTS)
         WRITE(731) FACES(1:3*N_FACES)
         WRITE(731) SURFS(1:N_FACES)
         WRITE(731) VOLUS(1:4*N_VOLUS)
      ENDIF
      CLOSE(731)
   ENDIF

ENDDO READ_GEOM_LOOP
35 REWIND(LU_INPUT) ; INPUT_FILE_LINE_NUMBER = 0

CALL CONVERTGEOM(T_BEGIN)

DO IG = 1, N_GEOMETRY

   G=>GEOMETRY(IG)

   ! Define box containing Geometry:
   DO X1AXIS=IAXIS,KAXIS
      G%GEOM_BOX( LOW_IND,X1AXIS) = 1._EB/GEOMEPS ! Initialize min location in X1AXIS dir to large (+) number.
      G%GEOM_BOX(HIGH_IND,X1AXIS) =-1._EB/GEOMEPS ! Initialize max location in X1AXIS dir to large (-) number.
      DO IVERT=1,G%N_VERTS
         G%GEOM_BOX( LOW_IND,X1AXIS) = MIN(G%GEOM_BOX( LOW_IND,X1AXIS),G%VERTS(MAX_DIM*(IVERT-1)+X1AXIS))
         G%GEOM_BOX(HIGH_IND,X1AXIS) = MAX(G%GEOM_BOX(HIGH_IND,X1AXIS),G%VERTS(MAX_DIM*(IVERT-1)+X1AXIS))
      ENDDO
   ENDDO
ENDDO

IF( (T_END-T_BEGIN) < TWO_EPSILON_EB) RETURN

CC_IBM = .TRUE.

IF(ALLOCATED(VOLUS)) DEALLOCATE(VOLUS)
IF(ALLOCATED(FACES)) DEALLOCATE(FACES)
IF(ALLOCATED(SURFS)) DEALLOCATE(SURFS)
IF(ALLOCATED(VERTS)) DEALLOCATE(VERTS)
IF(ALLOCATED(ZVALS)) DEALLOCATE(ZVALS)
IF(ALLOCATED(TFACES))DEALLOCATE(TFACES)

DEALLOCATE(GEOM_LINE)

CONTAINS


SUBROUTINE DEFINE_EXTRUDED_POLY(MAX_VERTS,N_VERTS,VERTS,MAX_POLY_VERTS,N_POLY_VERTS,POLY,&
                                EXTRUDE,MAX_FACES,N_FACES,START_FACE_LO,START_FACE_HI,START_FACE_MID,FACES,IERR)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT
INTEGER, INTENT(IN)    :: MAX_VERTS, MAX_POLY_VERTS, N_POLY_VERTS, POLY(MAX_POLY_VERTS), MAX_FACES
REAL(EB),INTENT(IN)    :: EXTRUDE
INTEGER, INTENT(INOUT) :: N_VERTS
REAL(EB),INTENT(INOUT) :: VERTS(3*MAX_VERTS)
INTEGER, INTENT(OUT)   :: N_FACES,START_FACE_LO,START_FACE_HI,START_FACE_MID,FACES(4*MAX_FACES),IERR

! Local Variables:
REAL(EB), ALLOCATABLE, DIMENSION(:) :: PVERTS,PVERTS2
REAL(EB):: XYZCEN(IAXIS:KAXIS), NVEC(IAXIS:KAXIS), DV1(IAXIS:KAXIS), DV2(IAXIS:KAXIS), N(IAXIS:KAXIS), SINANG
LOGICAL :: IS_CONVEX, VERT_DROPPED, NOPT_INTRI
INTEGER :: IM1, IP1, NVERTS2, V0, V1, V2, COUNT, COUNT_OUT, NLIST, NLIST_OLD, VERT_START, IVERT, IVM1, IV, IVP1, &
           I1, I2, I3, I4, IDUM, IFACE, JP1, JEND, INT_FLG
INTEGER, ALLOCATABLE, DIMENSION(:) :: NODE_FLG, VERT_LIST
LOGICAL, ALLOCATABLE, DIMENSION(:) :: NODE_EXISTS
REAL(EB):: BBLEN, THLEN, MINMAX_POS(LOW_IND:HIGH_IND,IAXIS:KAXIS), P1(IAXIS:JAXIS), D1(IAXIS:JAXIS), &
           P2(IAXIS:JAXIS), D2(IAXIS:JAXIS), SVEC(IAXIS:KAXIS), PVEC(IAXIS:KAXIS), SVARV(NOD1:NOD2,EDG1:EDG2), SLENV(EDG1:EDG2)

IERR = 1

! Define PVERTS:
ALLOCATE(PVERTS(1:2*MAX_DIM*N_POLY_VERTS)); PVERTS=0._EB
MINMAX_POS( LOW_IND,IAXIS:KAXIS) = 1._EB/GEOMEPS
MINMAX_POS(HIGH_IND,IAXIS:KAXIS) =-1._EB/GEOMEPS
DO I=1,N_POLY_VERTS
    PVERTS(3*I-2:3*I) = VERTS(3*POLY(I)-2:3*POLY(I))
    MINMAX_POS( LOW_IND,IAXIS) = MIN(MINMAX_POS( LOW_IND,IAXIS),PVERTS(3*I-2))
    MINMAX_POS( LOW_IND,JAXIS) = MIN(MINMAX_POS( LOW_IND,JAXIS),PVERTS(3*I-1))
    MINMAX_POS( LOW_IND,KAXIS) = MIN(MINMAX_POS( LOW_IND,KAXIS),PVERTS(3*I  ))
    MINMAX_POS(HIGH_IND,IAXIS) = MAX(MINMAX_POS(HIGH_IND,IAXIS),PVERTS(3*I-2))
    MINMAX_POS(HIGH_IND,JAXIS) = MAX(MINMAX_POS(HIGH_IND,JAXIS),PVERTS(3*I-1))
    MINMAX_POS(HIGH_IND,KAXIS) = MAX(MINMAX_POS(HIGH_IND,KAXIS),PVERTS(3*I  ))
ENDDO
PVERTS(3*(N_POLY_VERTS+1)-2:3*(N_POLY_VERTS+1)) = PVERTS(1:3)
! Define average normal:
XYZCEN(IAXIS:KAXIS)=0._EB
DO I=1,N_POLY_VERTS
   XYZCEN(IAXIS:KAXIS) = XYZCEN(IAXIS:KAXIS) + PVERTS(3*I-2:3*I)
ENDDO
XYZCEN = XYZCEN / REAL(N_POLY_VERTS,EB)
! Define an area averaged normal vector (note: this might need to change to average normal to the set of points in a
! least squares sense, i.e. eigenvector associated with smallest eigenvalue of the covariance matrix of vertices positions
! respect to XYZCEN):
NVEC(IAXIS:KAXIS)=0._EB
DO I=1,N_POLY_VERTS
   DV1(IAXIS:KAXIS) = PVERTS(3*I-2:3*I    ) - XYZCEN(IAXIS:KAXIS)
   DV2(IAXIS:KAXIS) = PVERTS(3*I+1:3*(I+1)) - XYZCEN(IAXIS:KAXIS)
   CALL CROSS_PRODUCT(N,DV1,DV2)
   NVEC(IAXIS:KAXIS) = NVEC(IAXIS:KAXIS) + N(IAXIS:KAXIS)
ENDDO
IF(NORM2(NVEC) > TWO_EPSILON_EB) NVEC=NVEC/NORM2(NVEC)

! Test all segments are in plane normal to NVEC, tolerance for distance to plane given by XYZCEN, NVEC is
! 5% of the bounding box diagonal for the polygon:
BBLEN = SQRT( (MINMAX_POS(HIGH_IND,IAXIS)-MINMAX_POS( LOW_IND,IAXIS))**2._EB + &
              (MINMAX_POS(HIGH_IND,JAXIS)-MINMAX_POS( LOW_IND,JAXIS))**2._EB + &
              (MINMAX_POS(HIGH_IND,KAXIS)-MINMAX_POS( LOW_IND,KAXIS))**2._EB )
THLEN = 0.05_EB * BBLEN ! Threshold distance to polygon average plane.
DO I=1,N_POLY_VERTS
   DV1(IAXIS:KAXIS) = PVERTS(3*I-2:3*I    ) - XYZCEN(IAXIS:KAXIS)
   IF (ABS(DOT_PRODUCT(DV1,NVEC)) > THLEN) THEN
      WRITE(MESSAGE,'(A,A,A,I3,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),&
      ' : Node (',POLY(I),') not in the plane of the polygon. Check VERTS.'
      CALL SHUTDOWN(MESSAGE); RETURN
   ENDIF
ENDDO

! Here project all points to average plane. Do seg-seg intersection tests:
DO I=1,N_POLY_VERTS
   DV1(IAXIS:KAXIS) = PVERTS(3*I-2:3*I)-XYZCEN(IAXIS:KAXIS)
   DV2(IAXIS:KAXIS) = DV1(IAXIS:KAXIS) - DOT_PRODUCT(DV1,NVEC) * NVEC(IAXIS:KAXIS)
   PVERTS(3*(I+N_POLY_VERTS)-2:3*(I+N_POLY_VERTS)) = XYZCEN(IAXIS:KAXIS) + DV2(IAXIS:KAXIS)
ENDDO
! Define local coordinate system SVEC,PVEC,NVEC:
IF(ABS(NVEC(IAXIS))>TWO_EPSILON_EB  .OR. ABS(NVEC(JAXIS))>TWO_EPSILON_EB) PVEC(IAXIS:KAXIS)=(/NVEC(JAXIS),-NVEC(IAXIS),0._EB/)
IF(ABS(NVEC(IAXIS))<TWO_EPSILON_EB .AND. ABS(NVEC(JAXIS))<TWO_EPSILON_EB) PVEC(IAXIS:KAXIS)=(/NVEC(KAXIS),0._EB,-NVEC(IAXIS)/)
PVEC = PVEC/NORM2(PVEC); CALL CROSS_PRODUCT(SVEC,PVEC,NVEC)
DO I=N_POLY_VERTS+1,2*N_POLY_VERTS
   IP1 = I + 1
   IF (I==2*N_POLY_VERTS) IP1=N_POLY_VERTS+1
   DV1 = PVERTS(3*I-2:3*I)-XYZCEN(IAXIS:KAXIS)
   DV2 = PVERTS(3*IP1-2:3*IP1)-XYZCEN(IAXIS:KAXIS)
   P1(IAXIS:JAXIS) = (/ DOT_PRODUCT(DV1,SVEC), DOT_PRODUCT(DV1,PVEC) /) ! Point coordinates in SVEC, PVEC axes.
   D1(IAXIS:JAXIS) = (/ DOT_PRODUCT(DV2,SVEC), DOT_PRODUCT(DV2,PVEC) /) - P1(IAXIS:JAXIS) ! Seg vector in SVEC, PVEC axes.
   JEND=2*N_POLY_VERTS; IF (I==N_POLY_VERTS+1) JEND=JEND-1
   DO J=I+2,JEND
      JP1 = J + 1
      if (J==2*N_POLY_VERTS) JP1=N_POLY_VERTS+1
      DV1 = PVERTS(3*J-2:3*J)-XYZCEN(IAXIS:KAXIS)
      DV2 = PVERTS(3*JP1-2:3*JP1)-XYZCEN(IAXIS:KAXIS)
      P2(IAXIS:JAXIS) = (/ DOT_PRODUCT(DV1,SVEC), DOT_PRODUCT(DV1,PVEC) /) ! Point coordinates in SVEC, PVEC axes.
      D2(IAXIS:JAXIS) = (/ DOT_PRODUCT(DV2,SVEC), DOT_PRODUCT(DV2,PVEC) /) - P2(IAXIS:JAXIS) ! Seg vector in SVEC, PVEC axes.
      CALL GET_SEGSEG_INTERSECTION(P1,D1,P2,D2,SVARV,SLENV,INT_FLG)
      IF (INT_FLG>0) THEN
          WRITE(MESSAGE,'(A,I3,A,I3,A,I3,A,I3,A)') 'Error : Segments (',POLY(I-N_POLY_VERTS),'-',POLY(IP1-N_POLY_VERTS),') and (',&
          POLY(J-N_POLY_VERTS),'-',POLY(JP1-N_POLY_VERTS),') intersect in average POLY plane.'
          CALL SHUTDOWN(MESSAGE); RETURN
      ENDIF
   ENDDO
ENDDO


IS_CONVEX=.TRUE.
ALLOCATE(NODE_FLG(1:N_POLY_VERTS+1)); NODE_FLG=1
DO I=1,N_POLY_VERTS
   IM1 = I - 1
   IF (I==1) IM1=N_POLY_VERTS
   IP1 = I + 1
   IF (I==N_POLY_VERTS) IP1=1
   DV1(IAXIS:KAXIS) = PVERTS(3*I-2:3*I    ) - PVERTS(3*IM1-2:3*IM1    ); DV1=DV1/NORM2(DV1)
   DV2(IAXIS:KAXIS) = PVERTS(3*IP1-2:3*IP1) - PVERTS(3*I-2:3*I        ); DV2=DV2/NORM2(DV2)
   CALL CROSS_PRODUCT(N,DV1,DV2)
   SINANG = NORM2(N)
   IF ( DOT_PRODUCT(NVEC,N)  < -GEOMEPS ) IS_CONVEX=.FALSE.
   IF ( SINANG               <  GEOMEPS ) NODE_FLG(I)= 0 ! Vertex located in line joining neighbors.
ENDDO

NVERTS2 = SUM(NODE_FLG(1:N_POLY_VERTS));
IF (NVERTS2 < 3) THEN
    WRITE(MESSAGE,'(A,A,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),' : Not enough valid vertices on the polygon.'
    CALL SHUTDOWN(MESSAGE); RETURN
ENDIF
ALLOCATE(PVERTS2(1:2*MAX_DIM*N_POLY_VERTS)); PVERTS2=0._EB
ALLOCATE(VERT_LIST(NVERTS2+1)); VERT_LIST=0
ALLOCATE(NODE_EXISTS(NVERTS2+1)); NODE_EXISTS=.TRUE.
COUNT = 0
DO I=1,N_POLY_VERTS
   IF (NODE_FLG(I)==0) CYCLE
   COUNT= COUNT + 1
   PVERTS2(3*COUNT-2:3*COUNT) = PVERTS(3*I-2:3*I)
   VERT_LIST(COUNT) = COUNT
ENDDO
PVERTS(1:3*NVERTS2)  = PVERTS2(1:3*NVERTS2)
VERT_LIST(NVERTS2+1) = VERT_LIST(1)
DEALLOCATE(PVERTS2)


! Now do the Ear clip:
N_FACES       = 0
START_FACE_LO = N_FACES
IS_CONVEX_IF : IF (IS_CONVEX) THEN ! Convex POLY.
   VERT_START = VERT_LIST(1)
   DO I = 1,NVERTS2
      IP1 = I+1; IF (I==NVERTS2) IP1=1
      IF (I==VERT_START .OR. IP1==VERT_START) CYCLE
      N_FACES = N_FACES + 1
      FACES(3*N_FACES-2) = VERT_LIST(VERT_START)
      FACES(3*N_FACES-1) = VERT_LIST(I)
      FACES(3*N_FACES  ) = VERT_LIST(IP1)
   ENDDO
ELSE IS_CONVEX_IF ! Simple polygon, ear clipping.
    NLIST = NVERTS2
    COUNT_OUT = 0
    OUTER_LOOP : DO WHILE(NLIST>=3) ! OUTER LOOP
         COUNT_OUT = COUNT_OUT + 1
         IF (COUNT_OUT > NVERTS2**4) THEN
             WRITE(MESSAGE,'(A,A,A)') 'ERROR: For extruded Polygon GEOM ',TRIM(ID),' : Could not triangulate polygon.'
             CALL SHUTDOWN(MESSAGE); RETURN
         ENDIF
         IVERT = 1
         INNER_LOOP : DO WHILE(IVERT<=NLIST) ! INNER LOOP
            IVM1 = IVERT-1; IV=IVERT; IVP1=IVERT+1
            IF (IVERT==1) IVM1=NLIST
            V0 = VERT_LIST(IVM1);  V1 = VERT_LIST(IV  );  V2 = VERT_LIST(IVP1);
            IF (.NOT.NODE_EXISTS(IVP1)) EXIT INNER_LOOP
            DV1(IAXIS:KAXIS) = PVERTS(3*V1-2:3*V1)-PVERTS(3*V0-2:3*V0)
            IF (NORM2(DV1)<TWO_EPSILON_EB) CYCLE; DV1=DV1/NORM2(DV1)
            DV2(IAXIS:KAXIS) = PVERTS(3*V2-2:3*V2)-PVERTS(3*V1-2:3*V1)
            IF (NORM2(DV2)<TWO_EPSILON_EB) CYCLE; DV2=DV2/NORM2(DV2)
            CALL CROSS_PRODUCT(N,DV1,DV2)
            NOPT_INTRI=DOT_PRODUCT(NVEC,N)>GEOMEPS
            IF (NOPT_INTRI) THEN
               DO I=1,NVERTS2
                  IF(ANY( (/V0,V1,V2/) == I)) CYCLE
                  IF (POINT_IN_TRIANGLE(PVERTS(3*I-2:3*I), PVERTS(3*V0-2:3*V0), PVERTS(3*V1-2:3*V1), PVERTS(3*V2-2:3*V2))) THEN
                     NOPT_INTRI=.FALSE.
                     EXIT
                  ENDIF
               ENDDO
            ENDIF
            IF ( NLIST==3 .OR. NOPT_INTRI ) THEN
                 N_FACES = N_FACES + 1
                 FACES(3*N_FACES-2) = V0
                 FACES(3*N_FACES-1) = V1
                 FACES(3*N_FACES  ) = V2
                 IF (NLIST == 3) EXIT OUTER_LOOP
                 NODE_EXISTS(IVERT) =.FALSE.
                 IF (IVERT==1) NODE_EXISTS(NLIST+1)=.FALSE.
                 IVERT = IVERT + 2
            ELSE
                 IVERT = IVERT + 1
            ENDIF
         ENDDO INNER_LOOP
         NLIST_OLD = NLIST
         NLIST     = 0
         DO I = 1,NLIST_OLD
             IF (NODE_EXISTS(I)) THEN
                 NLIST = NLIST + 1
                 VERT_LIST(NLIST) = VERT_LIST(I)
             ENDIF
         ENDDO
         VERT_LIST(NLIST+1) = VERT_LIST(1)
         NODE_EXISTS(1:NLIST+1) =.TRUE.

         ! Test for nodes connecting parallel edges, if found drop them:
         VERT_DROPPED=.FALSE.
         DO I=1,NLIST
            IVM1 = I-1; IV=I; IVP1=I+1; IF (I==1) IVM1=NLIST
            V0 = VERT_LIST(IVM1);  V1 = VERT_LIST(IV  );  V2 = VERT_LIST(IVP1)
            DV1(IAXIS:KAXIS) = PVERTS(3*V1-2:3*V1)-PVERTS(3*V0-2:3*V0)
            IF (NORM2(DV1)<TWO_EPSILON_EB) CYCLE; DV1=DV1/NORM2(DV1)
            DV2(IAXIS:KAXIS) = PVERTS(3*V2-2:3*V2)-PVERTS(3*V1-2:3*V1)
            IF (NORM2(DV2)<TWO_EPSILON_EB) CYCLE; DV2=DV2/NORM2(DV2)
            CALL CROSS_PRODUCT(N,DV1,DV2)
            IF (ABS(DOT_PRODUCT(NVEC,N))<GEOMEPS) THEN
               VERT_DROPPED=.TRUE.; NODE_EXISTS(I)=.FALSE.
               IF (NLIST == 3) EXIT OUTER_LOOP
            ENDIF
         ENDDO
         IF (VERT_DROPPED) THEN ! Repeat List generation:
             NLIST_OLD = NLIST; NLIST = 0
             DO I = 1,NLIST_OLD
                 IF (NODE_EXISTS(I)) THEN
                     NLIST = NLIST + 1
                     VERT_LIST(NLIST) = VERT_LIST(I)
                 ENDIF
             ENDDO
             VERT_LIST(NLIST+1) = VERT_LIST(1)
             NODE_EXISTS(1:NLIST+1)=.TRUE.
         ENDIF
    ENDDO OUTER_LOOP
ENDIF IS_CONVEX_IF

! Add top faces and Revert lo faces normal:
START_FACE_HI = N_FACES
DO IFACE=1,N_FACES
    FACES(3*(START_FACE_HI+IFACE)-2:3*(START_FACE_HI+IFACE)) = FACES(3*IFACE-2:3*IFACE) + NVERTS2
    IDUM=FACES(3*IFACE-1);  FACES(3*IFACE-1)=FACES(3*IFACE);  FACES(3*IFACE)=IDUM
ENDDO
N_FACES = 2*N_FACES

! Now replicate Vertices at a distance EXTRUDE in the normal direction.
N_VERTS = 2*NVERTS2
VERTS(1:3*NVERTS2) = PVERTS(1:3*NVERTS2)
DO I=1,NVERTS2
    VERTS(3*(I+NVERTS2)-2:3*(I+NVERTS2)) = PVERTS(3*I-2:3*I) + EXTRUDE*NVEC(IAXIS:KAXIS)
ENDDO

! Add side faces:
START_FACE_MID=N_FACES
DO IVERT=1,NVERTS2
    I1 = IVERT; I2 = IVERT+1;  I3 = IVERT+NVERTS2;  I4 = IVERT+NVERTS2+1
    IF (IVERT==NVERTS2) THEN
        I2 = 1;  I4 = 1+NVERTS2
    ENDIF
    N_FACES = N_FACES + 1
    FACES(3*N_FACES-2:3*N_FACES) = (/ I1, I2, I4 /)
    N_FACES = N_FACES + 1
    FACES(3*N_FACES-2:3*N_FACES) = (/ I1, I4, I3 /)
ENDDO

! Revert Faces order if EXTRUDE -ve:
IF (EXTRUDE < 0) THEN
    DO IFACE=1,N_FACES
        IDUM=FACES(3*IFACE-1);  FACES(3*IFACE-1)=FACES(3*IFACE);  FACES(3*IFACE)=IDUM
    ENDDO
ENDIF

DEALLOCATE(PVERTS,NODE_FLG,VERT_LIST,NODE_EXISTS)

IERR = 0

RETURN

END SUBROUTINE DEFINE_EXTRUDED_POLY



SUBROUTINE DEFINE_CYLINDER(VERTS,MAXVERTS,NVERTS,FACES,MAXFACES,NFACES,VOLS,MAXVOLS,NVOLS,CYL_FIND)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

INTEGER, INTENT(IN) :: MAXVERTS,MAXFACES,MAXVOLS
INTEGER, INTENT(OUT) :: NFACES, NVERTS
REAL(EB), INTENT(INOUT), TARGET :: VERTS(3*MAXVERTS)
INTEGER, INTENT(OUT) :: FACES(4*MAXFACES)
INTEGER, INTENT(OUT) :: NVOLS
INTEGER, INTENT(OUT) :: VOLS(4*MAXVOLS)
INTEGER, INTENT(OUT) :: CYL_FIND(LOW_IND:HIGH_IND,1:3)

! Local Variables:
REAL(EB), PARAMETER :: EX(IAXIS:KAXIS) = (/ 1._EB, 0._EB, 0._EB /)
REAL(EB) :: E1(IAXIS:KAXIS), E2(IAXIS:KAXIS), E3(IAXIS:KAXIS), TGL(3,3), V(IAXIS:KAXIS,1), R(IAXIS:KAXIS,1)
INTEGER :: NP_L,NP_T,IVERT,IFACE,ILE,ITH,IFC
REAL(EB):: DELTA_L,DELTA_T,THETA,POS_1,POS_2,POS_3, LEN



! Check if CYLINDER axis is any of IAXIS, JAXIS, KAXIS:
IF (ABS(CYLINDER_AXIS(JAXIS))<TWO_EPSILON_EB .AND.  ABS(CYLINDER_AXIS(KAXIS))<TWO_EPSILON_EB) THEN ! IAXIS
   E1(IAXIS:KAXIS) = EX(IAXIS:KAXIS)
   E2(IAXIS:KAXIS) = (/ 0._EB, 1._EB, 0._EB /)
   E3(IAXIS:KAXIS) = (/ 0._EB, 0._EB, 1._EB /)
ELSEIF (ABS(CYLINDER_AXIS(KAXIS))<TWO_EPSILON_EB .AND.  ABS(CYLINDER_AXIS(IAXIS))<TWO_EPSILON_EB) THEN ! JAXIS
   E1(IAXIS:KAXIS) = (/ 0._EB, 1._EB, 0._EB /)
   E2(IAXIS:KAXIS) = (/ 0._EB, 0._EB, 1._EB /)
   E3(IAXIS:KAXIS) = EX(IAXIS:KAXIS)
ELSEIF (ABS(CYLINDER_AXIS(IAXIS))<TWO_EPSILON_EB .AND.  ABS(CYLINDER_AXIS(JAXIS))<TWO_EPSILON_EB) THEN ! KAXIS
   E1(IAXIS:KAXIS) = (/ 0._EB, 0._EB, 1._EB /)
   E2(IAXIS:KAXIS) = EX(IAXIS:KAXIS)
   E3(IAXIS:KAXIS) = (/ 0._EB, 1._EB, 0._EB /)
ELSE
   ! Cylinder axis not aligned with any Eulerian Axis. Define an orthogonal se of unit vectors:
   ! E1 in direction of cylinder axis:
   LEN = SQRT(CYLINDER_AXIS(IAXIS)**2._EB + CYLINDER_AXIS(JAXIS)**2._EB + CYLINDER_AXIS(KAXIS)**2._EB)
   E1(IAXIS:KAXIS) = 1/LEN * CYLINDER_AXIS(IAXIS:KAXIS)

   ! E2 in direction normal to plane EX x E1:
   CALL CROSS_PRODUCT(E2,EX,E1)
   LEN = SQRT(E2(IAXIS)**2._EB + E2(JAXIS)**2._EB + E2(KAXIS)**2._EB)
   E2(IAXIS:KAXIS) = 1/LEN * E2(IAXIS:KAXIS)

   ! E3 in direction of E1 x E2
   CALL CROSS_PRODUCT(E3,E1,E2)
ENDIF

! Define transformation matrix from local to global axes:
TGL(IAXIS:KAXIS,IAXIS) = E1(IAXIS:KAXIS)
TGL(IAXIS:KAXIS,JAXIS) = E2(IAXIS:KAXIS)
TGL(IAXIS:KAXIS,KAXIS) = E3(IAXIS:KAXIS)

! Now define cylinder in local axes E1,E2,E3, using CYLINDER_RADIUS and CYLINDER_LENGTH, centered at zero origin:
! Define vertices:
NP_L = CYLINDER_NSEG_AXIS + 1
NP_T = CYLINDER_NSEG_THETA
DELTA_L = CYLINDER_LENGTH / REAL(CYLINDER_NSEG_AXIS,EB)
DELTA_T = 2._EB*PI / REAL(CYLINDER_NSEG_THETA,EB)
IVERT= 0

! Low plane center vertex:
POS_1 = -CYLINDER_LENGTH/2._EB
POS_2 = 0._EB; POS_3 = 0._EB;
IVERT = IVERT + 1
VERTS(3*IVERT-2:3*IVERT) = (/ POS_1, POS_2, POS_3 /)

VERTEX_LOOP : DO ILE=1,NP_L
   POS_1 = -CYLINDER_LENGTH/2._EB + REAL(ILE-1,EB)*DELTA_L
   DO ITH=1,NP_T

      THETA = REAL(ITH-1,EB)*DELTA_T
      POS_2 = CYLINDER_RADIUS*COS(THETA)
      POS_3 = CYLINDER_RADIUS*SIN(THETA)

      IVERT = IVERT + 1
      VERTS(3*IVERT-2:3*IVERT) = (/ POS_1, POS_2, POS_3 /)

   ENDDO
ENDDO VERTEX_LOOP

! High plane center vertex:
POS_1 = CYLINDER_LENGTH/2._EB
POS_2 = 0._EB; POS_3 = 0._EB;
IVERT = IVERT + 1
VERTS(3*IVERT-2:3*IVERT) = (/ POS_1, POS_2, POS_3 /)

NVERTS = IVERT

! Define faces:
! Low axis plane:
IFACE=0
IVERT=1
CYL_FIND(LOW_IND,3) = IFACE + 1
DO IFC=1,NP_T
   IF (IFC < NP_T) THEN
      I1 = 1 + IFC + 1
      I2 = 1 + IFC
      I3 = IVERT
   ELSE
      I1 = IVERT + 1
      I2 = IFC + 1
      I3 = IVERT
   ENDIF
   IFACE=IFACE+1
   FACES(3*IFACE-2:3*IFACE) = (/I1, I2, I3 /)
ENDDO
CYL_FIND(HIGH_IND,3) = IFACE

! Cylinder side faces:
CYL_FIND(LOW_IND,2) = IFACE + 1
FACE_LOOP : DO ILE=2,NP_L
   DO IFC=1,NP_T

      ! Locate first vertex index:
      IF (IFC < NP_T) THEN
         I1 = (ILE-1)*NP_T + 1 + IFC
         I2 = (ILE-1)*NP_T + 1 + IFC + 1
         I3 = (ILE-2)*NP_T + 1 + IFC
         I4 = (ILE-2)*NP_T + 1 + IFC + 1
      ELSE
         I1 = (ILE-1)*NP_T + 1 + IFC
         I2 = (ILE-1)*NP_T + 1 + 1
         I3 = (ILE-2)*NP_T + 1 + IFC
         I4 = (ILE-2)*NP_T + 1 + 1
      ENDIF

      IFACE=IFACE+1
      FACES(3*IFACE-2:3*IFACE) = (/I1, I3, I2/)
      IFACE=IFACE+1
      FACES(3*IFACE-2:3*IFACE) = (/I3, I4, I2/)

   ENDDO
ENDDO FACE_LOOP
CYL_FIND(HIGH_IND,2) = IFACE

! High axis plane:
IVERT=NVERTS
CYL_FIND(LOW_IND,1) = IFACE + 1
DO IFC=1,NP_T
   IF (IFC < NP_T) THEN
      I1 = (NP_L-1)*NP_T + 1 + IFC
      I2 = (NP_L-1)*NP_T + 1 + IFC + 1
      I3 = IVERT
   ELSE
      I1 = (NP_L-1)*NP_T + 1 + IFC
      I2 = (NP_L-1)*NP_T + 1 + 1
      I3 = IVERT
   ENDIF
   IFACE=IFACE+1
   FACES(3*IFACE-2:3*IFACE) = (/I1, I2, I3 /)
ENDDO
CYL_FIND(HIGH_IND,1) = IFACE
NFACES = IFACE

! Transform vertices to global axes:
DO IVERT=1,NVERTS
   V(IAXIS:KAXIS,1) = VERTS(3*IVERT-2:3*IVERT)
   R = MATMUL(TGL,V)
   VERTS(3*IVERT-2:3*IVERT) = R(IAXIS:KAXIS,1) + CYLINDER_ORIGIN(IAXIS:KAXIS)
ENDDO

! No volumes being defined.
NVOLS = 0
VOLS  = 0

! WRITE(LU_ERR,*) 'Vertices:'
! DO IVERT=1,NVERTS
!    WRITE(LU_ERR,*) VERTS(3*IVERT-2:3*IVERT)
! ENDDO
! WRITE(LU_ERR,*) ' '
! WRITE(LU_ERR,*) 'Faces:'
! DO IFACE=1,NFACES
!    WRITE(LU_ERR,*) FACES(3*IFACE-2:3*IFACE)
! ENDDO

RETURN
END SUBROUTINE DEFINE_CYLINDER

! ---------------------------- GET_GEOM_INFO ----------------------------------------

SUBROUTINE GET_GEOM_INFO(MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS) ! LU_INPUT not used for now.

! Count number of various geometry types on the current &GEOM line
! Assume a maximum number of faces and ZVALS, which can be modified in the &MISC line.

INTEGER, INTENT(INOUT) :: MAX_ZVALS,MAX_VERTS,MAX_FACES,MAX_VOLUS,MAX_IDS,MAX_SURF_IDS,MAX_POLY_VERTS

MAX_ZVALS     = MAX(MAX_ZVALS,                         MAXIMUM_GEOMETRY_ZVALS)
MAX_VOLUS     = MAX(MAX_VOLUS,6*MAX_ZVALS,             MAXIMUM_GEOMETRY_VOLUS)
MAX_FACES     = MAX(MAX_FACES,4*MAX_VOLUS,             MAXIMUM_GEOMETRY_FACES)
MAX_VERTS     = MAX(MAX_VERTS,4*MAX_VOLUS,3*MAX_FACES, MAXIMUM_GEOMETRY_VERTS)
MAX_IDS       = MAX(MAX_IDS,                           MAXIMUM_GEOMETRY_IDS)
MAX_SURF_IDS  = MAX(MAX_SURF_IDS,                      MAXIMUM_GEOMETRY_SURFIDS)
MAX_POLY_VERTS= MAX(MAX_POLY_VERTS,                    MAXIMUM_POLY_VERTS)

END SUBROUTINE GET_GEOM_INFO

! ---------------------------- ALLOCATE_BUFFERS ----------------------------------------

SUBROUTINE ALLOCATE_BUFFERS

IF(ALLOCATED(SURF_ID)) DEALLOCATE(SURF_ID)
ALLOCATE(SURF_ID(MAX_SURF_IDS+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','SURF_IDV',IZERO)

IF(ALLOCATED(ZVALS)) DEALLOCATE(ZVALS)
ALLOCATE(ZVALS(MAX_ZVALS+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','ZVALS',IZERO)

IF(ALLOCATED(VERTS)) DEALLOCATE(VERTS)
ALLOCATE(VERTS(3*MAX_VERTS+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','VERTS',IZERO)

IF(ALLOCATED(TFACES)) DEALLOCATE(TFACES)
ALLOCATE(TFACES(6*MAX_FACES+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','TFACES',IZERO)

IF(ALLOCATED(FACES)) DEALLOCATE(FACES)
ALLOCATE(FACES(4*MAX_FACES+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','FACES',IZERO)

IF(ALLOCATED(VOLUS)) DEALLOCATE(VOLUS)
ALLOCATE(VOLUS(4*MAX_VOLUS+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','VOLUS',IZERO)

IF(ALLOCATED(POLY)) DEALLOCATE(POLY)
ALLOCATE(POLY(MAX_POLY_VERTS+1),STAT=IZERO)
CALL ChkMemErr('ALLOCATE_BUFFERS','POLY',IZERO)
END SUBROUTINE ALLOCATE_BUFFERS

! ---------------------------- SET_GEOM_DEFAULTS ----------------------------------------

SUBROUTINE SET_GEOM_DEFAULTS

   ! Set defaults

   ZMIN=ZS_MIN
   WRITE(ID,'(A,I0)') 'geom_',N
   SURF_ID(:)= 'null'
   SURF_IDS = 'null'
   SURF_ID6 = 'null'
   MATL_ID = 'null'
   MOVE_ID = 'null'
   DEVC_ID = 'null'
   CTRL_ID = 'null'
   PROP_ID = 'null'
   HAVE_SURF = .TRUE.
   HAVE_MATL = .TRUE.
   TEXTURE_ORIGIN = 0.0_EB
   TEXTURE_MAPPING = 'RECTANGULAR'
   TEXTURE_SCALE = 1.0_EB
   AUTO_TEXTURE = .FALSE.
   TRANSPARENCY = -1._EB
   VERTS=1.001_EB*MAX_VAL
   ZVALS=1.001_EB*MAX_VAL
   XB=1.001_EB*MAX_VAL
   FACES=0
   VOLUS=0
   POLY =0
   IJK = 2 ! minimize number of triangles by default
   IS_GEOMETRY_DYNAMIC = .FALSE.
   EXTEND_TERRAIN      = .FALSE.
   IS_TERRAIN          = .FALSE.
   SNAP_TO_GRID        = .FALSE.
   ZVAL_HORIZON    = 1.001_EB*MAX_VAL

   SPHERE_ORIGIN   = 1.001_EB*MAX_VAL
   SPHERE_RADIUS   = 1.001_EB*MAX_VAL
   CYLINDER_LENGTH = 1.001_EB*MAX_VAL
   CYLINDER_RADIUS = 1.001_EB*MAX_VAL
   CYLINDER_ORIGIN = 1.001_EB*MAX_VAL
   CYLINDER_AXIS   = 1.001_EB*MAX_VAL
   EXTRUDE         = 0._EB
   CYLINDER_NSEG_THETA = -1
   CYLINDER_NSEG_AXIS  = -1
   N_LEVELS=-1
   N_LAT=-1
   N_LONG=-1
   SPHERE_TYPE=-1
   GEOM_TYPE=CAD_GEOM_TYPE
   BNDF_GEOM=BNDF_DEFAULT
   READ_BINARY = .FALSE.
   BINARY_FILE = 'null'
   RGB=-1

END SUBROUTINE SET_GEOM_DEFAULTS

! ! ---------------------------- EXTRUDE_SPHERE ----------------------------------------
!
! SUBROUTINE EXTRUDE_SPHERE(ZCENTER,VERTS,MAXVERTS,NVERTS,FACES,NFACES,VOLS,MAXVOLS, NVOLS)
!
! ! convert a closed surface defined by VERTS and FACES into a solid
!
! INTEGER, INTENT(IN) :: NFACES, MAXVERTS,MAXVOLS
! INTEGER, INTENT(INOUT) :: NVERTS
! REAL(EB), INTENT(INOUT), TARGET :: VERTS(3*MAXVERTS)
! INTEGER, INTENT(IN) :: FACES(3*NFACES)
! INTEGER, INTENT(OUT) :: NVOLS
! INTEGER, INTENT(OUT) :: VOLS(4*MAXVOLS)
! REAL(EB), INTENT(IN) :: ZCENTER(3)
!
! INTEGER :: I
!
! ! define a new vertex at ZCENTER
! VERTS(3*NVERTS+1:3*NVERTS+3)=ZCENTER(1:3)
!
! ! form a tetrahedron using each face and the vertex ZCENTER
! DO I = 1, NFACES
!    VOLS(4*I-3:4*I)=(/FACES(3*I-2:3*I),NVERTS+1/)
! ENDDO
! NVERTS=NVERTS+1
! NVOLS=NFACES
!
! END SUBROUTINE EXTRUDE_SPHERE

! ! ---------------------------- EXTRUDE_SURFACE ----------------------------------------
!
! SUBROUTINE EXTRUDE_SURFACE(ZMIN,VERTS,MAXVERTS,NVERTS,FACES,NFACES,VOLS,MAXVOLS, NVOLS)
!
! ! extend a 2D surface defined by VERTS and FACES to a plane defined by ZMIN
!
! INTEGER, INTENT(IN) :: NFACES, MAXVERTS,MAXVOLS
! INTEGER, INTENT(INOUT) :: NVERTS
! REAL(EB), INTENT(INOUT), TARGET :: VERTS(3*MAXVERTS)
! INTEGER, INTENT(IN) :: FACES(3*NFACES)
! INTEGER, INTENT(OUT) :: NVOLS
! INTEGER, INTENT(OUT) :: VOLS(4*MAXVOLS)
! REAL(EB), INTENT(IN) :: ZMIN
! INTEGER :: PRISM(6)
!
! INTEGER :: I
! REAL(EB), POINTER, DIMENSION(:) :: VNEW, VOLD
!
! ! define a new vertex on the plane z=ZMIN for each vertex in original list
! DO I = 1, NVERTS
!    VNEW=>VERTS(3*NVERTS+3*I-2:3*NVERTS+3*I)
!    VOLD=>VERTS(3*I-2:3*I)
!    VNEW(1:3)=(/VOLD(1:2),ZMIN/)
! ENDDO
! ! construct 3 tetrahedrons for each prism (solid between original face and face on plane z=zplane)
! DO I = 1, NFACES
!    PRISM(1:3)=FACES(3*I-2:3*I)
!    PRISM(4:6)=FACES(3*I-2:3*I)+NVERTS
!    CALL PRISM2TETRA(PRISM,VOLS(12*I-11:12*I))
! ENDDO
! NVOLS=3*NFACES
! NVERTS=2*NVERTS
!
! END SUBROUTINE EXTRUDE_SURFACE

! ---------------------------- BOX2TETRA ----------------------------------------

SUBROUTINE BOX2TETRA(BOX,TETRAS)

! split a box defined by a list of 8 vertices (not necessarily cubic) into 6 stackable tetrahedrons

!     8-------7
!   / .     / |
! 5-------6   |
! |   .   |   |
! |   .   |   |
! |   4-------3
! | /     | /
! 1-------2


INTEGER, INTENT(IN) :: BOX(8)
INTEGER, INTENT(OUT) :: TETRAS(1:24)

TETRAS(1:4)   = (/BOX(1),BOX(2),BOX(4),BOX(5)/)
TETRAS(5:8)   = (/BOX(4),BOX(5),BOX(2),BOX(6)/)
TETRAS(9:12)  = (/BOX(4),BOX(5),BOX(6),BOX(8)/)
TETRAS(13:16) = (/BOX(2),BOX(3),BOX(4),BOX(6)/)
TETRAS(17:20) = (/BOX(4),BOX(6),BOX(3),BOX(8)/)
TETRAS(21:24) = (/BOX(6),BOX(3),BOX(8),BOX(7)/)

END SUBROUTINE BOX2TETRA

! ! ---------------------------- PRISM2TETRA ----------------------------------------
!
! SUBROUTINE PRISM2TETRA(PRISM,TETRAS)
!
! ! split a prism defined by a list of 6 vertices into 3 tetrahedrons
!
! !       6
! !      /.\                      .
! !    /  .  \                    .
! !  /    .    \                  .
! ! 4-----------5
! ! |     .     |
! ! |     .     |
! ! |     3     |
! ! |    / \    |
! ! |  /     \  |
! ! |/         \|
! ! 1-----------2
! INTEGER, INTENT(IN) :: PRISM(6)
! INTEGER, INTENT(OUT) :: TETRAS(1:12)
!
! TETRAS(1:4)   = (/PRISM(1),PRISM(6),PRISM(4),PRISM(5)/)
! TETRAS(5:8)   = (/PRISM(1),PRISM(3),PRISM(6),PRISM(5)/)
! TETRAS(9:12)  = (/PRISM(1),PRISM(2),PRISM(3),PRISM(5)/)
!
! END SUBROUTINE PRISM2TETRA

! ! ---------------------------- SPLIT_TETRA ----------------------------------------
!
! SUBROUTINE SPLIT_TETRA(VERTS,MAXVERTS,NVERTS,TETRAS)
! ! split a tetrahedron defined by a list of 4 vertices into 4 tetrahedrons
!
! !        1
! !        |
! !       .|.
! !       .|.
! !      . | .
! !     .  7 .
! !     .  |  .
! !    .   4  .
! !    5  / \  6
! !   .  /   \ .
! !   . /     \ .
! !  . /       \ .
! !  ./         \.
! !  /           \.
! ! 2-------------3
!
! INTEGER, INTENT(IN) :: MAXVERTS
! INTEGER, INTENT(INOUT) :: NVERTS
! REAL(EB), INTENT(INOUT), TARGET :: VERTS(3*MAXVERTS)
! INTEGER, INTENT(INOUT) :: TETRAS(16)
!
! REAL(EB), POINTER, DIMENSION(:) :: VERT1, VERT2, VERT3, VERT4, VERT5, VERT6, VERT7
! INTEGER :: TETRANEW(16)
!
! VERT1=>VERTS(3*TETRAS(1)-2:3*TETRAS(1))
! VERT2=>VERTS(3*TETRAS(2)-2:3*TETRAS(2))
! VERT3=>VERTS(3*TETRAS(3)-2:3*TETRAS(3))
! VERT4=>VERTS(3*TETRAS(4)-2:3*TETRAS(4))
! VERT5=>VERTS(3*NVERTS+1:3*NVERTS+3)
! VERT6=>VERTS(3*NVERTS+4:3*NVERTS+6)
! VERT7=>VERTS(3*NVERTS+7:3*NVERTS+9)
!
! ! add 3 vertices
! VERT5(1:3) = ( VERT1(1:3)+VERT2(1:3) )/2.0_EB
! VERT6(1:3) = ( VERT1(1:3)+VERT3(1:3) )/2.0_EB
! VERT7(1:3) = ( VERT1(1:3)+VERT4(1:3) )/2.0_EB
! TETRAS(5)=NVERTS+1
! TETRAS(6)=NVERTS+2
! TETRAS(7)=NVERTS+3
! NVERTS=NVERTS+3
!
! TETRANEW(1:4)=(/TETRAS(1),TETRAS(5),TETRAS(6),TETRAS(7)/)
! CALL PRISM2TETRA(TETRAS(2:7),TETRANEW(5:16))
! TETRAS(1:16)=TETRANEW(1:16)
!
! END SUBROUTINE SPLIT_TETRA

! ---------------------------- ORDER_FACES ----------------------------------------

SUBROUTINE ORDER_FACES(ORDER,N) !
INTEGER, INTENT(IN) :: N
INTEGER, INTENT(OUT) :: ORDER(1:N)

INTEGER, ALLOCATABLE, DIMENSION(:) :: WORK
INTEGER :: I, IZERO

DO I = 1, N
   ORDER(I) = I
ENDDO
ALLOCATE(WORK(N),STAT=IZERO)
CALL ChkMemErr('ORDER_FACES','WORK',IZERO)
CALL ORDER_FACES1(ORDER,WORK,1,N,N)
END SUBROUTINE ORDER_FACES

! ---------------------------- ORDER_FACES1 ----------------------------------------

RECURSIVE SUBROUTINE ORDER_FACES1(ORDER,WORK,LEFT,RIGHT,N)
INTEGER, INTENT(IN) :: N, LEFT, RIGHT
INTEGER, INTENT(INOUT) :: ORDER(1:N)
INTEGER :: TEMP
INTEGER :: I1, I2
INTEGER, INTENT(OUT) :: WORK(N)
INTEGER :: ICOUNT

INTEGER :: NMID

IF (RIGHT-LEFT>1) THEN
   NMID = (LEFT+RIGHT)/2
   CALL ORDER_FACES1(ORDER,WORK,LEFT,NMID,N)
   CALL ORDER_FACES1(ORDER,WORK,NMID+1,RIGHT,N)
   I1=LEFT
   I2=NMID+1
   ICOUNT=LEFT
   DO WHILE (I1<=NMID .OR. I2<=RIGHT)
      IF (I1<=NMID .AND. I2<=RIGHT) THEN
        IF (COMPARE_FACES(ORDER(I1),ORDER(I2))==-1) THEN
           WORK(ICOUNT)=ORDER(I1)
           I1=I1+1
        ELSE
           WORK(ICOUNT)=ORDER(I2)
           I2=I2+1
        ENDIF
      ELSE IF (I1<=NMID .AND. I2>RIGHT) THEN
         WORK(ICOUNT)=ORDER(I1)
         I1=I1+1
      ELSE IF (I1>NMID .AND. I2<=RIGHT) THEN
         WORK(ICOUNT)=ORDER(I2)
         I2=I2+1
      ENDIF
      ICOUNT=ICOUNT+1
   ENDDO
   ORDER(LEFT:RIGHT)=WORK(LEFT:RIGHT)
ELSE IF (RIGHT-LEFT==1) THEN
   IF (COMPARE_FACES(ORDER(LEFT),ORDER(RIGHT))==1) RETURN
   TEMP=ORDER(LEFT)
   ORDER(LEFT) = ORDER(RIGHT)
   ORDER(RIGHT) = TEMP
ENDIF
END SUBROUTINE ORDER_FACES1

! ---------------------------- COMPARE_FACES ----------------------------------------

INTEGER FUNCTION COMPARE_FACES(INDEX1,INDEX2)
INTEGER, INTENT(IN) :: INDEX1, INDEX2
INTEGER, POINTER, DIMENSION(:) :: FACE1, FACE2
INTEGER :: F1(3), F2(3)

FACE1=>FACES(3*INDEX1-2:3*INDEX1)
FACE2=>FACES(3*INDEX2-2:3*INDEX2)
F1(1:3) = (/FACE1(1),MIN(FACE1(2),FACE1(3)),MAX(FACE1(2),FACE1(3))/)
F2(1:3) = (/FACE2(1),MIN(FACE2(2),FACE2(3)),MAX(FACE2(2),FACE2(3))/)

COMPARE_FACES=0
IF (F1(1)<F2(1)) THEN
   COMPARE_FACES=1
ELSE IF (F1(1)>F2(1)) THEN
   COMPARE_FACES=-1
ENDIF
IF (COMPARE_FACES/=0) RETURN

IF (F1(2)<F2(2)) THEN
   COMPARE_FACES=1
ELSE IF (F1(2)>F2(2)) THEN
   COMPARE_FACES=-1
ENDIF
IF (COMPARE_FACES/=0) RETURN

IF (F1(3)<F2(3)) THEN
   COMPARE_FACES=1
ELSE IF (F1(3)>F2(3)) THEN
   COMPARE_FACES=-1
ENDIF
END FUNCTION COMPARE_FACES

END SUBROUTINE READ_GEOM


! ---------------------------- INIT_SPHERE ----------------------------------------

SUBROUTINE INIT_SPHERE(N_LEVELS,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)

INTEGER, INTENT(IN) :: N_LEVELS
INTEGER, INTENT(OUT) :: N_VERTS, N_FACES
INTEGER, INTENT(IN) :: MAX_VERTS, MAX_FACES
REAL(EB), TARGET, INTENT(OUT) :: SPHERE_VERTS(3*MAX_VERTS)
INTEGER, TARGET, INTENT(OUT) :: SPHERE_FACES(3*MAX_FACES)

REAL(EB) :: ARG
REAL(EB), DIMENSION(3) :: VERT
INTEGER :: I,IFACE
INTEGER, DIMENSION(60) :: FACE_LIST
REAL(EB), PARAMETER :: ONETHIRD=1.0_EB/3.0_EB, TWOTHIRDS=2.0_EB/3.0_EB

DATA (FACE_LIST(I),I=1,60) / &
   1, 2, 3,  1, 3, 4,  1, 4, 5,  1, 5, 6,  1, 6,2, &
   2, 7, 3,  3, 7, 8,  3, 8, 4,  4, 8, 9,  4, 9,5, &
   5, 9,10,  5,10, 6,  6,10,11,  6,11, 2,  2,11,7, &
   12, 8,7,  12, 9,8,  12,10,9, 12,11,10, 12,7,11  &
   /

N_VERTS = 12
N_FACES = 20

SPHERE_VERTS(1:3) = (/0.0,0.0,1.0/) ! 1
DO I=2, 6
   ARG = REAL(I-2,EB)*72.0_EB
   ARG = 2.0_EB*PI*ARG/360.0_EB
   VERT = (/COS(ARG),SIN(ARG),1.0_EB/SQRT(5.0_EB)/)
   SPHERE_VERTS(3*I-2:3*I) = VERT/NORM2(VERT)  ! 2-6
ENDDO
DO I=7, 11
   ARG = 36.0_EB+REAL(I-7,EB)*72.0_EB
   ARG = 2.0_EB*PI*ARG/360.0_EB
   VERT = (/COS(ARG),SIN(ARG),-1.0_EB/SQRT(5.0_EB)/)
   SPHERE_VERTS(3*I-2:3*I) = VERT/NORM2(VERT)  ! 7-11
ENDDO
SPHERE_VERTS(34:36) = (/0.0,0.0,-1.0/) ! 12

SPHERE_FACES(1:60) = FACE_LIST(1:60)

! refine each triangle of the icosahedron recursively until the
! refined triangle sides are the same size as the grid mesh

DO IFACE = 1, 20 ! can't use N_FACES since N_FACES is altered by each call to REFINE_FACE
   CALL REFINE_FACE(N_LEVELS,IFACE,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)
ENDDO
END SUBROUTINE INIT_SPHERE

! ---------------------------- COMPUTE_TEXTURES ----------------------------------------

SUBROUTINE COMPUTE_TEXTURES(SPHERE_VERTS,SPHERE_FACES,SPHERE_TFACES,MAX_VERTS,MAX_FACES,N_FACES)
INTEGER, INTENT(IN) :: N_FACES,MAX_VERTS,MAX_FACES
REAL(EB), TARGET, INTENT(IN) :: SPHERE_VERTS(3*MAX_VERTS)
REAL(EB), INTENT(OUT), TARGET :: SPHERE_TFACES(6*MAX_FACES)
INTEGER, TARGET, INTENT(IN) :: SPHERE_FACES(3*MAX_FACES)

INTEGER :: IFACE
REAL(EB) :: EPS_TEXTURE
REAL(EB), POINTER, DIMENSION(:) :: TFACE, VERTPTR
INTEGER, POINTER, DIMENSION(:) :: FACEPTR

EPS_TEXTURE=0.25_EB
IFACE_LOOP: DO IFACE=0, N_FACES-1

   FACEPTR=>SPHERE_FACES(3*IFACE+1:3*IFACE+3)
   TFACE=>SPHERE_TFACES(6*IFACE+1:6*IFACE+6)

   VERTPTR=>SPHERE_VERTS(3*FACEPTR(1)-2:3*FACEPTR(1))
   CALL COMPUTE_TEXTURE(VERTPTR(1:3),TFACE(1:2))

   VERTPTR=>SPHERE_VERTS(3*FACEPTR(2)-2:3*FACEPTR(2))
   CALL COMPUTE_TEXTURE(VERTPTR(1:3),TFACE(3:4))

   VERTPTR=>SPHERE_VERTS(3*FACEPTR(3)-2:3*FACEPTR(3))
   CALL COMPUTE_TEXTURE(VERTPTR(1:3),TFACE(5:6))

   ! adjust texture coordinates when a triangle crosses the "prime meridian"

   IF (TFACE(1)>1.0_EB-EPS_TEXTURE .AND. TFACE(3)<EPS_TEXTURE) THEN
      TFACE(3)=TFACE(3)+1.0_EB
   ENDIF
   IF (TFACE(1)>1.0_EB-EPS_TEXTURE .AND. TFACE(5)<EPS_TEXTURE) THEN
      TFACE(5)=TFACE(5)+1.0_EB
   ENDIF

   IF (TFACE(3)>1.0_EB-EPS_TEXTURE .AND. TFACE(1)<EPS_TEXTURE) THEN
      TFACE(1)=TFACE(1)+1.0_EB
   ENDIF
   IF (TFACE(3)>1.0_EB-EPS_TEXTURE .AND. TFACE(5)<EPS_TEXTURE) THEN
      TFACE(5)=TFACE(5)+1.0_EB
   ENDIF

   IF (TFACE(5)>1.0_EB-EPS_TEXTURE .AND. TFACE(1)<EPS_TEXTURE) THEN
      TFACE(1)=TFACE(1)+1.0_EB
   ENDIF
   IF (TFACE(5)>1.0_EB-EPS_TEXTURE .AND. TFACE(3)<EPS_TEXTURE) THEN
      TFACE(3)=TFACE(3)+1.0_EB
   ENDIF

   ! make adjustments when face is at a pole

   IF (ABS(TFACE(2)-1.0_EB)<0.001_EB) THEN
      TFACE(1) = (TFACE(3)+TFACE(5))/2.0_EB
   ENDIF
   IF (ABS(TFACE(4)-1.0_EB)<0.001_EB) THEN
      TFACE(3) = (TFACE(1)+TFACE(5))/2.0_EB
   ENDIF
   IF (ABS(TFACE(6)-1.0_EB)<0.001_EB) THEN
      TFACE(5) = (TFACE(1)+TFACE(3))/2.0_EB
   ENDIF

   IF (ABS(TFACE(2))<0.001_EB) THEN
      TFACE(1) = (TFACE(3)+TFACE(5))/2.0_EB
   ENDIF
   IF (ABS(TFACE(4))<0.001_EB) THEN
      TFACE(3) = (TFACE(1)+TFACE(5))/2.0_EB
   ENDIF
   IF (ABS(TFACE(6))<0.001_EB) THEN
      TFACE(5) = (TFACE(1)+TFACE(3))/2.0_EB
   ENDIF

ENDDO IFACE_LOOP
END SUBROUTINE COMPUTE_TEXTURES

! ---------------------------- INIT_SPHERE2 ----------------------------------------

SUBROUTINE INIT_SPHERE2(N_VERTS, N_FACES, NLAT,NLONG,SPHERE_VERTS,SPHERE_FACES)
INTEGER, INTENT(IN) :: NLAT, NLONG
REAL(EB), INTENT(OUT), TARGET, DIMENSION(3*(NLONG*(NLAT-2) + 2)) :: SPHERE_VERTS
INTEGER, INTENT(OUT), TARGET, DIMENSION(3*(NLAT-1)*NLONG*2*2) :: SPHERE_FACES
INTEGER, INTENT(OUT) :: N_VERTS, N_FACES
REAL(EB) :: LAT, LONG
INTEGER :: ILONG, ILAT
REAL(EB) :: COSLAT(NLAT), SINLAT(NLAT)
REAL(EB) :: COSLONG(NLONG), SINLONG(NLONG)

INTEGER :: I , J, IJ, I11, I12, I21, I22

N_VERTS = NLONG*(NLAT-2) + 2
N_FACES = (NLAT-2)*NLONG*2

IJ = 0
DO I = 1, NLAT
   LAT = PI/2.0_EB - PI*REAL(I-1,EB)/REAL(NLAT-1,EB)
   COSLAT(I) = COS(LAT)
   SINLAT(I) = SIN(LAT)
ENDDO
DO I = 1, NLONG
   LONG = -PI + 2.0_EB*PI*REAL(I-1,EB)/REAL(NLONG,EB)
   COSLONG(I) = COS(LONG)
   SINLONG(I) = SIN(LONG)
ENDDO

! define vertices

! north pole

SPHERE_VERTS(1:3)  = (/0.0_EB,0.0_EB,1.0_EB/)

! middle latitudes

IJ = 4
DO I = 2, NLAT-1
   DO J = 1, NLONG
      SPHERE_VERTS(IJ:IJ+2)   = (/COSLONG(J)*COSLAT(I),SINLONG(J)*COSLAT(I),SINLAT(I)/)
      IJ = IJ + 3
   ENDDO
ENDDO

! south pole

SPHERE_VERTS(IJ:IJ+2)  = (/0.0_EB,0.0_EB,-1.0_EB/)

! define faces

! faces connected to north pole
IJ=1
DO ILONG = 1, NLONG
   I11 = ILONG+1
   I12 = ILONG+2
   I22 = 1
   IF (ILONG==NLONG)I12=2
   SPHERE_FACES(IJ:IJ+2)   = (/I22, I11,I12/)
   IJ = IJ + 3
ENDDO

DO ILAT = 2, NLAT - 2
   DO ILONG = 1, NLONG

      I11 = 1+ILONG+NLONG*(ILAT+1-2)
      I21 = I11 + 1
      I12 = 1+ILONG+NLONG*(ILAT-2)
      I22 = I12 + 1
      IF ( ILONG==NLONG) THEN
         I21 = 1+1+NLONG*(ILAT+1-2)
         I22 = 1+1+NLONG*(ILAT-2)
      ENDIF

      SPHERE_FACES(IJ:IJ+2)   = (/I12,I11,I22/)
      SPHERE_FACES(IJ+3:IJ+5) = (/I22,I11,I21/)
      IJ = IJ + 6
   ENDDO
ENDDO

! faces connected to south pole

DO ILONG = 1, NLONG
   I11 = ILONG+1 + NLONG*(NLAT-3)
   I12 = I11 + 1
   I22 = NLONG*(NLAT-2)+2
   IF (ILONG==NLONG) I12=2+NLONG*(NLAT-3)
   SPHERE_FACES(IJ:IJ+2)   = (/I11,I22,I12/)
   IJ = IJ + 3
ENDDO
END SUBROUTINE INIT_SPHERE2

! ---------------------------- REFINE_FACE ----------------------------------------

RECURSIVE SUBROUTINE REFINE_FACE(N_LEVELS,IFACE,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)

INTEGER, INTENT(IN) :: N_LEVELS
INTEGER, INTENT(IN) :: IFACE
INTEGER, INTENT(INOUT) :: N_VERTS, N_FACES
INTEGER, INTENT(IN) :: MAX_VERTS, MAX_FACES
REAL(EB), INTENT(INOUT), TARGET :: SPHERE_VERTS(3*MAX_VERTS)
INTEGER, INTENT(INOUT), TARGET :: SPHERE_FACES(3*MAX_FACES)

INTEGER, POINTER, DIMENSION(:) :: FACE1, FACE2, FACE3, FACE4
REAL(EB), POINTER, DIMENSION(:) :: V1, V2, V3
REAL(EB), POINTER, DIMENSION(:) :: V12, V13, V23
INTEGER :: N1, N2, N3, N4

IF (N_LEVELS==0 .OR. N_FACES+3>MAX_FACES .OR. N_VERTS+3>MAX_VERTS) RETURN ! prevent memory overwrites

FACE1(1:3)=>SPHERE_FACES(3*IFACE-2:3*IFACE) ! original face and 1st new face
FACE2(1:3)=>SPHERE_FACES(3*N_FACES+1:3*N_FACES+3) ! 2nd new face
FACE3(1:3)=>SPHERE_FACES(3*N_FACES+4:3*N_FACES+6) ! 3rd new face
FACE4(1:3)=>SPHERE_FACES(3*N_FACES+7:3*N_FACES+9) ! 4th new face

V1(1:3)=>SPHERE_VERTS(3*FACE1(1)-2:3*FACE1(1)) ! FACE1(1)
V2(1:3)=>SPHERE_VERTS(3*FACE1(2)-2:3*FACE1(2)) ! FACE1(2)
V3(1:3)=>SPHERE_VERTS(3*FACE1(3)-2:3*FACE1(3)) ! FACE1(3)

V12(1:3)=>SPHERE_VERTS(3*N_VERTS+1:3*N_VERTS+3)
V13(1:3)=>SPHERE_VERTS(3*N_VERTS+4:3*N_VERTS+6)
V23(1:3)=>SPHERE_VERTS(3*N_VERTS+7:3*N_VERTS+9)

V12 = (V1+V2)/2.0_EB
V13 = (V1+V3)/2.0_EB
V23 = (V2+V3)/2.0_EB
V12 = V12/NORM2(V12) ! N_VERTS + 1
V13 = V13/NORM2(V13) ! N_VERTS + 2
V23 = V23/NORM2(V23) ! N_VERTS + 3

! split triangle 123 into 4 triangles

!         1
!       /F1\                          .
!     12----13
!    /F2\F3/F4\                       i.
!  2 --- 23----3

FACE2(1:3) = (/N_VERTS+1,FACE1(2),N_VERTS+3/)
FACE3(1:3) = (/N_VERTS+1,N_VERTS+3,N_VERTS+2/)
FACE4(1:3) = (/N_VERTS+2,N_VERTS+3,FACE1(3)/)
FACE1(1:3) = (/ FACE1(1),N_VERTS+1,N_VERTS+2/)

N1 = IFACE
N2 = N_FACES+1
N3 = N_FACES+2
N4 = N_FACES+3

N_FACES = N_FACES + 3
N_VERTS = N_VERTS + 3
IF (N_LEVELS==1) RETURN  ! stop recursion

CALL REFINE_FACE(N_LEVELS-1,N1,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)
CALL REFINE_FACE(N_LEVELS-1,N2,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)
CALL REFINE_FACE(N_LEVELS-1,N3,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)
CALL REFINE_FACE(N_LEVELS-1,N4,N_VERTS,N_FACES,MAX_VERTS,MAX_FACES,SPHERE_VERTS,SPHERE_FACES)

END SUBROUTINE REFINE_FACE

! ---------------------------- COMPUTE_TEXTURE ----------------------------------------

SUBROUTINE COMPUTE_TEXTURE(XYZ,TEXT_COORDS)
REAL(EB), INTENT(IN), DIMENSION(3) :: XYZ
REAL(EB), INTENT(OUT), DIMENSION(2) :: TEXT_COORDS
REAL(EB), DIMENSION(2) :: ANGLES
REAL(EB) :: NORM2_XYZ, Z_ANGLE

NORM2_XYZ = NORM2(XYZ)
IF (NORM2_XYZ < TWO_EPSILON_EB) THEN
   Z_ANGLE = 0.0_EB
ELSE
   Z_ANGLE = ASIN(XYZ(3)/NORM2_XYZ)
ENDIF
ANGLES = (/ATAN2(XYZ(2),XYZ(1)),Z_ANGLE/)

!convert back to texture coordinates
TEXT_COORDS = (/ 0.5_EB + 0.5_EB*ANGLES(1)/PI,0.5_EB + ANGLES(2)/PI /)
END SUBROUTINE COMPUTE_TEXTURE

! ---------------------------- GET_GEOM_ID ----------------------------------------

INTEGER FUNCTION GET_GEOM_ID(ID,N_LAST)

! return the index of the geometry array with label ID

CHARACTER(30), INTENT(IN) :: ID
INTEGER, INTENT(IN) :: N_LAST

INTEGER :: N
TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()

GET_GEOM_ID = 0
DO N=1,N_LAST
   G=>GEOMETRY(N)
   IF (TRIM(G%ID)==TRIM(ID)) THEN
      GET_GEOM_ID = N
      RETURN
   ENDIF
ENDDO
END FUNCTION GET_GEOM_ID

! ---------------------------- GET_MATL_INDEX ----------------------------------------

INTEGER FUNCTION GET_MATL_INDEX(ID)
CHARACTER(30), INTENT(IN) :: ID
INTEGER :: N

DO N = 1, N_MATL
   IF (TRIM(MATERIAL(N)%ID)/=TRIM(ID)) CYCLE
   GET_MATL_INDEX = N
   RETURN
ENDDO
GET_MATL_INDEX = 0
END FUNCTION GET_MATL_INDEX

! ---------------------------- GET_SURF_INDEX ----------------------------------------

INTEGER FUNCTION GET_SURF_INDEX(ID)
CHARACTER(30), INTENT(IN) :: ID
INTEGER :: N

DO N = 1, N_SURF
   IF (TRIM(SURFACE(N)%ID)/=TRIM(ID)) CYCLE
   GET_SURF_INDEX = N
   RETURN
ENDDO
GET_SURF_INDEX = 0
END FUNCTION GET_SURF_INDEX

! ---------------------------- SETUP_TRANSFORM ----------------------------------------

! SUBROUTINE SETUP_TRANSFORM(SCALE,AZ,ELEV,GAXIS,GROTATE,M)
!
! ! construct a rotation matrix M that rotates a vector by
! ! AZ degrees around the Z axis then ELEV degrees around
! ! the (cos AZ, sin AZ, 0) axis
!
! REAL(EB), INTENT(IN) :: SCALE(3), AZ, ELEV, GAXIS(3), GROTATE
! REAL(EB), DIMENSION(3,3), INTENT(OUT) :: M
!
! REAL(EB) :: AXIS(3), M0(3,3), M1(3,3), M2(3,3), M3(3,3), MTEMP(3,3), MTEMP2(3,3)
!
! M0 = RESHAPE ((/&
!                SCALE(1),  0.0_EB, 0.0_EB,&
!                  0.0_EB,SCALE(2), 0.0_EB,&
!                  0.0_EB,  0.0_EB,SCALE(3) &
!                /),(/3,3/))
!
! AXIS = (/0.0_EB, 0.0_EB, 1.0_EB/)
! CALL SETUP_ROTATE(AZ,AXIS,M1)
!
! AXIS = (/COS(DEG2RAD*AZ), SIN(DEG2RAD*AZ), 0.0_EB/)
! CALL SETUP_ROTATE(ELEV,AXIS,M2)
!
! CALL SETUP_ROTATE(GROTATE,GAXIS,M3)
!
! MTEMP = MATMUL(M1,M0)
! MTEMP2 = MATMUL(M2,MTEMP)
! M = MATMUL(M3,MTEMP2)
!
! END SUBROUTINE SETUP_TRANSFORM

! ---------------------------- SETUP_ROTATE ----------------------------------------

! SUBROUTINE SETUP_ROTATE(ALPHA,U,M)
!
! ! construct a rotation matrix M that rotates a vector by
! ! ALPHA degrees about an axis U
!
! REAL(EB), INTENT(IN) :: ALPHA, U(3)
! REAL(EB), INTENT(OUT) :: M(3,3)
!
! REAL(EB) :: UP(3,1), S(3,3), UUT(3,3), IDENTITY(3,3)
!
! UP = RESHAPE(U/SQRT(DOT_PRODUCT(U,U)),(/3,1/))
! S =   RESHAPE( (/&
!                    0.0_EB, -UP(3,1),  UP(2,1),&
!                   UP(3,1),   0.0_EB, -UP(1,1),&
!                  -UP(2,1),  UP(1,1),  0.0_EB  &
!                  /),(/3,3/))
! UUT = MATMUL(UP,TRANSPOSE(UP))
! IDENTITY = RESHAPE ((/&
!                1.0_EB,0.0_EB,0.0_EB,&
!                0.0_EB,1.0_EB,0.0_EB,&
!                0.0_EB,0.0_EB,1.0_EB &
!                /),(/3,3/))
! M = UUT + COS(ALPHA*DEG2RAD)*(IDENTITY - UUT) + SIN(ALPHA*DEG2RAD)*S
!
! END SUBROUTINE SETUP_ROTATE

! ! ---------------------------- `TRANSLATE_VEC` ----------------------------------------
!
! SUBROUTINE TRANSLATE_VEC(XYZ,N,XIN,XOUT)
!
! ! translate a geometry by the vector XYZ
!
! INTEGER, INTENT(IN) :: N
! REAL(EB), INTENT(IN) :: XYZ(3), XIN(3*N)
! REAL(EB), INTENT(OUT) :: XOUT(3*N)
!
! REAL(EB) :: VEC(3)
! INTEGER :: I
!
! DO I = 1, N
!    VEC(1:3) = XYZ(1:3) + XIN(3*I-2:3*I) ! copy into a temp array so XIN and XOUT can point to same space
!    XOUT(3*I-2:3*I) = VEC(1:3)
! ENDDO
!
! END SUBROUTINE TRANSLATE_VEC

! ---------------------------- `TRANSLATE_VEC_INPLACE` ----------------------------------------

! SUBROUTINE TRANSLATE_VEC_INPLACE(XYZ,N,XINOUT)
!
! ! translate a geometry by the vector XYZ
!
! INTEGER, INTENT(IN) :: N
! REAL(EB), INTENT(IN) :: XYZ(3)
! REAL(EB), INTENT(INOUT) :: XINOUT(3*N)
!
! REAL(EB) :: VEC(3)
! INTEGER :: I
!
! DO I = 1, N
!    VEC(1:3) = XYZ(1:3) + XINOUT(3*I-2:3*I) ! copy into a temp array so XIN and XOUT can point to same space
!    XINOUT(3*I-2:3*I) = VEC(1:3)
! ENDDO
!
! END SUBROUTINE TRANSLATE_VEC_INPLACE

! ---------------------------- ROTATE_VEC ----------------------------------------

! SUBROUTINE ROTATE_VEC(M,N,XYZ0,XIN,XOUT)
!
! ! rotate the vector XIN about the origin XYZ0
!
! INTEGER, INTENT(IN) :: N
! REAL(EB), INTENT(IN) :: M(3,3), XIN(3*N), XYZ0(3)
! REAL(EB), INTENT(OUT) :: XOUT(3*N)
!
! REAL(EB) :: VEC(3)
! INTEGER :: I
!
! DO I = 1, N
!    VEC(1:3) = MATMUL(M,XIN(3*I-2:3*I)-XYZ0(1:3))  ! copy into a temp array so XIN and XOUT can point to same space
!    XOUT(3*I-2:3*I) = VEC(1:3) + XYZ0(1:3)
! ENDDO
! END SUBROUTINE ROTATE_VEC

! ---------------------------- GEOMCLIPS ----------------------------------------

SUBROUTINE GEOMCLIPS
USE BOXTETRA_ROUTINES, ONLY : GEOMCLIP
REAL(EB) :: XB(6)
INTEGER :: I
TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()

   ! clip geometries to mesh

XB(1)=-1.0
XB(2)=0.0
XB(3)=-1.0
XB(4)=0.0
XB(5)=0.0
XB(6)=1.0
DO I = 1, N_GEOMETRY
   G=>GEOMETRY(I)
   CALL GEOMCLIP(G%VERTS, G%N_VERTS, G%FACES, G%N_FACES, XB)
END DO
END SUBROUTINE GEOMCLIPS

! ---------------------------- PROCESS_GEOM ----------------------------------------

SUBROUTINE PROCESS_GEOM(IS_DYNAMIC,TIME, N_VERTS, N_FACES, N_VOLUS)

USE GEOMETRY_FUNCTIONS, ONLY: TRANSFORM_COORDINATES

! transform (scale, rotate and translate) vectors found on each &GEOM line

   LOGICAL, INTENT(IN) :: IS_DYNAMIC
   REAL(EB), INTENT(IN) :: TIME
   INTEGER, INTENT(OUT) :: N_VERTS, N_FACES, N_VOLUS

   INTEGER :: I, IVERT, IMOVE, MOVE_INDEX
   TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()
   REAL(EB) :: DELTA_T, VEC(1:3) ! M(3,3)

   IF (IS_DYNAMIC) THEN
      DELTA_T = TIME - T_BEGIN
   ELSE
      DELTA_T = 0.0_EB
   ENDIF

   DO I = 1, N_GEOMETRY
      G=>GEOMETRY(I)
      IF ((IS_DYNAMIC .AND. G%IS_DYNAMIC) .OR. (.NOT.IS_DYNAMIC .AND. .NOT.G%IS_DYNAMIC)) THEN
         G%N_VERTS = G%N_VERTS_BASE
         G%N_FACES = G%N_FACES_BASE
         G%N_VOLUS = G%N_VOLUS_BASE
      ENDIF
   ENDDO

   DO I = 1, N_GEOMETRY
      G=>GEOMETRY(I)
      IF (G%IS_DYNAMIC .AND. .NOT.IS_DYNAMIC) CYCLE
      IF (.NOT.G%IS_DYNAMIC .AND. IS_DYNAMIC) CYCLE
      MOVE_INDEX = 0
      IF (TRIM(G%MOVE_ID)/='null') THEN
         DO IMOVE=1,N_MOVE
            IF (TRIM(G%MOVE_ID)==TRIM(MOVEMENT(IMOVE)%ID)) THEN
               MOVE_INDEX = MOVEMENT(IMOVE)%INDEX
               EXIT
            ENDIF
         ENDDO
         IF (MOVE_INDEX==0) THEN
            WRITE(MESSAGE,'(A,A,A)')  'ERROR: &GEOM ',TRIM(G%ID),' MOVE_ID is not recognized'
            CALL SHUTDOWN(MESSAGE) ; RETURN
         ENDIF
         DO IVERT=1,G%N_VERTS
            VEC(1:3) = G%VERTS_BASE(3*IVERT-2:3*IVERT)
            CALL TRANSFORM_COORDINATES(VEC(1),VEC(2),VEC(3),MOVE_INDEX,1) ! Eventually, time varying motion dealt with here.
            G%VERTS(3*IVERT-2:3*IVERT) = VEC(1:3)
         ENDDO
      ELSE
         DO IVERT=1,G%N_VERTS
            G%VERTS(3*IVERT-2:3*IVERT) = G%VERTS_BASE(3*IVERT-2:3*IVERT)
         ENDDO
      ENDIF

   ENDDO

 ! remove this if statement when GEOMCLIPS is ready for use
   IF ( I .EQ. 0 ) THEN
      CALL GEOMCLIPS
   ENDIF

   CALL GEOM2TEXTURE

   N_VERTS = 0
   N_FACES = 0
   N_VOLUS = 0
   DO I = 1, N_GEOMETRY ! count vertices and faces
      G=>GEOMETRY(I)
      IF (G%IS_DYNAMIC .AND. .NOT.IS_DYNAMIC) CYCLE
      IF (.NOT.G%IS_DYNAMIC .AND. IS_DYNAMIC) CYCLE
      N_VERTS = N_VERTS + G%N_VERTS
      N_FACES = N_FACES + G%N_FACES
      N_VOLUS = N_VOLUS + G%N_VOLUS
   ENDDO


END SUBROUTINE PROCESS_GEOM

! ---------------------------- GEOM2TEXTURE ----------------------------------------

SUBROUTINE GEOM2TEXTURE
   INTEGER :: I,J,K,JJ
   TYPE(GEOMETRY_TYPE), POINTER :: G
   REAL(EB), POINTER, DIMENSION(:) :: XYZ, TFACES
   INTEGER, POINTER, DIMENSION(:) :: FACES
   INTEGER :: SURF_INDEX
   TYPE(SURFACE_TYPE), POINTER :: SF=>NULL()

   DO I = 1, N_GEOMETRY
      G=>GEOMETRY(I)
      IF (G%TEXTURE_MAPPING/='RECTANGULAR') CYCLE
      DO J = 0, G%N_FACES-1
         SURF_INDEX = G%SURFS(1+J)
         SF=>SURFACE(SURF_INDEX)
         IF (TRIM(SF%TEXTURE_MAP)=='null') CYCLE
         FACES(1:3)=>G%FACES(1+3*J:3+3*J)
         TFACES(1:6)=>G%TFACES(1+6*J:6+6*J)
         DO K = 0, 2
            JJ = FACES(1+K)

            XYZ(1:3) => G%VERTS(3*JJ-2:3*JJ)
            TFACES(1+2*K:2+2*K) = (XYZ(1:2) - G%TEXTURE_ORIGIN(1:2))/G%TEXTURE_SCALE(1:2)
         ENDDO
      ENDDO
   ENDDO
END SUBROUTINE GEOM2TEXTURE

! ---------------------------- MERGE_GEOMS ----------------------------------------

SUBROUTINE MERGE_GEOMS(VERTS,N_VERTS,FACES,TFACES,GEOM_IDS,SURF_IDS,N_FACES,VOLUS,MATL_IDS,N_VOLUS,IS_DYNAMIC)

! combine vectors and faces found on all &GEOM lines into one set of VECTOR and FACE arrays

INTEGER, INTENT(IN) :: N_VERTS, N_FACES, N_VOLUS
LOGICAL, INTENT(IN) :: IS_DYNAMIC
REAL(EB), DIMENSION(:), INTENT(OUT) :: VERTS(3*N_VERTS), TFACES(6*N_FACES)
INTEGER, DIMENSION(:), INTENT(OUT) :: FACES(3*N_FACES), VOLUS(4*N_VOLUS), MATL_IDS(N_VOLUS), GEOM_IDS(N_FACES), SURF_IDS(N_FACES)

INTEGER :: I
TYPE(GEOMETRY_TYPE), POINTER :: G=>NULL()
INTEGER :: IVERT, ITFACE, IFACE, IVOLUS, IMATL, IGEOM, ISURF, OFFSET

IVERT = 0
ITFACE = 0
IFACE = 0
IVOLUS = 0
IGEOM = 0
ISURF = 0
IMATL = 0
OFFSET = 0
DO I = 1, N_GEOMETRY
   G=>GEOMETRY(I)
   IF (G%IS_DYNAMIC .AND. .NOT.IS_DYNAMIC) CYCLE
   IF (.NOT.G%IS_DYNAMIC .AND. IS_DYNAMIC) CYCLE

   IF (G%N_VERTS>0) THEN
      VERTS(1+IVERT:3*G%N_VERTS+IVERT) = G%VERTS(1:3*G%N_VERTS)
      IVERT = IVERT + 3*G%N_VERTS
   ENDIF
   IF (G%N_FACES>0) THEN
      FACES(1+IFACE:3*G%N_FACES + IFACE) = G%FACES(1:3*G%N_FACES)+OFFSET
      IFACE = IFACE + 3*G%N_FACES

      TFACES(1+ITFACE:6*G%N_FACES + ITFACE) = G%TFACES(1:6*G%N_FACES)
      ITFACE = ITFACE + 6*G%N_FACES

      GEOM_IDS(1+IGEOM:G%N_FACES+IGEOM) = I
      IGEOM = IGEOM +   G%N_FACES

      SURF_IDS(1+ISURF:G%N_FACES+ISURF) = G%SURFS(1:G%N_FACES)
      ISURF = ISURF +   G%N_FACES
   ENDIF
   IF (G%N_VOLUS>0) THEN
      VOLUS(1+IVOLUS:4*G%N_VOLUS + IVOLUS) = G%VOLUS(1:4*G%N_VOLUS)+OFFSET
      IVOLUS = IVOLUS + 4*G%N_VOLUS

      MATL_IDS(1+IMATL:G%N_VOLUS+IMATL) = G%MATLS(1:G%N_VOLUS)
      IMATL = IMATL + G%N_VOLUS
   ENDIF
   OFFSET = OFFSET + G%N_VERTS
ENDDO

END SUBROUTINE MERGE_GEOMS

! ---------------------------- CONVERTGEOM ----------------------------------------

SUBROUTINE CONVERTGEOM(TIME)

REAL(EB), INTENT(IN) :: TIME

INTEGER :: N_VERTS, N_FACES, N_VOLUS
INTEGER :: N_VERTS_S, N_FACES_S, N_VOLUS_S
INTEGER :: N_VERTS_D, N_FACES_D, N_VOLUS_D
INTEGER, ALLOCATABLE, DIMENSION(:) :: VOLUS, FACES, MATL_IDS, SURF_IDS, GEOM_IDS
REAL(EB), ALLOCATABLE, DIMENSION(:) :: VERTS, TFACES
INTEGER :: IZERO

CALL PROCESS_GEOM(.FALSE.,TIME, N_VERTS_S, N_FACES_S, N_VOLUS_S)  ! scale, rotate, translate static GEOM vertices
CALL PROCESS_GEOM( .TRUE.,TIME, N_VERTS_D, N_FACES_D, N_VOLUS_D)  ! scale, rotate, translate dynamic GEOM vertices

N_VERTS = N_VERTS_S + N_VERTS_D
N_FACES = N_FACES_S + N_FACES_D
N_VOLUS = N_VOLUS_S + N_VOLUS_D

ALLOCATE(VERTS(MAX(1,3*N_VERTS)),STAT=IZERO)   ! create arrays to contain all vertices and faces
CALL ChkMemErr('CONVERTGEOM','VERTS',IZERO)

ALLOCATE(TFACES(MAX(1,6*N_FACES)),STAT=IZERO)   ! create arrays to contain all vertices and faces
CALL ChkMemErr('CONVERTGEOM','TVERTS',IZERO)

ALLOCATE(FACES(MAX(1,3*N_FACES)),STAT=IZERO)
CALL ChkMemErr('CONVERTGEOM','FACES',IZERO)

ALLOCATE(SURF_IDS(MAX(1,N_FACES)),STAT=IZERO)
CALL ChkMemErr('CONVERTGEOM','SURF_IDS',IZERO)

ALLOCATE(GEOM_IDS(MAX(1,N_FACES)),STAT=IZERO)
CALL ChkMemErr('CONVERTGEOM','SURF_IDS',IZERO)

ALLOCATE(VOLUS(MAX(1,4*N_VOLUS)),STAT=IZERO)
CALL ChkMemErr('CONVERTGEOM','VOLUS',IZERO)

ALLOCATE(MATL_IDS(MAX(1,N_VOLUS)),STAT=IZERO)
CALL ChkMemErr('CONVERTGEOM','MATL_IDS',IZERO)

IF (N_VERTS_S>0 .AND. (N_FACES_S>0 .OR. N_VOLUS_S>0)) THEN ! merge static geometry
   CALL MERGE_GEOMS(VERTS(1:3*N_VERTS_S),N_VERTS_S,&
      FACES(1:3*N_FACES_S),TFACES(1:3*N_FACES_S),GEOM_IDS(1:N_FACES_S),SURF_IDS(1:N_FACES_S),N_FACES_S,&
      VOLUS(1:3*N_VOLUS_S),MATL_IDS(1:N_VOLUS_S),N_VOLUS_S,.FALSE.)
ENDIF
IF (N_VERTS_D>0 .AND. (N_FACES_D>0 .OR. N_VOLUS_D>0)) THEN ! merge dynamic geometry
   CALL MERGE_GEOMS(VERTS(3*N_VERTS_S+1:3*N_VERTS),N_VERTS_D,&
      FACES(3*N_FACES_S+1:3*N_FACES),TFACES(3*N_FACES_S+1:3*N_FACES),GEOM_IDS,SURF_IDS(N_FACES_S+1:N_FACES),N_FACES_D,&
      VOLUS(3*N_VOLUS_S+1:3*N_VOLUS),MATL_IDS(N_VOLUS_S+1:N_VOLUS),N_VOLUS_D,.TRUE.)
ENDIF

RETURN
END SUBROUTINE CONVERTGEOM

! ---------------------------- REORDER_FACE ----------------------------------------

SUBROUTINE REORDER_VERTS(VERTS)
! the VERTS triplet V1, V2, V3 defines a face
! reorder V1,V2,V3 so that V1 has the smallest index
INTEGER, INTENT(INOUT) :: VERTS(3)

INTEGER :: VERTS_TEMP(5)

IF ( VERTS(1)<MIN(VERTS(2),VERTS(3))) RETURN ! already in correct order

VERTS_TEMP(1:3) = VERTS(1:3)
VERTS_TEMP(4:5) = VERTS(1:2)

IF (VERTS(2)<MIN(VERTS(1),VERTS(3))) THEN
   VERTS(1:3) = VERTS_TEMP(2:4)
ELSE
   VERTS(1:3) = VERTS_TEMP(3:5)
ENDIF
END SUBROUTINE REORDER_VERTS

! ---------------------------- OUTGEOM ----------------------------------------

SUBROUTINE OUTGEOM(LUNIT,LUNIT2,IS_DYNAMIC,TIME,APPLY_TRAN,TRAN)
   INTEGER, INTENT(IN) :: LUNIT, LUNIT2
   REAL(EB), INTENT(IN) :: TIME
   TYPE(TRANSFORM_TYPE), POINTER, INTENT(IN) :: TRAN
   LOGICAL, INTENT(IN) :: IS_DYNAMIC, APPLY_TRAN
   INTEGER :: N_VERTS, N_FACES, N_VOLUS
   INTEGER :: I
   INTEGER, ALLOCATABLE, DIMENSION(:) :: FACES, VOLUS, MATL_IDS, GEOM_IDS, SURF_IDS
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: VERTS, TFACES
   INTEGER :: IZERO

   CALL PROCESS_GEOM(IS_DYNAMIC,TIME,N_VERTS, N_FACES, N_VOLUS)  ! scale, rotate, translate GEOM vertices

   ALLOCATE(VERTS(MAX(1,3*N_VERTS)),STAT=IZERO)   ! create arrays to contain all vertices and faces
   CALL ChkMemErr('OUTGEOM','VERTS',IZERO)

   ALLOCATE(TFACES(MAX(1,6*N_FACES)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','VERTS',IZERO)

   ALLOCATE(FACES(MAX(1,3*N_FACES)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','FACES',IZERO)

   ALLOCATE(GEOM_IDS(MAX(1,N_FACES)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','GEOM_IDS',IZERO)

   ALLOCATE(SURF_IDS(MAX(1,N_FACES)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','SURF_IDS',IZERO)

   ALLOCATE(VOLUS(MAX(1,4*N_VOLUS)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','VOLUS',IZERO)

   ALLOCATE(MATL_IDS(MAX(1,N_VOLUS)),STAT=IZERO)
   CALL ChkMemErr('OUTGEOM','MATL_IDS',IZERO)

   IF (N_VERTS>0 .AND. (N_FACES>0 .OR. N_VOLUS>0)) THEN
      CALL MERGE_GEOMS(VERTS,N_VERTS,FACES,TFACES,GEOM_IDS,SURF_IDS,N_FACES,VOLUS,MATL_IDS,N_VOLUS,IS_DYNAMIC)
   ENDIF

   WRITE(LUNIT) REAL(TIME,FB)
   WRITE(LUNIT) N_VERTS, N_FACES, N_VOLUS
   IF (N_VERTS>0) THEN
      IF (APPLY_TRAN) THEN
         DO I = 1, N_VERTS
            VERTS(3*I) = VERTS(3*I) + TRAN%Z_OFFSET
         ENDDO
      ENDIF
      WRITE(LUNIT) (REAL(VERTS(I),FB), I=1,3*N_VERTS)
   ENDIF
   IF (N_FACES>0) THEN
      WRITE(LUNIT) (FACES(I), I=1,3*N_FACES)
      WRITE(LUNIT) (SURF_IDS(I), I=1,N_FACES)
      WRITE(LUNIT) (REAL(TFACES(I),FB), I=1,6*N_FACES)

      WRITE(LUNIT2) N_FACES
      WRITE(LUNIT2) (GEOM_IDS(I), I=1,N_FACES)
   ENDIF
   IF (N_VOLUS>0) THEN
      WRITE(LUNIT) (VOLUS(I), I=1,4*N_VOLUS)
      WRITE(LUNIT) (MATL_IDS(I), I=1,N_VOLUS)
   ENDIF

END SUBROUTINE OUTGEOM

! ---------------------------- WRITE_GEOM_ALL ------------------------------------

SUBROUTINE WRITE_GEOM_ALL
INTEGER :: I
REAL(EB) :: STIME

CALL WRITE_GEOM(T_BEGIN) ! write out both static and dynamic data at t=T_BEGIN
DO I = 1, NFRAMES
   STIME = (T_BEGIN*REAL(NFRAMES-I,EB) + T_END_GEOM*REAL(I,EB))/REAL(NFRAMES,EB)
   CALL WRITE_GEOM(STIME) ! write out just dynamic data at t=STIME
ENDDO
END SUBROUTINE WRITE_GEOM_ALL

! ---------------------------- WRITE_GEOM ----------------------------------------

SUBROUTINE WRITE_GEOM(TIME)

! output geometries to a .ge file

   REAL(EB), INTENT(IN) :: TIME
   INTEGER :: ONE=1, ZERO=0, VERSION=2
   INTEGER :: I, NM
   TYPE(TRANSFORM_TYPE), POINTER :: T=>NULL()


   IF (N_GEOMETRY<=0) RETURN

!   IF (ABS(TIME-T_BEGIN)<TWO_EPSILON_EB) THEN
   IF (WRITE_GEOM_FIRST) THEN
      OPEN(LU_GEOM(1),FILE=TRIM(FN_GEOM(1)),FORM='UNFORMATTED',STATUS='REPLACE')
      OPEN(LU_GEOM(2),FILE=TRIM(FN_GEOM(2)),FORM='UNFORMATTED',STATUS='REPLACE')
      WRITE(LU_GEOM(1)) ONE
      WRITE(LU_GEOM(1)) VERSION
      WRITE(LU_GEOM(1)) ZERO, ZERO, ONE ! n floats, n ints, first frame static
      CALL OUTGEOM(LU_GEOM(1),LU_GEOM(2),.FALSE.,TIME,.FALSE.,T) ! write out static data
   ELSE
      OPEN(LU_GEOM(1),FILE=TRIM(FN_GEOM(1)),FORM='UNFORMATTED',STATUS='OLD',POSITION='APPEND')
      OPEN(LU_GEOM(2),FILE=TRIM(FN_GEOM(2)),FORM='UNFORMATTED',STATUS='OLD',POSITION='APPEND')
   ENDIF
   CALL OUTGEOM(LU_GEOM(1),LU_GEOM(2),.TRUE.,TIME,.FALSE.,T) ! write out dynamic data
   CLOSE(LU_GEOM(1))
   CLOSE(LU_GEOM(2))

   DO I = 1, N_TRNF
      DO NM=1, NMESHES
         T => TRANSFORM(I,NM)
         IF (WRITE_GEOM_FIRST) THEN
            OPEN(LU_GEOM_TRAN,FILE=TRIM(FN_GEOM_TRNF(I,NM)),FORM='UNFORMATTED',STATUS='REPLACE')
            WRITE(LU_GEOM_TRAN) ONE
            WRITE(LU_GEOM_TRAN) VERSION
            WRITE(LU_GEOM_TRAN) ZERO, ZERO, ONE ! n floats, n ints, first frame static
            CALL OUTGEOM(LU_GEOM_TRAN,-1,.FALSE.,TIME,.TRUE.,T) ! write out static data
         ELSE
            OPEN(LU_GEOM_TRAN,FILE=TRIM(FN_GEOM_TRNF(I,NM)),FORM='UNFORMATTED',STATUS='OLD',POSITION='APPEND')
         ENDIF
         CALL OUTGEOM(LU_GEOM_TRAN,-1,.TRUE.,TIME,.TRUE.,T) ! write out dynamic data
         CLOSE(LU_GEOM_TRAN)
      ENDDO
   ENDDO

   WRITE_GEOM_FIRST = .FALSE.

END SUBROUTINE WRITE_GEOM

! ---------------------------- WRITE_GEOM_DATA-----------------------------------

! SUBROUTINE WRITE_GEOM_DATA(VERTS, NVERTS, TRIANGLES, NTRIANGLES, VERTDATA, NVERTDATA, TRIDATA, NTRIDATA)
!    INTEGER, INTENT(IN) :: NVERTS, NTRIANGLES, NVERTDATA, NTRIDATA
!    REAL(FB), INTENT(IN) :: VERTS(3*NVERTS), VERTDATA(NVERTDATA), TRIDATA(NTRIDATA)
!    INTEGER, INTENT(IN) :: TRIANGLES(3*NTRIANGLES)
!
!    INTEGER :: ONE=1, VERSION=2
!    INTEGER :: N_FLOATS=0, N_INTS=0, FIRST_FRAME_STATIC=1
!    INTEGER :: NVOLS=0, HAS_VERT_ID=0,NVOLDATA=0
!    REAL(FB) :: STIME=0.0_FB
!    INTEGER :: I
!
!    IF (NVERTS.EQ.0.OR.NTRIANGLES.EQ.0) RETURN
!    OPEN(LU_GEOM_DIAG(1),FILE=TRIM(FN_GEOM_DIAG(1)),FORM='UNFORMATTED',STATUS='REPLACE')
!    WRITE(LU_GEOM_DIAG(1)) ONE
!    WRITE(LU_GEOM_DIAG(1)) VERSION
!    WRITE(LU_GEOM_DIAG(1)) N_FLOATS, N_INTS, FIRST_FRAME_STATIC
!
!    WRITE(LU_GEOM_DIAG(1)) STIME
!    WRITE(LU_GEOM_DIAG(1)) NVERTS, NTRIANGLES, NVOLS
!    IF (NVERTS>0) WRITE(LU_GEOM_DIAG(1))(VERTS(I),I=1,3*NVERTS)
!    IF (NTRIANGLES>0) THEN
!       WRITE(LU_GEOM_DIAG(1)) (TRIANGLES(I),I=1,3*NTRIANGLES)
!       WRITE(LU_GEOM_DIAG(1)) (-1,I=1,NTRIANGLES)
!       WRITE(LU_GEOM_DIAG(1)) (-1.0_FB,-1.0_FB,I=1,3*NTRIANGLES)
!    ENDIF
!    CLOSE(LU_GEOM_DIAG(1))
!
!    OPEN(LU_GEOM_DIAG(2),FILE=TRIM(FN_GEOM_DIAG(2)),FORM='UNFORMATTED',STATUS='REPLACE')
!    WRITE(LU_GEOM_DIAG(2)) ONE
!    WRITE(LU_GEOM_DIAG(2)) VERSION
!    WRITE(LU_GEOM_DIAG(2)) N_FLOATS
!    WRITE(LU_GEOM_DIAG(2)) N_INTS
!
!    WRITE(LU_GEOM_DIAG(2)) STIME
!    WRITE(LU_GEOM_DIAG(1)) NVERTDATA, NTRIDATA, NVOLDATA
!    WRITE(LU_GEOM_DIAG(2)) HAS_VERT_ID
!    IF (NVERTDATA>0)WRITE(LU_GEOM_DIAG(2))(VERTDATA(I),I=1,NVERTDATA)
!    IF (NTRIDATA>0) WRITE(LU_GEOM_DIAG(2))(TRIDATA(I),I=1,NTRIDATA)
!    CLOSE(LU_GEOM_DIAG(2))
!
! END SUBROUTINE WRITE_GEOM_DATA

! ! ---------------------------- TRIANGLE_BOX_INTERSECT ----------------------------------------
!
! SUBROUTINE TRIANGLE_BOX_INTERSECT(IERR,V1,V2,V3,BB)
!
! INTEGER, INTENT(OUT) :: IERR
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),BB(6)
! REAL(EB) :: PLANE(4),P0(3),P1(3)
!
! IERR=0
!
! !! Filter small triangles
! !
! !A_TRI = TRIANGLE_AREA(V1,V2,V3)
! !A_BB  = MIN( (BB(2)-BB(1))*(BB(4)-BB(3)), (BB(2)-BB(1))*(BB(6)-BB(5)), (BB(4)-BB(3))*(BB(6)-BB(5)) )
! !IF (A_TRI < 0.01*A_BB) RETURN
!
! ! Are vertices outside of bounding planes?
!
! IF (MAX(V1(1),V2(1),V3(1))<BB(1)) RETURN
! IF (MIN(V1(1),V2(1),V3(1))>BB(2)) RETURN
! IF (MAX(V1(2),V2(2),V3(2))<BB(3)) RETURN
! IF (MIN(V1(2),V2(2),V3(2))>BB(4)) RETURN
! IF (MAX(V1(3),V2(3),V3(3))<BB(5)) RETURN
! IF (MIN(V1(3),V2(3),V3(3))>BB(6)) RETURN
!
! ! Any vertices inside bounding box?
!
! IF ( V1(1)>=BB(1) .AND. V1(1)<=BB(2) .AND. &
!      V1(2)>=BB(3) .AND. V1(2)<=BB(4) .AND. &
!      V1(3)>=BB(5) .AND. V1(3)<=BB(6) ) THEN
!    IERR=1
!    RETURN
! ENDIF
! IF ( V2(1)>=BB(1) .AND. V2(1)<=BB(2) .AND. &
!      V2(2)>=BB(3) .AND. V2(2)<=BB(4) .AND. &
!      V2(3)>=BB(5) .AND. V2(3)<=BB(6) ) THEN
!    IERR=1
!    RETURN
! ENDIF
! IF ( V3(1)>=BB(1) .AND. V3(1)<=BB(2) .AND. &
!      V3(2)>=BB(3) .AND. V3(2)<=BB(4) .AND. &
!      V3(3)>=BB(5) .AND. V3(3)<=BB(6) ) THEN
!    IERR=1
!    RETURN
! ENDIF
!
! ! There are a couple other trivial rejection tests we could employ.
! ! But for now we jump straight to line segment--plane intersection.
!
! ! Test edge V1,V2 for intersection with each face of box
! PLANE = (/-1._EB,0._EB,0._EB, BB(1)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB,-1); IF (IERR==1) RETURN
! PLANE = (/ 1._EB,0._EB,0._EB,-BB(2)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB, 1); IF (IERR==1) RETURN
! PLANE = (/0._EB,-1._EB,0._EB, BB(3)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB,-2); IF (IERR==1) RETURN
! PLANE = (/0._EB, 1._EB,0._EB,-BB(4)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB, 2); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB,-1._EB, BB(5)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB,-3); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB, 1._EB,-BB(6)/); CALL LINE_PLANE_INTERSECT(IERR,V1,V2,PLANE,BB, 3); IF (IERR==1) RETURN
!
! ! Test edge V2,V3 for intersection with each face of box
! PLANE = (/-1._EB,0._EB,0._EB, BB(1)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB,-1); IF (IERR==1) RETURN
! PLANE = (/ 1._EB,0._EB,0._EB,-BB(2)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB, 1); IF (IERR==1) RETURN
! PLANE = (/0._EB,-1._EB,0._EB, BB(3)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB,-2); IF (IERR==1) RETURN
! PLANE = (/0._EB, 1._EB,0._EB,-BB(4)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB, 2); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB,-1._EB, BB(5)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB,-3); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB, 1._EB,-BB(6)/); CALL LINE_PLANE_INTERSECT(IERR,V2,V3,PLANE,BB, 3); IF (IERR==1) RETURN
!
! ! Test edge V3,V1 for intersection with each face of box
! PLANE = (/-1._EB,0._EB,0._EB, BB(1)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB,-1); IF (IERR==1) RETURN
! PLANE = (/ 1._EB,0._EB,0._EB,-BB(2)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB, 1); IF (IERR==1) RETURN
! PLANE = (/0._EB,-1._EB,0._EB, BB(3)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB,-2); IF (IERR==1) RETURN
! PLANE = (/0._EB, 1._EB,0._EB,-BB(4)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB, 2); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB,-1._EB, BB(5)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB,-3); IF (IERR==1) RETURN
! PLANE = (/0._EB,0._EB, 1._EB,-BB(6)/); CALL LINE_PLANE_INTERSECT(IERR,V3,V1,PLANE,BB, 3); IF (IERR==1) RETURN
!
! ! The remaining possibility for tri-box intersection is that the corner of the box pokes through
! ! the triangle such that neither the vertices nor the edges of tri intersect any of the box faces.
! ! In this case the diagonal of the box corner intersects the plane formed by the tri.  The diagonal
! ! is defined as the line segment from point P0 to P1, formed from the corners of the bounding box.
!
! ! Test the four box diagonals:
!
! P0 = (/BB(1),BB(3),BB(5)/)
! P1 = (/BB(2),BB(4),BB(6)/)
! CALL LINE_SEGMENT_TRIANGLE_INTERSECT(IERR,V1,V2,V3,P0,P1); IF (IERR==1) RETURN
!
! P0 = (/BB(2),BB(3),BB(5)/)
! P1 = (/BB(1),BB(4),BB(6)/)
! CALL LINE_SEGMENT_TRIANGLE_INTERSECT(IERR,V1,V2,V3,P0,P1); IF (IERR==1) RETURN
!
! P0 = (/BB(1),BB(3),BB(6)/)
! P1 = (/BB(2),BB(4),BB(5)/)
! CALL LINE_SEGMENT_TRIANGLE_INTERSECT(IERR,V1,V2,V3,P0,P1); IF (IERR==1) RETURN
!
! P0 = (/BB(1),BB(4),BB(5)/)
! P1 = (/BB(2),BB(3),BB(6)/)
! CALL LINE_SEGMENT_TRIANGLE_INTERSECT(IERR,V1,V2,V3,P0,P1); IF (IERR==1) RETURN
!
! ! test commit from Charles Luo
!
! END SUBROUTINE TRIANGLE_BOX_INTERSECT

! ---------------------------- TRIANGLE_AREA ----------------------------------------

REAL(EB) FUNCTION TRIANGLE_AREA(V1,V2,V3)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3)
REAL(EB) :: N(3),R1(3),R2(3)

R1 = V2-V1
R2 = V3-V1
CALL CROSS_PRODUCT(N,R1,R2)

TRIANGLE_AREA = 0.5_EB*NORM2(N)

END FUNCTION TRIANGLE_AREA

! ! ---------------------------- LINE_SEGMENT_TRIANGLE_INTERSECT ----------------------------------------
!
! SUBROUTINE LINE_SEGMENT_TRIANGLE_INTERSECT(IERR,V1,V2,V3,P0,P1)
! USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT
!
! INTEGER, INTENT(OUT) :: IERR
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),P0(3),P1(3)
! REAL(EB) :: E1(3),E2(3),S(3),Q(3),U,V,TMP,T,D(3),P(3)
! REAL(EB), PARAMETER :: EPS=1.E-10_EB
!
! IERR=0
!
! ! Schneider and Eberly, Section 11.1
!
! D = P1-P0
!
! E1 = V2-V1
! E2 = V3-V1
!
! CALL CROSS_PRODUCT(P,D,E2)
!
! TMP = DOT_PRODUCT(P,E1)
!
! IF ( ABS(TMP)<EPS ) RETURN
!
! TMP = 1._EB/TMP
! S = P0-V1
!
! U = TMP*DOT_PRODUCT(S,P)
! IF (U<0._EB .OR. U>1._EB) RETURN
!
! CALL CROSS_PRODUCT(Q,S,E1)
! V = TMP*DOT_PRODUCT(D,Q)
! IF (V<0._EB .OR. (U+V)>1._EB) RETURN
!
! T = TMP*DOT_PRODUCT(E2,Q)
! !XI = P0 + T*D ! the intersection point
!
! IF (T>=0._EB .AND. T<=1._EB) IERR=1
!
! END SUBROUTINE LINE_SEGMENT_TRIANGLE_INTERSECT

! ! ---------------------------- LINE_PLANE_INTERSECT ----------------------------------------
!
! SUBROUTINE LINE_PLANE_INTERSECT(IERR,P0,P1,PP,BB,IOR)
!
! INTEGER, INTENT(OUT) :: IERR
! REAL(EB), INTENT(IN) :: P0(3),P1(3),PP(4),BB(6)
! INTEGER, INTENT(IN) :: IOR
! REAL(EB) :: D(3),T,DENOM, Q0(3)
! REAL(EB), PARAMETER :: EPS=1.E-10_EB
!
! IERR=0
! Q0=-999._EB
! T=0._EB
!
! D = P1-P0
! DENOM = DOT_PRODUCT(PP(1:3),D)
!
! IF (ABS(DENOM)>EPS) THEN
!    T = -( DOT_PRODUCT(PP(1:3),P0)+PP(4) )/DENOM
!    IF (T>=0._EB .AND. T<=1._EB) THEN
!       Q0 = P0 + T*D ! instersection point
!       IF (POINT_IN_BOX_2D(Q0,BB,IOR)) IERR=1
!    ENDIF
! ENDIF
!
! END SUBROUTINE LINE_PLANE_INTERSECT

! ---------------------------- POINT_IN_BOX_2D ----------------------------------------

LOGICAL FUNCTION POINT_IN_BOX_2D(P,BB,IOR)

REAL(EB), INTENT(IN) :: P(3),BB(6)
INTEGER, INTENT(IN) :: IOR

POINT_IN_BOX_2D=.FALSE.

SELECT CASE(ABS(IOR))
   CASE(1) ! YZ plane
      IF ( P(2)>=BB(3) .AND. P(2)<=BB(4) .AND. &
           P(3)>=BB(5) .AND. P(3)<=BB(6) ) POINT_IN_BOX_2D=.TRUE.
   CASE(2) ! XZ plane
      IF ( P(1)>=BB(1) .AND. P(1)<=BB(2) .AND. &
           P(3)>=BB(5) .AND. P(3)<=BB(6) ) POINT_IN_BOX_2D=.TRUE.
   CASE(3) ! XY plane
      IF ( P(1)>=BB(1) .AND. P(1)<=BB(2) .AND. &
           P(2)>=BB(3) .AND. P(2)<=BB(4) ) POINT_IN_BOX_2D=.TRUE.
END SELECT

END FUNCTION POINT_IN_BOX_2D

! ---------------------------- POINT_IN_TETRAHEDRON ----------------------------------------

LOGICAL FUNCTION POINT_IN_TETRAHEDRON(XP,V1,V2,V3,V4,BB)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

REAL(EB), INTENT(IN) :: XP(3),V1(3),V2(3),V3(3),V4(3),BB(6)
REAL(EB) :: U_VEC(3),V_VEC(3),N_VEC(3),Q_VEC(3),R_VEC(3)
INTEGER :: I

! In this routine, we test all four faces of the tet volume defined by the points X(i),Y(i),Z(i); i=1:4.
! If the point is on the negative side of all the faces, it is inside the volume.

POINT_IN_TETRAHEDRON=.FALSE.

! first test bounding box

IF (XP(1)<BB(1)) RETURN
IF (XP(1)>BB(2)) RETURN
IF (XP(2)<BB(3)) RETURN
IF (XP(2)>BB(4)) RETURN
IF (XP(3)<BB(5)) RETURN
IF (XP(3)>BB(6)) RETURN

POINT_IN_TETRAHEDRON=.TRUE.

FACE_LOOP: DO I=1,4

   SELECT CASE(I)
      CASE(1)
         ! vertex ordering = 1,2,3,4
         Q_VEC = XP-(/V1(1),V1(2),V1(3)/) ! form a vector from a point on the triangular surface to the point XP
         R_VEC = (/V4(1),V4(2),V4(3)/)-(/V1(1),V1(2),V1(3)/) ! vector from the tri to other point of volume defining inside
         U_VEC = (/V2(1)-V1(1),V2(2)-V1(2),V2(3)-V1(3)/) ! vectors forming the sides of the triangle
         V_VEC = (/V3(1)-V1(1),V3(2)-V1(2),V3(3)-V1(3)/)
      CASE(2)
         ! vertex ordering = 1,3,4,2
         Q_VEC = XP-(/V1(1),V1(2),V1(3)/)
         R_VEC = (/V2(1),V2(2),V2(3)/)-(/V1(1),V1(2),V1(3)/)
         U_VEC = (/V3(1)-V1(1),V3(2)-V1(2),V3(3)-V1(3)/)
         V_VEC = (/V4(1)-V1(1),V4(2)-V1(2),V4(3)-V1(3)/)
      CASE(3)
         ! vertex ordering = 1,4,2,3
         Q_VEC = XP-(/V1(1),V1(2),V1(3)/)
         R_VEC = (/V2(1),V2(2),V2(3)/)-(/V1(1),V1(2),V1(3)/)
         U_VEC = (/V4(1)-V1(1),V4(2)-V1(2),V4(3)-V1(3)/)
         V_VEC = (/V2(1)-V1(1),V2(2)-V1(2),V2(3)-V1(3)/)
      CASE(4)
         ! vertex ordering = 2,4,3,1
         Q_VEC = XP-(/V2(1),V2(2),V2(3)/)
         R_VEC = (/V1(1),V1(2),V1(3)/)-(/V2(1),V2(2),V2(3)/)
         U_VEC = (/V4(1)-V2(1),V4(2)-V2(2),V4(3)-V2(3)/)
         V_VEC = (/V3(1)-V2(1),V3(2)-V2(2),V3(3)-V2(3)/)
   END SELECT

   ! if the sign of the dot products are equal, the point is inside, else it is outside and we return

   IF ( ABS( SIGN(1._EB,DOT_PRODUCT(Q_VEC,N_VEC))-SIGN(1._EB,DOT_PRODUCT(R_VEC,N_VEC)) )>TWO_EPSILON_EB ) THEN
      POINT_IN_TETRAHEDRON=.FALSE.
      RETURN
   ENDIF

ENDDO FACE_LOOP

END FUNCTION POINT_IN_TETRAHEDRON

! ! ---------------------------- POINT_IN_POLYHEDRON ----------------------------------------
!
! LOGICAL FUNCTION POINT_IN_POLYHEDRON(XP,BB)
!
! REAL(EB) :: XP(3),BB(6),XX(3),YY(3),ZZ(3),RAY_DIRECTION(3)
! INTEGER :: I,J,N_INTERSECTIONS,IRAY
! REAL(EB), PARAMETER :: EPS=1.E-6_EB
!
! ! Schneider and Eberly, Geometric Tools for Computer Graphics, Morgan Kaufmann, 2003. Section 13.4
!
! POINT_IN_POLYHEDRON=.FALSE.
!
! ! test global bounding box
!
! IF ( XP(1)<BB(1) .OR. XP(1)>BB(2) ) RETURN
! IF ( XP(2)<BB(3) .OR. XP(2)>BB(4) ) RETURN
! IF ( XP(3)<BB(5) .OR. XP(3)>BB(6) ) RETURN
!
! N_INTERSECTIONS=0
!
! RAY_DIRECTION = (/0._EB,0._EB,1._EB/)
!
! FACE_LOOP: DO I=1,N_FACE
!
!    ! test bounding box
!    XX(1) = VERTEX(FACET(I)%VERTEX(1))%X
!    XX(2) = VERTEX(FACET(I)%VERTEX(2))%X
!    XX(3) = VERTEX(FACET(I)%VERTEX(3))%X
!
!    IF (XP(1)<MINVAL(XX)) CYCLE FACE_LOOP
!    IF (XP(1)>MAXVAL(XX)) CYCLE FACE_LOOP
!
!    YY(1) = VERTEX(FACET(I)%VERTEX(1))%Y
!    YY(2) = VERTEX(FACET(I)%VERTEX(2))%Y
!    YY(3) = VERTEX(FACET(I)%VERTEX(3))%Y
!
!    IF (XP(2)<MINVAL(YY)) CYCLE FACE_LOOP
!    IF (XP(2)>MAXVAL(YY)) CYCLE FACE_LOOP
!
!    ZZ(1) = VERTEX(FACET(I)%VERTEX(1))%Z
!    ZZ(2) = VERTEX(FACET(I)%VERTEX(2))%Z
!    ZZ(3) = VERTEX(FACET(I)%VERTEX(3))%Z
!
!    IF (XP(3)>MAXVAL(ZZ)) CYCLE FACE_LOOP
!
!    RAY_TEST_LOOP: DO J=1,3
!       IRAY = RAY_TRIANGLE_INTERSECT(I,XP,RAY_DIRECTION)
!       SELECT CASE(IRAY)
!          CASE(0)
!             ! does not intersect
!             EXIT RAY_TEST_LOOP
!          CASE(1)
!             ! ray intersects triangle
!             N_INTERSECTIONS=N_INTERSECTIONS+1
!             EXIT RAY_TEST_LOOP
!          CASE(2)
!             ! ray intersects edge, try new ray (shift origin)
!             IF (J==1) XP=XP+(/EPS,0._EB,0._EB/) ! shift in x direction
!             IF (J==2) XP=XP+(/0._EB,EPS,0._EB/) ! shift in y direction
!             IF (J==3) WRITE(LU_ERR,*) 'WARNING: ray test failed'
!       END SELECT
!    ENDDO RAY_TEST_LOOP
!
! ENDDO FACE_LOOP
!
! IF ( MOD(N_INTERSECTIONS,2)/=0 ) POINT_IN_POLYHEDRON=.TRUE.
!
! END FUNCTION POINT_IN_POLYHEDRON
!
! ---------------------------- VALID_TRIANGLE ----------------------------------------

LOGICAL FUNCTION VALID_TRIANGLE(DIR, VERTS, NVERTS, IV1, IV2, IV3,VERT_FLAG)

INTEGER, INTENT(IN) :: DIR, NVERTS, IV1, IV2, IV3, VERT_FLAG(0:300)
REAL(FB), INTENT(IN), TARGET :: VERTS(3*NVERTS)

REAL(FB), PARAMETER :: EPS_FB = 1.E-7_FB
REAL(FB), POINTER, DIMENSION(:) :: V, V1, V2, V3
REAL(FB) :: U1(3), U2(3), U1XU2, D123

INTEGER :: I

VALID_TRIANGLE = .FALSE.

V1(1:3)=>VERTS(3*IV1-2:3*IV1)
V2(1:3)=>VERTS(3*IV2-2:3*IV2)
V3(1:3)=>VERTS(3*IV3-2:3*IV3)

U1 = V2 - V1;
U2 = V3 - V2;

! triangle is invalid if angle at V2 is > 180 deg

IF(DIR==1) THEN
   U1(1) = U1(2)
   U1(2) = U1(3)
   U2(1) = U2(2)
   U2(2) = U2(3)
ELSE IF(DIR==2) THEN
   U1(2) = U1(1)
   U1(1) = U1(3)
   U2(2) = U2(1)
   U2(1) = U2(3)
ELSE
   U1(1) = U1(1)
   U1(2) = U1(2)
   U2(1) = U2(1)
   U2(2) = U2(2)
ENDIF
U1(1:2) = U1(1:2) / SQRT(U1(1)**2._FB+U1(2)**2._FB) ! Normalize
U2(1:2) = U2(1:2) / SQRT(U2(1)**2._FB+U2(2)**2._FB) ! Normalize
U1XU2 = U1(1)*U2(2)-U1(2)*U2(1) ! U1 x U2
IF (U1XU2 < EPS_FB) RETURN

DO I = 1, NVERTS
  IF (VERT_FLAG(I) == 0) CYCLE
  IF (I == IV1 .OR. I == IV2 .OR.I == IV3 ) CYCLE
  V(1:3)=>VERTS(3*I-2:3*I)
  ! These CYCLE tests are done to treat holes properly:
  D123=SQRT( (V(1)-V1(1))**2._FB + (V(2)-V1(2))**2._FB + (V(3)-V1(3))**2._FB )
  IF (D123 < EPS_FB) CYCLE
  D123=SQRT( (V(1)-V2(1))**2._FB + (V(2)-V2(2))**2._FB + (V(3)-V2(3))**2._FB )
  IF (D123 < EPS_FB) CYCLE
  D123=SQRT( (V(1)-V3(1))**2._FB + (V(2)-V3(2))**2._FB + (V(3)-V3(3))**2._FB )
  IF (D123 < EPS_FB) CYCLE
  IF (POINT_IN_TRIANGLE_FB(V, V1, V2, V3)) RETURN
ENDDO

VALID_TRIANGLE = .TRUE.
END FUNCTION VALID_TRIANGLE

! ------------------------- PT_LINE_DISTANCE_2D ------------------------------------

! REAL(FB) FUNCTION PT_LINE_DISTANCE_2D(X0,Y0,X1,Y1,X2,Y2)
!
! REAL(FB), INTENT(IN) :: X0,Y0,X1,Y1,X2,Y2
!
! ! Local Variables:
! REAL(FB), PARAMETER :: EPS_FB = 1.E-7_FB
! REAL(FB) :: X3,Y3
! REAL(FB) :: DX01,DY01,DX21,DY21,DSQ
! REAL(FB) :: DPRM = -1._FB
!
! DX01 = X0 - X1
! DY01 = Y0 - Y1
! DX21 = X2 - X1
! DY21 = Y2 - Y1
! DSQ  = DX21**2._FB + DY21**2._FB
! IF (DSQ > EPS_FB**2) DPRM=(DX01*DX21+DY01*DY21)/DSQ
! IF (DPRM < EPS_FB) THEN
!    X3=X1; Y3=Y1
! ELSE IF (DPRM > (1._FB+EPS_FB)) THEN
!    X3=X2; Y3=Y2
! ELSE
!    X3 = X1 + DPRM*DX21
!    Y3 = Y1 + DPRM*DY21
! ENDIF
!
! PT_LINE_DISTANCE_2D = SQRT( (X0-X3)**2._FB + (Y0-Y3)**2._FB )
!
! END FUNCTION PT_LINE_DISTANCE_2D


! ----------------------------- DIFF_ANGLE -----------------------------------------

LOGICAL FUNCTION DIFF_ANGLE(DIR, VERTS, NVERTS, IV1, IV2, IV3, ABS_FLG)

INTEGER, INTENT(IN) :: DIR, NVERTS, IV1, IV2, IV3
REAL(FB), INTENT(IN), TARGET :: VERTS(3*NVERTS)
LOGICAL, INTENT(IN) :: ABS_FLG

REAL(FB), PARAMETER :: EPS_FB = 1.E-7_FB
REAL(FB), PARAMETER :: EPS_MID= 1.E-4_FB
REAL(FB), POINTER, DIMENSION(:) :: V1, V2, V3
REAL(FB) :: U1(3), U2(3), CRPD(3), NORMU(2)
LOGICAL :: TEST_FLAG=.FALSE.

DIFF_ANGLE = .FALSE.

V1(1:3)=>VERTS(3*IV1-2:3*IV1)
V2(1:3)=>VERTS(3*IV2-2:3*IV2)
V3(1:3)=>VERTS(3*IV3-2:3*IV3)

U1 = V2 - V1;
U2 = V3 - V2;

NORMU(1)=SQRT(U1(1)**2._FB+U1(2)**2._FB+U1(3)**2._FB)
NORMU(2)=SQRT(U2(1)**2._FB+U2(2)**2._FB+U2(3)**2._FB)

IF(ANY(NORMU(1:2)<EPS_FB)) THEN
   DIFF_ANGLE = .TRUE.
   RETURN
ENDIF

! triangle is invalid if angle at V2 is > 180 deg
SELECT CASE(DIR)
CASE(IAXIS)
   U1(1) = U1(2)
   U1(2) = U1(3)
   U2(1) = U2(2)
   U2(2) = U2(3)
CASE(JAXIS)
   U1(2) = U1(1)
   U1(1) = U1(3)
   U2(2) = U2(1)
   U2(1) = U2(3)
CASE(KAXIS)
   U1(1) = U1(1)
   U1(2) = U1(2)
   U2(1) = U2(1)
   U2(2) = U2(2)
CASE(0) ! 3D Cross for Inboundary faces:
   U1(1:3) = U1(1:3) / NORMU(1) ! Normalize
   U2(1:3) = U2(1:3) / NORMU(2) ! Normalize
   CRPD(1) = U1(2)*U2(3)-U1(3)*U2(2)
   CRPD(2) = U1(3)*U2(1)-U1(1)*U2(3)
   CRPD(3) = U1(1)*U2(2)-U1(2)*U2(1)
   ! ABS_FLG always .TRUE. in the 3D case:
   IF (SQRT(CRPD(1)**2._FB+CRPD(2)**2._FB+CRPD(3)**2._FB) < EPS_FB) DIFF_ANGLE = .TRUE.
   RETURN
END SELECT

U1(1:2) = U1(1:2) / SQRT(U1(1)**2._FB+U1(2)**2._FB) ! Normalize
U2(1:2) = U2(1:2) / SQRT(U2(1)**2._FB+U2(2)**2._FB) ! Normalize
IF (ABS_FLG) THEN
   TEST_FLAG=ABS(U1(1)*U2(2)-U1(2)*U2(1)) < EPS_MID
ELSE
   TEST_FLAG=    U1(1)*U2(2)-U1(2)*U2(1)  < EPS_FB
ENDIF
IF (TEST_FLAG) DIFF_ANGLE = .TRUE.

RETURN

END FUNCTION DIFF_ANGLE

! ---------------------------- POINT_IN_TRIANGLE_FB ----------------------------------------

LOGICAL FUNCTION POINT_IN_TRIANGLE_FB(P_FB,V1_FB,V2_FB,V3_FB)

REAL(FB), INTENT(IN) :: P_FB(3),V1_FB(3),V2_FB(3),V3_FB(3)
REAL(EB)             :: P_EB(3),V1_EB(3),V2_EB(3),V3_EB(3)

 P_EB = REAL( P_FB,EB)
V1_EB = REAL(V1_FB,EB)
V2_EB = REAL(V2_FB,EB)
V3_EB = REAL(V3_FB,EB)
POINT_IN_TRIANGLE_FB = POINT_IN_TRIANGLE(P_EB,V1_EB,V2_EB,V3_EB)

END FUNCTION POINT_IN_TRIANGLE_FB

! ---------------------------- POINT_IN_TRIANGLE ----------------------------------------

LOGICAL FUNCTION POINT_IN_TRIANGLE(P,V1,V2,V3)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

REAL(EB), INTENT(IN) :: P(3),V1(3),V2(3),V3(3)
REAL(EB) :: E(3),E1(3),E2(3),N(3),R(3),Q(3)
INTEGER :: I
REAL(EB), PARAMETER :: EPS=1.E-16_EB

! This routine tests whether the projection of P, in the plane normal
! direction, onto to the plane defined by the triangle (V1,V2,V3) is
! inside the triangle.

POINT_IN_TRIANGLE=.TRUE. ! start by assuming the point is inside

! compute face normal
E1 = V2-V1
E2 = V3-V1
CALL CROSS_PRODUCT(N,E1,E2)

EDGE_LOOP: DO I=1,3
   SELECT CASE(I)
      CASE(1)
         E = V2-V1
         R = P-V1
      CASE(2)
         E = V3-V2
         R = P-V2
      CASE(3)
         E = V1-V3
         R = P-V3
   END SELECT
   CALL CROSS_PRODUCT(Q,E,R)
   IF ( DOT_PRODUCT(Q,N) < -EPS ) THEN
      POINT_IN_TRIANGLE=.FALSE.
      RETURN
   ENDIF
ENDDO EDGE_LOOP

END FUNCTION POINT_IN_TRIANGLE

! ---------------------------- TRIANGULATE ----------------------------------------

SUBROUTINE TRIANGULATE(DIR,VERTS,NVERTS,VERT_OFFSET,FACES,LOCTYPE)

INTEGER, INTENT(IN) :: DIR, NVERTS, VERT_OFFSET
REAL(FB), INTENT(IN), TARGET :: VERTS(3*NVERTS)
INTEGER, INTENT(OUT) :: FACES(3*(NVERTS-2))
INTEGER, INTENT(OUT) :: LOCTYPE(NVERTS-2)

INTEGER :: IFACE, NLIST, NLIST_OLD
INTEGER :: VERT_LIST(0:1024), VERT_FLAG(0:1023), EDGE_LIST(2,1:1024)
LOGICAL :: NODE_EXISTS(1024)
INTEGER :: IM1, I, IP1, V0, V1, V2, IVERT, IEDGE
LOGICAL HAVE_TRIANGLE
REAL(FB), POINTER, DIMENSION(:) :: VV1, VV2, VV3
REAL(FB) :: U1(3), U2(3), U1XU2
REAL(FB), PARAMETER :: EPS_FB = 1.E-7_FB
INTEGER :: NBIG_ANGLES, VERT_START
LOGICAL :: VERT_DROPPED, FLAG

INTEGER :: HIDEDGE(3), EDGEI(1:2), NVERTS2, NEDGES, COUNT
INTEGER, PARAMETER :: SHFT_NODE(1:4) = (/ 2, 1, 0, 2 /)

INTEGER :: COUNT_OUT

FLAG = .TRUE.

! Drop vertices that are repeated, close verts in EB precision that are fused in FB:
VERT_FLAG(1:NVERTS)=1
I = 1
VV1(1:3)=>VERTS(3*NVERTS-2:3*NVERTS)
VV2(1:3)=>VERTS(3*I-2:3*I)
IF ( ABS(VV1(1)-VV2(1))+ABS(VV1(2)-VV2(2))+ABS(VV1(3)-VV2(3)) < EPS_FB) VERT_FLAG(I)=0
DO I = 2, NVERTS
   VV1(1:3)=>VERTS(3*(I-1)-2:3*(I-1))
   VV2(1:3)=>VERTS(3*I-2:3*I)
   IF ( ABS(VV1(1)-VV2(1))+ABS(VV1(2)-VV2(2))+ABS(VV1(3)-VV2(3)) < EPS_FB) VERT_FLAG(I)=0
ENDDO
NLIST  = SUM(VERT_FLAG(1:NVERTS))
NVERTS2= NLIST
COUNT = 0
DO I = 1, NVERTS
   IF(VERT_FLAG(I)==0) CYCLE
   COUNT= COUNT + 1
   VERT_LIST(COUNT) = I
ENDDO
VERT_LIST(0) = VERT_LIST(NLIST)
VERT_LIST(NLIST+1) = VERT_LIST(1)

! Now drop vertices contained whithin lines of the polygon:
DO I=1,NLIST
   IM1   = VERT_LIST(I-1)
   IVERT = VERT_LIST(I)
   IP1   = VERT_LIST(I+1)
   IF ( DIFF_ANGLE(DIR,VERTS,NVERTS,IM1,IVERT,IP1,.TRUE.) ) VERT_FLAG(IVERT)=0
ENDDO

! Redo List:
NLIST  = SUM(VERT_FLAG(1:NVERTS))

IF (NLIST < 3) THEN
   FACES(1:3*(NVERTS-2)) = VERT_OFFSET + 1
   LOCTYPE(1:NVERTS-2) = 4+8+16
   RETURN
ENDIF

NVERTS2= NLIST
NEDGES = NLIST
COUNT = 0
DO I = 1, NVERTS
   IF(VERT_FLAG(I)==0) CYCLE
   COUNT= COUNT + 1
   VERT_LIST(COUNT) = I
ENDDO
VERT_LIST(0) = VERT_LIST(NLIST)
VERT_LIST(NLIST+1) = VERT_LIST(1)
NODE_EXISTS(1:NLIST+1) = .TRUE.
DO I = 1, NLIST-1
   EDGE_LIST(1:2,I) = (/ VERT_LIST(I),     VERT_LIST(I+1) /)
ENDDO
EDGE_LIST(1:2,NLIST) = (/ VERT_LIST(NEDGES), VERT_LIST(1) /)
FACES(1:3*(NVERTS-2)) = VERT_OFFSET+VERT_LIST(NLIST)

IF (DIR == 0) THEN ! INBOUNDARY cut-face, always convex polygon.
   VERT_START = VERT_LIST(1)
   IFACE = 0
   DO I = 1, NVERTS2
      IP1 = I + 1
      IF (I==NVERTS2) IP1=1
      IF (I==VERT_START .OR. IP1==VERT_START) CYCLE
      FACES(3*IFACE+1) = VERT_OFFSET+VERT_LIST(VERT_START)
      FACES(3*IFACE+2) = VERT_OFFSET+VERT_LIST(I)
      FACES(3*IFACE+3) = VERT_OFFSET+VERT_LIST(IP1)
      IFACE = IFACE + 1
   ENDDO
   ! Here test edges to define LOCTYPE:
   LOCTYPE(:) = 4+8+16
   DO IFACE=1,NVERTS2-2
      HIDEDGE(1:3) = 1 ! Initialize to hidden all edges.
      DO IEDGE=1,3
         ! Nodes i,i+1:
         EDGEI(1:2) = (/ FACES(3*IFACE-SHFT_NODE(IEDGE))-VERT_OFFSET, FACES(3*IFACE-SHFT_NODE(IEDGE+1))-VERT_OFFSET /)
         DO I=1,NEDGES
            IF(EDGE_LIST(1,I)==EDGEI(1) .AND. EDGE_LIST(2,I)==EDGEI(2)) THEN
               HIDEDGE(IEDGE) = 0 ! Edge belongs to polygon, set to plot.
               EXIT
            ENDIF
         ENDDO
      ENDDO
      LOCTYPE(IFACE) = 4 * HIDEDGE(1) + 8 * HIDEDGE(2) + 16 * HIDEDGE(3)
   ENDDO
   RETURN
ENDIF

IF (FLAG) THEN ! find number of angles > 180 deg
   NBIG_ANGLES = 0
   VERT_START = VERT_LIST(1)
   DO I = 1, NVERTS2
      IM1 = I - 1
      IF (I==1)IM1 = NVERTS2
      IP1 = I + 1
      IF (I==NVERTS2)IP1 = 1
      IF ( DIFF_ANGLE(DIR,VERTS,NVERTS,VERT_LIST(IM1),VERT_LIST(I),VERT_LIST(IP1),.FALSE.) ) THEN
         NBIG_ANGLES = NBIG_ANGLES + 1
         VERT_START = I
      ENDIF
   END DO

   ! if 0 angles (convex) or 1 angle (simple concave) then triangulate using a fan
   IF ( NBIG_ANGLES <= 1 ) THEN
      IFACE = 0
      DO I = 1, NVERTS2
         IP1 = I + 1
         IF (I==NVERTS2) IP1=1
         IF (I==VERT_START .OR. IP1==VERT_START) CYCLE
         FACES(3*IFACE+1) = VERT_OFFSET+VERT_LIST(VERT_START)
         FACES(3*IFACE+2) = VERT_OFFSET+VERT_LIST(I)
         FACES(3*IFACE+3) = VERT_OFFSET+VERT_LIST(IP1)
         IFACE = IFACE + 1
      ENDDO
      ! Here test edges to define LOCTYPE:
      LOCTYPE(:) = 4+8+16
      DO IFACE=1,NVERTS2-2
         HIDEDGE(1:3) = 1 ! Initialize to hidden all edges.
         DO IEDGE=1,3
            ! Nodes i,i+1:
            EDGEI(1:2) = (/ FACES(3*IFACE-SHFT_NODE(IEDGE))-VERT_OFFSET, FACES(3*IFACE-SHFT_NODE(IEDGE+1))-VERT_OFFSET /)
            DO I=1,NEDGES
               IF(EDGE_LIST(1,I)==EDGEI(1) .AND. EDGE_LIST(2,I)==EDGEI(2)) THEN
                  HIDEDGE(IEDGE) = 0 ! Edge belongs to polygon, set to plot.
                  EXIT
               ENDIF
            ENDDO
         ENDDO
         LOCTYPE(IFACE) = 4 * HIDEDGE(1) + 8 * HIDEDGE(2) + 16 * HIDEDGE(3)
      ENDDO
      RETURN
   ENDIF
ENDIF

! more than 1 angles in polygon > 180 deg
COUNT_OUT = 0
IFACE = 1
OUTER: DO WHILE (NLIST>=3)
   COUNT_OUT = COUNT_OUT + 1
   IF(COUNT_OUT > NVERTS**4) THEN
      ! Revert to Convex poly solution:
      DO IVERT = 1, NVERTS - 2 ! for now assume face is convex
        ! vertex indices 1, 2, ..., NVF
        ! faces (1,2,3), (1,3,4), ..., (1,NVF-1,NVF)
          FACES(3*IVERT-2) = VERT_OFFSET+1
          FACES(3*IVERT-1) = VERT_OFFSET+1+IVERT
          FACES(3*IVERT)   = VERT_OFFSET+2+IVERT
      ENDDO
      EXIT
   ENDIF
   IVERT = 1
   HAVE_TRIANGLE = .FALSE.
   INNER: DO WHILE (IVERT<=NLIST)
      V0 = VERT_LIST(IVERT-1)
      V1 = VERT_LIST(IVERT)
      V2 = VERT_LIST(IVERT+1)
      IF(.NOT.NODE_EXISTS(IVERT+1))EXIT INNER
      IF(NLIST==3.OR.VALID_TRIANGLE(DIR,VERTS,NVERTS,V0,V1,V2,VERT_FLAG)) THEN
         FACES(IFACE  ) = VERT_OFFSET+V0
         FACES(IFACE+1) = VERT_OFFSET+V1
         FACES(IFACE+2) = VERT_OFFSET+V2
         IF (NLIST == 3) EXIT OUTER
         IFACE = IFACE + 3
         NODE_EXISTS(IVERT) = .FALSE.
         IF(IVERT==1) NODE_EXISTS(NLIST+1) = .FALSE.
         HAVE_TRIANGLE = .TRUE.
         IVERT = IVERT + 2
      ELSE
         IVERT = IVERT + 1
      ENDIF
   ENDDO INNER
   NLIST_OLD = NLIST
   NLIST = 0
   DO I = 1, NLIST_OLD
      IF(NODE_EXISTS(I))THEN
         NLIST = NLIST + 1
         VERT_LIST(NLIST) = VERT_LIST(I)
      ENDIF
   ENDDO
   VERT_LIST(0) = VERT_LIST(NLIST)
   VERT_LIST(NLIST+1) = VERT_LIST(1)
   NODE_EXISTS(1:NLIST+1) = .TRUE.

   ! Test for nodes connecting parallel edges, if found drop them:
   VERT_DROPPED=.FALSE.
   DO I=1,NLIST
      V0=VERT_LIST(I-1); V1=VERT_LIST(I); V2=VERT_LIST(I+1);
      VV1(1:3)=>VERTS(3*V0-2:3*V0)
      VV2(1:3)=>VERTS(3*V1-2:3*V1)
      VV3(1:3)=>VERTS(3*V2-2:3*V2)
      U1 = VV2 - VV1;
      U2 = VV3 - VV2;
      SELECT CASE(DIR)
      CASE(IAXIS)
          U1(1) = U1(2); U1(2) = U1(3)
          U2(1) = U2(2); U2(2) = U2(3)
      CASE(JAXIS)
          U1(2) = U1(1); U1(1) = U1(3)
          U2(2) = U2(1); U2(1) = U2(3)
      CASE(KAXIS)
          U1(1) = U1(1); U1(2) = U1(2)
          U2(1) = U2(1); U2(2) = U2(2)
      END SELECT
      U1(1:2) = U1(1:2) / SQRT(U1(1)**2._FB+U1(2)**2._FB) ! Normalize
      U2(1:2) = U2(1:2) / SQRT(U2(1)**2._FB+U2(2)**2._FB) ! Normalize
      IF (U1(1)*U2(1)+U1(2)*U2(2) > -EPS_FB) CYCLE
      U1XU2  = U1(1)*U2(2)-U1(2)*U2(1) ! U1 x U2
      IF (ABS(U1XU2) < EPS_FB) THEN ! Triple product less than EPS
         VERT_DROPPED=.TRUE.; NODE_EXISTS(I)=.FALSE.
         IF (IFACE < 3*(NVERTS2-2)) THEN
            FACES(IFACE  ) = VERT_OFFSET+V0
            FACES(IFACE+1) = VERT_OFFSET+V1
            FACES(IFACE+2) = VERT_OFFSET+V2
            IFACE = IFACE + 3
         ENDIF
         IF (NLIST == 3) EXIT OUTER
      ENDIF
   ENDDO
   IF (VERT_DROPPED) THEN
      ! Repeat List generation:
      NLIST_OLD = NLIST
      NLIST = 0
      DO I = 1, NLIST_OLD
         IF(NODE_EXISTS(I))THEN
            NLIST = NLIST + 1
            VERT_LIST(NLIST) = VERT_LIST(I)
         ENDIF
      ENDDO
      VERT_LIST(0) = VERT_LIST(NLIST)
      VERT_LIST(NLIST+1) = VERT_LIST(1)
      NODE_EXISTS(1:NLIST+1) = .TRUE.
   ENDIF
ENDDO OUTER

! Here test edges to define LOCTYPE:
LOCTYPE(:) = 4+8+16
DO IFACE=1,NVERTS2-2
   HIDEDGE(1:3) = 1 ! Initialize to hidden all edges.
   DO IEDGE=1,3
      ! Nodes i,i+1:
      EDGEI(1:2) = (/ FACES(3*IFACE-SHFT_NODE(IEDGE))-VERT_OFFSET, FACES(3*IFACE-SHFT_NODE(IEDGE+1))-VERT_OFFSET /)
      DO I=1,NEDGES
         IF(EDGE_LIST(1,I)==EDGEI(1) .AND. EDGE_LIST(2,I)==EDGEI(2)) THEN
            HIDEDGE(IEDGE) = 0 ! Edge belongs to polygon, set to plot.
            EXIT
         ENDIF
      ENDDO
   ENDDO
   LOCTYPE(IFACE) = 4 * HIDEDGE(1) + 8 * HIDEDGE(2) + 16 * HIDEDGE(3)
ENDDO

RETURN
END SUBROUTINE TRIANGULATE

! ! ---------------------------- TRIANGULATE2 ----------------------------------------
!
! SUBROUTINE TRIANGULATE2(DIR, VERTS,NVERTS,VERT_OFFSET,FACES)
!   INTEGER, INTENT(IN) :: DIR, NVERTS, VERT_OFFSET
!   REAL(FB), INTENT(IN) :: VERTS(3*NVERTS)
!   INTEGER, INTENT(OUT) :: FACES(3*(NVERTS-2))
!   INTEGER :: IVERT
!
!
!   IF (VERTS(1)*VERTS(1)<0.0 .OR. DIR==4) THEN
!   ! a dummy checks to prevent compiler warnings for unused variables
!   ! (we need VERTS eventually  but don't need VERTS now)
!      RETURN
!   ENDIF
!   DO IVERT = 1, NVERTS - 2 ! for now assume face is convex
!   ! vertex indices 1, 2, ..., NVF
!   ! faces (1,2,3), (1,3,4), ..., (1,NVF-1,NVF)
!     FACES(3*IVERT-2) = VERT_OFFSET+1
!     FACES(3*IVERT-1) = VERT_OFFSET+1+IVERT
!     FACES(3*IVERT)   = VERT_OFFSET+2+IVERT
!   ENDDO
! END SUBROUTINE TRIANGULATE2

! ! ---------------------------- RAY_TRIANGLE_INTERSECT ----------------------------------------
!
! INTEGER FUNCTION RAY_TRIANGLE_INTERSECT(TRI,XP,D)
! USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT
!
! INTEGER, INTENT(IN) :: TRI
! REAL(EB), INTENT(IN) :: XP(3),D(3)
! REAL(EB) :: E1(3),E2(3),P(3),S(3),Q(3),U,V,TMP,V1(3),V2(3),V3(3),T !,XI(3)
! REAL(EB), PARAMETER :: EPS=1.E-10_EB
!
! ! Schneider and Eberly, Section 11.1
!
! V1(1) = VERTEX(FACET(TRI)%VERTEX(1))%X
! V1(2) = VERTEX(FACET(TRI)%VERTEX(1))%Y
! V1(3) = VERTEX(FACET(TRI)%VERTEX(1))%Z
!
! V2(1) = VERTEX(FACET(TRI)%VERTEX(2))%X
! V2(2) = VERTEX(FACET(TRI)%VERTEX(2))%Y
! V2(3) = VERTEX(FACET(TRI)%VERTEX(2))%Z
!
! V3(1) = VERTEX(FACET(TRI)%VERTEX(3))%X
! V3(2) = VERTEX(FACET(TRI)%VERTEX(3))%Y
! V3(3) = VERTEX(FACET(TRI)%VERTEX(3))%Z
!
! E1 = V2-V1
! E2 = V3-V1
!
! CALL CROSS_PRODUCT(P,D,E2)
!
! TMP = DOT_PRODUCT(P,E1)
!
! IF ( ABS(TMP)<EPS ) THEN
!    RAY_TRIANGLE_INTERSECT=0
!    RETURN
! ENDIF
!
! TMP = 1._EB/TMP
! S = XP-V1
!
! U = TMP*DOT_PRODUCT(S,P)
! IF (U<-EPS .OR. U>(1._EB+EPS)) THEN
!    ! ray does not intersect triangle
!    RAY_TRIANGLE_INTERSECT=0
!    RETURN
! ENDIF
!
! IF (U<EPS .OR. U>(1._EB-EPS)) THEN
!    ! ray intersects edge
!    RAY_TRIANGLE_INTERSECT=2
!    RETURN
! ENDIF
!
! CALL CROSS_PRODUCT(Q,S,E1)
! V = TMP*DOT_PRODUCT(D,Q)
! IF (V<-EPS .OR. (U+V)>(1._EB+EPS)) THEN
!    ! ray does not intersect triangle
!    RAY_TRIANGLE_INTERSECT=0
!    RETURN
! ENDIF
!
! IF (V<EPS .OR. (U+V)>(1._EB-EPS)) THEN
!    ! ray intersects edge
!    RAY_TRIANGLE_INTERSECT=2
!    RETURN
! ENDIF
!
! T = TMP*DOT_PRODUCT(E2,Q)
! !XI = XP + T*D ! the intersection point
!
! IF (T>0._EB) THEN
!    RAY_TRIANGLE_INTERSECT=1
! ELSE
!    RAY_TRIANGLE_INTERSECT=0
! ENDIF
! RETURN
!
! END FUNCTION RAY_TRIANGLE_INTERSECT
!

! ---------------------------- RAY_TRIANGLE_INTERSECT_PT ----------------------------------------

SUBROUTINE RAY_TRIANGLE_INTERSECT_PT(V1,V2,V3,XP,D,IS_INTERSECT,POS)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

! V1(3), V2(3), V3(3) triangle vertices coordinates.
! XP(3) -> Ray origin coordinates.
! D(3)  -> Ray direction.
! OUTPUT :
! IS_INTERSECT, .TRUE. if these is intersection.
! POS(3), coordinates of intersection point.

REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),XP(3),D(3)
LOGICAL,  INTENT(OUT):: IS_INTERSECT
REAL(EB), INTENT(OUT):: POS(3)

REAL(EB) :: E1(3),E2(3),P(3),S(3),Q(3),U,V,TMP,T
REAL(EB), PARAMETER :: EPS=1.E-10_EB

! Schneider and Eberly, Section 11.1
IS_INTERSECT = .FALSE.
POS(1:3)     = 1._EB/TWO_EPSILON_EB

E1 = V2-V1
E2 = V3-V1

CALL CROSS_PRODUCT(P,D,E2)

TMP = DOT_PRODUCT(P,E1)

IF ( ABS(TMP)<EPS ) RETURN ! No intersection.
TMP = 1._EB/TMP
S = XP-V1

U = TMP*DOT_PRODUCT(S,P)
IF (U<-EPS .OR. U>(1._EB+EPS)) RETURN ! No intersection.

CALL CROSS_PRODUCT(Q,S,E1)
V = TMP*DOT_PRODUCT(D,Q)
IF (V<-EPS .OR. (U+V)>(1._EB+EPS)) RETURN ! No intersection.

T   = TMP*DOT_PRODUCT(E2,Q)
IF (T <= 0._EB) RETURN ! No intersection.

IS_INTERSECT = .TRUE.
POS = XP + T*D ! the intersection point

RETURN
END SUBROUTINE RAY_TRIANGLE_INTERSECT_PT

! ---------------------------- TRILINEAR ----------------------------------------

REAL(EB) FUNCTION TRILINEAR(UU,DXI,LL)

REAL(EB), INTENT(IN) :: UU(0:1,0:1,0:1),DXI(3),LL(3)
REAL(EB) :: XX,YY,ZZ

! Comments:
!
! see http://local.wasp.uwa.edu.au/~pbourke/miscellaneous/interpolation/index.html
! with appropriate scaling. LL is length of side.
!
!                       UU(1,1,1)
!        z /----------/
!        ^/          / |
!        ------------  |    Particle position
!        |          |  |
!  LL(3) |   o<-----|------- DXI = [DXI(1),DXI(2),DXI(3)]
!        |          | /
!        |          |/      Particle property at XX = TRILINEAR
!        ------------> x
!        ^
!        |
!   X0 = [0,0,0]
!
!    UU(0,0,0)
!
!===========================================================

XX = DXI(1)/LL(1)
YY = DXI(2)/LL(2)
ZZ = DXI(3)/LL(3)

TRILINEAR = UU(0,0,0)*(1._EB-XX)*(1._EB-YY)*(1._EB-ZZ) + &
            UU(1,0,0)*XX*(1._EB-YY)*(1._EB-ZZ) +         &
            UU(0,1,0)*(1._EB-XX)*YY*(1._EB-ZZ) +         &
            UU(0,0,1)*(1._EB-XX)*(1._EB-YY)*ZZ +         &
            UU(1,0,1)*XX*(1._EB-YY)*ZZ +                 &
            UU(0,1,1)*(1._EB-XX)*YY*ZZ +                 &
            UU(1,1,0)*XX*YY*(1._EB-ZZ) +                 &
            UU(1,1,1)*XX*YY*ZZ

END FUNCTION TRILINEAR

! ---------------------------- GETU ----------------------------------------

SUBROUTINE GETU(U_DATA,DXI,XI_IN,I_VEL,NM)

REAL(EB), INTENT(OUT) :: U_DATA(0:1,0:1,0:1),DXI(3)
REAL(EB), INTENT(IN) :: XI_IN(3)
INTEGER, INTENT(IN) :: I_VEL,NM
TYPE(MESH_TYPE), POINTER :: M
REAL(EB), POINTER, DIMENSION(:,:,:) :: UU,VV,WW
INTEGER :: II,JJ,KK
REAL(EB) :: XI(3)

M=>MESHES(NM)
IF (PREDICTOR) THEN
   UU => M%U
   VV => M%V
   WW => M%W
ELSE
   UU => M%US
   VV => M%VS
   WW => M%WS
ENDIF

!II = INDU(1)
!JJ = INDU(2)
!KK = INDU(3)
!
!IF (XI(1)<XU(1)) THEN
!   N=CEILING((XU(1)-XI(1))/M%DX(II))
!   II=MAX(0,II-N)
!   DXI(1)=XI(1)-(XU(1)-REAL(N,EB)*M%DX(II))
!ELSE
!   N=FLOOR((XI(1)-XU(1))/M%DX(II))
!   II=MIN(IBP1,II+N)
!   DXI(1)=XI(1)-(XU(1)+REAL(N,EB)*M%DX(II))
!ENDIF
!
!IF (XI(2)<XU(2)) THEN
!   N=CEILING((XU(2)-XI(2))/M%DY(JJ))
!   JJ=MAX(0,JJ-N)
!   DXI(2)=XI(2)-(XU(2)-REAL(N,EB)*M%DY(JJ))
!ELSE
!   N=FLOOR((XI(2)-XU(2))/M%DY(JJ))
!   JJ=MIN(JBP1,JJ+N)
!   DXI(2)=XI(2)-(XU(2)+REAL(N,EB)*M%DY(JJ))
!ENDIF
!
!IF (XI(3)<XU(3)) THEN
!   N=CEILING((XU(3)-XI(3))/M%DZ(KK))
!   KK=MAX(0,KK-N)
!   DXI(3)=XI(3)-(XU(3)-REAL(N,EB)*M%DZ(KK))
!ELSE
!   N=FLOOR((XI(3)-XU(3))/M%DZ(KK))
!   KK=MIN(KBP1,KK+N)
!   DXI(3)=XI(3)-(XU(3)+REAL(N,EB)*M%DZ(KK))
!ENDIF

XI(1) = MAX(M%XS,MIN(M%XF,XI_IN(1)))
XI(2) = MAX(M%YS,MIN(M%YF,XI_IN(2)))
XI(3) = MAX(M%ZS,MIN(M%ZF,XI_IN(3)))

SELECT CASE(I_VEL)
   CASE(1)
      II = FLOOR((XI(1)-M%XS)/M%DX(1))
      JJ = FLOOR((XI(2)-M%YS)/M%DY(1)+0.5_EB)
      KK = FLOOR((XI(3)-M%ZS)/M%DZ(1)+0.5_EB)
      DXI(1) = XI(1) - M%X(II)
      DXI(2) = XI(2) - M%YC(JJ)
      DXI(3) = XI(3) - M%ZC(KK)
   CASE(2)
      II = FLOOR((XI(1)-M%XS)/M%DX(1)+0.5_EB)
      JJ = FLOOR((XI(2)-M%YS)/M%DY(1))
      KK = FLOOR((XI(3)-M%ZS)/M%DZ(1)+0.5_EB)
      DXI(1) = XI(1) - M%XC(II)
      DXI(2) = XI(2) - M%Y(JJ)
      DXI(3) = XI(3) - M%ZC(KK)
   CASE(3)
      II = FLOOR((XI(1)-M%XS)/M%DX(1)+0.5_EB)
      JJ = FLOOR((XI(2)-M%YS)/M%DY(1)+0.5_EB)
      KK = FLOOR((XI(3)-M%ZS)/M%DZ(1))
      DXI(1) = XI(1) - M%XC(II)
      DXI(2) = XI(2) - M%YC(JJ)
      DXI(3) = XI(3) - M%Z(KK)
   CASE(4)
      II = FLOOR((XI(1)-M%XS)/M%DX(1)+0.5_EB)
      JJ = FLOOR((XI(2)-M%YS)/M%DY(1)+0.5_EB)
      KK = FLOOR((XI(3)-M%ZS)/M%DZ(1)+0.5_EB)
      DXI(1) = XI(1) - M%XC(II)
      DXI(2) = XI(2) - M%YC(JJ)
      DXI(3) = XI(3) - M%ZC(KK)
END SELECT

DXI = MAX(0._EB,DXI)

SELECT CASE(I_VEL)
   CASE(1)
      U_DATA(0,0,0) = UU(II,JJ,KK)
      U_DATA(1,0,0) = UU(II+1,JJ,KK)
      U_DATA(0,1,0) = UU(II,JJ+1,KK)
      U_DATA(0,0,1) = UU(II,JJ,KK+1)
      U_DATA(1,0,1) = UU(II+1,JJ,KK+1)
      U_DATA(0,1,1) = UU(II,JJ+1,KK+1)
      U_DATA(1,1,0) = UU(II+1,JJ+1,KK)
      U_DATA(1,1,1) = UU(II+1,JJ+1,KK+1)
   CASE(2)
      U_DATA(0,0,0) = VV(II,JJ,KK)
      U_DATA(1,0,0) = VV(II+1,JJ,KK)
      U_DATA(0,1,0) = VV(II,JJ+1,KK)
      U_DATA(0,0,1) = VV(II,JJ,KK+1)
      U_DATA(1,0,1) = VV(II+1,JJ,KK+1)
      U_DATA(0,1,1) = VV(II,JJ+1,KK+1)
      U_DATA(1,1,0) = VV(II+1,JJ+1,KK)
      U_DATA(1,1,1) = VV(II+1,JJ+1,KK+1)
   CASE(3)
      U_DATA(0,0,0) = WW(II,JJ,KK)
      U_DATA(1,0,0) = WW(II+1,JJ,KK)
      U_DATA(0,1,0) = WW(II,JJ+1,KK)
      U_DATA(0,0,1) = WW(II,JJ,KK+1)
      U_DATA(1,0,1) = WW(II+1,JJ,KK+1)
      U_DATA(0,1,1) = WW(II,JJ+1,KK+1)
      U_DATA(1,1,0) = WW(II+1,JJ+1,KK)
      U_DATA(1,1,1) = WW(II+1,JJ+1,KK+1)
   CASE(4) ! viscosity
      U_DATA(0,0,0) = M%MU(II,JJ,KK)
      U_DATA(1,0,0) = M%MU(II+1,JJ,KK)
      U_DATA(0,1,0) = M%MU(II,JJ+1,KK)
      U_DATA(0,0,1) = M%MU(II,JJ,KK+1)
      U_DATA(1,0,1) = M%MU(II+1,JJ,KK+1)
      U_DATA(0,1,1) = M%MU(II,JJ+1,KK+1)
      U_DATA(1,1,0) = M%MU(II+1,JJ+1,KK)
      U_DATA(1,1,1) = M%MU(II+1,JJ+1,KK+1)
END SELECT

END SUBROUTINE GETU

! ---------------------------- GETGRAD ----------------------------------------

SUBROUTINE GETGRAD(G_DATA,DXI,XI,XU,INDU,COMP_I,COMP_J,NM)

REAL(EB), INTENT(OUT) :: G_DATA(0:1,0:1,0:1),DXI(3)
REAL(EB), INTENT(IN) :: XI(3),XU(3)
INTEGER, INTENT(IN) :: INDU(3),COMP_I,COMP_J,NM
TYPE(MESH_TYPE), POINTER :: M
REAL(EB), POINTER, DIMENSION(:,:,:) :: DUDX
INTEGER :: II,JJ,KK,N

M=>MESHES(NM)

IF (COMP_I==1 .AND. COMP_J==1) DUDX => M%WORK5
IF (COMP_I==1 .AND. COMP_J==2) DUDX => M%IBM_SAVE1
IF (COMP_I==1 .AND. COMP_J==3) DUDX => M%IBM_SAVE2
IF (COMP_I==2 .AND. COMP_J==1) DUDX => M%IBM_SAVE3
IF (COMP_I==2 .AND. COMP_J==2) DUDX => M%WORK6
IF (COMP_I==2 .AND. COMP_J==3) DUDX => M%IBM_SAVE4
IF (COMP_I==3 .AND. COMP_J==1) DUDX => M%IBM_SAVE5
IF (COMP_I==3 .AND. COMP_J==2) DUDX => M%IBM_SAVE6
IF (COMP_I==3 .AND. COMP_J==3) DUDX => M%WORK7

II = INDU(1)
JJ = INDU(2)
KK = INDU(3)

IF (XI(1)<XU(1)) THEN
   N=CEILING((XU(1)-XI(1))/M%DX(II))
   II=MAX(0,II-N)
   DXI(1)=XI(1)-(XU(1)-REAL(N,EB)*M%DX(II))
ELSE
   N=FLOOR((XI(1)-XU(1))/M%DX(II))
   II=MIN(IBP1,II+N)
   DXI(1)=XI(1)-(XU(1)+REAL(N,EB)*M%DX(II))
ENDIF

IF (XI(2)<XU(2)) THEN
   N=CEILING((XU(2)-XI(2))/M%DY(JJ))
   JJ=MAX(0,JJ-N)
   DXI(2)=XI(2)-(XU(2)-REAL(N,EB)*M%DY(JJ))
ELSE
   N=FLOOR((XI(2)-XU(2))/M%DY(JJ))
   JJ=MIN(JBP1,JJ+N)
   DXI(2)=XI(2)-(XU(2)+REAL(N,EB)*M%DY(JJ))
ENDIF

IF (XI(3)<XU(3)) THEN
   N=CEILING((XU(3)-XI(3))/M%DZ(KK))
   KK=MAX(0,KK-N)
   DXI(3)=XI(3)-(XU(3)-REAL(N,EB)*M%DZ(KK))
ELSE
   N=FLOOR((XI(3)-XU(3))/M%DZ(KK))
   KK=MIN(KBP1,KK+N)
   DXI(3)=XI(3)-(XU(3)+REAL(N,EB)*M%DZ(KK))
ENDIF

IF (ANY(DXI<0._EB)) THEN
   WRITE(MESSAGE,'(A)') 'ERROR: DXI<0 in GETGRAD'
   CALL SHUTDOWN(MESSAGE)
ENDIF
IF (DXI(1)>M%DX(II) .OR. DXI(2)>M%DY(JJ) .OR. DXI(3)>M%DZ(KK)) THEN
   WRITE(MESSAGE,'(A)') 'ERROR: DXI>DX in GETGRAD'
   CALL SHUTDOWN(MESSAGE)
ENDIF

G_DATA(0,0,0) = DUDX(II,JJ,KK)
G_DATA(1,0,0) = DUDX(II+1,JJ,KK)
G_DATA(0,1,0) = DUDX(II,JJ+1,KK)
G_DATA(0,0,1) = DUDX(II,JJ,KK+1)
G_DATA(1,0,1) = DUDX(II+1,JJ,KK+1)
G_DATA(0,1,1) = DUDX(II,JJ+1,KK+1)
G_DATA(1,1,0) = DUDX(II+1,JJ+1,KK)
G_DATA(1,1,1) = DUDX(II+1,JJ+1,KK+1)

END SUBROUTINE GETGRAD


! ! ---------------------------- TRI_PLANE_BOX_INTERSECT ----------------------------------------
!
! SUBROUTINE TRI_PLANE_BOX_INTERSECT(NP,PC,V1,V2,V3,BB)
! USE MATH_FUNCTIONS
! ! get the intersection points (cooridnates) of the BB's 12 edges and the plane of the trianlge
! ! regular intersection polygons with 0, 3, 4, 5, or 6 corners
! ! irregular intersection case (corner, edge, or face intersection) should also be ok.
!
! INTEGER, INTENT(OUT) :: NP
! REAL(EB), INTENT(OUT) :: PC(18) ! max 6 points but maybe repeated at the vertices
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),BB(6)
! REAL(EB) :: P0(3),P1(3),Q(3),PC_TMP(60)
! INTEGER :: I,J,IERR,IERR2
!
! NP = 0
! EDGE_LOOP: DO I=1,12
!    SELECT CASE(I)
!       CASE(1)
!          P0(1)=BB(1)
!          P0(2)=BB(3)
!          P0(3)=BB(5)
!          P1(1)=BB(2)
!          P1(2)=BB(3)
!          P1(3)=BB(5)
!       CASE(2)
!          P0(1)=BB(2)
!          P0(2)=BB(3)
!          P0(3)=BB(5)
!          P1(1)=BB(2)
!          P1(2)=BB(4)
!          P1(3)=BB(5)
!       CASE(3)
!          P0(1)=BB(2)
!          P0(2)=BB(4)
!          P0(3)=BB(5)
!          P1(1)=BB(1)
!          P1(2)=BB(4)
!          P1(3)=BB(5)
!       CASE(4)
!          P0(1)=BB(1)
!          P0(2)=BB(4)
!          P0(3)=BB(5)
!          P1(1)=BB(1)
!          P1(2)=BB(3)
!          P1(3)=BB(5)
!       CASE(5)
!          P0(1)=BB(1)
!          P0(2)=BB(3)
!          P0(3)=BB(6)
!          P1(1)=BB(2)
!          P1(2)=BB(3)
!          P1(3)=BB(6)
!       CASE(6)
!          P0(1)=BB(2)
!          P0(2)=BB(3)
!          P0(3)=BB(6)
!          P1(1)=BB(2)
!          P1(2)=BB(4)
!          P1(3)=BB(6)
!       CASE(7)
!          P0(1)=BB(2)
!          P0(2)=BB(4)
!          P0(3)=BB(6)
!          P1(1)=BB(1)
!          P1(2)=BB(4)
!          P1(3)=BB(6)
!       CASE(8)
!          P0(1)=BB(1)
!          P0(2)=BB(4)
!          P0(3)=BB(6)
!          P1(1)=BB(1)
!          P1(2)=BB(3)
!          P1(3)=BB(6)
!       CASE(9)
!          P0(1)=BB(1)
!          P0(2)=BB(3)
!          P0(3)=BB(5)
!          P1(1)=BB(1)
!          P1(2)=BB(3)
!          P1(3)=BB(6)
!       CASE(10)
!          P0(1)=BB(2)
!          P0(2)=BB(3)
!          P0(3)=BB(5)
!          P1(1)=BB(2)
!          P1(2)=BB(3)
!          P1(3)=BB(6)
!       CASE(11)
!          P0(1)=BB(2)
!          P0(2)=BB(4)
!          P0(3)=BB(5)
!          P1(1)=BB(2)
!          P1(2)=BB(4)
!          P1(3)=BB(6)
!       CASE(12)
!          P0(1)=BB(1)
!          P0(2)=BB(4)
!          P0(3)=BB(5)
!          P1(1)=BB(1)
!          P1(2)=BB(4)
!          P1(3)=BB(6)
!    END SELECT
!    CALL LINE_SEG_TRI_PLANE_INTERSECT(IERR,IERR2,Q,V1,V2,V3,P0,P1)
!
!    IF (IERR==1) THEN
!       NP=NP+1
!       DO J=1,3
!          PC_TMP((NP-1)*3+J)=Q(J)
!       ENDDO
!    ENDIF
! ENDDO EDGE_LOOP
!
! ! For more than 3 intersection points
! ! they have to be sorted in order to create a convex polygon
! CALL ELIMATE_REPEATED_POINTS(NP,PC_TMP)
! IF ( NP > 6) THEN
!    WRITE(LU_OUTPUT,*)"*** Triangle box intersections"
!    DO I = 1, NP
!       WRITE(LU_OUTPUT,*)I,PC_TMP(3*I-2),PC_TMP(3*I-1),PC_TMP(3*I)
!    ENDDO
!    CALL SHUTDOWN("ERROR: more than 6 triangle box intersections")
! ENDIF
! IF (NP > 3) THEN
!    CALL SORT_POLYGON_CORNERS(NP,V1,V2,V3,PC_TMP)
! ENDIF
! DO I=1,NP*3
!    PC(I) = PC_TMP(I)
! ENDDO
!
! RETURN
! END SUBROUTINE TRI_PLANE_BOX_INTERSECT

! ! ---------------------------- SORT_POLYGON_CORNERS ----------------------------------------
!
! SUBROUTINE SORT_POLYGON_CORNERS(NP,V1,V2,V3,PC)
! USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT
! ! Sort all the corners of a polygon
! ! Ref: Gernot Hoffmann, Cube Plane Intersection.
!
! INTEGER, INTENT(IN) :: NP
! REAL(EB), INTENT(INOUT) :: PC(60)
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3)
! REAL(EB) :: MEAN_VALUE(3),POLY_NORM(3),R1,R2,TMP(3),U(3),W(3)
! INTEGER :: I,J,K,IOR,NA,NB
!
! IF (NP <=3 ) RETURN
!
! U = V2-V1
! W = V3-V1
! CALL CROSS_PRODUCT(POLY_NORM,U,W)
!
! DO I=1,3
!    MEAN_VALUE(I) = 0._EB
!    DO J=1,NP
!       MEAN_VALUE(I) = MEAN_VALUE(I) + PC((J-1)*3+I)/REAL(NP)
!    ENDDO
! ENDDO
!
! !get normal of ploygan
! IF (ABS(POLY_NORM(1)) >= ABS(POLY_NORM(2)) .AND. ABS(POLY_NORM(1)) >= ABS(POLY_NORM(3)) ) THEN
!    IOR = 1
!    NA = 2
!    NB = 3
! ELSE IF (ABS(POLY_NORM(2)) >= ABS(POLY_NORM(3)) ) THEN
!    IOR = 2
!    NA = 1
!    NB = 3
! ELSE
!    IOR = 3
!    NA = 1
!    NB = 2
! ENDIF
!
! DO I=1,NP-1
!    R1 = ATAN2(PC((I-1)*3+NB)-MEAN_VALUE(NB), PC((I-1)*3+NA)-MEAN_VALUE(NA))
!    DO J=I+1, NP
!       R2 = ATAN2(PC((J-1)*3+NB)-MEAN_VALUE(NB), PC((J-1)*3+NA)-MEAN_VALUE(NA))
!       IF (R2 < R1) THEN
!          DO K=1,3
!             TMP(K) = PC((J-1)*3+K)
!             PC((J-1)*3+K) = PC((I-1)*3+K)
!             PC((I-1)*3+K) = TMP(K)
!             R1 = R2
!          ENDDO
!       ENDIF
!    ENDDO
! ENDDO
!
! RETURN
! END SUBROUTINE SORT_POLYGON_CORNERS

! ! ---------------------------- TRIANGLE_POLYGON_POINTS ----------------------------------------
!
! SUBROUTINE TRIANGLE_POLYGON_POINTS(IERR,NXP,XPC,V1,V2,V3,NP,PC,BB)
! ! Calculate the intersection points of a triangle and a polygon, if intersected.
! ! http://softsurfer.com/Archive/algorithm_0106/algorithm_0106.htm
!
! INTEGER, INTENT(IN) :: NP
! INTEGER, INTENT(OUT) :: NXP,IERR
! REAL(EB), INTENT(OUT) :: XPC(60)
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),PC(18),BB(6)
! INTEGER :: I,J,K
! REAL(EB) :: U(3),V(3),W(3),S1P0(3),XC(3)
! REAL(EB) :: A,B,C,D,E,DD,SC,TC
! REAL(EB), PARAMETER :: EPS=1.E-20_EB,TOL=1.E-12_EB
! !LOGICAL :: POINT_IN_BB, POINT_IN_TRIANGLE
!
! IERR = 0
! SC = 0._EB
! TC = 0._EB
! NXP = 0
! TRIANGLE_LOOP: DO I=1,3
!    SELECT CASE(I)
!       CASE(1)
!          U = V2-V1
!          S1P0 = V1
!       CASE(2)
!          U = V3-V2
!          S1P0 = V2
!       CASE(3)
!          U = V1-V3
!          S1P0 = V3
!    END SELECT
!
!    POLYGON_LOOP: DO J=1,NP
!       IF (J < NP) THEN
!          DO K=1,3
!             V(K) = PC(J*3+K)-PC((J-1)*3+K)
!          ENDDO
!       ELSE
!          DO K=1,3
!             V(K) = PC(K)-PC((J-1)*3+K)
!          ENDDO
!       ENDIF
!
!       DO K=1,3
!          W(K) = S1P0(K)-PC((J-1)*3+K)
!       ENDDO
!
!       A = DOT_PRODUCT(U,U)
!       B = DOT_PRODUCT(U,V)
!       C = DOT_PRODUCT(V,V)
!       D = DOT_PRODUCT(U,W)
!       E = DOT_PRODUCT(V,W)
!       DD = A*C-B*B
!
!       IF (DD < EPS) THEN ! almost parallel
!          IERR = 0
!          CYCLE
!       ELSE
!          SC = (B*E-C*D)/DD
!          TC = (A*E-B*D)/DD
!          IF (SC>-TOL .AND. SC<1._EB+TOL .AND. TC>-TOL .AND. TC<1._EB+TOL ) THEN
!             NXP = NXP+1
!             XC = S1P0+SC*U
!             DO K=1,3
!                XPC((NXP-1)*3+K) = XC(K)
!             ENDDO
!          ENDIF
!       ENDIF
!
!    ENDDO POLYGON_LOOP
! ENDDO TRIANGLE_LOOP
!
! !WRITE(LU_ERR,*) 'A', NXP
! ! add triangle vertices in polygon
! DO I=1,3
!    SELECT CASE(I)
!       CASE(1)
!          V = V1
!       CASE(2)
!          V = V2
!       CASE(3)
!          V = V3
!    END SELECT
!
!    IF (POINT_IN_BB(V,BB)) THEN
!       NXP = NXP+1
!       DO K=1,3
!          XPC((NXP-1)*3+K) = V(K)
!       ENDDO
!    ENDIF
! ENDDO
!
! !WRITE(LU_ERR,*) 'B', NXP
! ! add polygon vertices in triangle
! DO I=1,NP
!    DO J=1,3
!       V(J) = PC((I-1)*3+J)
!    ENDDO
!    IF (POINT_IN_TRIANGLE(V,V1,V2,V3)) THEN
!       NXP = NXP+1
!       DO J=1,3
!          XPC((NXP-1)*3+J) = V(J)
!       ENDDO
!    ENDIF
! ENDDO
!
! !WRITE(LU_ERR,*) 'C', NXP
!
! CALL ELIMATE_REPEATED_POINTS(NXP,XPC)
!
! !WRITE(LU_ERR,*) 'D', NXP
!
! IF (NXP > 3) THEN
!    CALL SORT_POLYGON_CORNERS(NXP,V1,V2,V3,XPC)
! ENDIF
!
! !WRITE(LU_ERR,*) 'E', NXP
!
! IF (NXP >= 1) THEN
!    IERR = 1 ! index for intersecting
! ELSE
!    IERR = 0
! ENDIF
!
! RETURN
! END SUBROUTINE TRIANGLE_POLYGON_POINTS

! ! ---------------------------- ELIMATE_REPEATED_POINTS ----------------------------------------
!
! SUBROUTINE ELIMATE_REPEATED_POINTS(NP,PC)
!
! INTEGER, INTENT(INOUT):: NP
! REAL(EB), INTENT(INOUT) :: PC(60)
! INTEGER :: NP2,I,J,K
! REAL(EB) :: U(3),V(3),W(3)
! REAL(EB), PARAMETER :: EPS_DIFF=1.0E-8_EB
!
! I = 1
! DO WHILE (I <= NP-1)
!    DO K=1,3
!       U(K) = PC(3*(I-1)+K)
!    ENDDO
!
!    J = I+1
!    NP2 = NP
!    DO WHILE (J <= NP2)
!       DO K=1,3
!          V(K) = PC(3*(J-1)+K)
!       ENDDO
!       W = U-V
!       ! use hybrid comparison test
!       !    absolute for small values
!       !    relative for large values
!       IF (NORM2(W) <= MAX(1.0_EB,NORM2(U),NORM2(V))*EPS_DIFF) THEN
!          DO K=3*J+1,3*NP
!             PC(K-3) = PC(K)
!          ENDDO
!          NP = NP-1
!          J = J-1
!       ENDIF
!       J = J+1
!       IF (J > NP) EXIT
!    ENDDO
!    I = I+1
! ENDDO
!
! RETURN
! END SUBROUTINE ELIMATE_REPEATED_POINTS

! ---------------------------- POINT_IN_BB ----------------------------------------

LOGICAL FUNCTION POINT_IN_BB(V1,BB)

REAL(EB), INTENT(IN) :: V1(3),BB(6)

POINT_IN_BB=.FALSE.
IF ( V1(1)>=BB(1) .AND. V1(1)<=BB(2) .AND. &
     V1(2)>=BB(3) .AND. V1(2)<=BB(4) .AND. &
     V1(3)>=BB(5) .AND. V1(3)<=BB(6) ) THEN
   POINT_IN_BB=.TRUE.
   RETURN
ENDIF

RETURN
END FUNCTION POINT_IN_BB

! ! ---------------------------- LINE_SEG_TRI_PLANE_INTERSECT ----------------------------------------
!
! SUBROUTINE LINE_SEG_TRI_PLANE_INTERSECT(IERR,IERR2,Q,V1,V2,V3,P0,P1)
! USE MATH_FUNCTIONS, ONLY:CROSS_PRODUCT
!
! INTEGER, INTENT(OUT) :: IERR
! REAL(EB), INTENT(OUT) :: Q(3)
! REAL(EB), INTENT(IN) :: V1(3),V2(3),V3(3),P0(3),P1(3)
! REAL(EB) :: E1(3),E2(3),S(3),U,V,TMP,T,D(3),P(3)
! REAL(EB), PARAMETER :: EPS=1.E-10_EB,TOL=1.E-15
! INTEGER :: IERR2
!
! IERR  = 0
! IERR2 = 1
! ! IERR=1:  line segment intersect with the plane
! ! IERR2=1: the intersection point is in the triangle
!
! ! Schneider and Eberly, Section 11.1
!
! D = P1-P0
! E1 = V2-V1
! E2 = V3-V1
!
! CALL CROSS_PRODUCT(P,D,E2)
!
! TMP = DOT_PRODUCT(P,E1)
!
! IF ( ABS(TMP)<EPS ) RETURN
!
! TMP = 1._EB/TMP
! S = P0-V1
!
! U = TMP*DOT_PRODUCT(S,P)
! IF (U<0._EB .OR. U>1._EB) IERR2=0
!
! CALL CROSS_PRODUCT(Q,S,E1)
! V = TMP*DOT_PRODUCT(D,Q)
! IF (V<0._EB .OR. (U+V)>1._EB) IERR2=0
!
! T = TMP*DOT_PRODUCT(E2,Q)
! Q = P0 + T*D ! the intersection point
!
! IF (T>=0._EB-TOL .AND. T<=1._EB+TOL) IERR=1
!
! RETURN
! END SUBROUTINE LINE_SEG_TRI_PLANE_INTERSECT

! ---------------------------- POLYGON_AREA ----------------------------------------

REAL(EB) FUNCTION POLYGON_AREA(NP,PC)
! Calculate the area of a polygon

INTEGER, INTENT(IN) :: NP
REAL(EB), INTENT(IN) :: PC(60)
INTEGER :: I,K
REAL(EB) :: V1(3),V2(3),V3(3)

POLYGON_AREA = 0._EB
V3 = POLYGON_CENTROID(NP,PC)

DO I=1,NP
   IF (I < NP) THEN
      DO K=1,3
         V1(K) = PC((I-1)*3+K)
         V2(K) = PC(I*3+K)
      ENDDO
   ELSE
      DO K=1,3
         V1(K) = PC((I-1)*3+K)
         V2(K) = PC(K)
      ENDDO
   ENDIF
   POLYGON_AREA = POLYGON_AREA+TRIANGLE_AREA(V1,V2,V3)
ENDDO

RETURN
END FUNCTION POLYGON_AREA

! ---------------------------- POLYGON_CENTROID ----------------------------------------

REAL(EB) FUNCTION POLYGON_CENTROID(NP,PC)
! Calculate the centroid of polygon vertices

DIMENSION :: POLYGON_CENTROID(3)
INTEGER, INTENT(IN) :: NP
REAL(EB), INTENT(IN) :: PC(60)
INTEGER :: I,K

POLYGON_CENTROID = 0._EB
DO I=1,NP
   DO K=1,3
      POLYGON_CENTROID(K) = POLYGON_CENTROID(K)+PC((I-1)*3+K)/NP
   ENDDO
ENDDO

RETURN
END FUNCTION POLYGON_CENTROID

! ---------------------------- INTERSECT_SPHERE_AABB ----------------------------------------

! Algorithm from Schneider and Eberly, p. 644
! Intersection of Sphere and Axis-Aligned Bounding Box

LOGICAL FUNCTION INTERSECT_SPHERE_AABB(X0,RADIUS,XB)

REAL(EB), INTENT(IN) :: X0(3),RADIUS,XB(6)
REAL(EB) :: DIST_SQUARED

INTERSECT_SPHERE_AABB=.TRUE.

! Compute distance in each direction, summing as we go
DIST_SQUARED = 0._EB
IF (X0(1)<XB(1)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(1)-XB(1))**2
ELSEIF (X0(1)>XB(2)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(1)-XB(2))**2
ENDIF
IF (X0(2)<XB(3)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(2)-XB(3))**2
ELSEIF (X0(2)>XB(4)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(2)-XB(4))**2
ENDIF
IF (X0(3)<XB(5)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(3)-XB(5))**2
ELSEIF (X0(3)>XB(6)) THEN
   DIST_SQUARED = DIST_SQUARED + (X0(3)-XB(6))**2
ENDIF

! Compare squared distance to radius squared
IF (DIST_SQUARED > (RADIUS*RADIUS-TWO_EPSILON_EB)) INTERSECT_SPHERE_AABB=.FALSE.

RETURN
END FUNCTION INTERSECT_SPHERE_AABB

! ---------------------------- INTERSECT_CYLINDER_AABB ----------------------------------------

! Intersection of Cylinder and Axis-Aligned Bounding Box
!
! Cylinder is represented by:
!   X_IN   = bottom-center of cylinder (X,Y,Z) in grid reference frame
!   H      = length of cylinder
!   RADIUS = radius of cylinder
!   AX_VEC = unit vector pointing along cylinder axis (which leads to ROT_MAT using ROTATION_MATRIX)
!
! The basic algorithm is:
!   1. rotate the cylinder into a frame where the axis points in the vertical direction (+zbar in new frame)
!   2. find the vertex point locations of AABB in this new frame
!   3. test each vertex location against the end caps of cylinder
!   4. test each vertex against radius of cylinder

LOGICAL FUNCTION INTERSECT_CYLINDER_AABB(X_IN,H,RADIUS,ROTMAT,XB)

REAL(EB), INTENT(IN) :: X_IN(3),H,RADIUS,ROTMAT(3,3),XB(6)
REAL(EB) :: X(3),U(3),V(3),DUX(2),Z0,ZH,R2,DIST_SQUARED

INTERSECT_CYLINDER_AABB=.FALSE.

X  = MATMUL(ROTMAT,X_IN) ! transform center
Z0 = X(3)                ! lower cap in new reference frame
ZH = X(3) + H            ! upper cap in new reference frame

! transform vertices and test against end caps, then radius
R2 = RADIUS*RADIUS
V = (/0.5_EB*(XB(1)+XB(2)),0.5_EB*(XB(3)+XB(4)),0.5_EB*(XB(5)+XB(6))/)
U = MATMUL(ROTMAT,V)
IF (U(3)>=Z0 .AND. U(3)<=ZH) THEN
   ! centroid is within end-cap range, now test against radius
   ! in new frame the distance from centroid to cylinder axis only requires the 1st and 2nd vector components
   DUX = U(1:2) - X(1:2)
   DIST_SQUARED = DOT_PRODUCT(DUX,DUX)
   IF (DIST_SQUARED < R2+TWO_EPSILON_EB) THEN
      INTERSECT_CYLINDER_AABB = .TRUE.
      RETURN
   ENDIF
ENDIF

RETURN
END FUNCTION INTERSECT_CYLINDER_AABB

! ---------------------------- ROTATION_MATRIX ----------------------------------------

SUBROUTINE ROTATION_MATRIX(R_OUT,A_IN,THETA)
USE MATH_FUNCTIONS, ONLY: CROSS_PRODUCT

REAL(EB), INTENT(OUT) :: R_OUT(3,3)
REAL(EB), INTENT(IN) :: A_IN(3),THETA
REAL(EB) :: A(3),C,DENOM,V(3),A1(3),A2(3),A3(3),B1(3),B2(3),B3(3),R_THETA(3,3)

! initialize 2D rotation matrix
! this is a counterclockwise rotation
R_THETA = 0._EB
R_THETA(1,1) =  COS(THETA*DEG2RAD); R_THETA(1,2) = SIN(THETA*DEG2RAD)
R_THETA(2,1) = -SIN(THETA*DEG2RAD); R_THETA(2,2) = COS(THETA*DEG2RAD)
R_THETA(3,3) = 1._EB

! initialize R_OUT as 2D rotation matrix
R_OUT = R_THETA

! normalize input vector
DENOM = SQRT(DOT_PRODUCT(A_IN,A_IN))
IF (DENOM<TWO_EPSILON_EB) RETURN
A = A_IN/DENOM

! orthonormal basis in new system
B1 = (/1._EB,0._EB,0._EB/)
B2 = (/0._EB,1._EB,0._EB/)
B3 = (/0._EB,0._EB,1._EB/)

CALL CROSS_PRODUCT(V,A,B3)
C = DOT_PRODUCT(A,B3)

IF (DOT_PRODUCT(V,V)<TWO_EPSILON_EB) THEN
   ! if cross product has zero length, there are two possibilities:
   !   1. vectors are aligned in same direction, no rotation required
   !   2. vectors are aligned in opposite direction, 180 degree rotation
   IF (C>0._EB) THEN
      RETURN
   ELSE
      R_OUT = -R_OUT
      RETURN
   ENDIF
ENDIF

! find orthnormal basis for A=A3 in old system

A3 = A
CALL CROSS_PRODUCT(A2,B3,A3)
CALL CROSS_PRODUCT(A1,A2,A3)

! rotation matrix (direction cosines), Pope (2000), Eq. (A.11)

R_OUT(1,1) = DOT_PRODUCT(A1,B1); R_OUT(1,2) = DOT_PRODUCT(A1,B2); R_OUT(1,3) = DOT_PRODUCT(A1,B3)
R_OUT(2,1) = DOT_PRODUCT(A2,B1); R_OUT(2,2) = DOT_PRODUCT(A2,B2); R_OUT(2,3) = DOT_PRODUCT(A2,B3)
R_OUT(3,1) = DOT_PRODUCT(A3,B1); R_OUT(3,2) = DOT_PRODUCT(A3,B2); R_OUT(3,3) = DOT_PRODUCT(A3,B3)

R_OUT = MATMUL(R_OUT,R_THETA)

! ! test
! print *,R_OUT(1,:)
! print *,R_OUT(2,:)
! print *,R_OUT(3,:)
! print *,MATMUL(R_OUT,A) ! result should be B3
! stop

END SUBROUTINE ROTATION_MATRIX

! ---------------------------- INTERSECT_CONE_AABB ----------------------------------------

! This routine basically follows the INTERSECT_CYLINDER_AABB algorithm, with radius = R(Z)

LOGICAL FUNCTION INTERSECT_CONE_AABB(X_IN,H,RADIUS,ROTMAT,XB)

REAL(EB), INTENT(IN) :: X_IN(3),H,RADIUS,ROTMAT(3,3),XB(6)
REAL(EB) :: X(3),U(3),V(3),DUX(2),Z0,ZH,DIST_SQUARED,R_Z
INTEGER :: II,JJ,KK

INTERSECT_CONE_AABB=.FALSE.

X  = MATMUL(ROTMAT,X_IN) ! transform center
Z0 = X(3)                ! lower cap in new reference frame
ZH = X(3) + H            ! upper cap in new reference frame

! transform vertices and test against end caps, then radius
DO KK=5,6
   DO JJ=3,4
      DO II=1,2
         V = (/XB(II),XB(JJ),XB(KK)/)
         U = MATMUL(ROTMAT,V)
         IF (U(3)>=Z0 .AND. U(3)<=ZH) THEN
            ! vertex is within end-cap range, now test against radius
            ! in new frame the distance from vertex to CONE axis only requires the 1st and 2nd vector components
            DUX = U(1:2) - X(1:2)
            DIST_SQUARED = DOT_PRODUCT(DUX,DUX)
            R_Z = RADIUS*(1._EB-(U(3)-Z0)/H)
            IF (DIST_SQUARED < R_Z*R_Z+TWO_EPSILON_EB) THEN
               INTERSECT_CONE_AABB = .TRUE.
               RETURN
            ENDIF
         ENDIF
      ENDDO
   ENDDO
ENDDO

RETURN
END FUNCTION INTERSECT_CONE_AABB

! ---------------------------- INTERSECT_OBB_AABB ----------------------------------------

! Intersect an Oriented Bounding Box (OBB) with an Axis-Aligned Bounding Box (AABB)
! First, rotate AABB into OBB frame.
! Then test each vertex.

LOGICAL FUNCTION INTERSECT_OBB_AABB(X_IN,L,W,H,ROTMAT,XB)

REAL(EB), INTENT(IN) :: X_IN(3),L,W,H,ROTMAT(3,3),XB(6)
REAL(EB) :: X(3),U(3),V(3),X0,XL,Y0,YW,Z0,ZH
INTEGER :: II,JJ,KK

INTERSECT_OBB_AABB=.FALSE.

X  = MATMUL(ROTMAT,X_IN) ! transform center
X0 = X(1) - 0.5_EB*L - TWO_EPSILON_EB
XL = X(1) + 0.5_EB*L + TWO_EPSILON_EB
Y0 = X(2) - 0.5_EB*W - TWO_EPSILON_EB
YW = X(2) + 0.5_EB*W + TWO_EPSILON_EB
Z0 = X(3) - 0.5_EB*H - TWO_EPSILON_EB
ZH = X(3) + 0.5_EB*H + TWO_EPSILON_EB

! transform and test vertices (probably a more efficient way, but just to get going...)
DO KK=5,6
   DO JJ=3,4
      DO II=1,2
         V = (/XB(II),XB(JJ),XB(KK)/)
         U = MATMUL(ROTMAT,V)
         IF (U(1)>X0 .AND. U(1)<XL .AND. U(2)>Y0 .AND. U(2)<YW .AND. U(3)>Z0 .AND. U(3)<ZH) THEN
            INTERSECT_OBB_AABB=.TRUE.
            RETURN
         ENDIF
      ENDDO
   ENDDO
ENDDO

RETURN
END FUNCTION INTERSECT_OBB_AABB

! ! ---------------------------- TRIANGLE_ON_CELL_SURF ----------------------------------------
!
! SUBROUTINE TRIANGLE_ON_CELL_SURF(IERR1,N_VEC,V,XC,YC,ZC,DX,DY,DZ)
!
! INTEGER, INTENT(OUT) :: IERR1
! REAL(EB), INTENT(IN) :: N_VEC(3),V(3),XC,YC,ZC,DX,DY,DZ
! REAL(EB) :: DIST(3),TOL=1.E-15_EB
!
! IERR1 = 1
! DIST = 0._EB
! !IF (NORM2(N_VEC)>1._EB) N_VEC = N_VEC/NORM2(N_VEC)
!
! IF (N_VEC(1)==1._EB .OR. N_VEC(1)==-1._EB) THEN
!    DIST(1) = XC-V(1)
!    IF ( ABS(ABS(DIST(1))-DX*0.5_EB)<TOL .AND. DOT_PRODUCT(DIST,N_VEC)<0._EB) THEN
!       IERR1 = -1
!    ENDIF
!    RETURN
! ENDIF
!
! IF (N_VEC(2)==1._EB .OR. N_VEC(2)==-1._EB) THEN
!    DIST(2) = YC-V(2)
!    IF ( ABS(ABS(DIST(2))-DY*0.5_EB)<TOL .AND. DOT_PRODUCT(DIST,N_VEC)<0._EB) THEN
!       IERR1 = -1
!    ENDIF
!    RETURN
! ENDIF
!
! IF (N_VEC(3)==1._EB .OR. N_VEC(3)==-1._EB) THEN
!    DIST(3) = ZC-V(3)
!    IF ( ABS(ABS(DIST(3))-DZ*0.5_EB)<TOL .AND. DOT_PRODUCT(DIST,N_VEC)<0._EB) THEN
!       IERR1 = -1
!    ENDIF
!    RETURN
! ENDIF
!
! RETURN
! END SUBROUTINE TRIANGLE_ON_CELL_SURF

! ! ---------------------------- POLYGON_CLOSE_TO_EDGE ----------------------------------------
!
! SUBROUTINE POLYGON_CLOSE_TO_EDGE(IOR,N_VEC,V,XC,YC,ZC,DX,DY,DZ)
! INTEGER, INTENT(OUT) :: IOR
! REAL(EB), INTENT(IN) :: N_VEC(3),V(3),XC,YC,ZC,DX,DY,DZ
! REAL(EB) :: DIST(3),DMAX
! REAL(EB), PARAMETER :: TOLERANCE=0.01_EB
!
! IOR = 0
! DIST(1) = XC-V(1)
! DIST(2) = YC-V(2)
! DIST(3) = ZC-V(3)
!
! IF (ABS(DIST(1)/DX) >= ABS(DIST(2)/DY) .AND. ABS(DIST(1)/DX) >= ABS(DIST(3)/DZ)) THEN
!    DMAX = ABS(DIST(1)/DX*2._EB)
!    IF (DMAX < (1._EB-TOLERANCE) .OR. DOT_PRODUCT(DIST,N_VEC) > 0._EB) RETURN
!    IF (DIST(1) < 0._EB) THEN
!       IOR = 1
!    ELSE
!       IOR = -1
!    ENDIF
! ELSEIF (ABS(DIST(2)/DY) >= ABS(DIST(3)/DZ)) THEN
!    DMAX = ABS(DIST(2)/DY*2._EB)
!    IF (DMAX < (1._EB-TOLERANCE) .OR. DOT_PRODUCT(DIST,N_VEC) > 0._EB) RETURN
!    IF (DIST(2) < 0._EB) THEN
!       IOR = 2
!    ELSE
!       IOR = -2
!    ENDIF
! ELSE
!    DMAX = ABS(DIST(3)/DZ*2._EB)
!    IF (DMAX < (1._EB-TOLERANCE) .OR. DOT_PRODUCT(DIST,N_VEC) > 0._EB) RETURN
!    IF (DIST(3) < 0._EB) THEN
!       IOR = 3
!    ELSE
!       IOR = -3
!    ENDIF
! ENDIF
!
! END SUBROUTINE POLYGON_CLOSE_TO_EDGE

! ---------------------------- AVERAGE_FACE_VALUES ----------------------------------------

! for each node, compute the average values of faces connected to that node

SUBROUTINE AVERAGE_FACE_VALUES(VERT_UNIQUE, VERT_VALS, NVERTS, FACES, FACE_VALS, NFACES)
INTEGER, INTENT(IN) :: NVERTS, NFACES
INTEGER, INTENT(IN), TARGET :: FACES(3*NFACES), VERT_UNIQUE(NVERTS)
REAL(FB), INTENT(IN) :: FACE_VALS(NFACES)
REAL(FB), INTENT(OUT) :: VERT_VALS(NVERTS)

INTEGER, DIMENSION(:), POINTER :: V
INTEGER :: I
INTEGER :: COUNT(NVERTS)

VERT_VALS(1:NVERTS) = 0.0_FB
COUNT(1:NVERTS) = 0
DO I = 1, NFACES
   V(1:3) => FACES(3*I-2:3*I)
   V(1:3) = VERT_UNIQUE(V(1:3))
   VERT_VALS(V(1)) = VERT_VALS(V(1)) + FACE_VALS(I)
   COUNT(V(1)) = COUNT(V(1)) + 1
   VERT_VALS(V(2)) = VERT_VALS(V(2)) + FACE_VALS(I)
   COUNT(V(2)) = COUNT(V(2)) + 1
   VERT_VALS(V(3)) = VERT_VALS(V(3)) + FACE_VALS(I)
   COUNT(V(3)) = COUNT(V(3)) + 1
ENDDO
DO I = 1, NVERTS
   IF (COUNT(I) .GT. 1) VERT_VALS(I) = VERT_VALS(I)/REAL(COUNT(I), FB)
ENDDO
DO I = 1, NVERTS
   IF (VERT_UNIQUE(I) .NE. I) VERT_VALS(I) = VERT_VALS(VERT_UNIQUE(I))
ENDDO

END SUBROUTINE AVERAGE_FACE_VALUES


! ---------------------------- MAKE_UNIQUE_VERT_ARRAY ----------------------------------------

! construct an array that points to first vertex in a vertex array when one or more vertices are identical

SUBROUTINE MAKE_UNIQUE_VERT_ARRAY(VERTS, VERT_UNIQUE, NVERTS)
INTEGER, INTENT(IN) :: NVERTS
REAL(FB), INTENT(IN) :: VERTS(3*NVERTS)
INTEGER, INTENT(OUT) :: VERT_UNIQUE(NVERTS)

INTEGER :: PERM(NVERTS)
INTEGER :: I, RESULT

DO I = 1, NVERTS
   PERM(I) = I
   VERT_UNIQUE(I) = I
ENDDO
CALL MAKE_PERMUTATION_ARRAY(VERTS, PERM, NVERTS, 1, NVERTS)

DO I = 1, NVERTS - 1
   CALL COMPARE_VERTS(VERTS, NVERTS, PERM(I), PERM(I+1), RESULT)
   IF (RESULT == 0) VERT_UNIQUE(PERM(I+1)) = VERT_UNIQUE(PERM(I))
END DO

END SUBROUTINE MAKE_UNIQUE_VERT_ARRAY

! ---------------------------- COMPARE_VERTS ----------------------------------------

! returns -1, 0, 1 when a vertex I is less than, the same or greater than vertex J

SUBROUTINE COMPARE_VERTS(VERTS, NVERTS, I, J, RESULT)
INTEGER, INTENT(IN) :: NVERTS
REAL(FB), INTENT(IN) :: VERTS(3*NVERTS)
INTEGER, INTENT(IN) :: I, J
INTEGER, INTENT(OUT) :: RESULT
REAL(FB) :: TOLERANCE=0.00001_FB

IF (VERTS(3*I-2) < VERTS(3*J-2) - TOLERANCE) THEN
   RESULT = -1
   RETURN
ENDIF
IF (VERTS(3*I-2) > VERTS(3*J-2) + TOLERANCE) THEN
   RESULT = 1
   RETURN
ENDIF
IF (VERTS(3*I-1) < VERTS(3*J-1) - TOLERANCE) THEN
   RESULT = -1
   RETURN
ENDIF
IF (VERTS(3*I-1) > VERTS(3*J-1) + TOLERANCE) THEN
   RESULT = 1
   RETURN
ENDIF
IF (VERTS(3*I  ) < VERTS(3*J  ) - TOLERANCE) THEN
   RESULT = -1
   RETURN
ENDIF
IF (VERTS(3*I  ) > VERTS(3*J  ) + TOLERANCE) THEN
   RESULT = 1
   RETURN
ENDIF
RESULT = 0
RETURN
END SUBROUTINE COMPARE_VERTS

! ---------------------------- MAKE_PERMUTATION_ARRAY ----------------------------------------

! sort a vertex array in increasing order and store the order in a permutation array
! PERM(1) is the 1st vertex, PERM(2) is the 2nd and so on

RECURSIVE SUBROUTINE MAKE_PERMUTATION_ARRAY(VERTS, PERM, NVERTS, FIRST, LAST)
INTEGER, INTENT(IN) :: NVERTS
REAL(FB), INTENT(IN) :: VERTS(3*NVERTS)
INTEGER, INTENT(INOUT) :: PERM(NVERTS)
INTEGER, INTENT(IN) :: FIRST, LAST
INTEGER :: PERM_COPY(NVERTS)
INTEGER RESULT

INTEGER :: MID, I, I1, I2, IP1, IP2, N, N1, N2

IF (FIRST .EQ. LAST)RETURN  ! only one element in list so don't need to sort

! FIRST .... LAST         original list
! FIRST ...  MID          first half of list
! MID+1 ...  LAST         2nd half of list

MID = (FIRST + LAST)/2

CALL MAKE_PERMUTATION_ARRAY(VERTS, PERM, NVERTS, FIRST,   MID)  ! sort first half of list
CALL MAKE_PERMUTATION_ARRAY(VERTS, PERM, NVERTS, MID+1,   LAST) ! sort 2nd half of list

! combine two lists into one
I1 = 1
I2 = 1
N1 = MID + 1 - FIRST
N2 = LAST - MID
N = LAST + 1 - FIRST
DO I = 1, N
   IF (I1 .GT. N1 ) THEN ! no more in 1st half so copy item from 2nd half
      IP2 = PERM(MID + I2)
      PERM_COPY(I) = IP2
      I2 = I2 + 1
      CYCLE
   ENDIF

   IF (I2 .GT. N2 ) THEN ! no more in 2nd half so copy item from first half
      IP1 = PERM(FIRST + I1 - 1)
      PERM_COPY(I) = IP1
      I1 = I1 + 1
      CYCLE
   ENDIF

   IP1 = PERM(FIRST + I1 - 1)
   IP2 = PERM(MID + I2)
   CALL COMPARE_VERTS(VERTS, NVERTS, IP1, IP2, RESULT)
   IF (RESULT .EQ. -1) THEN ! sort in increasing order
      PERM_COPY(I) = IP1
      I1 = I1 + 1
   ELSE
      PERM_COPY(I) = IP2
      I2 = I2 + 1
   ENDIF
END DO
DO I = 1, N
   PERM(FIRST + I - 1) = PERM_COPY(I)
END DO

END SUBROUTINE MAKE_PERMUTATION_ARRAY

END MODULE COMPLEX_GEOMETRY
