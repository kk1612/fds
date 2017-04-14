MODULE GLOBAL_CONSTANTS

! Module containing global constants, parameters, variables

USE PRECISION_PARAMETERS
IMPLICIT NONE

! Indices for various modes of operation

INTEGER, PARAMETER :: GAS_SPECIES=2,AEROSOL_SPECIES=3                                       ! For SPECIES%MODE
INTEGER, PARAMETER :: EXPLICIT_EULER=1,RK2=2,RK3=3,RK2_RICHARDSON=4                         ! For COMBUSTION_ODE
INTEGER, PARAMETER :: EXTINCTION_1=1,EXTINCTION_2=2,EXTINCTION_3=3,EXTINCTION_4=4,&         ! For EXTINCT_MOD
                      EXTINCTION_5=5, EXTINCTION_6=6
INTEGER, PARAMETER :: NO_TURB_MODEL=0,CONSMAG=1,DYNSMAG=2,DEARDORFF=3,VREMAN=4,RNG=5        ! Turbulence model
INTEGER, PARAMETER :: CONVECTIVE_FLUX_BC=-1,NET_FLUX_BC=0,SPECIFIED_TEMPERATURE=1,&
                      NO_CONVECTION=2,THERMALLY_THICK=3,INFLOW_OUTFLOW=4,&
                      INTERPOLATED_BC=6,THERMALLY_THICK_HT3D=7,&
                      VEG_BNDRY_FUEL=99                                                     ! Heat transfer BC
INTEGER, PARAMETER :: H_CUSTOM=-1,H_DEFAULT=0,H_LOGLAW=1,H_ABL=2,H_EDDY=3                   ! Heat transfer coefficient model
INTEGER, PARAMETER :: WALL_MODEL_BC=2,FREE_SLIP_BC=3,NO_SLIP_BC=4,INTERPOLATED_VELOCITY_BC=6 ! Velocity BC
INTEGER, PARAMETER :: EXPOSED=0,VOID=1,INSULATED=2                                          ! Surface backing
INTEGER, PARAMETER :: SURF_CARTESIAN=0,SURF_CYLINDRICAL=1,SURF_SPHERICAL=2                  ! Surface geometry
INTEGER, PARAMETER :: NO_MASS_FLUX=1,SPECIFIED_MASS_FRACTION=2,SPECIFIED_MASS_FLUX=3,&
                      INFLOW_OUTFLOW_MASS_FLUX=4                                            ! Mass transfer BC
INTEGER, PARAMETER :: NULL_BOUNDARY=0,SOLID_BOUNDARY=1,OPEN_BOUNDARY=2,MIRROR_BOUNDARY=3, & ! Boundary Types
                      INTERPOLATED_BOUNDARY=6,PERIODIC_BOUNDARY=7,WIND_BOUNDARY=8
INTEGER, PARAMETER :: FISHPAK_BC_PERIODIC=0, &                                              ! Fishpak (FFT solver) BC
                      FISHPAK_BC_DIRICHLET_DIRICHLET=1, &
                      FISHPAK_BC_DIRICHLET_NEUMANN=2, &
                      FISHPAK_BC_NEUMANN_NEUMANN=3, &
                      FISHPAK_BC_NEUMANN_DIRICHLET=4
INTEGER, PARAMETER :: DIRICHLET=1,NEUMANN=2,INTERNAL=3                                      ! Pressure Boundary Conditions
INTEGER, PARAMETER :: PYROLYSIS_NONE=0,PYROLYSIS_SOLID=1,PYROLYSIS_LIQUID=2,&
                      PYROLYSIS_MATERIAL=3,PYROLYSIS_SPECIFIED=4                            ! Pyrolysis model
INTEGER, PARAMETER :: ATMOSPHERIC_PROFILE=1, PARABOLIC_PROFILE=2,&
                      BOUNDARY_LAYER_PROFILE=3, RAMP_PROFILE=4                              ! Surface velocity profile
INTEGER, PARAMETER :: CELL_CENTER=1, CELL_FACE=2, CELL_EDGE=3                               ! Cell position for output quantities
INTEGER, PARAMETER :: NO_STOP=0, INSTABILITY_STOP=1, USER_STOP=2, SETUP_STOP=3, &
                      SETUP_ONLY_STOP=4, CTRL_STOP=5, TGA_ANALYSIS_STOP=6, &
                      LEVELSET_STOP=7, REALIZABILITY_STOP=8, EVACUATION_STOP=9              ! Program Stop Status
INTEGER, PARAMETER :: SPHERE_DRAG=1,CYLINDER_DRAG=2,USER_DRAG=3,SCREEN_DRAG=4,POROUS_DRAG=5 ! Options for drag computation
INTEGER, PARAMETER :: OLD=1,NEW=2,GUESS=3,PREVIOUS=4                                        ! Network solver indices
INTEGER, PARAMETER :: NODE1=1,NODE2=2,LINEAR_INTERPOLATION=-1                               ! Duct mass transport interpolation
INTEGER, PARAMETER :: HVAC_BOUNDARY=42
INTEGER :: MINT_SPECIES=20

! Species components of the lumped species

INTEGER :: FUEL_INDEX=0,O2_INDEX=0,N2_INDEX=0,H2O_INDEX=0,CO2_INDEX=0,CO_INDEX=0,&
           H2_INDEX=0,SOOT_INDEX=0,OTHER_INDEX=0                            ! Lumped Species Sub-species

! Species components used in FED calculations

INTEGER :: HCN_INDEX=0,NO_INDEX=0,NO2_INDEX=0

! Passive scalars

INTEGER :: ZETA_INDEX=0

! Program Status Code

INTEGER :: STOP_STATUS=NO_STOP,INPUT_FILE_LINE_NUMBER=0

! Miscellaneous logical constants

LOGICAL :: LES,DNS,RADIATION=.TRUE.,RADIATION_COMPLETED=.TRUE.,EXCHANGE_RADIATION=.FALSE.,KAPPA_ARRAY=.FALSE.,CYLINDRICAL,NOISE, &
           PREDICTOR,CORRECTOR,INITIALIZATION_PHASE,APPEND,PARTICLE_FILE=.FALSE.,RESTART,SUPPRESSION=.TRUE., &
           ACCUMULATE_WATER=.FALSE.,WRITE_XYZ=.FALSE., &
           CHECK_POISSON=.FALSE.,TWO_D,SET_UP_ONLY=.FALSE.,SMOKE3D, &
           STATUS_FILES=.FALSE.,LOCK_TIME_STEP=.FALSE.,RESTRICT_TIME_STEP=.TRUE.,  &
           FLUSH_FILE_BUFFERS,CLIP_RESTART_FILES=.TRUE., &
           COLUMN_DUMP_LIMIT=.FALSE.,MASS_FILE=.FALSE.,STRATIFICATION,SOLID_PHASE_ONLY, &
           AEROSOL_AL2O3=.FALSE.,SHARED_FILE_SYSTEM=.TRUE., &
           FREEZE_VELOCITY=.FALSE.,BNDF_DEFAULT=.TRUE., &
           SPATIAL_GRAVITY_VARIATION=.FALSE., &
           PROJECTION=.FALSE.,CLIP_MASS_FRACTION=.FALSE.,CHECK_VN=.TRUE., &
           SOLID_PARTICLES=.FALSE.,HVAC=.FALSE.,BAROCLINIC=.TRUE.,BAROCLINIC_TERMS_ATTACHED=.FALSE., &
           GRAVITATIONAL_DEPOSITION=.TRUE.,GRAVITATIONAL_SETTLING=.TRUE.,THERMOPHORETIC_DEPOSITION=.TRUE.,&
           TURBULENT_DEPOSITION=.TRUE., DEPOSITION=.TRUE., &
           VELOCITY_ERROR_FILE=.FALSE.,CONSTANT_SPECIFIC_HEAT_RATIO=.FALSE.,MEAN_FORCING(3)=.FALSE.,CHECK_HT=.FALSE., &
           PATCH_VELOCITY=.FALSE.,OVERWRITE=.TRUE.,INIT_HRRPUV=.FALSE.,WFDS_BNDRYFUEL=.FALSE., &
           TENSOR_DIFFUSIVITY=.FALSE.,SYNTHETIC_EDDY_METHOD=.FALSE.,UVW_RESTART=.FALSE.,RESEARCH_MODE=.FALSE.,&
           COMPUTE_VISCOSITY_TWICE=.TRUE.,PARTICLE_CFL=.FALSE.,IBM_FEM_COUPLING=.FALSE.,FDS5_OPTIONS=.FALSE.,&
           ENTHALPY_TRANSPORT=.TRUE.,CONSTANT_H_SOLID=.TRUE.,POTENTIAL_TEMPERATURE_CORRECTION=.FALSE.,&
           RTE_SOURCE_CORRECTION=.TRUE.,LAPLACE_PRESSURE_CORRECTION=.FALSE.,&
           CHECK_REALIZABILITY=.FALSE.,WD_PROPS=.FALSE.,TRANSPORT_UNMIXED_FRACTION=.FALSE.,&
           COMPUTE_ZETA_SOURCE_TERM=.TRUE.,GEOM_DIAG=.FALSE.,SUPPRESS_DIAGNOSTICS=.FALSE.,WRITE_GEOM_FIRST=.TRUE.,&
           SIMPLE_CHEMISTRY=.FALSE.,FIRST_PASS,REIGNITION_MODEL=.FALSE.,NO_RAMPS=.FALSE.,VERBOSE=.FALSE.,&
           SOLID_HT3D=.FALSE.,HVAC_MASS_TRANSPORT=.FALSE., &
           EXTERNAL_BOUNDARY_CORRECTION=.FALSE.,EVAPORATION=.TRUE.,DUCT_HT=.FALSE., &
           DUCT_HT_INSERTED,PROCESS_ALL_MESHES=.FALSE.,&
           COUPLED_1D3D_HEAT_TRANSFER=.FALSE.,PYROLYSIS_HT3D=.FALSE.,STORE_Q_DOT_PPP_S=.FALSE.,&
           NEW_MOMENTUM_NUDGING=.FALSE.,CORRECT_SUBGRID_TEMPERATURE=.FALSE.

INTEGER :: BNDF_TIME_INTEGRALS=0

INTEGER, ALLOCATABLE, DIMENSION(:) :: CHANGE_TIME_STEP_INDEX

! Miscellaneous character strings

CHARACTER(256) :: TITLE,RENDER_FILE,UVW_FILE='null'
CHARACTER(40) :: CHID,RESTART_CHID
CHARACTER(256) :: TERRAIN_IMAGE

! Dates, version numbers, revision numbers

CHARACTER(LABEL_LENGTH) :: VERSION_STRING='null'
REAL(FB) :: VERSION_NUMBER=6.0
CHARACTER(255) :: REVISION='unknown'
CHARACTER(255) :: REVISION_DATE='unknown'
CHARACTER(255) :: COMPILE_DATE='unknown'

! Global EVACuation parameters

LOGICAL, ALLOCATABLE, DIMENSION(:) :: EVACUATION_ONLY, EVACUATION_SKIP
REAL(EB) :: EVAC_DT_FLOWFIELD,EVAC_DT_STEADY_STATE,T_EVAC,T_EVAC_SAVE
INTEGER :: EVAC_PRESSURE_ITERATIONS,EVAC_TIME_ITERATIONS,EVAC_N_QUANTITIES,I_EVAC
INTEGER :: EVAC_AVATAR_NCOLOR
LOGICAL :: EVACUATION_MC_MODE=.FALSE.,EVACUATION_DRILL=.FALSE.,NO_EVACUATION=.FALSE.
CHARACTER(LABEL_LENGTH), ALLOCATABLE, DIMENSION(:) :: EVAC_CLASS_NAME, EVAC_CLASS_PROP
INTEGER, ALLOCATABLE, DIMENSION(:) :: EVAC_QUANTITIES_INDEX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: EVAC_CLASS_RGB,EVAC_AVATAR_RGB
REAL(EB), ALLOCATABLE, DIMENSION(:) :: EVACUATION_Z_OFFSET

! Miscellaneous real constants

REAL(EB) :: CPOPR,RSC,RPR,TMPA,TMPA4,RHOA,P_INF,&
            CP_GAMMA,GAMMA,GM1OG,U0,V0,W0,H0,GVEC(3),FVEC(3)=0._EB,OVEC(3)=0._EB, &
            C_SMAGORINSKY=0.2_EB,C_DEARDORFF=0.1_EB,C_VREMAN=0.07_EB,C_RNG=0.2_EB,C_RNG_CUTOFF=10._EB, &
            LAPSE_RATE,TEX_ORI(3),KAPPA0, &
            ASSUMED_GAS_TEMPERATURE,PR_ONTH,MU_AIR_0,CP_AIR_0,PR_AIR,K_AIR_0, &
            CHARACTERISTIC_VELOCITY,CFL_MAX,CFL_MIN,VN_MAX,VN_MIN,PR,SC,H_V_W,GROUND_LEVEL=0._EB, &
            LIMITING_DT_RATIO=1.E-4_EB,HRRPUVCUT_MAX=200._EB, NOISE_VELOCITY=0.005_EB, &
            SCALAR_ENERGY_TOLERANCE=1.E-12_EB,DT_MEAN_FORCING=1.E10_EB,SPONGE_LAYER_DISTANCE=0._EB, &
            TAU_CHEM=1.E-10_EB,TAU_FLAME=1.E10_EB,SMOKE_ALBEDO=0.3_EB, &
            Y_WERNER_WENGLE=11.81_EB,PARTICLE_CFL_MAX=1.0_EB,PARTICLE_CFL_MIN=0.8_EB,DELTA_IBM,GRAV=9.80665_EB,&
            H_V_H2O(0:5000),CHI_R_MIN=0._EB,CHI_R_MAX=1._EB,DRAG_CFL_MAX,EVAP_FILM_FAC=0.333_EB


REAL(EB), PARAMETER :: TMPM=273.15_EB, P_STP=101325._EB,R0=8314.472_EB,R1=1.986257E-03_EB,&
                       SIGMA=5.670373E-8_EB,K_BOLTZMANN=1.3806488E-23_EB

REAL(FB) :: HRRPUV_MAX_SMV=-1.0_FB
INTEGER :: USE_HRRPUV_MAX_SMV=0

! Parameters associated with parallel mode

INTEGER :: MYID=0,N_MPI_PROCESSES=1,EVAC_PROCESS=-1,LOWER_MESH_INDEX=1000000000,UPPER_MESH_INDEX=-1000000000
LOGICAL :: USE_MPI=.FALSE.,PROFILING=.FALSE.
INTEGER, ALLOCATABLE, DIMENSION(:) :: PROCESS,FILE_COUNTER

! Time parameters

REAL(EB) :: DT_INITIAL,T_BEGIN,T_END,T_END_GEOM,TWFIN,TIME_SHRINK_FACTOR,RELAXATION_FACTOR=1._EB,MPI_TIMEOUT=300._EB
EQUIVALENCE(T_END,TWFIN)

! Combustion parameters

REAL(EB) :: Y_O2_INFTY=0.232378_EB,Y_CO2_INFTY=0.000595_EB,Y_H2O_INFTY=0._EB,&
            MW_AIR=28.84852_EB,MW_N2,MW_O2,MW_CO2,MW_H2O,MW_CO,MW_H2,VISIBILITY_FACTOR, &
            EC_LL,Y_P_MIN_EDC=0.01_EB,ZZ_MIN_GLOBAL=1.E-10_EB,&
            FIXED_MIX_TIME=-1._EB,INITIAL_UNMIXED_FRACTION=1._EB,RICHARDSON_ERROR_TOLERANCE=1.E-6_EB,&
            H_F_REFERENCE_TEMPERATURE=25._EB
INTEGER :: N_SPECIES=0,N_REACTIONS,I_PRODUCTS=-1,I_WATER=-1,I_CO2=-1,N_TRACKED_SPECIES=0,N_SURFACE_DENSITY_SPECIES=0,&
           COMBUSTION_ODE_SOLVER=-1,EXTINCT_MOD=-1,MAX_CHEMISTRY_ITERATIONS=20,&
           N_PASSIVE_SCALARS=0,N_TOTAL_SCALARS=0,TRANSPORT_ZETA_SCHEME=1,N_FIXED_CHEMISTRY_SUBSTEPS=-1
LOGICAL :: SIMPLE_CHEM=.TRUE.,OUTPUT_CHEM_IT=.FALSE.,REAC_SOURCE_CHECK=.FALSE.,TEMPERATURE_DEPENDENT_REACTION=.FALSE.
REAL(EB) :: RSUM0
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: Z2Y,CP_Z,CPBAR_Z,K_RSQMW_Z,MU_RSQMW_Z,D_Z,CP_AVG_Z,G_F_Z,H_SENS_Z
REAL(EB), ALLOCATABLE, DIMENSION(:) :: MWR_Z,RSQ_MW_Z
CHARACTER(LABEL_LENGTH) :: EXTINCTION_MODEL

! Radiation parameters

INTEGER :: NUMBER_SPECTRAL_BANDS=0,NUMBER_RADIATION_ANGLES=0,ANGLE_INCREMENT=0,RADIATION_ITERATIONS=1, &
           INITIAL_RADIATION_ITERATIONS,NUMBER_INITIAL_ITERATIONS
EQUIVALENCE(INITIAL_RADIATION_ITERATIONS,NUMBER_INITIAL_ITERATIONS)
REAL(EB) :: RTE_SOURCE_CORRECTION_FACTOR=1._EB,RAD_Q_SUM=0._EB,KFST4_SUM=0._EB

! Ramping parameters

CHARACTER(LABEL_LENGTH), POINTER, DIMENSION(:) :: RAMP_ID,RAMP_TYPE
INTEGER :: I_RAMP_AGT,I_RAMP_U0_T,I_RAMP_V0_T,I_RAMP_W0_T,I_RAMP_U0_Z,I_RAMP_V0_Z,I_RAMP_W0_Z,I_RAMP_GX,I_RAMP_GY,I_RAMP_GZ,&
           I_RAMP_FVX_T,I_RAMP_FVY_T,I_RAMP_FVZ_T,N_RAMP=0,I_RAMP_TMP0_Z=0,I_RAMP_P0_Z=0
INTEGER, PARAMETER :: TIME_HEAT=-1,TIME_VELO=-2,TIME_TEMP=-3,TIME_EFLUX=-4,TIME_PART=-5,TANH_RAMP=-2,TSQR_RAMP=-1,&
                      VELO_PROF_X=-6,VELO_PROF_Y=-7,VELO_PROF_Z=-8

! TABLe parameters

CHARACTER(LABEL_LENGTH) :: TABLE_ID(1000)
INTEGER :: N_TABLE=0,TABLE_TYPE(1000)
INTEGER, PARAMETER :: SPRAY_PATTERN=1,PART_RADIATIVE_PROPERTY=2,POINTWISE_INSERTION=3,TABLE_2D_TYPE=4,FLAME_SPEED_TABLE=5

! Variables related to meshes

INTEGER :: NMESHES=1,IBAR_MAX=0,JBAR_MAX=0,KBAR_MAX=0,MESH_LIST_EMB(100)
REAL(EB) :: XS_MIN=1.E6_EB,XF_MAX=-1.E6_EB,YS_MIN=1.E6_EB,YF_MAX=-1.E6_EB,ZS_MIN=1.E6_EB,ZF_MAX=-1.E6_EB
CHARACTER(LABEL_LENGTH), DIMENSION(:), ALLOCATABLE :: MESH_NAME
CHARACTER(LABEL_LENGTH), DIMENSION(:,:), ALLOCATABLE :: PERIODIC_MESH_NAMES

! Variables related to pressure solver

LOGICAL :: ITERATE_PRESSURE=.FALSE.,ITERATE_BAROCLINIC_TERM,SUSPEND_PRESSURE_ITERATIONS=.TRUE.
REAL(EB) :: VELOCITY_TOLERANCE=0._EB,PRESSURE_TOLERANCE=0._EB,ITERATION_SUSPEND_FACTOR=0.95_EB
REAL(EB), ALLOCATABLE, DIMENSION(:) :: VELOCITY_ERROR_MAX,PRESSURE_ERROR_MAX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: VELOCITY_ERROR_MAX_LOC,PRESSURE_ERROR_MAX_LOC
INTEGER :: PRESSURE_ITERATIONS=0,MAX_PRESSURE_ITERATIONS=10,TOTAL_PRESSURE_ITERATIONS=0
CHARACTER(10):: PRES_METHOD = 'FFT'

!! Parameters for the Laplace solver (under construction)
!
!INTEGER, PARAMETER :: SCI_KM1=1,SCI_JM1=2,SCI_IM1=3,SCI_IJK=4,SCI_IP1=5,SCI_JP1=6,SCI_KP1=7 ! (S)parse (C)olumn (I)ndex
!INTEGER, PARAMETER :: NDIAG=7

! Miscellaneous integer constants

INTEGER :: ICYC,ICYC_RESTART=0,NFRAMES,PERIODIC_TEST=0,TURB_MODEL=0,SLIP_CONDITION=2,FISHPAK_BC(3)=-1,&
           STOP_AT_ITER=0,HT3D_TEST=0,STOPFDS=-1,WALL_INCREMENT=2,WALL_INCREMENT_HT3D=1

! Clocks for output file dumps

REAL(EB), ALLOCATABLE, DIMENSION(:) :: PART_CLOCK,SLCF_CLOCK,SL3D_CLOCK, &
                                       PL3D_CLOCK,BNDF_CLOCK,ISOF_CLOCK,PROF_CLOCK
REAL(EB) :: MINT_CLOCK,DEVC_CLOCK,HRR_CLOCK,EVAC_CLOCK=1.E6_EB,CTRL_CLOCK,FLUSH_CLOCK,CPU_CLOCK,RESTART_CLOCK
REAL(EB) :: DT_SLCF,DT_BNDE,DT_BNDF,DT_DEVC,DT_DEVC_LINE,DT_PL3D,DT_PART,DT_RESTART,DT_ISOF,DT_HRR,DT_MASS,DT_PROF,DT_CTRL,&
            DT_FLUSH,DT_SL3D,DT_GEOM,DT_CPU
REAL(EB) :: BNDC_CLOCK,BNDE_CLOCK,GEOC_CLOCK,GEOM_CLOCK,UVW_CLOCK,UVW_TIMER(10),MMS_TIMER=1.E10_EB
REAL(EB) :: UVW_CLOCK_CBC(1:4)=(/0._EB,0.28_EB,0.67_EB,1.E10_EB/),TURB_INIT_CLOCK=-1.E10_EB
LOGICAL  :: UPDATE_DEVICES_AGAIN=.FALSE.

! Miscellaneous mesh dimensions

REAL(EB) :: CHARACTERISTIC_CELL_SIZE=1.E6_EB

! Logical units and output file names

INTEGER                              :: LU_ERR=0,LU_END=2,LU_GIT=3,LU_SMV=4,LU_INPUT=5,LU_OUTPUT=6,LU_STOP=7,LU_CPU=8
INTEGER                              :: LU_MASS,LU_HRR,LU_NOTREADY,LU_VELOCITY_ERROR,LU_LINE=-1,LU_CUTCELL
INTEGER                              :: LU_EVACCSV,LU_EVACEFF,LU_EVACFED,LU_EVACOUT,LU_HISTOGRAM,LU_EVAC_CB
INTEGER                              :: LU_BNDC=-1,LU_GEOC=-1,LU_TGA
INTEGER, ALLOCATABLE, DIMENSION(:)   :: LU_PART,LU_PROF,LU_XYZ,LU_PL3D,LU_DEVC,LU_STATE,LU_CTRL,LU_CORE,LU_RESTART
INTEGER, ALLOCATABLE, DIMENSION(:)   :: LU_VEG_OUT,LU_GEOM,LU_BNDE
INTEGER                              :: LU_GEOM_DIAG(2)
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: LU_SLCF,LU_SLCF_GEOM,LU_BNDF,LU_ISOF,LU_SMOKE3D,LU_BNDF_SLCF
INTEGER                              :: DEVC_COLUMN_LIMIT=254,CTRL_COLUMN_LIMIT=254

CHARACTER(250)                             :: FN_INPUT='null'
CHARACTER(80)                              :: FN_STOP='null',FN_CPU
CHARACTER(80)                              :: FN_MASS,FN_HRR,FN_OUTPUT,FN_SMV,FN_END,FN_ERR,FN_NOTREADY,FN_VELOCITY_ERROR,FN_GIT
CHARACTER(80)                              :: FN_EVACCSV,FN_EVACEFF,FN_EVACFED,FN_EVACOUT,FN_LINE,FN_HISTOGRAM,FN_CUTCELL,FN_TGA
CHARACTER(80), ALLOCATABLE, DIMENSION(:)   :: FN_PART,FN_PROF,FN_XYZ,FN_PL3D,FN_DEVC,FN_STATE,FN_CTRL,FN_CORE,FN_RESTART
CHARACTER(80), ALLOCATABLE, DIMENSION(:)   :: FN_VEG_OUT,FN_GEOM,FN_BNDE
CHARACTER(80)                              :: FN_GEOM_DIAG(2)
CHARACTER(80), ALLOCATABLE, DIMENSION(:,:) :: FN_SLCF,FN_SLCF_GEOM,FN_BNDF,FN_ISOF,FN_SMOKE3D,FN_BNDF_SLCF

CHARACTER(9) :: FMT_R

! Boundary condition arrays

CHARACTER(LABEL_LENGTH) :: MATL_NAME(1:1000)
INTEGER :: N_SURF,N_SURF_RESERVED,N_MATL,MIRROR_SURF_INDEX,OPEN_SURF_INDEX,INTERPOLATED_SURF_INDEX,DEFAULT_SURF_INDEX=0, &
           INERT_SURF_INDEX=0,PERIODIC_SURF_INDEX,PERIODIC_WIND_SURF_INDEX,HVAC_SURF_INDEX=-1,EVACUATION_SURF_INDEX=-1,&
           MASSLESS_TRACER_SURF_INDEX, MASSLESS_TARGET_SURF_INDEX,DROPLET_SURF_INDEX,VEGETATION_SURF_INDEX,NWP_MAX
REAL(EB), ALLOCATABLE, DIMENSION(:) :: AAS,BBS,CCS,DDS,DDT,DX_S,RDX_S,RDXN_S,DX_WGT_S, &
                                       K_S,RHOCBAR,C_S,RHO_S,Q_S,KAPPA_S,X_S_NEW,R_S,MF_FRAC,REGRID_FACTOR,R_S_NEW
INTEGER,  ALLOCATABLE, DIMENSION(:) :: LAYER_INDEX,CELL_COUNT

! Divergence Arrays

REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: DSUM,USUM,PSUM

! Level Set vegetation fire spread

LOGICAL  :: VEG_LEVEL_SET,VEG_LEVEL_SET_COUPLED,VEG_LEVEL_SET_UNCOUPLED
LOGICAL  :: RK2_PREDICTOR_LS,LSET_ELLIPSE,LSET_TAN2
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: FLUX0_LS,FLUX1_LS,HEAD_WIDTH,PHI_LS,PHI0_LS,PHI_TEMP,PHI1_LS,ROS_BACKU, &
                                         ROS_HEAD,ROS_HEAD_U0_INFW,ROS_HEAD_U_INFW,ROS_FLANK, &
                                         SR_X_LS,SR_Y_LS,U_LS,V_LS,Z_LS,DZTDX,DZTDY,MAG_ZT, &
                                         FLANKFIRE_LIFETIME,WIND_EXP,PHI_WS,UMF,THETA_ELPS, &
                                         PHI_S,PHI_S_X,PHI_S_Y,PHI_W,ASPECT
REAL(FB), ALLOCATABLE, DIMENSION(:,:) :: MAG_SR_OUT,PHI_OUT,TOA

! Parameters for Terrain and Wind simulation needs

LOGICAL :: TERRAIN_CASE=.FALSE.,WIND_ONLY=.FALSE.
INTEGER :: N_VENT_TOTAL=0

! Sprinkler Variables

REAL(EB) :: C_DIMARZO=6.E6_EB
INTEGER :: N_ACTUATED_SPRINKLERS=0,N_OPEN_NOZZLES=0
INTEGER, PARAMETER :: NDC=1000,NDC2=100
LOGICAL :: POROUS_FLOOR=.TRUE.,ALLOW_UNDERSIDE_PARTICLES=.FALSE.,ALLOW_SURFACE_PARTICLES=.TRUE.

! Particles and PARTICLEs

INTEGER :: MAXIMUM_PARTICLES,N_LAGRANGIAN_CLASSES,PARTICLE_TAG,N_EVAC,N_LP_ARRAY_INDICES=0,N_INITIAL_PARTICLE_SUBSTEPS=1
REAL(EB) :: CNF_CUTOFF=0.005_EB
LOGICAL :: EB_PART_FILE=.FALSE.,PL3D_PARTICLE_FLUX=.FALSE.,SLCF_PARTICLE_FLUX=.FALSE.,DEVC_PARTICLE_FLUX=.FALSE.
LOGICAL :: OMESH_PARTICLES=.FALSE.

INTEGER :: MOMENTUM_INTERPOLATION_METHOD=0

! Agglomeration model

LOGICAL :: AGGLOMERATION = .TRUE.,SOOT_OXIDATION=.FALSE.
INTEGER :: N_PARTICLE_BINS,AGGLOMERATION_INDEX=-1
REAL(EB) :: MIN_PARTICLE_DIAMETER,MAX_PARTICLE_DIAMETER

! Variables of pyrolysis

LOGICAL :: CALL_PYROLYSIS

! Number of initial value, pressure zone, and multiplier derived types

INTEGER :: N_INIT,N_ZONE,N_MULT
LOGICAL, ALLOCATABLE, DIMENSION(:,:,:) :: CONNECTED_ZONES
REAL(EB) :: PRESSURE_RELAX_TIME=1._EB

! Clipping values

REAL(EB) :: TMPMIN,TMPMAX,RHOMIN,RHOMAX

! Flux limiter

INTEGER, PARAMETER :: CENTRAL_LIMITER=0,GODUNOV_LIMITER=1,SUPERBEE_LIMITER=2,MINMOD_LIMITER=3,CHARM_LIMITER=4,MP5_LIMITER=5
INTEGER :: FLUX_LIMITER=SUPERBEE_LIMITER,CFL_VELOCITY_NORM=0

! Numerical quadrature (used in TEST_FILTER)

INTEGER, PARAMETER :: TRAPAZOID_QUADRATURE=0, SIMPSON_QUADRATURE=1, MIDPOINT_QUADRATURE=2
INTEGER :: TEST_FILTER_QUADRATURE=TRAPAZOID_QUADRATURE

! CPU and Wall Clock Timings

INTEGER, PARAMETER :: N_TIMERS=13
REAL(EB), ALLOCATABLE, DIMENSION(:) :: T_USED
REAL(EB) :: WALL_CLOCK_START,WALL_CLOCK_END,WALL_CLOCK_START_ITERATIONS=0._EB,CPU_TIME_START

! OpenMP Specifications

INTEGER :: OPENMP_AVAILABLE_THREADS = 1
INTEGER :: OPENMP_USED_THREADS      = 1
LOGICAL :: OPENMP_USER_SET_THREADS  = .FALSE.
LOGICAL :: USE_OPENMP               = .FALSE.

! CSV specification

INTEGER :: N_CSVF=0

! Complex geometry (experimental-OLD)

INTEGER :: IMMERSED_BOUNDARY_METHOD=1,N_GEOM=0,N_VERT=0,N_FACE=0,N_VOLU=0
INTEGER, PARAMETER :: ICOMPLEX=5
INTEGER, ALLOCATABLE, DIMENSION(:) :: INT_FACE_VALS_ARRAY,INT_SURF_VALS_ARRAY
INTEGER, ALLOCATABLE, DIMENSION(:) :: INT_VOLS_VALS_ARRAY,INT_MATL_VALS_ARRAY
REAL(FB), ALLOCATABLE, DIMENSION(:) :: FB_REAL_FACE_VALS_ARRAY,FB_REAL_VERT_ARRAY
REAL(EB) :: DT_BNDC=1.E10_EB,DT_GEOC=1.E10_EB
REAL(EB), ALLOCATABLE, TARGET, DIMENSION(:) :: FACE_WORK1,FACE_WORK2
LOGICAL :: CUTCELLS ! if true call routine for generating cutcell list (for debugging)

! Complex Geometry parameters (experimental-NEW)

LOGICAL :: CC_IBM=.FALSE.
LOGICAL :: CHECK_MASS_CONSERVE =.FALSE.
LOGICAL :: GLMAT_SOLVER =.FALSE.
LOGICAL :: PRES_ON_WHOLE_DOMAIN=.TRUE.
LOGICAL :: PRES_ON_CARTESIAN=.TRUE.
LOGICAL :: DO_IMPLICIT_CCREGION=.TRUE.
LOGICAL :: COMPUTE_CUTCELLS_ONLY=.FALSE.
LOGICAL :: CC_ZEROIBM_VELO=.FALSE.

INTEGER, PARAMETER :: GLMAT_BYMESH = 1 ! Apply matrix-vector Solver by mesh.
INTEGER, PARAMETER :: GLMAT_WHLDOM = 2 ! Apply matrix-vector Solver on the whole domain.
INTEGER :: GLMAT_SETUP_FLAG = GLMAT_WHLDOM ! Default for now.

! Threshold factor for volume of cut-cells respect to volume of Cartesian cells:
! Currently used in the thermo div definition of cut-cells.
REAL(EB) :: CCVOL_LINK=0.15_EB

INTEGER,  PARAMETER :: LOW_IND   = 1
INTEGER,  PARAMETER :: HIGH_IND  = 2

INTEGER,  PARAMETER :: MAX_DIM   = 3 ! Maximum number of spatial dimensions for a problem.
INTEGER,  PARAMETER :: IAXIS = 1
INTEGER,  PARAMETER :: JAXIS = 2
INTEGER,  PARAMETER :: KAXIS = 3

INTEGER, PARAMETER :: NOD1 = 1
INTEGER, PARAMETER :: NOD2 = 2
INTEGER, PARAMETER :: NOD3 = 3
INTEGER, PARAMETER :: NOD4 = 4
INTEGER, PARAMETER :: EDG1 = 1
INTEGER, PARAMETER :: EDG2 = 2
INTEGER, PARAMETER :: EDG3 = 3

! Allocation increment parameters:
INTEGER, PARAMETER :: IBM_ALLOC_DVERT = 10
INTEGER, PARAMETER :: IBM_ALLOC_DELEM = 10

! Maximum number of wet surface triangles related to element

INTEGER, PARAMETER :: IBM_MAX_WSTRIANG_SGL = 16  ! Up to 16 wstriangles related to a wet surface vertex.
INTEGER, PARAMETER :: IBM_MAX_WSTRIANG_SEG =  2  ! Up to two wstriangles related to a segment.
INTEGER, PARAMETER :: IBM_MAX_WSTRIANG_TRI =  1  ! Up to 1 wstriangle per BODINT_PLANE triangle (i.e. surface triangle
                                                 ! aligned with X1PLN plane.)

! HVAC Parameters

INTEGER :: N_DUCTNODES = 0, N_DUCTS = 0, N_FANS = 0, N_FILTERS = 0, N_AIRCOILS = 0,N_NETWORKS=0, N_DUCTRUNS=0
INTEGER , ALLOCATABLE, DIMENSION(:) :: DUCT_NE,DUCTNODE_NE
REAL(EB) :: HVAC_PRES_RELAX=0.5_EB,DT_HVAC=-1._EB
LOGICAL :: HVAC_SOLVE=.FALSE.

! Global array of orientation vectors

REAL(EB), POINTER, DIMENSION(:,:) :: ORIENTATION_VECTOR
REAL(EB) :: NORTHANGLE=-190.0_EB
INTEGER :: N_ORIENTATION_VECTOR

! Special TGA parameters

INTEGER :: TGA_SURF_INDEX=-100,TGA_WALL_INDEX=-100,TGA_PARTICLE_INDEX=-100
REAL(EB) :: TGA_HEATING_RATE=5._EB,TGA_FINAL_TEMPERATURE=800._EB

! Parameter passed to smokeview (in .smv file) to control generation of blockage location data structures

LOGICAL :: IBLANK_SMV=.TRUE.

END MODULE GLOBAL_CONSTANTS
