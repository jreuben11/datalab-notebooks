       £K"	   {Б÷Abrain.Event:2ь	$вq     шb-ќ	Ґ	{Б÷A"’г

global_step/Initializer/zerosConst*
dtype0	*
_class
loc:@global_step*
value	B	 R *
_output_shapes
: 
П
global_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@global_step*
shared_name 
≤
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_class
loc:@global_step*
T0	*
_output_shapes
: 
З
(matching_filenames/MatchingFiles/patternConst*
dtype0*/
value&B$ Bdata/babyweight/eval-data.csv**
_output_shapes
: 
А
 matching_filenames/MatchingFilesMatchingFiles(matching_filenames/MatchingFiles/pattern*#
_output_shapes
:€€€€€€€€€
z
matching_filenames
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
„
matching_filenames/AssignAssignmatching_filenames matching_filenames/MatchingFiles*
validate_shape( *%
_class
loc:@matching_filenames*
use_locking(*
T0*#
_output_shapes
:€€€€€€€€€
Б
matching_filenames/readIdentitymatching_filenames*%
_class
loc:@matching_filenames*
T0*
_output_shapes
:
e
input_producer/SizeSizematching_filenames/read*
out_type0*
T0*
_output_shapes
: 
Z
input_producer/Greater/yConst*
dtype0*
value	B : *
_output_shapes
: 
q
input_producer/GreaterGreaterinput_producer/Sizeinput_producer/Greater/y*
T0*
_output_shapes
: 
Т
input_producer/Assert/ConstConst*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 
Ъ
#input_producer/Assert/Assert/data_0Const*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 
А
input_producer/Assert/AssertAssertinput_producer/Greater#input_producer/Assert/Assert/data_0*
	summarize*

T
2
~
input_producer/IdentityIdentitymatching_filenames/read^input_producer/Assert/Assert*
T0*
_output_shapes
:
c
!input_producer/limit_epochs/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ж
"input_producer/limit_epochs/epochs
VariableV2*
dtype0	*
shape: *
	container *
shared_name *
_output_shapes
: 
ы
)input_producer/limit_epochs/epochs/AssignAssign"input_producer/limit_epochs/epochs!input_producer/limit_epochs/Const*
validate_shape(*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
use_locking(*
T0	*
_output_shapes
: 
ѓ
'input_producer/limit_epochs/epochs/readIdentity"input_producer/limit_epochs/epochs*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
T0	*
_output_shapes
: 
ї
%input_producer/limit_epochs/CountUpTo	CountUpTo"input_producer/limit_epochs/epochs*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
limit*
T0	*
_output_shapes
: 
Л
input_producer/limit_epochsIdentityinput_producer/Identity&^input_producer/limit_epochs/CountUpTo*
T0*
_output_shapes
:
У
input_producerFIFOQueueV2*
capacity *
_output_shapes
: *
shapes
: *
component_types
2*
	container *
shared_name 
Э
)input_producer/input_producer_EnqueueManyQueueEnqueueManyV2input_producerinput_producer/limit_epochs*

timeout_ms€€€€€€€€€*
Tcomponents
2
b
#input_producer/input_producer_CloseQueueCloseV2input_producer*
cancel_pending_enqueues( 
d
%input_producer/input_producer_Close_1QueueCloseV2input_producer*
cancel_pending_enqueues(
Y
"input_producer/input_producer_SizeQueueSizeV2input_producer*
_output_shapes
: 
o
input_producer/CastCast"input_producer/input_producer_Size*

DstT0*

SrcT0*
_output_shapes
: 
Y
input_producer/mul/yConst*
dtype0*
valueB
 *   =*
_output_shapes
: 
e
input_producer/mulMulinput_producer/Castinput_producer/mul/y*
T0*
_output_shapes
: 
К
'input_producer/fraction_of_32_full/tagsConst*
dtype0*3
value*B( B"input_producer/fraction_of_32_full*
_output_shapes
: 
С
"input_producer/fraction_of_32_fullScalarSummary'input_producer/fraction_of_32_full/tagsinput_producer/mul*
T0*
_output_shapes
: 
y
TextLineReaderV2TextLineReaderV2*
	container *
shared_name *
skip_header_lines *
_output_shapes
: 
_
ReaderReadUpToV2/num_recordsConst*
dtype0	*
value
B	 Rи*
_output_shapes
: 
Ш
ReaderReadUpToV2ReaderReadUpToV2TextLineReaderV2input_producerReaderReadUpToV2/num_records*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Y
ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
z

ExpandDims
ExpandDimsReaderReadUpToV2:1ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:€€€€€€€€€
h
DecodeCSV/record_defaults_0Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_1Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_2Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_3Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_4Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_5Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_6Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_7Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_8Const*
dtype0*
valueBBnull*
_output_shapes
:
i
DecodeCSV/record_defaults_9Const*
dtype0*
valueBBnokey*
_output_shapes
:
Ћ
	DecodeCSV	DecodeCSV
ExpandDimsDecodeCSV/record_defaults_0DecodeCSV/record_defaults_1DecodeCSV/record_defaults_2DecodeCSV/record_defaults_3DecodeCSV/record_defaults_4DecodeCSV/record_defaults_5DecodeCSV/record_defaults_6DecodeCSV/record_defaults_7DecodeCSV/record_defaults_8DecodeCSV/record_defaults_9*
OUT_TYPE
2
*
field_delim,*‘
_output_shapesЅ
Њ:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€
Л
@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeShapeDecodeCSV:5*
out_type0*
T0*
_output_shapes
:
Ш
Ndnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ъ
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ъ
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
†
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeNdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackPdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
М
Jdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
†
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceJdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
д
Bdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeReshapeDecodeCSV:5Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Ж
;dnn/input_from_feature_columns/input_layer/mother_age/ShapeShapeDecodeCSV:2*
out_type0*
T0*
_output_shapes
:
У
Idnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Х
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Х
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
З
Cdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/mother_age/ShapeIdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackKdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
З
Ednn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
С
Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceEdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
Џ
=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeReshapeDecodeCSV:2Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
°
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ShapeShapeDecodeCSV:3*
out_type0*
T0*
_output_shapes
:
й
Udnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/CastCastVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
Ъ
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
€
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqualNotEqualDecodeCSV:3Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
г
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/WhereWhereYdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
±
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
М
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ReshapeReshapeDecodeCSV:3^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
µ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Ы
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_sliceStridedSliceVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Whereddnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
є
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
є
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
І
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1StridedSliceVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Wherefdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stackhdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_1hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
у
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/unstackUnpackUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
ф
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/stackPackZdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
«
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/MulMul`dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
∞
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
д
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/SumSumTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Mulfdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
њ
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/AddAdd^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_sliceTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
н
Wdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/GatherGatherXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ReshapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ь
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ConstConst*
dtype0*О
valueДBБBWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese*
_output_shapes
:
Ъ
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
°
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
°
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
¶
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startXdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Size_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/delta*

Tidx0*
_output_shapes
:
т
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
к
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
ѓ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
Ѓ
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initInitializeTableV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Const[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64*

Tkey0*

Tval0	
¬
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Gatherddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
ї
|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB"      *
_output_shapes
:
Ѓ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *    *
_output_shapes
: 
∞
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *   ?*
_output_shapes
: 
’
Жdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
_output_shapes

:*
dtype0*
seed2 *

seed *
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
†
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMulЖdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
Н
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
ї
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
shared_name 
э
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal*
validate_shape(*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
use_locking(*
T0*
_output_shapes

:
№
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
і
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
≥
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ќ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SliceSliceUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castjdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
Ѓ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ConstConst*
dtype0*
valueB: *
_output_shapes
:
х
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
ѓ
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
Д
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherGatherUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castmdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
у
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Prodednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather*
N*
T0	*
_output_shapes
:*

axis 
¬
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapeSparseReshapeVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/WhereUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/x*-
_output_shapes
:€€€€€€€€€:
Г
udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
ѓ
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
П
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Г
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual*'
_output_shapes
:€€€€€€€€€
њ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Б
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
І
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1Gatherldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
ђ
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_2Gatherudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
И
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
Ї
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
—
Жdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ђ
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityЖdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stackИdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_1Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
≤
wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/CastCastАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ђ
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/rangeRange~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/startwdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Є
ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast_1Castxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
Џ
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ј
Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stackКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_1Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
”
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiffListDiffydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast_1Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
’
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
’
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≥
Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2StridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityИdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stackКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_1Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Бdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≈
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsВdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2Бdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
—
Оdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
—
Оdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Ж
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDenseSparseToDense{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiff}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDimsОdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesОdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
“
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
≈
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ReshapeReshape{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiffАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Є
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/zeros_like	ZerosLikezdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
«
ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concatConcatV2zdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/zeros_like~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
≥
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ShapeShape{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
°
wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/FillFillxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Shapexdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
√
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
µ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1ConcatV2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concatАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
√
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ѓ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2ConcatV2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_2wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/FillАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
ґ
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorderSparseReorder{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
Х
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/IdentityIdentitygdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identity*
T0	*
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ё
Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ё
Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
в
Дdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSliceАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorderКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackМdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
«
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/CastCastДdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
Ў
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/UniqueUniqueВdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
њ
Зdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupGather^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*'
_output_shapes
:€€€€€€€€€
—
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparseSparseSegmentMeanЗdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
њ
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
¶
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ReshapeАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDensendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
Ъ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Љ
rdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
Њ
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Њ
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
‘
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
®
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ь
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:*

axis 
И
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
†
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
в
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
ш
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1CastUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
ґ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
µ
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
г
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
Д
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights*
out_type0*
T0*
_output_shapes
:
ґ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
Њ
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
д
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
ђ
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
з
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
ъ
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
о
Fdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2*
out_type0*
T0*
_output_shapes
:
Ю
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Њ
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Т
Pdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
≤
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
Ќ
Hdnn/input_from_feature_columns/input_layer/mother_race_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Е
:dnn/input_from_feature_columns/input_layer/plurality/ShapeShapeDecodeCSV:4*
out_type0*
T0*
_output_shapes
:
Т
Hdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ф
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ф
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
В
Bdnn/input_from_feature_columns/input_layer/plurality/strided_sliceStridedSlice:dnn/input_from_feature_columns/input_layer/plurality/ShapeHdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackJdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Ж
Ddnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
О
Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shapePackBdnn/input_from_feature_columns/input_layer/plurality/strided_sliceDdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1*
N*
T0*
_output_shapes
:*

axis 
Ў
<dnn/input_from_feature_columns/input_layer/plurality/ReshapeReshapeDecodeCSV:4Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
«
1dnn/input_from_feature_columns/input_layer/concatConcatV2Bdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeHdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape<dnn/input_from_feature_columns/input_layer/plurality/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0
«
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB"       *
_output_shapes
:
є
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *Ђ“»Њ*
_output_shapes
: 
є
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *Ђ“»>*
_output_shapes
: 
°
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
Ю
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
: 
∞
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
Ґ
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
…
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
shared_name 
Ч
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
±
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
≤
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
valueB *    *
_output_shapes
: 
њ
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *
_output_shapes
: *
dtype0*
shape: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
shared_name 
Ж
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes
: 
™
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
: 
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

: 
»
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€ 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
: 
°
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*'
_output_shapes
:€€€€€€€€€ *
T0*
data_formatNHWC
y
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€ 
[
dnn/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Р
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*'
_output_shapes
:€€€€€€€€€ 
x
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€ 
h
dnn/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Н
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
†
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
_output_shapes
: 
Ђ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
_output_shapes
: 
°
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
«
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB"       *
_output_shapes
:
є
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *уµЊ*
_output_shapes
: 
є
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *уµ>*
_output_shapes
: 
°
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
Ю
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
: 
∞
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
Ґ
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
…
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
shared_name 
Ч
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
±
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
≤
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
valueB*    *
_output_shapes
:
њ
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
shared_name 
Ж
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:
™
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

: 
ї
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
°
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*'
_output_shapes
:€€€€€€€€€*
T0*
data_formatNHWC
y
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€
]
dnn/zero_fraction_1/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ф
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*'
_output_shapes
:€€€€€€€€€
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
j
dnn/zero_fraction_1/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
У
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
†
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
_output_shapes
: 
≠
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
_output_shapes
: 
°
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
є
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB"      *
_output_shapes
:
Ђ
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *0њ*
_output_shapes
: 
Ђ
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *0?*
_output_shapes
: 
М
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

:*
dtype0*
seed2 *

seed *
T0*,
_class"
 loc:@dnn/logits/weights/part_0
В
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes
: 
Ф
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
Ж
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
ї
dnn/logits/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*,
_class"
 loc:@dnn/logits/weights/part_0*
shared_name 
ы
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Ь
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
§
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
valueB*    *
_output_shapes
:
±
dnn/logits/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*+
_class!
loc:@dnn/logits/biases/part_0*
shared_name 
к
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
Х
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*+
_class!
loc:@dnn/logits/biases/part_0*
T0*
_output_shapes
:
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:
≠
dnn/logits/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/logits/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
М
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*'
_output_shapes
:€€€€€€€€€*
T0*
data_formatNHWC
]
dnn/zero_fraction_2/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
В
dnn/zero_fraction_2/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_2/zero*
T0*'
_output_shapes
:€€€€€€€€€
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
j
dnn/zero_fraction_2/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
У
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
Т
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
_output_shapes
: 
Я
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst*
dtype0**
value!B Bdnn/dnn/logits/activation*
_output_shapes
: 
Б
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
А
5linear/linear_model/alcohol_use/to_sparse_input/ShapeShapeDecodeCSV:8*
out_type0*
T0*
_output_shapes
:
І
4linear/linear_model/alcohol_use/to_sparse_input/CastCast5linear/linear_model/alcohol_use/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
y
8linear/linear_model/alcohol_use/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
љ
8linear/linear_model/alcohol_use/to_sparse_input/NotEqualNotEqualDecodeCSV:88linear/linear_model/alcohol_use/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
°
5linear/linear_model/alcohol_use/to_sparse_input/WhereWhere8linear/linear_model/alcohol_use/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/alcohol_use/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
 
7linear/linear_model/alcohol_use/to_sparse_input/ReshapeReshapeDecodeCSV:8=linear/linear_model/alcohol_use/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Ф
Clinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ц
=linear/linear_model/alcohol_use/to_sparse_input/strided_sliceStridedSlice5linear/linear_model/alcohol_use/to_sparse_input/WhereClinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stackElinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_1Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ш
Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ш
Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
В
?linear/linear_model/alcohol_use/to_sparse_input/strided_slice_1StridedSlice5linear/linear_model/alcohol_use/to_sparse_input/WhereElinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stackGlinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_1Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
±
7linear/linear_model/alcohol_use/to_sparse_input/unstackUnpack4linear/linear_model/alcohol_use/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
≤
5linear/linear_model/alcohol_use/to_sparse_input/stackPack9linear/linear_model/alcohol_use/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
д
3linear/linear_model/alcohol_use/to_sparse_input/MulMul?linear/linear_model/alcohol_use/to_sparse_input/strided_slice_15linear/linear_model/alcohol_use/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
П
Elinear/linear_model/alcohol_use/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Б
3linear/linear_model/alcohol_use/to_sparse_input/SumSum3linear/linear_model/alcohol_use/to_sparse_input/MulElinear/linear_model/alcohol_use/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
№
3linear/linear_model/alcohol_use/to_sparse_input/AddAdd=linear/linear_model/alcohol_use/to_sparse_input/strided_slice3linear/linear_model/alcohol_use/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
К
6linear/linear_model/alcohol_use/to_sparse_input/GatherGather7linear/linear_model/alcohol_use/to_sparse_input/Reshape3linear/linear_model/alcohol_use/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Т
8linear/linear_model/alcohol_use/alcohol_use_lookup/ConstConst*
dtype0*&
valueBBTrueBFalseBNone*
_output_shapes
:
y
7linear/linear_model/alcohol_use/alcohol_use_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
А
>linear/linear_model/alcohol_use/alcohol_use_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
А
>linear/linear_model/alcohol_use/alcohol_use_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ґ
8linear/linear_model/alcohol_use/alcohol_use_lookup/rangeRange>linear/linear_model/alcohol_use/alcohol_use_lookup/range/start7linear/linear_model/alcohol_use/alcohol_use_lookup/Size>linear/linear_model/alcohol_use/alcohol_use_lookup/range/delta*

Tidx0*
_output_shapes
:
∞
:linear/linear_model/alcohol_use/alcohol_use_lookup/ToInt64Cast8linear/linear_model/alcohol_use/alcohol_use_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
…
=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
О
Clinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
™
Hlinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/table_initInitializeTableV2=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table8linear/linear_model/alcohol_use/alcohol_use_lookup/Const:linear/linear_model/alcohol_use/alcohol_use_lookup/ToInt64*

Tkey0*

Tval0	
Њ
1linear/linear_model/alcohol_use/hash_table_LookupLookupTableFindV2=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table6linear/linear_model/alcohol_use/to_sparse_input/GatherClinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ь
*linear/linear_model/alcohol_use/Shape/CastCast4linear/linear_model/alcohol_use/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/alcohol_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/alcohol_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

5linear/linear_model/alcohol_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ю
-linear/linear_model/alcohol_use/strided_sliceStridedSlice*linear/linear_model/alcohol_use/Shape/Cast3linear/linear_model/alcohol_use/strided_slice/stack5linear/linear_model/alcohol_use/strided_slice/stack_15linear/linear_model/alcohol_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
s
(linear/linear_model/alcohol_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ѕ
&linear/linear_model/alcohol_use/Cast/xPack-linear/linear_model/alcohol_use/strided_slice(linear/linear_model/alcohol_use/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
И
$linear/linear_model/alcohol_use/CastCast&linear/linear_model/alcohol_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
А
-linear/linear_model/alcohol_use/SparseReshapeSparseReshape5linear/linear_model/alcohol_use/to_sparse_input/Where4linear/linear_model/alcohol_use/to_sparse_input/Cast$linear/linear_model/alcohol_use/Cast*-
_output_shapes
:€€€€€€€€€:
£
6linear/linear_model/alcohol_use/SparseReshape/IdentityIdentity1linear/linear_model/alcohol_use/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
Ў
@linear/linear_model/alcohol_use/weights/part_0/Initializer/zerosConst*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
valueB*    *
_output_shapes

:
е
.linear/linear_model/alcohol_use/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
shared_name 
∆
5linear/linear_model/alcohol_use/weights/part_0/AssignAssign.linear/linear_model/alcohol_use/weights/part_0@linear/linear_model/alcohol_use/weights/part_0/Initializer/zeros*
validate_shape(*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
џ
3linear/linear_model/alcohol_use/weights/part_0/readIdentity.linear/linear_model/alcohol_use/weights/part_0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
T0*
_output_shapes

:
В
8linear/linear_model/alcohol_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/alcohol_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
С
2linear/linear_model/alcohol_use/weighted_sum/SliceSlice/linear/linear_model/alcohol_use/SparseReshape:18linear/linear_model/alcohol_use/weighted_sum/Slice/begin7linear/linear_model/alcohol_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
|
2linear/linear_model/alcohol_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
я
1linear/linear_model/alcohol_use/weighted_sum/ProdProd2linear/linear_model/alcohol_use/weighted_sum/Slice2linear/linear_model/alcohol_use/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
}
;linear/linear_model/alcohol_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
3linear/linear_model/alcohol_use/weighted_sum/GatherGather/linear/linear_model/alcohol_use/SparseReshape:1;linear/linear_model/alcohol_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ё
3linear/linear_model/alcohol_use/weighted_sum/Cast/xPack1linear/linear_model/alcohol_use/weighted_sum/Prod3linear/linear_model/alcohol_use/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
П
:linear/linear_model/alcohol_use/weighted_sum/SparseReshapeSparseReshape-linear/linear_model/alcohol_use/SparseReshape/linear/linear_model/alcohol_use/SparseReshape:13linear/linear_model/alcohol_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
µ
Clinear/linear_model/alcohol_use/weighted_sum/SparseReshape/IdentityIdentity6linear/linear_model/alcohol_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
}
;linear/linear_model/alcohol_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
щ
9linear/linear_model/alcohol_use/weighted_sum/GreaterEqualGreaterEqualClinear/linear_model/alcohol_use/weighted_sum/SparseReshape/Identity;linear/linear_model/alcohol_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Я
2linear/linear_model/alcohol_use/weighted_sum/WhereWhere9linear/linear_model/alcohol_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Н
:linear/linear_model/alcohol_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
л
4linear/linear_model/alcohol_use/weighted_sum/ReshapeReshape2linear/linear_model/alcohol_use/weighted_sum/Where:linear/linear_model/alcohol_use/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
С
5linear/linear_model/alcohol_use/weighted_sum/Gather_1Gather:linear/linear_model/alcohol_use/weighted_sum/SparseReshape4linear/linear_model/alcohol_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ц
5linear/linear_model/alcohol_use/weighted_sum/Gather_2GatherClinear/linear_model/alcohol_use/weighted_sum/SparseReshape/Identity4linear/linear_model/alcohol_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/alcohol_use/weighted_sum/IdentityIdentity<linear/linear_model/alcohol_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
И
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ю
Tlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice5linear/linear_model/alcohol_use/weighted_sum/IdentityTlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackVlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/CastCastNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
г
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/rangeRangeLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/startElinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/CastLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
‘
Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Cast_1CastFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
І
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
¬
Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice5linear/linear_model/alcohol_use/weighted_sum/Gather_1Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackXlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Љ
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffGlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Cast_1Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
µ
Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice5linear/linear_model/alcohol_use/weighted_sum/IdentityVlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackXlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ъ
Olinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≠
Klinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsPlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2Olinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ю
\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Й
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffKlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Я
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ѓ
Hlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
‘
Klinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeHlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
€
Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Hlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ReshapeKlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/zeros_likeLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
ѕ
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ShapeShapeIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Л
Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/FillFillFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ShapeFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
м
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV25linear/linear_model/alcohol_use/weighted_sum/Gather_1Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concatNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
Р
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ж
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV25linear/linear_model/alcohol_use/weighted_sum/Gather_2Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/FillNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
н
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_25linear/linear_model/alcohol_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
±
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/IdentityIdentity5linear/linear_model/alcohol_use/weighted_sum/Identity*
T0	*
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
Rlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorderXlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackZlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
в
Ilinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/CastCastRlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
у
Klinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/UniqueUniquePlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
Ulinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGather3linear/linear_model/alcohol_use/weights/part_0/readKlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
З
Dlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumUlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/embedding_lookupMlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Unique:1Ilinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
Н
<linear/linear_model/alcohol_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
П
6linear/linear_model/alcohol_use/weighted_sum/Reshape_1ReshapeNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense<linear/linear_model/alcohol_use/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
ґ
2linear/linear_model/alcohol_use/weighted_sum/ShapeShapeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
К
@linear/linear_model/alcohol_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Џ
:linear/linear_model/alcohol_use/weighted_sum/strided_sliceStridedSlice2linear/linear_model/alcohol_use/weighted_sum/Shape@linear/linear_model/alcohol_use/weighted_sum/strided_slice/stackBlinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_1Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
4linear/linear_model/alcohol_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ж
2linear/linear_model/alcohol_use/weighted_sum/stackPack4linear/linear_model/alcohol_use/weighted_sum/stack/0:linear/linear_model/alcohol_use/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
т
1linear/linear_model/alcohol_use/weighted_sum/TileTile6linear/linear_model/alcohol_use/weighted_sum/Reshape_12linear/linear_model/alcohol_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
Љ
7linear/linear_model/alcohol_use/weighted_sum/zeros_like	ZerosLikeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ъ
,linear/linear_model/alcohol_use/weighted_sumSelect1linear/linear_model/alcohol_use/weighted_sum/Tile7linear/linear_model/alcohol_use/weighted_sum/zeros_likeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
†
3linear/linear_model/alcohol_use/weighted_sum/Cast_1Cast/linear/linear_model/alcohol_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Д
:linear/linear_model/alcohol_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/alcohol_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ы
4linear/linear_model/alcohol_use/weighted_sum/Slice_1Slice3linear/linear_model/alcohol_use/weighted_sum/Cast_1:linear/linear_model/alcohol_use/weighted_sum/Slice_1/begin9linear/linear_model/alcohol_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
†
4linear/linear_model/alcohol_use/weighted_sum/Shape_1Shape,linear/linear_model/alcohol_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Д
:linear/linear_model/alcohol_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
М
9linear/linear_model/alcohol_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ь
4linear/linear_model/alcohol_use/weighted_sum/Slice_2Slice4linear/linear_model/alcohol_use/weighted_sum/Shape_1:linear/linear_model/alcohol_use/weighted_sum/Slice_2/begin9linear/linear_model/alcohol_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
z
8linear/linear_model/alcohol_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Я
3linear/linear_model/alcohol_use/weighted_sum/concatConcatV24linear/linear_model/alcohol_use/weighted_sum/Slice_14linear/linear_model/alcohol_use/weighted_sum/Slice_28linear/linear_model/alcohol_use/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
д
6linear/linear_model/alcohol_use/weighted_sum/Reshape_2Reshape,linear/linear_model/alcohol_use/weighted_sum3linear/linear_model/alcohol_use/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Р
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ShapeShapeDecodeCSV:7*
out_type0*
T0*
_output_shapes
:
«
Dlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/CastCastElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
Й
Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ё
Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/NotEqualNotEqualDecodeCSV:7Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
Ѕ
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereWhereHlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
†
Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
к
Glinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ReshapeReshapeDecodeCSV:7Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
§
Slinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
∆
Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_sliceStridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereSlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stackUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_1Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
®
Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
®
Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
“
Olinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stackWlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_1Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
—
Glinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/unstackUnpackDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
“
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/stackPackIlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
Ф
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/MulMulOlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Я
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
±
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/SumSumClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/MulUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
М
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/AddAddMlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_sliceClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
Ї
Flinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/GatherGatherGlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ReshapeClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
Jlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ConstConst*
dtype0*&
valueBBTrueBFalseBNone*
_output_shapes
:
Л
Ilinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Т
Plinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Т
Plinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
к
Jlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/rangeRangePlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/startIlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/SizePlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/delta*

Tidx0*
_output_shapes
:
‘
Llinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ToInt64CastJlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
џ
Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
†
Ulinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
т
Zlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/table_initInitializeTableV2Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableJlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ConstLlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ToInt64*

Tkey0*

Tval0	
В
Alinear/linear_model/alcohol_use_X_cigarette_use/hash_table_LookupLookupTableFindV2Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableFlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/GatherUlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
О
;linear/linear_model/alcohol_use_X_cigarette_use/SparseCrossSparseCrossElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Where5linear/linear_model/alcohol_use/to_sparse_input/WhereAlinear/linear_model/alcohol_use_X_cigarette_use/hash_table_Lookup1linear/linear_model/alcohol_use/hash_table_LookupDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast4linear/linear_model/alcohol_use/to_sparse_input/Cast*
internal_type0	*
dense_types
 *<
_output_shapes*
(:€€€€€€€€€:€€€€€€€€€:*
out_type0	*
N*
num_buckets	*
hash_keyюят„м*
sparse_types
2		*
hashed_output(
µ
:linear/linear_model/alcohol_use_X_cigarette_use/Shape/CastCast=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:2*

DstT0*

SrcT0	*
_output_shapes
:
Н
Clinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
П
Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
о
=linear/linear_model/alcohol_use_X_cigarette_use/strided_sliceStridedSlice:linear/linear_model/alcohol_use_X_cigarette_use/Shape/CastClinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stackElinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_1Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Г
8linear/linear_model/alcohol_use_X_cigarette_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
с
6linear/linear_model/alcohol_use_X_cigarette_use/Cast/xPack=linear/linear_model/alcohol_use_X_cigarette_use/strided_slice8linear/linear_model/alcohol_use_X_cigarette_use/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
®
4linear/linear_model/alcohol_use_X_cigarette_use/CastCast6linear/linear_model/alcohol_use_X_cigarette_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ѓ
=linear/linear_model/alcohol_use_X_cigarette_use/SparseReshapeSparseReshape;linear/linear_model/alcohol_use_X_cigarette_use/SparseCross=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:24linear/linear_model/alcohol_use_X_cigarette_use/Cast*-
_output_shapes
:€€€€€€€€€:
њ
Flinear/linear_model/alcohol_use_X_cigarette_use/SparseReshape/IdentityIdentity=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:1*
T0	*#
_output_shapes
:€€€€€€€€€
ш
Plinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Initializer/zerosConst*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
valueB	*    *
_output_shapes

:	
Е
>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0
VariableV2*
	container *
_output_shapes

:	*
dtype0*
shape
:	*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
shared_name 
Ж
Elinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/AssignAssign>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0Plinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Initializer/zeros*
validate_shape(*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:	
Л
Clinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/readIdentity>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
T0*
_output_shapes

:	
Т
Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
С
Glinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
—
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SliceSlice?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/beginGlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
М
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
П
Alinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ProdProdBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SliceBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
Н
Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
™
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GatherGather?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Н
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast/xPackAlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ProdClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
ѕ
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshapeSparseReshape=linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
’
Slinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityIdentityFlinear/linear_model/alcohol_use_X_cigarette_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
Н
Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
©
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqualGreaterEqualSlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityKlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
њ
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/WhereWhereIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Э
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ы
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ReshapeReshapeBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/WhereJlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Ѕ
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1GatherJlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshapeDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
∆
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_2GatherSlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
ƒ
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/IdentityIdentityLlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Ш
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ѓ
dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
э
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identitydlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackflinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
н
Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/CastCast^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
£
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/rangeRange\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/startUlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
ф
Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1CastVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
Ј
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Т
`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
м
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffWlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
≤
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
≤
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Е
`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identityflinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
™
_linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ё
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDims`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2_linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ѓ
llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ѓ
llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ў
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDimsllinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesllinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
ѓ
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
ё
Xlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
ф
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeXlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
њ
Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Xlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
п
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeShapeYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
ї
Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/FillFillVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
†
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ђ
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
†
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
¶
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_2Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Fill^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
≠
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
—
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/IdentityIdentityElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identity*
T0	*
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ї
jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ї
jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
≥
blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlice^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackjlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
В
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/CastCastblinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
У
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/UniqueUnique`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ƒ
elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherClinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
«
Tlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumelinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookup]linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Unique:1Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
Э
Llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
њ
Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1Reshape^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseLlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
÷
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ShapeShapeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Ъ
Plinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
™
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_sliceStridedSliceBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ShapePlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stackRlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_1Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Ж
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
Ц
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stackPackDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack/0Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
Ґ
Alinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/TileTileFlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
№
Glinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/zeros_like	ZerosLikeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Џ
<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sumSelectAlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/TileGlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/zeros_likeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
ј
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast_1Cast?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Ф
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
У
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
џ
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1SliceClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast_1Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/beginIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
ј
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Shape_1Shape<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Ф
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
Ь
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
№
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2SliceDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Shape_1Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/beginIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
К
Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
я
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concatConcatV2Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Ф
Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_2Reshape<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sumClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Ѓ
,linear/linear_model/cigarette_use/Shape/CastCastDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:

5linear/linear_model/cigarette_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/cigarette_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Б
7linear/linear_model/cigarette_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
®
/linear/linear_model/cigarette_use/strided_sliceStridedSlice,linear/linear_model/cigarette_use/Shape/Cast5linear/linear_model/cigarette_use/strided_slice/stack7linear/linear_model/cigarette_use/strided_slice/stack_17linear/linear_model/cigarette_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
u
*linear/linear_model/cigarette_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
«
(linear/linear_model/cigarette_use/Cast/xPack/linear/linear_model/cigarette_use/strided_slice*linear/linear_model/cigarette_use/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
М
&linear/linear_model/cigarette_use/CastCast(linear/linear_model/cigarette_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
§
/linear/linear_model/cigarette_use/SparseReshapeSparseReshapeElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast&linear/linear_model/cigarette_use/Cast*-
_output_shapes
:€€€€€€€€€:
µ
8linear/linear_model/cigarette_use/SparseReshape/IdentityIdentityAlinear/linear_model/alcohol_use_X_cigarette_use/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
№
Blinear/linear_model/cigarette_use/weights/part_0/Initializer/zerosConst*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
valueB*    *
_output_shapes

:
й
0linear/linear_model/cigarette_use/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
shared_name 
ќ
7linear/linear_model/cigarette_use/weights/part_0/AssignAssign0linear/linear_model/cigarette_use/weights/part_0Blinear/linear_model/cigarette_use/weights/part_0/Initializer/zeros*
validate_shape(*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
б
5linear/linear_model/cigarette_use/weights/part_0/readIdentity0linear/linear_model/cigarette_use/weights/part_0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
T0*
_output_shapes

:
Д
:linear/linear_model/cigarette_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/cigarette_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Щ
4linear/linear_model/cigarette_use/weighted_sum/SliceSlice1linear/linear_model/cigarette_use/SparseReshape:1:linear/linear_model/cigarette_use/weighted_sum/Slice/begin9linear/linear_model/cigarette_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
~
4linear/linear_model/cigarette_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
е
3linear/linear_model/cigarette_use/weighted_sum/ProdProd4linear/linear_model/cigarette_use/weighted_sum/Slice4linear/linear_model/cigarette_use/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0

=linear/linear_model/cigarette_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
А
5linear/linear_model/cigarette_use/weighted_sum/GatherGather1linear/linear_model/cigarette_use/SparseReshape:1=linear/linear_model/cigarette_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
г
5linear/linear_model/cigarette_use/weighted_sum/Cast/xPack3linear/linear_model/cigarette_use/weighted_sum/Prod5linear/linear_model/cigarette_use/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
Ч
<linear/linear_model/cigarette_use/weighted_sum/SparseReshapeSparseReshape/linear/linear_model/cigarette_use/SparseReshape1linear/linear_model/cigarette_use/SparseReshape:15linear/linear_model/cigarette_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
є
Elinear/linear_model/cigarette_use/weighted_sum/SparseReshape/IdentityIdentity8linear/linear_model/cigarette_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€

=linear/linear_model/cigarette_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
€
;linear/linear_model/cigarette_use/weighted_sum/GreaterEqualGreaterEqualElinear/linear_model/cigarette_use/weighted_sum/SparseReshape/Identity=linear/linear_model/cigarette_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
£
4linear/linear_model/cigarette_use/weighted_sum/WhereWhere;linear/linear_model/cigarette_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
П
<linear/linear_model/cigarette_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
с
6linear/linear_model/cigarette_use/weighted_sum/ReshapeReshape4linear/linear_model/cigarette_use/weighted_sum/Where<linear/linear_model/cigarette_use/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Ч
7linear/linear_model/cigarette_use/weighted_sum/Gather_1Gather<linear/linear_model/cigarette_use/weighted_sum/SparseReshape6linear/linear_model/cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ь
7linear/linear_model/cigarette_use/weighted_sum/Gather_2GatherElinear/linear_model/cigarette_use/weighted_sum/SparseReshape/Identity6linear/linear_model/cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
®
7linear/linear_model/cigarette_use/weighted_sum/IdentityIdentity>linear/linear_model/cigarette_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
К
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
†
Vlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ј
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice7linear/linear_model/cigarette_use/weighted_sum/IdentityVlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackXlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
—
Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/CastCastPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
л
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/rangeRangeNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/startGlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/CastNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Ў
Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1CastHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
©
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ћ
Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice7linear/linear_model/cigarette_use/weighted_sum/Gather_1Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackZlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
¬
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffIlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
§
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
§
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
њ
Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice7linear/linear_model/cigarette_use/weighted_sum/IdentityXlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackZlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ь
Qlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≥
Mlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsRlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2Qlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
†
^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
†
^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
У
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffMlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
°
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
і
Jlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Ў
Mlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeJlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
З
Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Jlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeMlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_likeNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
”
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeShapeKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
С
Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/FillFillHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Т
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ф
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV27linear/linear_model/cigarette_use/weighted_sum/Gather_1Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concatPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
Т
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
о
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV27linear/linear_model/cigarette_use/weighted_sum/Gather_2Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/FillPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
х
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_27linear/linear_model/cigarette_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
µ
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/IdentityIdentity7linear/linear_model/cigarette_use/weighted_sum/Identity*
T0	*
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
≠
\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
≠
\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
н
Tlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicePlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderZlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
ж
Klinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/CastCastTlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
ч
Mlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/UniqueUniqueRlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
М
Wlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGather5linear/linear_model/cigarette_use/weights/part_0/readMlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
П
Flinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumWlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupOlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Unique:1Klinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
П
>linear/linear_model/cigarette_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Х
8linear/linear_model/cigarette_use/weighted_sum/Reshape_1ReshapePlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense>linear/linear_model/cigarette_use/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
Ї
4linear/linear_model/cigarette_use/weighted_sum/ShapeShapeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
М
Blinear/linear_model/cigarette_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
О
Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
О
Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
д
<linear/linear_model/cigarette_use/weighted_sum/strided_sliceStridedSlice4linear/linear_model/cigarette_use/weighted_sum/ShapeBlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stackDlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_1Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
x
6linear/linear_model/cigarette_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
м
4linear/linear_model/cigarette_use/weighted_sum/stackPack6linear/linear_model/cigarette_use/weighted_sum/stack/0<linear/linear_model/cigarette_use/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
ш
3linear/linear_model/cigarette_use/weighted_sum/TileTile8linear/linear_model/cigarette_use/weighted_sum/Reshape_14linear/linear_model/cigarette_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
ј
9linear/linear_model/cigarette_use/weighted_sum/zeros_like	ZerosLikeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ґ
.linear/linear_model/cigarette_use/weighted_sumSelect3linear/linear_model/cigarette_use/weighted_sum/Tile9linear/linear_model/cigarette_use/weighted_sum/zeros_likeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/cigarette_use/weighted_sum/Cast_1Cast1linear/linear_model/cigarette_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Ж
<linear/linear_model/cigarette_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Е
;linear/linear_model/cigarette_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
£
6linear/linear_model/cigarette_use/weighted_sum/Slice_1Slice5linear/linear_model/cigarette_use/weighted_sum/Cast_1<linear/linear_model/cigarette_use/weighted_sum/Slice_1/begin;linear/linear_model/cigarette_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
§
6linear/linear_model/cigarette_use/weighted_sum/Shape_1Shape.linear/linear_model/cigarette_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Ж
<linear/linear_model/cigarette_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
О
;linear/linear_model/cigarette_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
§
6linear/linear_model/cigarette_use/weighted_sum/Slice_2Slice6linear/linear_model/cigarette_use/weighted_sum/Shape_1<linear/linear_model/cigarette_use/weighted_sum/Slice_2/begin;linear/linear_model/cigarette_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
|
:linear/linear_model/cigarette_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
І
5linear/linear_model/cigarette_use/weighted_sum/concatConcatV26linear/linear_model/cigarette_use/weighted_sum/Slice_16linear/linear_model/cigarette_use/weighted_sum/Slice_2:linear/linear_model/cigarette_use/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
к
8linear/linear_model/cigarette_use/weighted_sum/Reshape_2Reshape.linear/linear_model/cigarette_use/weighted_sum5linear/linear_model/cigarette_use/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
|
1linear/linear_model/is_male/to_sparse_input/ShapeShapeDecodeCSV:1*
out_type0*
T0*
_output_shapes
:
Я
0linear/linear_model/is_male/to_sparse_input/CastCast1linear/linear_model/is_male/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
u
4linear/linear_model/is_male/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
µ
4linear/linear_model/is_male/to_sparse_input/NotEqualNotEqualDecodeCSV:14linear/linear_model/is_male/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
Щ
1linear/linear_model/is_male/to_sparse_input/WhereWhere4linear/linear_model/is_male/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
М
9linear/linear_model/is_male/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
¬
3linear/linear_model/is_male/to_sparse_input/ReshapeReshapeDecodeCSV:19linear/linear_model/is_male/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Р
?linear/linear_model/is_male/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
в
9linear/linear_model/is_male/to_sparse_input/strided_sliceStridedSlice1linear/linear_model/is_male/to_sparse_input/Where?linear/linear_model/is_male/to_sparse_input/strided_slice/stackAlinear/linear_model/is_male/to_sparse_input/strided_slice/stack_1Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ф
Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ф
Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
о
;linear/linear_model/is_male/to_sparse_input/strided_slice_1StridedSlice1linear/linear_model/is_male/to_sparse_input/WhereAlinear/linear_model/is_male/to_sparse_input/strided_slice_1/stackClinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_1Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
©
3linear/linear_model/is_male/to_sparse_input/unstackUnpack0linear/linear_model/is_male/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
™
1linear/linear_model/is_male/to_sparse_input/stackPack5linear/linear_model/is_male/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
Ў
/linear/linear_model/is_male/to_sparse_input/MulMul;linear/linear_model/is_male/to_sparse_input/strided_slice_11linear/linear_model/is_male/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Л
Alinear/linear_model/is_male/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
х
/linear/linear_model/is_male/to_sparse_input/SumSum/linear/linear_model/is_male/to_sparse_input/MulAlinear/linear_model/is_male/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
–
/linear/linear_model/is_male/to_sparse_input/AddAdd9linear/linear_model/is_male/to_sparse_input/strided_slice/linear/linear_model/is_male/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
ю
2linear/linear_model/is_male/to_sparse_input/GatherGather3linear/linear_model/is_male/to_sparse_input/Reshape/linear/linear_model/is_male/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Д
0linear/linear_model/is_male/is_male_lookup/ConstConst*
dtype0* 
valueBBTrueBFalse*
_output_shapes
:
q
/linear/linear_model/is_male/is_male_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
x
6linear/linear_model/is_male/is_male_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
x
6linear/linear_model/is_male/is_male_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
В
0linear/linear_model/is_male/is_male_lookup/rangeRange6linear/linear_model/is_male/is_male_lookup/range/start/linear/linear_model/is_male/is_male_lookup/Size6linear/linear_model/is_male/is_male_lookup/range/delta*

Tidx0*
_output_shapes
:
†
2linear/linear_model/is_male/is_male_lookup/ToInt64Cast0linear/linear_model/is_male/is_male_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Ѕ
5linear/linear_model/is_male/is_male_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ж
;linear/linear_model/is_male/is_male_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
К
@linear/linear_model/is_male/is_male_lookup/hash_table/table_initInitializeTableV25linear/linear_model/is_male/is_male_lookup/hash_table0linear/linear_model/is_male/is_male_lookup/Const2linear/linear_model/is_male/is_male_lookup/ToInt64*

Tkey0*

Tval0	
¶
-linear/linear_model/is_male/hash_table_LookupLookupTableFindV25linear/linear_model/is_male/is_male_lookup/hash_table2linear/linear_model/is_male/to_sparse_input/Gather;linear/linear_model/is_male/is_male_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ф
&linear/linear_model/is_male/Shape/CastCast0linear/linear_model/is_male/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
y
/linear/linear_model/is_male/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
{
1linear/linear_model/is_male/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
{
1linear/linear_model/is_male/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
К
)linear/linear_model/is_male/strided_sliceStridedSlice&linear/linear_model/is_male/Shape/Cast/linear/linear_model/is_male/strided_slice/stack1linear/linear_model/is_male/strided_slice/stack_11linear/linear_model/is_male/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
o
$linear/linear_model/is_male/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
µ
"linear/linear_model/is_male/Cast/xPack)linear/linear_model/is_male/strided_slice$linear/linear_model/is_male/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
А
 linear/linear_model/is_male/CastCast"linear/linear_model/is_male/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
р
)linear/linear_model/is_male/SparseReshapeSparseReshape1linear/linear_model/is_male/to_sparse_input/Where0linear/linear_model/is_male/to_sparse_input/Cast linear/linear_model/is_male/Cast*-
_output_shapes
:€€€€€€€€€:
Ы
2linear/linear_model/is_male/SparseReshape/IdentityIdentity-linear/linear_model/is_male/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
–
<linear/linear_model/is_male/weights/part_0/Initializer/zerosConst*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
valueB*    *
_output_shapes

:
Ё
*linear/linear_model/is_male/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
shared_name 
ґ
1linear/linear_model/is_male/weights/part_0/AssignAssign*linear/linear_model/is_male/weights/part_0<linear/linear_model/is_male/weights/part_0/Initializer/zeros*
validate_shape(*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
use_locking(*
T0*
_output_shapes

:
ѕ
/linear/linear_model/is_male/weights/part_0/readIdentity*linear/linear_model/is_male/weights/part_0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
T0*
_output_shapes

:
~
4linear/linear_model/is_male/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
}
3linear/linear_model/is_male/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Б
.linear/linear_model/is_male/weighted_sum/SliceSlice+linear/linear_model/is_male/SparseReshape:14linear/linear_model/is_male/weighted_sum/Slice/begin3linear/linear_model/is_male/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
x
.linear/linear_model/is_male/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
”
-linear/linear_model/is_male/weighted_sum/ProdProd.linear/linear_model/is_male/weighted_sum/Slice.linear/linear_model/is_male/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
y
7linear/linear_model/is_male/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
о
/linear/linear_model/is_male/weighted_sum/GatherGather+linear/linear_model/is_male/SparseReshape:17linear/linear_model/is_male/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
—
/linear/linear_model/is_male/weighted_sum/Cast/xPack-linear/linear_model/is_male/weighted_sum/Prod/linear/linear_model/is_male/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
€
6linear/linear_model/is_male/weighted_sum/SparseReshapeSparseReshape)linear/linear_model/is_male/SparseReshape+linear/linear_model/is_male/SparseReshape:1/linear/linear_model/is_male/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
≠
?linear/linear_model/is_male/weighted_sum/SparseReshape/IdentityIdentity2linear/linear_model/is_male/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
y
7linear/linear_model/is_male/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
н
5linear/linear_model/is_male/weighted_sum/GreaterEqualGreaterEqual?linear/linear_model/is_male/weighted_sum/SparseReshape/Identity7linear/linear_model/is_male/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Ч
.linear/linear_model/is_male/weighted_sum/WhereWhere5linear/linear_model/is_male/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Й
6linear/linear_model/is_male/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
я
0linear/linear_model/is_male/weighted_sum/ReshapeReshape.linear/linear_model/is_male/weighted_sum/Where6linear/linear_model/is_male/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Е
1linear/linear_model/is_male/weighted_sum/Gather_1Gather6linear/linear_model/is_male/weighted_sum/SparseReshape0linear/linear_model/is_male/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
К
1linear/linear_model/is_male/weighted_sum/Gather_2Gather?linear/linear_model/is_male/weighted_sum/SparseReshape/Identity0linear/linear_model/is_male/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ь
1linear/linear_model/is_male/weighted_sum/IdentityIdentity8linear/linear_model/is_male/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Д
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ъ
Plinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Щ
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice1linear/linear_model/is_male/weighted_sum/IdentityPlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stackRlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
≈
Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/CastCastJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
”
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/rangeRangeHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/startAlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/CastHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
ћ
Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Cast_1CastBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
£
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Ѓ
Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice1linear/linear_model/is_male/weighted_sum/Gather_1Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackTlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
∞
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffListDiffClinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Cast_1Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ю
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ю
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
°
Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice1linear/linear_model/is_male/weighted_sum/IdentityRlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackTlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ц
Klinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
°
Glinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsLlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2Klinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ъ
Xlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ъ
Xlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
х
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffGlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDimsXlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesXlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Ы
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ґ
Dlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ReshapeReshapeElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
ћ
Glinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeDlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
п
Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concatConcatV2Dlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ReshapeGlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/zeros_likeHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
«
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ShapeShapeElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
€
Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/FillFillBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ShapeBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
М
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
№
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1ConcatV21linear/linear_model/is_male/weighted_sum/Gather_1Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concatJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
М
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
÷
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2ConcatV21linear/linear_model/is_male/weighted_sum/Gather_2Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/FillJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
Ё
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_21linear/linear_model/is_male/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
©
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/IdentityIdentity1linear/linear_model/is_male/weighted_sum/Identity*
T0	*
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
І
Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
І
Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ѕ
Nlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorderTlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stackVlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Џ
Elinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/CastCastNlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
л
Glinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/UniqueUniqueLlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ф
Qlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/embedding_lookupGather/linear/linear_model/is_male/weights/part_0/readGlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*'
_output_shapes
:€€€€€€€€€
ч
@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparseSparseSegmentSumQlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/embedding_lookupIlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Unique:1Elinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
Й
8linear/linear_model/is_male/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Г
2linear/linear_model/is_male/weighted_sum/Reshape_1ReshapeJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense8linear/linear_model/is_male/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
Ѓ
.linear/linear_model/is_male/weighted_sum/ShapeShape@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Ж
<linear/linear_model/is_male/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
И
>linear/linear_model/is_male/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
И
>linear/linear_model/is_male/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
∆
6linear/linear_model/is_male/weighted_sum/strided_sliceStridedSlice.linear/linear_model/is_male/weighted_sum/Shape<linear/linear_model/is_male/weighted_sum/strided_slice/stack>linear/linear_model/is_male/weighted_sum/strided_slice/stack_1>linear/linear_model/is_male/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
r
0linear/linear_model/is_male/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
Џ
.linear/linear_model/is_male/weighted_sum/stackPack0linear/linear_model/is_male/weighted_sum/stack/06linear/linear_model/is_male/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
ж
-linear/linear_model/is_male/weighted_sum/TileTile2linear/linear_model/is_male/weighted_sum/Reshape_1.linear/linear_model/is_male/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
і
3linear/linear_model/is_male/weighted_sum/zeros_like	ZerosLike@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
К
(linear/linear_model/is_male/weighted_sumSelect-linear/linear_model/is_male/weighted_sum/Tile3linear/linear_model/is_male/weighted_sum/zeros_like@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ш
/linear/linear_model/is_male/weighted_sum/Cast_1Cast+linear/linear_model/is_male/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
А
6linear/linear_model/is_male/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/is_male/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Л
0linear/linear_model/is_male/weighted_sum/Slice_1Slice/linear/linear_model/is_male/weighted_sum/Cast_16linear/linear_model/is_male/weighted_sum/Slice_1/begin5linear/linear_model/is_male/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ш
0linear/linear_model/is_male/weighted_sum/Shape_1Shape(linear/linear_model/is_male/weighted_sum*
out_type0*
T0*
_output_shapes
:
А
6linear/linear_model/is_male/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
И
5linear/linear_model/is_male/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
М
0linear/linear_model/is_male/weighted_sum/Slice_2Slice0linear/linear_model/is_male/weighted_sum/Shape_16linear/linear_model/is_male/weighted_sum/Slice_2/begin5linear/linear_model/is_male/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
v
4linear/linear_model/is_male/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
П
/linear/linear_model/is_male/weighted_sum/concatConcatV20linear/linear_model/is_male/weighted_sum/Slice_10linear/linear_model/is_male/weighted_sum/Slice_24linear/linear_model/is_male/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Ў
2linear/linear_model/is_male/weighted_sum/Reshape_2Reshape(linear/linear_model/is_male/weighted_sum/linear/linear_model/is_male/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Г
8linear/linear_model/mother_married/to_sparse_input/ShapeShapeDecodeCSV:6*
out_type0*
T0*
_output_shapes
:
≠
7linear/linear_model/mother_married/to_sparse_input/CastCast8linear/linear_model/mother_married/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
|
;linear/linear_model/mother_married/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
√
;linear/linear_model/mother_married/to_sparse_input/NotEqualNotEqualDecodeCSV:6;linear/linear_model/mother_married/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
І
8linear/linear_model/mother_married/to_sparse_input/WhereWhere;linear/linear_model/mother_married/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
У
@linear/linear_model/mother_married/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
–
:linear/linear_model/mother_married/to_sparse_input/ReshapeReshapeDecodeCSV:6@linear/linear_model/mother_married/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Ч
Flinear/linear_model/mother_married/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Е
@linear/linear_model/mother_married/to_sparse_input/strided_sliceStridedSlice8linear/linear_model/mother_married/to_sparse_input/WhereFlinear/linear_model/mother_married/to_sparse_input/strided_slice/stackHlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_1Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ы
Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ы
Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
С
Blinear/linear_model/mother_married/to_sparse_input/strided_slice_1StridedSlice8linear/linear_model/mother_married/to_sparse_input/WhereHlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stackJlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_1Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ј
:linear/linear_model/mother_married/to_sparse_input/unstackUnpack7linear/linear_model/mother_married/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
Є
8linear/linear_model/mother_married/to_sparse_input/stackPack<linear/linear_model/mother_married/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
н
6linear/linear_model/mother_married/to_sparse_input/MulMulBlinear/linear_model/mother_married/to_sparse_input/strided_slice_18linear/linear_model/mother_married/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Т
Hlinear/linear_model/mother_married/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
К
6linear/linear_model/mother_married/to_sparse_input/SumSum6linear/linear_model/mother_married/to_sparse_input/MulHlinear/linear_model/mother_married/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
е
6linear/linear_model/mother_married/to_sparse_input/AddAdd@linear/linear_model/mother_married/to_sparse_input/strided_slice6linear/linear_model/mother_married/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
У
9linear/linear_model/mother_married/to_sparse_input/GatherGather:linear/linear_model/mother_married/to_sparse_input/Reshape6linear/linear_model/mother_married/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Т
>linear/linear_model/mother_married/mother_married_lookup/ConstConst*
dtype0* 
valueBBTrueBFalse*
_output_shapes
:

=linear/linear_model/mother_married/mother_married_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Ж
Dlinear/linear_model/mother_married/mother_married_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Ж
Dlinear/linear_model/mother_married/mother_married_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ї
>linear/linear_model/mother_married/mother_married_lookup/rangeRangeDlinear/linear_model/mother_married/mother_married_lookup/range/start=linear/linear_model/mother_married/mother_married_lookup/SizeDlinear/linear_model/mother_married/mother_married_lookup/range/delta*

Tidx0*
_output_shapes
:
Љ
@linear/linear_model/mother_married/mother_married_lookup/ToInt64Cast>linear/linear_model/mother_married/mother_married_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
ѕ
Clinear/linear_model/mother_married/mother_married_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ф
Ilinear/linear_model/mother_married/mother_married_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
¬
Nlinear/linear_model/mother_married/mother_married_lookup/hash_table/table_initInitializeTableV2Clinear/linear_model/mother_married/mother_married_lookup/hash_table>linear/linear_model/mother_married/mother_married_lookup/Const@linear/linear_model/mother_married/mother_married_lookup/ToInt64*

Tkey0*

Tval0	
–
4linear/linear_model/mother_married/hash_table_LookupLookupTableFindV2Clinear/linear_model/mother_married/mother_married_lookup/hash_table9linear/linear_model/mother_married/to_sparse_input/GatherIlinear/linear_model/mother_married/mother_married_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ґ
-linear/linear_model/mother_married/Shape/CastCast7linear/linear_model/mother_married/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
А
6linear/linear_model/mother_married/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
В
8linear/linear_model/mother_married/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
В
8linear/linear_model/mother_married/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
0linear/linear_model/mother_married/strided_sliceStridedSlice-linear/linear_model/mother_married/Shape/Cast6linear/linear_model/mother_married/strided_slice/stack8linear/linear_model/mother_married/strided_slice/stack_18linear/linear_model/mother_married/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
+linear/linear_model/mother_married/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
 
)linear/linear_model/mother_married/Cast/xPack0linear/linear_model/mother_married/strided_slice+linear/linear_model/mother_married/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
О
'linear/linear_model/mother_married/CastCast)linear/linear_model/mother_married/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
М
0linear/linear_model/mother_married/SparseReshapeSparseReshape8linear/linear_model/mother_married/to_sparse_input/Where7linear/linear_model/mother_married/to_sparse_input/Cast'linear/linear_model/mother_married/Cast*-
_output_shapes
:€€€€€€€€€:
©
9linear/linear_model/mother_married/SparseReshape/IdentityIdentity4linear/linear_model/mother_married/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
ё
Clinear/linear_model/mother_married/weights/part_0/Initializer/zerosConst*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
valueB*    *
_output_shapes

:
л
1linear/linear_model/mother_married/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
shared_name 
“
8linear/linear_model/mother_married/weights/part_0/AssignAssign1linear/linear_model/mother_married/weights/part_0Clinear/linear_model/mother_married/weights/part_0/Initializer/zeros*
validate_shape(*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
use_locking(*
T0*
_output_shapes

:
д
6linear/linear_model/mother_married/weights/part_0/readIdentity1linear/linear_model/mother_married/weights/part_0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
T0*
_output_shapes

:
Е
;linear/linear_model/mother_married/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Д
:linear/linear_model/mother_married/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Э
5linear/linear_model/mother_married/weighted_sum/SliceSlice2linear/linear_model/mother_married/SparseReshape:1;linear/linear_model/mother_married/weighted_sum/Slice/begin:linear/linear_model/mother_married/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

5linear/linear_model/mother_married/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
и
4linear/linear_model/mother_married/weighted_sum/ProdProd5linear/linear_model/mother_married/weighted_sum/Slice5linear/linear_model/mother_married/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
А
>linear/linear_model/mother_married/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
Г
6linear/linear_model/mother_married/weighted_sum/GatherGather2linear/linear_model/mother_married/SparseReshape:1>linear/linear_model/mother_married/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
ж
6linear/linear_model/mother_married/weighted_sum/Cast/xPack4linear/linear_model/mother_married/weighted_sum/Prod6linear/linear_model/mother_married/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
Ы
=linear/linear_model/mother_married/weighted_sum/SparseReshapeSparseReshape0linear/linear_model/mother_married/SparseReshape2linear/linear_model/mother_married/SparseReshape:16linear/linear_model/mother_married/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
ї
Flinear/linear_model/mother_married/weighted_sum/SparseReshape/IdentityIdentity9linear/linear_model/mother_married/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
А
>linear/linear_model/mother_married/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
В
<linear/linear_model/mother_married/weighted_sum/GreaterEqualGreaterEqualFlinear/linear_model/mother_married/weighted_sum/SparseReshape/Identity>linear/linear_model/mother_married/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
•
5linear/linear_model/mother_married/weighted_sum/WhereWhere<linear/linear_model/mother_married/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/mother_married/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
ф
7linear/linear_model/mother_married/weighted_sum/ReshapeReshape5linear/linear_model/mother_married/weighted_sum/Where=linear/linear_model/mother_married/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Ъ
8linear/linear_model/mother_married/weighted_sum/Gather_1Gather=linear/linear_model/mother_married/weighted_sum/SparseReshape7linear/linear_model/mother_married/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Я
8linear/linear_model/mother_married/weighted_sum/Gather_2GatherFlinear/linear_model/mother_married/weighted_sum/SparseReshape/Identity7linear/linear_model/mother_married/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
™
8linear/linear_model/mother_married/weighted_sum/IdentityIdentity?linear/linear_model/mother_married/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Л
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
°
Wlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Љ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear_model/mother_married/weighted_sum/IdentityWlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stackYlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
”
Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/CastCastQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
п
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/rangeRangeOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/startHlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/CastOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Џ
Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Cast_1CastIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
™
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
—
Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear_model/mother_married/weighted_sum/Gather_1Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
≈
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffListDiffJlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Cast_1Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
•
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
•
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ƒ
Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear_model/mother_married/weighted_sum/IdentityYlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Э
Rlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
ґ
Nlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2Rlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
°
_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
°
_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Ш
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Ґ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ј
Klinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ReshapeReshapeLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
Џ
Nlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Л
Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concatConcatV2Klinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ReshapeNlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/zeros_likeOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
’
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ShapeShapeLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Ф
Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/FillFillIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ShapeIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
У
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ш
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1ConcatV28linear/linear_model/mother_married/weighted_sum/Gather_1Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concatQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
У
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
т
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2ConcatV28linear/linear_model/mother_married/weighted_sum/Gather_2Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/FillQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
щ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_28linear/linear_model/mother_married/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
Ј
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/IdentityIdentity8linear/linear_model/mother_married/weighted_sum/Identity*
T0	*
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѓ
]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѓ
]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
т
Ulinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorder[linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
и
Llinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/CastCastUlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
щ
Nlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/UniqueUniqueSlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Р
Xlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/embedding_lookupGather6linear/linear_model/mother_married/weights/part_0/readNlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*'
_output_shapes
:€€€€€€€€€
У
Glinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparseSparseSegmentSumXlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/embedding_lookupPlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Unique:1Llinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
Р
?linear/linear_model/mother_married/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ш
9linear/linear_model/mother_married/weighted_sum/Reshape_1ReshapeQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense?linear/linear_model/mother_married/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
Љ
5linear/linear_model/mother_married/weighted_sum/ShapeShapeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Н
Clinear/linear_model/mother_married/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
й
=linear/linear_model/mother_married/weighted_sum/strided_sliceStridedSlice5linear/linear_model/mother_married/weighted_sum/ShapeClinear/linear_model/mother_married/weighted_sum/strided_slice/stackElinear/linear_model/mother_married/weighted_sum/strided_slice/stack_1Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
y
7linear/linear_model/mother_married/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
п
5linear/linear_model/mother_married/weighted_sum/stackPack7linear/linear_model/mother_married/weighted_sum/stack/0=linear/linear_model/mother_married/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
ы
4linear/linear_model/mother_married/weighted_sum/TileTile9linear/linear_model/mother_married/weighted_sum/Reshape_15linear/linear_model/mother_married/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
¬
:linear/linear_model/mother_married/weighted_sum/zeros_like	ZerosLikeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
¶
/linear/linear_model/mother_married/weighted_sumSelect4linear/linear_model/mother_married/weighted_sum/Tile:linear/linear_model/mother_married/weighted_sum/zeros_likeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
¶
6linear/linear_model/mother_married/weighted_sum/Cast_1Cast2linear/linear_model/mother_married/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
З
=linear/linear_model/mother_married/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Ж
<linear/linear_model/mother_married/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
І
7linear/linear_model/mother_married/weighted_sum/Slice_1Slice6linear/linear_model/mother_married/weighted_sum/Cast_1=linear/linear_model/mother_married/weighted_sum/Slice_1/begin<linear/linear_model/mother_married/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
¶
7linear/linear_model/mother_married/weighted_sum/Shape_1Shape/linear/linear_model/mother_married/weighted_sum*
out_type0*
T0*
_output_shapes
:
З
=linear/linear_model/mother_married/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
П
<linear/linear_model/mother_married/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
®
7linear/linear_model/mother_married/weighted_sum/Slice_2Slice7linear/linear_model/mother_married/weighted_sum/Shape_1=linear/linear_model/mother_married/weighted_sum/Slice_2/begin<linear/linear_model/mother_married/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
}
;linear/linear_model/mother_married/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ђ
6linear/linear_model/mother_married/weighted_sum/concatConcatV27linear/linear_model/mother_married/weighted_sum/Slice_17linear/linear_model/mother_married/weighted_sum/Slice_2;linear/linear_model/mother_married/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
н
9linear/linear_model/mother_married/weighted_sum/Reshape_2Reshape/linear/linear_model/mother_married/weighted_sum6linear/linear_model/mother_married/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
А
5linear/linear_model/mother_race/to_sparse_input/ShapeShapeDecodeCSV:3*
out_type0*
T0*
_output_shapes
:
І
4linear/linear_model/mother_race/to_sparse_input/CastCast5linear/linear_model/mother_race/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
y
8linear/linear_model/mother_race/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
љ
8linear/linear_model/mother_race/to_sparse_input/NotEqualNotEqualDecodeCSV:38linear/linear_model/mother_race/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
°
5linear/linear_model/mother_race/to_sparse_input/WhereWhere8linear/linear_model/mother_race/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/mother_race/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
 
7linear/linear_model/mother_race/to_sparse_input/ReshapeReshapeDecodeCSV:3=linear/linear_model/mother_race/to_sparse_input/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
Ф
Clinear/linear_model/mother_race/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ц
=linear/linear_model/mother_race/to_sparse_input/strided_sliceStridedSlice5linear/linear_model/mother_race/to_sparse_input/WhereClinear/linear_model/mother_race/to_sparse_input/strided_slice/stackElinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_1Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ш
Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ш
Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
В
?linear/linear_model/mother_race/to_sparse_input/strided_slice_1StridedSlice5linear/linear_model/mother_race/to_sparse_input/WhereElinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stackGlinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_1Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
±
7linear/linear_model/mother_race/to_sparse_input/unstackUnpack4linear/linear_model/mother_race/to_sparse_input/Cast*	
num*
T0	*
_output_shapes
: : *

axis 
≤
5linear/linear_model/mother_race/to_sparse_input/stackPack9linear/linear_model/mother_race/to_sparse_input/unstack:1*
N*
T0	*
_output_shapes
:*

axis 
д
3linear/linear_model/mother_race/to_sparse_input/MulMul?linear/linear_model/mother_race/to_sparse_input/strided_slice_15linear/linear_model/mother_race/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
П
Elinear/linear_model/mother_race/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Б
3linear/linear_model/mother_race/to_sparse_input/SumSum3linear/linear_model/mother_race/to_sparse_input/MulElinear/linear_model/mother_race/to_sparse_input/Sum/reduction_indices*#
_output_shapes
:€€€€€€€€€*
T0	*
	keep_dims( *

Tidx0
№
3linear/linear_model/mother_race/to_sparse_input/AddAdd=linear/linear_model/mother_race/to_sparse_input/strided_slice3linear/linear_model/mother_race/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
К
6linear/linear_model/mother_race/to_sparse_input/GatherGather7linear/linear_model/mother_race/to_sparse_input/Reshape3linear/linear_model/mother_race/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
ы
8linear/linear_model/mother_race/mother_race_lookup/ConstConst*
dtype0*О
valueДBБBWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese*
_output_shapes
:
y
7linear/linear_model/mother_race/mother_race_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
А
>linear/linear_model/mother_race/mother_race_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
А
>linear/linear_model/mother_race/mother_race_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ґ
8linear/linear_model/mother_race/mother_race_lookup/rangeRange>linear/linear_model/mother_race/mother_race_lookup/range/start7linear/linear_model/mother_race/mother_race_lookup/Size>linear/linear_model/mother_race/mother_race_lookup/range/delta*

Tidx0*
_output_shapes
:
∞
:linear/linear_model/mother_race/mother_race_lookup/ToInt64Cast8linear/linear_model/mother_race/mother_race_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
…
=linear/linear_model/mother_race/mother_race_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
О
Clinear/linear_model/mother_race/mother_race_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
™
Hlinear/linear_model/mother_race/mother_race_lookup/hash_table/table_initInitializeTableV2=linear/linear_model/mother_race/mother_race_lookup/hash_table8linear/linear_model/mother_race/mother_race_lookup/Const:linear/linear_model/mother_race/mother_race_lookup/ToInt64*

Tkey0*

Tval0	
Њ
1linear/linear_model/mother_race/hash_table_LookupLookupTableFindV2=linear/linear_model/mother_race/mother_race_lookup/hash_table6linear/linear_model/mother_race/to_sparse_input/GatherClinear/linear_model/mother_race/mother_race_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ь
*linear/linear_model/mother_race/Shape/CastCast4linear/linear_model/mother_race/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/mother_race/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/mother_race/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

5linear/linear_model/mother_race/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ю
-linear/linear_model/mother_race/strided_sliceStridedSlice*linear/linear_model/mother_race/Shape/Cast3linear/linear_model/mother_race/strided_slice/stack5linear/linear_model/mother_race/strided_slice/stack_15linear/linear_model/mother_race/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
s
(linear/linear_model/mother_race/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ѕ
&linear/linear_model/mother_race/Cast/xPack-linear/linear_model/mother_race/strided_slice(linear/linear_model/mother_race/Cast/x/1*
N*
T0*
_output_shapes
:*

axis 
И
$linear/linear_model/mother_race/CastCast&linear/linear_model/mother_race/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
А
-linear/linear_model/mother_race/SparseReshapeSparseReshape5linear/linear_model/mother_race/to_sparse_input/Where4linear/linear_model/mother_race/to_sparse_input/Cast$linear/linear_model/mother_race/Cast*-
_output_shapes
:€€€€€€€€€:
£
6linear/linear_model/mother_race/SparseReshape/IdentityIdentity1linear/linear_model/mother_race/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
Ў
@linear/linear_model/mother_race/weights/part_0/Initializer/zerosConst*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
valueB*    *
_output_shapes

:
е
.linear/linear_model/mother_race/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
shared_name 
∆
5linear/linear_model/mother_race/weights/part_0/AssignAssign.linear/linear_model/mother_race/weights/part_0@linear/linear_model/mother_race/weights/part_0/Initializer/zeros*
validate_shape(*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
use_locking(*
T0*
_output_shapes

:
џ
3linear/linear_model/mother_race/weights/part_0/readIdentity.linear/linear_model/mother_race/weights/part_0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
T0*
_output_shapes

:
В
8linear/linear_model/mother_race/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/mother_race/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
С
2linear/linear_model/mother_race/weighted_sum/SliceSlice/linear/linear_model/mother_race/SparseReshape:18linear/linear_model/mother_race/weighted_sum/Slice/begin7linear/linear_model/mother_race/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
|
2linear/linear_model/mother_race/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
я
1linear/linear_model/mother_race/weighted_sum/ProdProd2linear/linear_model/mother_race/weighted_sum/Slice2linear/linear_model/mother_race/weighted_sum/Const*
_output_shapes
: *
T0	*
	keep_dims( *

Tidx0
}
;linear/linear_model/mother_race/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
3linear/linear_model/mother_race/weighted_sum/GatherGather/linear/linear_model/mother_race/SparseReshape:1;linear/linear_model/mother_race/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ё
3linear/linear_model/mother_race/weighted_sum/Cast/xPack1linear/linear_model/mother_race/weighted_sum/Prod3linear/linear_model/mother_race/weighted_sum/Gather*
N*
T0	*
_output_shapes
:*

axis 
П
:linear/linear_model/mother_race/weighted_sum/SparseReshapeSparseReshape-linear/linear_model/mother_race/SparseReshape/linear/linear_model/mother_race/SparseReshape:13linear/linear_model/mother_race/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
µ
Clinear/linear_model/mother_race/weighted_sum/SparseReshape/IdentityIdentity6linear/linear_model/mother_race/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
}
;linear/linear_model/mother_race/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
щ
9linear/linear_model/mother_race/weighted_sum/GreaterEqualGreaterEqualClinear/linear_model/mother_race/weighted_sum/SparseReshape/Identity;linear/linear_model/mother_race/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Я
2linear/linear_model/mother_race/weighted_sum/WhereWhere9linear/linear_model/mother_race/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Н
:linear/linear_model/mother_race/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
л
4linear/linear_model/mother_race/weighted_sum/ReshapeReshape2linear/linear_model/mother_race/weighted_sum/Where:linear/linear_model/mother_race/weighted_sum/Reshape/shape*#
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
С
5linear/linear_model/mother_race/weighted_sum/Gather_1Gather:linear/linear_model/mother_race/weighted_sum/SparseReshape4linear/linear_model/mother_race/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ц
5linear/linear_model/mother_race/weighted_sum/Gather_2GatherClinear/linear_model/mother_race/weighted_sum/SparseReshape/Identity4linear/linear_model/mother_race/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/mother_race/weighted_sum/IdentityIdentity<linear/linear_model/mother_race/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
И
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ю
Tlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice5linear/linear_model/mother_race/weighted_sum/IdentityTlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stackVlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/CastCastNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
г
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/rangeRangeLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/startElinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/CastLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
‘
Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Cast_1CastFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
І
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
¬
Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice5linear/linear_model/mother_race/weighted_sum/Gather_1Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackXlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Љ
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffListDiffGlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Cast_1Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
µ
Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice5linear/linear_model/mother_race/weighted_sum/IdentityVlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackXlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ъ
Olinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≠
Klinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsPlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2Olinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ю
\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ю
\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Й
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffKlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Я
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ѓ
Hlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ReshapeReshapeIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape/shape*'
_output_shapes
:€€€€€€€€€*
T0	*
Tshape0
‘
Klinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeHlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
€
Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concatConcatV2Hlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ReshapeKlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/zeros_likeLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
ѕ
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ShapeShapeIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Л
Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/FillFillFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ShapeFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
м
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1ConcatV25linear/linear_model/mother_race/weighted_sum/Gather_1Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concatNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1/axis*
N*

Tidx0*'
_output_shapes
:€€€€€€€€€*
T0	
Р
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ж
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2ConcatV25linear/linear_model/mother_race/weighted_sum/Gather_2Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/FillNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0	
н
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_25linear/linear_model/mother_race/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
±
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/IdentityIdentity5linear/linear_model/mother_race/weighted_sum/Identity*
T0	*
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
Rlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorderXlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stackZlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
в
Ilinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/CastCastRlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
у
Klinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/UniqueUniquePlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
Ulinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/embedding_lookupGather3linear/linear_model/mother_race/weights/part_0/readKlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*'
_output_shapes
:€€€€€€€€€
З
Dlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparseSparseSegmentSumUlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/embedding_lookupMlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Unique:1Ilinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:€€€€€€€€€*
T0*

Tidx0
Н
<linear/linear_model/mother_race/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
П
6linear/linear_model/mother_race/weighted_sum/Reshape_1ReshapeNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense<linear/linear_model/mother_race/weighted_sum/Reshape_1/shape*'
_output_shapes
:€€€€€€€€€*
T0
*
Tshape0
ґ
2linear/linear_model/mother_race/weighted_sum/ShapeShapeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
К
@linear/linear_model/mother_race/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Џ
:linear/linear_model/mother_race/weighted_sum/strided_sliceStridedSlice2linear/linear_model/mother_race/weighted_sum/Shape@linear/linear_model/mother_race/weighted_sum/strided_slice/stackBlinear/linear_model/mother_race/weighted_sum/strided_slice/stack_1Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
4linear/linear_model/mother_race/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ж
2linear/linear_model/mother_race/weighted_sum/stackPack4linear/linear_model/mother_race/weighted_sum/stack/0:linear/linear_model/mother_race/weighted_sum/strided_slice*
N*
T0*
_output_shapes
:*

axis 
т
1linear/linear_model/mother_race/weighted_sum/TileTile6linear/linear_model/mother_race/weighted_sum/Reshape_12linear/linear_model/mother_race/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
Љ
7linear/linear_model/mother_race/weighted_sum/zeros_like	ZerosLikeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ъ
,linear/linear_model/mother_race/weighted_sumSelect1linear/linear_model/mother_race/weighted_sum/Tile7linear/linear_model/mother_race/weighted_sum/zeros_likeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
†
3linear/linear_model/mother_race/weighted_sum/Cast_1Cast/linear/linear_model/mother_race/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Д
:linear/linear_model/mother_race/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/mother_race/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ы
4linear/linear_model/mother_race/weighted_sum/Slice_1Slice3linear/linear_model/mother_race/weighted_sum/Cast_1:linear/linear_model/mother_race/weighted_sum/Slice_1/begin9linear/linear_model/mother_race/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
†
4linear/linear_model/mother_race/weighted_sum/Shape_1Shape,linear/linear_model/mother_race/weighted_sum*
out_type0*
T0*
_output_shapes
:
Д
:linear/linear_model/mother_race/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
М
9linear/linear_model/mother_race/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ь
4linear/linear_model/mother_race/weighted_sum/Slice_2Slice4linear/linear_model/mother_race/weighted_sum/Shape_1:linear/linear_model/mother_race/weighted_sum/Slice_2/begin9linear/linear_model/mother_race/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
z
8linear/linear_model/mother_race/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Я
3linear/linear_model/mother_race/weighted_sum/concatConcatV24linear/linear_model/mother_race/weighted_sum/Slice_14linear/linear_model/mother_race/weighted_sum/Slice_28linear/linear_model/mother_race/weighted_sum/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
д
6linear/linear_model/mother_race/weighted_sum/Reshape_2Reshape,linear/linear_model/mother_race/weighted_sum3linear/linear_model/mother_race/weighted_sum/concat*'
_output_shapes
:€€€€€€€€€*
T0*
Tshape0
ћ
(linear/linear_model/weighted_sum_no_biasAddN6linear/linear_model/alcohol_use/weighted_sum/Reshape_2Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_28linear/linear_model/cigarette_use/weighted_sum/Reshape_22linear/linear_model/is_male/weighted_sum/Reshape_29linear/linear_model/mother_married/weighted_sum/Reshape_26linear/linear_model/mother_race/weighted_sum/Reshape_2*'
_output_shapes
:€€€€€€€€€*
T0*
N
¬
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
valueB*    *
_output_shapes
:
ѕ
'linear/linear_model/bias_weights/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
shared_name 
¶
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
¬
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
T0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
ј
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*'
_output_shapes
:€€€€€€€€€*
T0*
data_formatNHWC
^
linear/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Т
linear/zero_fraction/EqualEqual linear/linear_model/weighted_sumlinear/zero_fraction/zero*
T0*'
_output_shapes
:€€€€€€€€€
~
linear/zero_fraction/CastCastlinear/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
k
linear/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
Р
*linear/linear/fraction_of_zero_values/tagsConst*
dtype0*6
value-B+ B%linear/linear/fraction_of_zero_values*
_output_shapes
: 
Ю
%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
u
linear/linear/activation/tagConst*
dtype0*)
value B Blinear/linear/activation*
_output_shapes
: 
Н
linear/linear/activationHistogramSummarylinear/linear/activation/tag linear/linear_model/weighted_sum*
T0*
_output_shapes
: 
r
addAdddnn/logits/BiasAdd linear/linear_model/weighted_sum*
T0*'
_output_shapes
:€€€€€€€€€
w
"regression_head/predictions/scoresSqueezeadd*
squeeze_dims
*
T0*#
_output_shapes
:€€€€€€€€€
В
$regression_head/predictions/IdentityIdentity"regression_head/predictions/scores*
T0*#
_output_shapes
:€€€€€€€€€
n
%regression_head/mean_squared_loss/subSubadd	DecodeCSV*
T0*'
_output_shapes
:€€€€€€€€€
Д
!regression_head/mean_squared_lossSquare%regression_head/mean_squared_loss/sub*
T0*'
_output_shapes
:€€€€€€€€€
}
,regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
љ
&regression_head/mean_squared_loss/lossMean!regression_head/mean_squared_loss,regression_head/mean_squared_loss/loss/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
g
"regression_head/ScalarSummary/tagsConst*
dtype0*
valueB
 Bloss*
_output_shapes
: 
Ы
regression_head/ScalarSummaryScalarSummary"regression_head/ScalarSummary/tags&regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
g
"regression_head/metrics/mean/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ж
"regression_head/metrics/mean/total
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ь
)regression_head/metrics/mean/total/AssignAssign"regression_head/metrics/mean/total"regression_head/metrics/mean/zeros*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking(*
T0*
_output_shapes
: 
ѓ
'regression_head/metrics/mean/total/readIdentity"regression_head/metrics/mean/total*5
_class+
)'loc:@regression_head/metrics/mean/total*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 
Ж
"regression_head/metrics/mean/count
VariableV2*
dtype0*
shape: *
	container *
shared_name *
_output_shapes
: 
ю
)regression_head/metrics/mean/count/AssignAssign"regression_head/metrics/mean/count$regression_head/metrics/mean/zeros_1*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking(*
T0*
_output_shapes
: 
ѓ
'regression_head/metrics/mean/count/readIdentity"regression_head/metrics/mean/count*5
_class+
)'loc:@regression_head/metrics/mean/count*
T0*
_output_shapes
: 
c
!regression_head/metrics/mean/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Б
&regression_head/metrics/mean/ToFloat_1Cast!regression_head/metrics/mean/Size*

DstT0*

SrcT0*
_output_shapes
: 
e
"regression_head/metrics/mean/ConstConst*
dtype0*
valueB *
_output_shapes
: 
±
 regression_head/metrics/mean/SumSum&regression_head/mean_squared_loss/loss"regression_head/metrics/mean/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
д
&regression_head/metrics/mean/AssignAdd	AssignAdd"regression_head/metrics/mean/total regression_head/metrics/mean/Sum*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking( *
T0*
_output_shapes
: 
Х
(regression_head/metrics/mean/AssignAdd_1	AssignAdd"regression_head/metrics/mean/count&regression_head/metrics/mean/ToFloat_1'^regression_head/mean_squared_loss/loss*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking( *
T0*
_output_shapes
: 
k
&regression_head/metrics/mean/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
°
$regression_head/metrics/mean/GreaterGreater'regression_head/metrics/mean/count/read&regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
Ґ
$regression_head/metrics/mean/truedivRealDiv'regression_head/metrics/mean/total/read'regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
њ
"regression_head/metrics/mean/valueSelect$regression_head/metrics/mean/Greater$regression_head/metrics/mean/truediv$regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
¶
&regression_head/metrics/mean/Greater_1Greater(regression_head/metrics/mean/AssignAdd_1(regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
§
&regression_head/metrics/mean/truediv_1RealDiv&regression_head/metrics/mean/AssignAdd(regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ћ
&regression_head/metrics/mean/update_opSelect&regression_head/metrics/mean/Greater_1&regression_head/metrics/mean/truediv_1(regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
;

group_depsNoOp'^regression_head/metrics/mean/update_op
{
eval_step/Initializer/zerosConst*
dtype0	*
_class
loc:@eval_step*
value	B	 R *
_output_shapes
: 
Л
	eval_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@eval_step*
shared_name 
™
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
validate_shape(*
_class
loc:@eval_step*
use_locking(*
T0	*
_output_shapes
: 
d
eval_step/readIdentity	eval_step*
_class
loc:@eval_step*
T0	*
_output_shapes
: 
Q
AssignAdd/valueConst*
dtype0	*
value	B	 R*
_output_shapes
: 
Д
	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
_class
loc:@eval_step*
use_locking( *
T0	*
_output_shapes
: 
Б
initNoOp^global_step/Assigna^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign6^linear/linear_model/alcohol_use/weights/part_0/AssignF^linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Assign8^linear/linear_model/cigarette_use/weights/part_0/Assign2^linear/linear_model/is_male/weights/part_0/Assign9^linear/linear_model/mother_married/weights/part_0/Assign6^linear/linear_model/mother_race/weights/part_0/Assign/^linear/linear_model/bias_weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1
Я
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
љ
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes
: 
Ћ
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
…
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ћ
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
…
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
љ
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
ї
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
з
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitialized.linear/linear_model/alcohol_use/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
_output_shapes
: 
З
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
_output_shapes
: 
м
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized0linear/linear_model/cigarette_use/weights/part_0*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized*linear/linear_model/is_male/weights/part_0*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
_output_shapes
: 
о
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized1linear/linear_model/mother_married/weights/part_0*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
_output_shapes
: 
и
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized.linear/linear_model/mother_race/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
_output_shapes
: 
Џ
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
∞
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedmatching_filenames*
dtype0*%
_class
loc:@matching_filenames*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized"input_producer/limit_epochs/epochs*
dtype0	*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized"regression_head/metrics/mean/total*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/total*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized"regression_head/metrics/mean/count*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/count*
_output_shapes
: 
Ю
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized	eval_step*
dtype0	*
_class
loc:@eval_step*
_output_shapes
: 
ќ	
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_19*
N*
T0
*
_output_shapes
:*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
ц
$report_uninitialized_variables/ConstConst*
dtype0*Э
valueУBРBglobal_stepBYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0B dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B.linear/linear_model/alcohol_use/weights/part_0B>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0B0linear/linear_model/cigarette_use/weights/part_0B*linear/linear_model/is_male/weights/part_0B1linear/linear_model/mother_married/weights/part_0B.linear/linear_model/mother_race/weights/part_0B'linear/linear_model/bias_weights/part_0Bmatching_filenamesB"input_producer/limit_epochs/epochsB"regression_head/metrics/mean/totalB"regression_head/metrics/mean/countB	eval_step*
_output_shapes
:
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Й
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ў
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
М
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
х
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
Н
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
б
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
ѓ
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
N*
T0*
_output_shapes
:*

axis 
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ђ
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Ћ
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
_output_shapes
:*
T0*
Tshape0
О
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
џ
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
_output_shapes
:*
T0
*
Tshape0
Ъ
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:€€€€€€€€€
ґ
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:€€€€€€€€€
В
2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
g
$report_uninitialized_resources/ConstConst*
dtype0*
valueB *
_output_shapes
: 
M
concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Љ
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*
N*

Tidx0*#
_output_shapes
:€€€€€€€€€*
T0
°
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
њ
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes
: 
Ќ
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Ћ
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ќ
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Ћ
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
њ
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
љ
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
й
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitialized.linear/linear_model/alcohol_use/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
_output_shapes
: 
Й
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
_output_shapes
: 
о
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized0linear/linear_model/cigarette_use/weights/part_0*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
_output_shapes
: 
в
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized*linear/linear_model/is_male/weights/part_0*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
_output_shapes
: 
р
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized1linear/linear_model/mother_married/weights/part_0*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
_output_shapes
: 
к
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized.linear/linear_model/mother_race/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
_output_shapes
: 
№
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
—
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_14*
N*
T0
*
_output_shapes
:*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
н
&report_uninitialized_variables_1/ConstConst*
dtype0*Т
valueИBЕBglobal_stepBYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0B dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B.linear/linear_model/alcohol_use/weights/part_0B>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0B0linear/linear_model/cigarette_use/weights/part_0B*linear/linear_model/is_male/weights/part_0B1linear/linear_model/mother_married/weights/part_0B.linear/linear_model/mother_race/weights/part_0B'linear/linear_model/bias_weights/part_0*
_output_shapes
:
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
г
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
О
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ы
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:
П
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
П
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
л
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
≥
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
N*
T0*
_output_shapes
:*

axis 
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
≥
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
—
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
_output_shapes
:*
T0*
Tshape0
Р
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
б
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
_output_shapes
:*
T0
*
Tshape0
Ю
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:€€€€€€€€€
Ї
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:€€€€€€€€€
И
4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ѕ
init_2NoOp^matching_filenames/Assign*^input_producer/limit_epochs/epochs/Assign*^regression_head/metrics/mean/total/Assign*^regression_head/metrics/mean/count/Assign^eval_step/Assign
К
init_all_tablesNoOpj^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initI^linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/table_init[^linear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/table_initA^linear/linear_model/is_male/is_male_lookup/hash_table/table_initO^linear/linear_model/mother_married/mother_married_lookup/hash_table/table_initI^linear/linear_model/mother_race/mother_race_lookup/hash_table/table_init
/
group_deps_2NoOp^init_2^init_all_tables
ђ
Merge/MergeSummaryMergeSummary"input_producer/fraction_of_32_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation%linear/linear/fraction_of_zero_valueslinear/linear/activationregression_head/ScalarSummary*
_output_shapes
: *
N

P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
Д
save/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_82622d2e5d444cd481224ae9bfb942cb/part*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
_output_shapes
: *
	separator *
N
Q
save/num_shardsConst*
dtype0*
value	B :*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
dtype0*
value	B : *
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
э
save/SaveV2/tensor_namesConst*
dtype0*∞
value¶B£Bdnn/hiddenlayer_0/biasesBdnn/hiddenlayer_0/weightsBdnn/hiddenlayer_1/biasesBdnn/hiddenlayer_1/weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBdnn/logits/biasesBdnn/logits/weightsBglobal_stepB'linear/linear_model/alcohol_use/weightsB7linear/linear_model/alcohol_use_X_cigarette_use/weightsB linear/linear_model/bias_weightsB)linear/linear_model/cigarette_use/weightsB#linear/linear_model/is_male/weightsB*linear/linear_model/mother_married/weightsB'linear/linear_model/mother_race/weights*
_output_shapes
:
Ц
save/SaveV2/shape_and_slicesConst*
dtype0*≈
valueїBЄB32 0,32B7 32 0,7:0,32B16 0,16B32 16 0,32:0,16B12 4 0,12:0,4B1 0,1B16 1 0,16:0,1B B3 1 0,3:0,1B9 1 0,9:0,1B1 0,1B3 1 0,3:0,1B2 1 0,2:0,1B2 1 0,2:0,1B12 1 0,12:0,1*
_output_shapes
:
≈
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/read%dnn/hiddenlayer_0/weights/part_0/read$dnn/hiddenlayer_1/biases/part_0/read%dnn/hiddenlayer_1/weights/part_0/read^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readdnn/logits/biases/part_0/readdnn/logits/weights/part_0/readglobal_step3linear/linear_model/alcohol_use/weights/part_0/readClinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read,linear/linear_model/bias_weights/part_0/read5linear/linear_model/cigarette_use/weights/part_0/read/linear/linear_model/is_male/weights/part_0/read6linear/linear_model/mother_married/weights/part_0/read3linear/linear_model/mother_race/weights/part_0/read*
dtypes
2	
С
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
T0*
_output_shapes
: 
Э
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
N*
T0*
_output_shapes
:*

axis 
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
|
save/RestoreV2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_0/biases*
_output_shapes
:
o
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueBB32 0,32*
_output_shapes
:
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
»
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes
: 

save/RestoreV2_1/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_0/weights*
_output_shapes
:
w
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*"
valueBB7 32 0,7:0,32*
_output_shapes
:
Ц
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
“
save/Assign_1Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_1*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
~
save/RestoreV2_2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_1/biases*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueBB16 0,16*
_output_shapes
:
Ц
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
ћ
save/Assign_2Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:

save/RestoreV2_3/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_1/weights*
_output_shapes
:
y
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*$
valueBB32 16 0,32:0,16*
_output_shapes
:
Ц
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
“
save/Assign_3Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_3*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
Є
save/RestoreV2_4/tensor_namesConst*
dtype0*g
value^B\BRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights*
_output_shapes
:
w
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*"
valueBB12 4 0,12:0,4*
_output_shapes
:
Ц
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
ƒ
save/Assign_4AssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0save/RestoreV2_4*
validate_shape(*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
use_locking(*
T0*
_output_shapes

:
w
save/RestoreV2_5/tensor_namesConst*
dtype0*&
valueBBdnn/logits/biases*
_output_shapes
:
o
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:
Ц
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
Њ
save/Assign_5Assigndnn/logits/biases/part_0save/RestoreV2_5*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
x
save/RestoreV2_6/tensor_namesConst*
dtype0*'
valueBBdnn/logits/weights*
_output_shapes
:
w
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*"
valueBB16 1 0,16:0,1*
_output_shapes
:
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
ƒ
save/Assign_6Assigndnn/logits/weights/part_0save/RestoreV2_6*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

:
q
save/RestoreV2_7/tensor_namesConst*
dtype0* 
valueBBglobal_step*
_output_shapes
:
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ц
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2	*
_output_shapes
:
†
save/Assign_7Assignglobal_stepsave/RestoreV2_7*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
Н
save/RestoreV2_8/tensor_namesConst*
dtype0*<
value3B1B'linear/linear_model/alcohol_use/weights*
_output_shapes
:
u
!save/RestoreV2_8/shape_and_slicesConst*
dtype0* 
valueBB3 1 0,3:0,1*
_output_shapes
:
Ц
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_8Assign.linear/linear_model/alcohol_use/weights/part_0save/RestoreV2_8*
validate_shape(*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Э
save/RestoreV2_9/tensor_namesConst*
dtype0*L
valueCBAB7linear/linear_model/alcohol_use_X_cigarette_use/weights*
_output_shapes
:
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0* 
valueBB9 1 0,9:0,1*
_output_shapes
:
Ц
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
О
save/Assign_9Assign>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0save/RestoreV2_9*
validate_shape(*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:	
З
save/RestoreV2_10/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/bias_weights*
_output_shapes
:
p
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:
Щ
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
ё
save/Assign_10Assign'linear/linear_model/bias_weights/part_0save/RestoreV2_10*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
Р
save/RestoreV2_11/tensor_namesConst*
dtype0*>
value5B3B)linear/linear_model/cigarette_use/weights*
_output_shapes
:
v
"save/RestoreV2_11/shape_and_slicesConst*
dtype0* 
valueBB3 1 0,3:0,1*
_output_shapes
:
Щ
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
ф
save/Assign_11Assign0linear/linear_model/cigarette_use/weights/part_0save/RestoreV2_11*
validate_shape(*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
К
save/RestoreV2_12/tensor_namesConst*
dtype0*8
value/B-B#linear/linear_model/is_male/weights*
_output_shapes
:
v
"save/RestoreV2_12/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:
Щ
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
и
save/Assign_12Assign*linear/linear_model/is_male/weights/part_0save/RestoreV2_12*
validate_shape(*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
use_locking(*
T0*
_output_shapes

:
С
save/RestoreV2_13/tensor_namesConst*
dtype0*?
value6B4B*linear/linear_model/mother_married/weights*
_output_shapes
:
v
"save/RestoreV2_13/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:
Щ
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
ц
save/Assign_13Assign1linear/linear_model/mother_married/weights/part_0save/RestoreV2_13*
validate_shape(*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
use_locking(*
T0*
_output_shapes

:
О
save/RestoreV2_14/tensor_namesConst*
dtype0*<
value3B1B'linear/linear_model/mother_race/weights*
_output_shapes
:
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*"
valueBB12 1 0,12:0,1*
_output_shapes
:
Щ
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
р
save/Assign_14Assign.linear/linear_model/mother_race/weights/part_0save/RestoreV2_14*
validate_shape(*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Н
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14
-
save/restore_allNoOp^save/restore_shard"ИWm’∞     ИКЦ	6=F{Б÷AJЗа
ё7Љ7
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	АР
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeintИ
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
p
	AssignAdd
ref"TА

value"T

output_ref"TА"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
F
	CountUpTo
ref"TА
output"T"
limitint"
Ttype:
2	
Л
	DecodeCSV
records
record_defaults2OUT_TYPE
output2OUT_TYPE"$
OUT_TYPE
list(type)(0:
2	"
field_delimstring,
A
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
Ѓ
FIFOQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityint€€€€€€€€€"
	containerstring "
shared_namestring И
4
Fill
dims

value"T
output"T"	
Ttype
М
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
:
Greater
x"T
y"T
z
"
Ttype:
2		
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
°
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetypeИ
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
b
InitializeTableV2
table_handle
keys"Tkey
values"Tval"
Tkeytype"
TvaltypeИ
N
IsVariableInitialized
ref"dtypeА
is_initialized
"
dtypetypeШ
\
ListDiff
x"T
y"T
out"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	


LogicalNot
x

y

w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
TouttypeИ
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
+
MatchingFiles
pattern
	filenames
К
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
b
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
<
Mul
x"T
y"T
z"T"
Ttype:
2	Р

NoOp
D
NotEqual
x"T
y"T
z
"
Ttype:
2	
Р
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
К
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
B
QueueCloseV2

handle"#
cancel_pending_enqueuesbool( И
}
QueueEnqueueManyV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint€€€€€€€€€И
&
QueueSizeV2

handle
sizeИ
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
a
ReaderReadUpToV2
reader_handle
queue_handle
num_records	
keys

valuesИ
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
A
Relu
features"T
activations"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
р
SparseCross
indices	*N
values2sparse_types
shapes	*N
dense_inputs2dense_types
output_indices	
output_values"out_type
output_shape	"

Nint("
hashed_outputbool"
num_bucketsint("
hash_keyint"$
sparse_types
list(type)(:
2	"#
dense_types
list(type)(:
2	"
out_typetype:
2	"
internal_typetype:
2	
y
SparseReorder
input_indices	
input_values"T
input_shape	
output_indices	
output_values"T"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
z
SparseSegmentMean	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2"
Tidxtype0:
2	
А
SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2		"
Tidxtype0:
2	
Љ
SparseToDense
sparse_indices"Tindices
output_shape"Tindices
sparse_values"T
default_value"T

dense"T"
validate_indicesbool("	
Ttype"
Tindicestype:
2	
0
Square
x"T
y"T"
Ttype:
	2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
ц
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
Й
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
z
TextLineReaderV2
reader_handle"
skip_header_linesint "
	containerstring "
shared_namestring И
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И

Where	
input
	
index	
&
	ZerosLike
x"T
y"T"	
Ttype*1.2.02v1.2.0-rc2-21-g12f033d’г

global_step/Initializer/zerosConst*
dtype0	*
_class
loc:@global_step*
value	B	 R *
_output_shapes
: 
П
global_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@global_step*
shared_name 
≤
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_class
loc:@global_step*
T0	*
_output_shapes
: 
З
(matching_filenames/MatchingFiles/patternConst*
dtype0*/
value&B$ Bdata/babyweight/eval-data.csv**
_output_shapes
: 
А
 matching_filenames/MatchingFilesMatchingFiles(matching_filenames/MatchingFiles/pattern*#
_output_shapes
:€€€€€€€€€
z
matching_filenames
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:
„
matching_filenames/AssignAssignmatching_filenames matching_filenames/MatchingFiles*
validate_shape( *%
_class
loc:@matching_filenames*
use_locking(*
T0*#
_output_shapes
:€€€€€€€€€
Б
matching_filenames/readIdentitymatching_filenames*%
_class
loc:@matching_filenames*
T0*
_output_shapes
:
e
input_producer/SizeSizematching_filenames/read*
out_type0*
T0*
_output_shapes
: 
Z
input_producer/Greater/yConst*
dtype0*
value	B : *
_output_shapes
: 
q
input_producer/GreaterGreaterinput_producer/Sizeinput_producer/Greater/y*
T0*
_output_shapes
: 
Т
input_producer/Assert/ConstConst*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 
Ъ
#input_producer/Assert/Assert/data_0Const*
dtype0*G
value>B< B6string_input_producer requires a non-null input tensor*
_output_shapes
: 
А
input_producer/Assert/AssertAssertinput_producer/Greater#input_producer/Assert/Assert/data_0*
	summarize*

T
2
~
input_producer/IdentityIdentitymatching_filenames/read^input_producer/Assert/Assert*
T0*
_output_shapes
:
c
!input_producer/limit_epochs/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ж
"input_producer/limit_epochs/epochs
VariableV2*
dtype0	*
shape: *
shared_name *
	container *
_output_shapes
: 
ы
)input_producer/limit_epochs/epochs/AssignAssign"input_producer/limit_epochs/epochs!input_producer/limit_epochs/Const*
validate_shape(*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
use_locking(*
T0	*
_output_shapes
: 
ѓ
'input_producer/limit_epochs/epochs/readIdentity"input_producer/limit_epochs/epochs*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
T0	*
_output_shapes
: 
ї
%input_producer/limit_epochs/CountUpTo	CountUpTo"input_producer/limit_epochs/epochs*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
limit*
T0	*
_output_shapes
: 
Л
input_producer/limit_epochsIdentityinput_producer/Identity&^input_producer/limit_epochs/CountUpTo*
T0*
_output_shapes
:
У
input_producerFIFOQueueV2*
capacity *
component_types
2*
_output_shapes
: *
shapes
: *
	container *
shared_name 
Э
)input_producer/input_producer_EnqueueManyQueueEnqueueManyV2input_producerinput_producer/limit_epochs*

timeout_ms€€€€€€€€€*
Tcomponents
2
b
#input_producer/input_producer_CloseQueueCloseV2input_producer*
cancel_pending_enqueues( 
d
%input_producer/input_producer_Close_1QueueCloseV2input_producer*
cancel_pending_enqueues(
Y
"input_producer/input_producer_SizeQueueSizeV2input_producer*
_output_shapes
: 
o
input_producer/CastCast"input_producer/input_producer_Size*

DstT0*

SrcT0*
_output_shapes
: 
Y
input_producer/mul/yConst*
dtype0*
valueB
 *   =*
_output_shapes
: 
e
input_producer/mulMulinput_producer/Castinput_producer/mul/y*
T0*
_output_shapes
: 
К
'input_producer/fraction_of_32_full/tagsConst*
dtype0*3
value*B( B"input_producer/fraction_of_32_full*
_output_shapes
: 
С
"input_producer/fraction_of_32_fullScalarSummary'input_producer/fraction_of_32_full/tagsinput_producer/mul*
T0*
_output_shapes
: 
y
TextLineReaderV2TextLineReaderV2*
shared_name *
	container *
skip_header_lines *
_output_shapes
: 
_
ReaderReadUpToV2/num_recordsConst*
dtype0	*
value
B	 Rи*
_output_shapes
: 
Ш
ReaderReadUpToV2ReaderReadUpToV2TextLineReaderV2input_producerReaderReadUpToV2/num_records*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Y
ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
z

ExpandDims
ExpandDimsReaderReadUpToV2:1ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:€€€€€€€€€
h
DecodeCSV/record_defaults_0Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_1Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_2Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_3Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_4Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_5Const*
dtype0*
valueB*    *
_output_shapes
:
h
DecodeCSV/record_defaults_6Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_7Const*
dtype0*
valueBBnull*
_output_shapes
:
h
DecodeCSV/record_defaults_8Const*
dtype0*
valueBBnull*
_output_shapes
:
i
DecodeCSV/record_defaults_9Const*
dtype0*
valueBBnokey*
_output_shapes
:
Ћ
	DecodeCSV	DecodeCSV
ExpandDimsDecodeCSV/record_defaults_0DecodeCSV/record_defaults_1DecodeCSV/record_defaults_2DecodeCSV/record_defaults_3DecodeCSV/record_defaults_4DecodeCSV/record_defaults_5DecodeCSV/record_defaults_6DecodeCSV/record_defaults_7DecodeCSV/record_defaults_8DecodeCSV/record_defaults_9*
OUT_TYPE
2
*
field_delim,*‘
_output_shapesЅ
Њ:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€:€€€€€€€€€
Л
@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeShapeDecodeCSV:5*
out_type0*
T0*
_output_shapes
:
Ш
Ndnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ъ
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ъ
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
†
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeNdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackPdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
М
Jdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
†
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceJdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
д
Bdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeReshapeDecodeCSV:5Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
Ж
;dnn/input_from_feature_columns/input_layer/mother_age/ShapeShapeDecodeCSV:2*
out_type0*
T0*
_output_shapes
:
У
Idnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Х
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Х
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
З
Cdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/mother_age/ShapeIdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackKdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
З
Ednn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
С
Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceEdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
Џ
=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeReshapeDecodeCSV:2Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
°
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ShapeShapeDecodeCSV:3*
out_type0*
T0*
_output_shapes
:
й
Udnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/CastCastVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
Ъ
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
€
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqualNotEqualDecodeCSV:3Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
г
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/WhereWhereYdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
±
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
М
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ReshapeReshapeDecodeCSV:3^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
µ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Ы
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_sliceStridedSliceVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Whereddnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ј
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
є
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
є
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
І
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1StridedSliceVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Wherefdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stackhdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_1hdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
у
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/unstackUnpackUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
ф
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/stackPackZdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
«
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/MulMul`dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_slice_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
∞
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
д
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/SumSumTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Mulfdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
њ
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/AddAdd^dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/strided_sliceTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
н
Wdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/GatherGatherXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ReshapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ь
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ConstConst*
dtype0*О
valueДBБBWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese*
_output_shapes
:
Ъ
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
°
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
°
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
¶
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startXdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Size_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/delta*

Tidx0*
_output_shapes
:
т
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
к
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
ѓ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
Ѓ
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initInitializeTableV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Const[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64*

Tkey0*

Tval0	
¬
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Gatherddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
ї
|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB"      *
_output_shapes
:
Ѓ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *    *
_output_shapes
: 
∞
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *   ?*
_output_shapes
: 
’
Жdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
_output_shapes

:*
dtype0*
seed2 *

seed *
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
†
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMulЖdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
Н
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
ї
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
shared_name 
э
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal*
validate_shape(*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
use_locking(*
T0*
_output_shapes

:
№
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*
_output_shapes

:
і
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
≥
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ќ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SliceSliceUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castjdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
Ѓ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ConstConst*
dtype0*
valueB: *
_output_shapes
:
х
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
ѓ
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
Д
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherGatherUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castmdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
у
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Prodednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather*
_output_shapes
:*

axis *
T0	*
N
¬
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapeSparseReshapeVdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/WhereUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Castednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/x*-
_output_shapes
:€€€€€€€€€:
Г
udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
ѓ
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
П
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Г
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual*'
_output_shapes
:€€€€€€€€€
њ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Б
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
І
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1Gatherldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
ђ
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_2Gatherudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
И
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
Ї
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
—
Жdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ђ
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityЖdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stackИdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_1Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
≤
wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/CastCastАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ђ
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/rangeRange~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/startwdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Є
ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast_1Castxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
Џ
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ј
Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stackКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_1Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
”
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiffListDiffydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Cast_1Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
”
Иdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
’
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
’
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≥
Вdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2StridedSlicegdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityИdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stackКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_1Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Бdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≈
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsВdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/strided_slice_2Бdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
—
Оdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
—
Оdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Ж
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDenseSparseToDense{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiff}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ExpandDimsОdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesОdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
“
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
≈
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ReshapeReshape{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiffАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
Є
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/zeros_like	ZerosLikezdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
ј
~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
«
ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concatConcatV2zdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Reshape}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/zeros_like~dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
≥
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ShapeShape{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
°
wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/FillFillxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Shapexdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
√
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
µ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1ConcatV2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_1ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concatАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
√
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ѓ
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2ConcatV2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Gather_2wdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/FillАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
ґ
Аdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorderSparseReorder{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/concat_2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
Х
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/IdentityIdentitygdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identity*
T0	*
_output_shapes
:
№
Кdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ё
Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ё
Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
в
Дdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSliceАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorderКdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackМdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Мdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
«
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/CastCastДdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
Ў
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/UniqueUniqueВdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
њ
Зdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupGather^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*'
_output_shapes
:€€€€€€€€€
—
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparseSparseSegmentMeanЗdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
њ
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
¶
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ReshapeАdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseToDensendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
Ъ
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Љ
rdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
Њ
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Њ
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
‘
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
®
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ь
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice*
_output_shapes
:*

axis *
T0*
N
И
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
†
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
в
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
ш
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1CastUdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
ґ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
µ
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
г
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
Д
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights*
out_type0*
T0*
_output_shapes
:
ґ
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
Њ
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
д
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
ђ
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
з
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
ъ
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
о
Fdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2*
out_type0*
T0*
_output_shapes
:
Ю
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Њ
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Т
Pdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
≤
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
Ќ
Hdnn/input_from_feature_columns/input_layer/mother_race_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
Е
:dnn/input_from_feature_columns/input_layer/plurality/ShapeShapeDecodeCSV:4*
out_type0*
T0*
_output_shapes
:
Т
Hdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ф
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ф
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
В
Bdnn/input_from_feature_columns/input_layer/plurality/strided_sliceStridedSlice:dnn/input_from_feature_columns/input_layer/plurality/ShapeHdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackJdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Ж
Ddnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
О
Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shapePackBdnn/input_from_feature_columns/input_layer/plurality/strided_sliceDdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1*
_output_shapes
:*

axis *
T0*
N
Ў
<dnn/input_from_feature_columns/input_layer/plurality/ReshapeReshapeDecodeCSV:4Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
«
1dnn/input_from_feature_columns/input_layer/concatConcatV2Bdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeHdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape<dnn/input_from_feature_columns/input_layer/plurality/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0*
N
«
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB"       *
_output_shapes
:
є
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *Ђ“»Њ*
_output_shapes
: 
є
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
valueB
 *Ђ“»>*
_output_shapes
: 
°
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
Ю
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes
: 
∞
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
Ґ
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
…
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
shared_name 
Ч
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
±
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

: 
≤
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
valueB *    *
_output_shapes
: 
њ
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *
_output_shapes
: *
dtype0*
shape: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
shared_name 
Ж
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes
: 
™
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
: 
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

: 
»
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€ 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
: 
°
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
data_formatNHWC*
T0*'
_output_shapes
:€€€€€€€€€ 
y
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€ 
[
dnn/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Р
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*'
_output_shapes
:€€€€€€€€€ 
x
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€ 
h
dnn/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Н
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
†
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
_output_shapes
: 
Ђ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
_output_shapes
: 
°
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
«
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB"       *
_output_shapes
:
є
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *уµЊ*
_output_shapes
: 
є
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
valueB
 *уµ>*
_output_shapes
: 
°
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

: *
dtype0*
seed2 *

seed *
T0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
Ю
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes
: 
∞
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
Ґ
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
…
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *
_output_shapes

: *
dtype0*
shape
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
shared_name 
Ч
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
±
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

: 
≤
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
valueB*    *
_output_shapes
:
њ
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
shared_name 
Ж
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:
™
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

: 
ї
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
°
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
data_formatNHWC*
T0*'
_output_shapes
:€€€€€€€€€
y
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€
]
dnn/zero_fraction_1/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ф
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*'
_output_shapes
:€€€€€€€€€
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
j
dnn/zero_fraction_1/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
У
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
†
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
dtype0*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
_output_shapes
: 
≠
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
_output_shapes
: 
°
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
є
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB"      *
_output_shapes
:
Ђ
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *0њ*
_output_shapes
: 
Ђ
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
valueB
 *0?*
_output_shapes
: 
М
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
_output_shapes

:*
dtype0*
seed2 *

seed *
T0*,
_class"
 loc:@dnn/logits/weights/part_0
В
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes
: 
Ф
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
Ж
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
ї
dnn/logits/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*,
_class"
 loc:@dnn/logits/weights/part_0*
shared_name 
ы
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Ь
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*,
_class"
 loc:@dnn/logits/weights/part_0*
T0*
_output_shapes

:
§
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
valueB*    *
_output_shapes
:
±
dnn/logits/biases/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*+
_class!
loc:@dnn/logits/biases/part_0*
shared_name 
к
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
Х
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*+
_class!
loc:@dnn/logits/biases/part_0*
T0*
_output_shapes
:
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:
≠
dnn/logits/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/logits/weights*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:€€€€€€€€€
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
М
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
data_formatNHWC*
T0*'
_output_shapes
:€€€€€€€€€
]
dnn/zero_fraction_2/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
В
dnn/zero_fraction_2/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_2/zero*
T0*'
_output_shapes
:€€€€€€€€€
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
j
dnn/zero_fraction_2/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
У
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
Т
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
_output_shapes
: 
Я
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst*
dtype0**
value!B Bdnn/dnn/logits/activation*
_output_shapes
: 
Б
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
А
5linear/linear_model/alcohol_use/to_sparse_input/ShapeShapeDecodeCSV:8*
out_type0*
T0*
_output_shapes
:
І
4linear/linear_model/alcohol_use/to_sparse_input/CastCast5linear/linear_model/alcohol_use/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
y
8linear/linear_model/alcohol_use/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
љ
8linear/linear_model/alcohol_use/to_sparse_input/NotEqualNotEqualDecodeCSV:88linear/linear_model/alcohol_use/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
°
5linear/linear_model/alcohol_use/to_sparse_input/WhereWhere8linear/linear_model/alcohol_use/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/alcohol_use/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
 
7linear/linear_model/alcohol_use/to_sparse_input/ReshapeReshapeDecodeCSV:8=linear/linear_model/alcohol_use/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
Ф
Clinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ц
=linear/linear_model/alcohol_use/to_sparse_input/strided_sliceStridedSlice5linear/linear_model/alcohol_use/to_sparse_input/WhereClinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stackElinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_1Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ц
Elinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ш
Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ш
Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
В
?linear/linear_model/alcohol_use/to_sparse_input/strided_slice_1StridedSlice5linear/linear_model/alcohol_use/to_sparse_input/WhereElinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stackGlinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_1Glinear/linear_model/alcohol_use/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
±
7linear/linear_model/alcohol_use/to_sparse_input/unstackUnpack4linear/linear_model/alcohol_use/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
≤
5linear/linear_model/alcohol_use/to_sparse_input/stackPack9linear/linear_model/alcohol_use/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
д
3linear/linear_model/alcohol_use/to_sparse_input/MulMul?linear/linear_model/alcohol_use/to_sparse_input/strided_slice_15linear/linear_model/alcohol_use/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
П
Elinear/linear_model/alcohol_use/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Б
3linear/linear_model/alcohol_use/to_sparse_input/SumSum3linear/linear_model/alcohol_use/to_sparse_input/MulElinear/linear_model/alcohol_use/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
№
3linear/linear_model/alcohol_use/to_sparse_input/AddAdd=linear/linear_model/alcohol_use/to_sparse_input/strided_slice3linear/linear_model/alcohol_use/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
К
6linear/linear_model/alcohol_use/to_sparse_input/GatherGather7linear/linear_model/alcohol_use/to_sparse_input/Reshape3linear/linear_model/alcohol_use/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Т
8linear/linear_model/alcohol_use/alcohol_use_lookup/ConstConst*
dtype0*&
valueBBTrueBFalseBNone*
_output_shapes
:
y
7linear/linear_model/alcohol_use/alcohol_use_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
А
>linear/linear_model/alcohol_use/alcohol_use_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
А
>linear/linear_model/alcohol_use/alcohol_use_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ґ
8linear/linear_model/alcohol_use/alcohol_use_lookup/rangeRange>linear/linear_model/alcohol_use/alcohol_use_lookup/range/start7linear/linear_model/alcohol_use/alcohol_use_lookup/Size>linear/linear_model/alcohol_use/alcohol_use_lookup/range/delta*

Tidx0*
_output_shapes
:
∞
:linear/linear_model/alcohol_use/alcohol_use_lookup/ToInt64Cast8linear/linear_model/alcohol_use/alcohol_use_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
…
=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
О
Clinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
™
Hlinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/table_initInitializeTableV2=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table8linear/linear_model/alcohol_use/alcohol_use_lookup/Const:linear/linear_model/alcohol_use/alcohol_use_lookup/ToInt64*

Tkey0*

Tval0	
Њ
1linear/linear_model/alcohol_use/hash_table_LookupLookupTableFindV2=linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table6linear/linear_model/alcohol_use/to_sparse_input/GatherClinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ь
*linear/linear_model/alcohol_use/Shape/CastCast4linear/linear_model/alcohol_use/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/alcohol_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/alcohol_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

5linear/linear_model/alcohol_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ю
-linear/linear_model/alcohol_use/strided_sliceStridedSlice*linear/linear_model/alcohol_use/Shape/Cast3linear/linear_model/alcohol_use/strided_slice/stack5linear/linear_model/alcohol_use/strided_slice/stack_15linear/linear_model/alcohol_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
s
(linear/linear_model/alcohol_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ѕ
&linear/linear_model/alcohol_use/Cast/xPack-linear/linear_model/alcohol_use/strided_slice(linear/linear_model/alcohol_use/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
И
$linear/linear_model/alcohol_use/CastCast&linear/linear_model/alcohol_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
А
-linear/linear_model/alcohol_use/SparseReshapeSparseReshape5linear/linear_model/alcohol_use/to_sparse_input/Where4linear/linear_model/alcohol_use/to_sparse_input/Cast$linear/linear_model/alcohol_use/Cast*-
_output_shapes
:€€€€€€€€€:
£
6linear/linear_model/alcohol_use/SparseReshape/IdentityIdentity1linear/linear_model/alcohol_use/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
Ў
@linear/linear_model/alcohol_use/weights/part_0/Initializer/zerosConst*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
valueB*    *
_output_shapes

:
е
.linear/linear_model/alcohol_use/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
shared_name 
∆
5linear/linear_model/alcohol_use/weights/part_0/AssignAssign.linear/linear_model/alcohol_use/weights/part_0@linear/linear_model/alcohol_use/weights/part_0/Initializer/zeros*
validate_shape(*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
џ
3linear/linear_model/alcohol_use/weights/part_0/readIdentity.linear/linear_model/alcohol_use/weights/part_0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
T0*
_output_shapes

:
В
8linear/linear_model/alcohol_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/alcohol_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
С
2linear/linear_model/alcohol_use/weighted_sum/SliceSlice/linear/linear_model/alcohol_use/SparseReshape:18linear/linear_model/alcohol_use/weighted_sum/Slice/begin7linear/linear_model/alcohol_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
|
2linear/linear_model/alcohol_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
я
1linear/linear_model/alcohol_use/weighted_sum/ProdProd2linear/linear_model/alcohol_use/weighted_sum/Slice2linear/linear_model/alcohol_use/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
}
;linear/linear_model/alcohol_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
3linear/linear_model/alcohol_use/weighted_sum/GatherGather/linear/linear_model/alcohol_use/SparseReshape:1;linear/linear_model/alcohol_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ё
3linear/linear_model/alcohol_use/weighted_sum/Cast/xPack1linear/linear_model/alcohol_use/weighted_sum/Prod3linear/linear_model/alcohol_use/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
П
:linear/linear_model/alcohol_use/weighted_sum/SparseReshapeSparseReshape-linear/linear_model/alcohol_use/SparseReshape/linear/linear_model/alcohol_use/SparseReshape:13linear/linear_model/alcohol_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
µ
Clinear/linear_model/alcohol_use/weighted_sum/SparseReshape/IdentityIdentity6linear/linear_model/alcohol_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
}
;linear/linear_model/alcohol_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
щ
9linear/linear_model/alcohol_use/weighted_sum/GreaterEqualGreaterEqualClinear/linear_model/alcohol_use/weighted_sum/SparseReshape/Identity;linear/linear_model/alcohol_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Я
2linear/linear_model/alcohol_use/weighted_sum/WhereWhere9linear/linear_model/alcohol_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Н
:linear/linear_model/alcohol_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
л
4linear/linear_model/alcohol_use/weighted_sum/ReshapeReshape2linear/linear_model/alcohol_use/weighted_sum/Where:linear/linear_model/alcohol_use/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
С
5linear/linear_model/alcohol_use/weighted_sum/Gather_1Gather:linear/linear_model/alcohol_use/weighted_sum/SparseReshape4linear/linear_model/alcohol_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ц
5linear/linear_model/alcohol_use/weighted_sum/Gather_2GatherClinear/linear_model/alcohol_use/weighted_sum/SparseReshape/Identity4linear/linear_model/alcohol_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/alcohol_use/weighted_sum/IdentityIdentity<linear/linear_model/alcohol_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
И
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ю
Tlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice5linear/linear_model/alcohol_use/weighted_sum/IdentityTlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackVlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/CastCastNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
г
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/rangeRangeLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/startElinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/CastLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
‘
Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Cast_1CastFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
І
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
¬
Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice5linear/linear_model/alcohol_use/weighted_sum/Gather_1Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackXlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Љ
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffGlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Cast_1Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
†
Vlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
µ
Plinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice5linear/linear_model/alcohol_use/weighted_sum/IdentityVlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackXlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Xlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ъ
Olinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≠
Klinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsPlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/strided_slice_2Olinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ю
\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Й
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffKlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ExpandDims\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values\linear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Я
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ѓ
Hlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
‘
Klinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeHlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
О
Llinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
€
Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Hlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ReshapeKlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/zeros_likeLlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
ѕ
Flinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ShapeShapeIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Л
Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/FillFillFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/ShapeFlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
м
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV25linear/linear_model/alcohol_use/weighted_sum/Gather_1Glinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concatNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
Р
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ж
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV25linear/linear_model/alcohol_use/weighted_sum/Gather_2Elinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/FillNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
н
Nlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderIlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_1Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/concat_25linear/linear_model/alcohol_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
±
Ilinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/IdentityIdentity5linear/linear_model/alcohol_use/weighted_sum/Identity*
T0	*
_output_shapes
:
©
Xlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
Rlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorderXlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackZlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Zlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
в
Ilinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/CastCastRlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
у
Klinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/UniqueUniquePlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
Ulinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGather3linear/linear_model/alcohol_use/weights/part_0/readKlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
З
Dlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumUlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/embedding_lookupMlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Unique:1Ilinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
Н
<linear/linear_model/alcohol_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
П
6linear/linear_model/alcohol_use/weighted_sum/Reshape_1ReshapeNlinear/linear_model/alcohol_use/weighted_sum/SparseFillEmptyRows/SparseToDense<linear/linear_model/alcohol_use/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
ґ
2linear/linear_model/alcohol_use/weighted_sum/ShapeShapeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
К
@linear/linear_model/alcohol_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Џ
:linear/linear_model/alcohol_use/weighted_sum/strided_sliceStridedSlice2linear/linear_model/alcohol_use/weighted_sum/Shape@linear/linear_model/alcohol_use/weighted_sum/strided_slice/stackBlinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_1Blinear/linear_model/alcohol_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
4linear/linear_model/alcohol_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ж
2linear/linear_model/alcohol_use/weighted_sum/stackPack4linear/linear_model/alcohol_use/weighted_sum/stack/0:linear/linear_model/alcohol_use/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
т
1linear/linear_model/alcohol_use/weighted_sum/TileTile6linear/linear_model/alcohol_use/weighted_sum/Reshape_12linear/linear_model/alcohol_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
Љ
7linear/linear_model/alcohol_use/weighted_sum/zeros_like	ZerosLikeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ъ
,linear/linear_model/alcohol_use/weighted_sumSelect1linear/linear_model/alcohol_use/weighted_sum/Tile7linear/linear_model/alcohol_use/weighted_sum/zeros_likeDlinear/linear_model/alcohol_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
†
3linear/linear_model/alcohol_use/weighted_sum/Cast_1Cast/linear/linear_model/alcohol_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Д
:linear/linear_model/alcohol_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/alcohol_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ы
4linear/linear_model/alcohol_use/weighted_sum/Slice_1Slice3linear/linear_model/alcohol_use/weighted_sum/Cast_1:linear/linear_model/alcohol_use/weighted_sum/Slice_1/begin9linear/linear_model/alcohol_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
†
4linear/linear_model/alcohol_use/weighted_sum/Shape_1Shape,linear/linear_model/alcohol_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Д
:linear/linear_model/alcohol_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
М
9linear/linear_model/alcohol_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ь
4linear/linear_model/alcohol_use/weighted_sum/Slice_2Slice4linear/linear_model/alcohol_use/weighted_sum/Shape_1:linear/linear_model/alcohol_use/weighted_sum/Slice_2/begin9linear/linear_model/alcohol_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
z
8linear/linear_model/alcohol_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Я
3linear/linear_model/alcohol_use/weighted_sum/concatConcatV24linear/linear_model/alcohol_use/weighted_sum/Slice_14linear/linear_model/alcohol_use/weighted_sum/Slice_28linear/linear_model/alcohol_use/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
д
6linear/linear_model/alcohol_use/weighted_sum/Reshape_2Reshape,linear/linear_model/alcohol_use/weighted_sum3linear/linear_model/alcohol_use/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
Р
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ShapeShapeDecodeCSV:7*
out_type0*
T0*
_output_shapes
:
«
Dlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/CastCastElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
Й
Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
Ё
Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/NotEqualNotEqualDecodeCSV:7Hlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
Ѕ
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereWhereHlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
†
Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
к
Glinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ReshapeReshapeDecodeCSV:7Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
§
Slinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
∆
Mlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_sliceStridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereSlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stackUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_1Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
¶
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
®
Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
®
Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
“
Olinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stackWlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_1Wlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
—
Glinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/unstackUnpackDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
“
Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/stackPackIlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
Ф
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/MulMulOlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_slice_1Elinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Я
Ulinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
±
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/SumSumClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/MulUlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
М
Clinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/AddAddMlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/strided_sliceClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
Ї
Flinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/GatherGatherGlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/ReshapeClinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
Jlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ConstConst*
dtype0*&
valueBBTrueBFalseBNone*
_output_shapes
:
Л
Ilinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Т
Plinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Т
Plinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
к
Jlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/rangeRangePlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/startIlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/SizePlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range/delta*

Tidx0*
_output_shapes
:
‘
Llinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ToInt64CastJlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
џ
Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
†
Ulinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
т
Zlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/table_initInitializeTableV2Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableJlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ConstLlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/ToInt64*

Tkey0*

Tval0	
В
Alinear/linear_model/alcohol_use_X_cigarette_use/hash_table_LookupLookupTableFindV2Olinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_tableFlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/GatherUlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
О
;linear/linear_model/alcohol_use_X_cigarette_use/SparseCrossSparseCrossElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Where5linear/linear_model/alcohol_use/to_sparse_input/WhereAlinear/linear_model/alcohol_use_X_cigarette_use/hash_table_Lookup1linear/linear_model/alcohol_use/hash_table_LookupDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast4linear/linear_model/alcohol_use/to_sparse_input/Cast*
internal_type0	*
dense_types
 *<
_output_shapes*
(:€€€€€€€€€:€€€€€€€€€:*
out_type0	*
N*
num_buckets	*
hash_keyюят„м*
sparse_types
2		*
hashed_output(
µ
:linear/linear_model/alcohol_use_X_cigarette_use/Shape/CastCast=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:2*

DstT0*

SrcT0	*
_output_shapes
:
Н
Clinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
П
Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
о
=linear/linear_model/alcohol_use_X_cigarette_use/strided_sliceStridedSlice:linear/linear_model/alcohol_use_X_cigarette_use/Shape/CastClinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stackElinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_1Elinear/linear_model/alcohol_use_X_cigarette_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Г
8linear/linear_model/alcohol_use_X_cigarette_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
с
6linear/linear_model/alcohol_use_X_cigarette_use/Cast/xPack=linear/linear_model/alcohol_use_X_cigarette_use/strided_slice8linear/linear_model/alcohol_use_X_cigarette_use/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
®
4linear/linear_model/alcohol_use_X_cigarette_use/CastCast6linear/linear_model/alcohol_use_X_cigarette_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
ѓ
=linear/linear_model/alcohol_use_X_cigarette_use/SparseReshapeSparseReshape;linear/linear_model/alcohol_use_X_cigarette_use/SparseCross=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:24linear/linear_model/alcohol_use_X_cigarette_use/Cast*-
_output_shapes
:€€€€€€€€€:
њ
Flinear/linear_model/alcohol_use_X_cigarette_use/SparseReshape/IdentityIdentity=linear/linear_model/alcohol_use_X_cigarette_use/SparseCross:1*
T0	*#
_output_shapes
:€€€€€€€€€
ш
Plinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Initializer/zerosConst*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
valueB	*    *
_output_shapes

:	
Е
>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0
VariableV2*
	container *
_output_shapes

:	*
dtype0*
shape
:	*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
shared_name 
Ж
Elinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/AssignAssign>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0Plinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Initializer/zeros*
validate_shape(*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:	
Л
Clinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/readIdentity>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
T0*
_output_shapes

:	
Т
Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
С
Glinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
—
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SliceSlice?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/beginGlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
М
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
П
Alinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ProdProdBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SliceBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
Н
Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
™
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GatherGather?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Н
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast/xPackAlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ProdClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
ѕ
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshapeSparseReshape=linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
’
Slinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityIdentityFlinear/linear_model/alcohol_use_X_cigarette_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
Н
Klinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
©
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqualGreaterEqualSlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityKlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
њ
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/WhereWhereIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Э
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ы
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ReshapeReshapeBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/WhereJlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
Ѕ
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1GatherJlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshapeDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
∆
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_2GatherSlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape/IdentityDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
ƒ
Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/IdentityIdentityLlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Ш
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ѓ
dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
э
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identitydlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackflinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
н
Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/CastCast^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
£
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/rangeRange\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/startUlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
ф
Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1CastVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
Ј
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Т
`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
м
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffWlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
≤
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
≤
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Е
`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSliceElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identityflinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
™
_linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ё
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDims`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2_linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ѓ
llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ѓ
llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
ў
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDimsllinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesllinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
ѓ
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
ё
Xlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
ф
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeXlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
Ю
\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
њ
Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Xlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like\linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
п
Vlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeShapeYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
ї
Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/FillFillVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeVlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
†
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ђ
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_1Wlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
†
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
¶
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Gather_2Ulinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/Fill^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
≠
^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderYlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2Elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
—
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/IdentityIdentityElinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Identity*
T0	*
_output_shapes
:
є
hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ї
jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ї
jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
≥
blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlice^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderhlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackjlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
В
Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/CastCastblinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
У
[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/UniqueUnique`linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ƒ
elinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherClinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read[linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
«
Tlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumelinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookup]linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Unique:1Ylinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
Э
Llinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
њ
Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1Reshape^linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseLlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
÷
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ShapeShapeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Ъ
Plinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
™
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_sliceStridedSliceBlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/ShapePlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stackRlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_1Rlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Ж
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
Ц
Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stackPackDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack/0Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
Ґ
Alinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/TileTileFlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_1Blinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
№
Glinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/zeros_like	ZerosLikeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Џ
<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sumSelectAlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/TileGlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/zeros_likeTlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
ј
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast_1Cast?linear/linear_model/alcohol_use_X_cigarette_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Ф
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
У
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
џ
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1SliceClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Cast_1Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/beginIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
ј
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Shape_1Shape<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Ф
Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
Ь
Ilinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
№
Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2SliceDlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Shape_1Jlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/beginIlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
К
Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
я
Clinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concatConcatV2Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_1Dlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Slice_2Hlinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ф
Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_2Reshape<linear/linear_model/alcohol_use_X_cigarette_use/weighted_sumClinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
Ѓ
,linear/linear_model/cigarette_use/Shape/CastCastDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:

5linear/linear_model/cigarette_use/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/cigarette_use/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Б
7linear/linear_model/cigarette_use/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
®
/linear/linear_model/cigarette_use/strided_sliceStridedSlice,linear/linear_model/cigarette_use/Shape/Cast5linear/linear_model/cigarette_use/strided_slice/stack7linear/linear_model/cigarette_use/strided_slice/stack_17linear/linear_model/cigarette_use/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
u
*linear/linear_model/cigarette_use/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
«
(linear/linear_model/cigarette_use/Cast/xPack/linear/linear_model/cigarette_use/strided_slice*linear/linear_model/cigarette_use/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
М
&linear/linear_model/cigarette_use/CastCast(linear/linear_model/cigarette_use/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
§
/linear/linear_model/cigarette_use/SparseReshapeSparseReshapeElinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/WhereDlinear/linear_model/alcohol_use_X_cigarette_use/to_sparse_input/Cast&linear/linear_model/cigarette_use/Cast*-
_output_shapes
:€€€€€€€€€:
µ
8linear/linear_model/cigarette_use/SparseReshape/IdentityIdentityAlinear/linear_model/alcohol_use_X_cigarette_use/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
№
Blinear/linear_model/cigarette_use/weights/part_0/Initializer/zerosConst*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
valueB*    *
_output_shapes

:
й
0linear/linear_model/cigarette_use/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
shared_name 
ќ
7linear/linear_model/cigarette_use/weights/part_0/AssignAssign0linear/linear_model/cigarette_use/weights/part_0Blinear/linear_model/cigarette_use/weights/part_0/Initializer/zeros*
validate_shape(*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
б
5linear/linear_model/cigarette_use/weights/part_0/readIdentity0linear/linear_model/cigarette_use/weights/part_0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
T0*
_output_shapes

:
Д
:linear/linear_model/cigarette_use/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/cigarette_use/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Щ
4linear/linear_model/cigarette_use/weighted_sum/SliceSlice1linear/linear_model/cigarette_use/SparseReshape:1:linear/linear_model/cigarette_use/weighted_sum/Slice/begin9linear/linear_model/cigarette_use/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
~
4linear/linear_model/cigarette_use/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
е
3linear/linear_model/cigarette_use/weighted_sum/ProdProd4linear/linear_model/cigarette_use/weighted_sum/Slice4linear/linear_model/cigarette_use/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 

=linear/linear_model/cigarette_use/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
А
5linear/linear_model/cigarette_use/weighted_sum/GatherGather1linear/linear_model/cigarette_use/SparseReshape:1=linear/linear_model/cigarette_use/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
г
5linear/linear_model/cigarette_use/weighted_sum/Cast/xPack3linear/linear_model/cigarette_use/weighted_sum/Prod5linear/linear_model/cigarette_use/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
Ч
<linear/linear_model/cigarette_use/weighted_sum/SparseReshapeSparseReshape/linear/linear_model/cigarette_use/SparseReshape1linear/linear_model/cigarette_use/SparseReshape:15linear/linear_model/cigarette_use/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
є
Elinear/linear_model/cigarette_use/weighted_sum/SparseReshape/IdentityIdentity8linear/linear_model/cigarette_use/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€

=linear/linear_model/cigarette_use/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
€
;linear/linear_model/cigarette_use/weighted_sum/GreaterEqualGreaterEqualElinear/linear_model/cigarette_use/weighted_sum/SparseReshape/Identity=linear/linear_model/cigarette_use/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
£
4linear/linear_model/cigarette_use/weighted_sum/WhereWhere;linear/linear_model/cigarette_use/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
П
<linear/linear_model/cigarette_use/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
с
6linear/linear_model/cigarette_use/weighted_sum/ReshapeReshape4linear/linear_model/cigarette_use/weighted_sum/Where<linear/linear_model/cigarette_use/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
Ч
7linear/linear_model/cigarette_use/weighted_sum/Gather_1Gather<linear/linear_model/cigarette_use/weighted_sum/SparseReshape6linear/linear_model/cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ь
7linear/linear_model/cigarette_use/weighted_sum/Gather_2GatherElinear/linear_model/cigarette_use/weighted_sum/SparseReshape/Identity6linear/linear_model/cigarette_use/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
®
7linear/linear_model/cigarette_use/weighted_sum/IdentityIdentity>linear/linear_model/cigarette_use/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
К
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
†
Vlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ј
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice7linear/linear_model/cigarette_use/weighted_sum/IdentityVlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stackXlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
—
Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/CastCastPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
л
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/rangeRangeNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/startGlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/CastNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Ў
Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1CastHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
©
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ћ
Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice7linear/linear_model/cigarette_use/weighted_sum/Gather_1Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackZlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
¬
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffListDiffIlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Cast_1Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Ґ
Xlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
§
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
§
Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
њ
Rlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice7linear/linear_model/cigarette_use/weighted_sum/IdentityXlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackZlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Zlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ь
Qlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≥
Mlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsRlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/strided_slice_2Qlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
†
^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
†
^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
У
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffMlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ExpandDims^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values^linear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
°
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
і
Jlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeReshapeKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiffPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
Ў
Mlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeJlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
З
Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concatConcatV2Jlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ReshapeMlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/zeros_likeNlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
”
Hlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeShapeKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
С
Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/FillFillHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/ShapeHlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Т
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ф
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1ConcatV27linear/linear_model/cigarette_use/weighted_sum/Gather_1Ilinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concatPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
Т
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
о
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2ConcatV27linear/linear_model/cigarette_use/weighted_sum/Gather_2Glinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/FillPlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
х
Plinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderKlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_1Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/concat_27linear/linear_model/cigarette_use/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
µ
Klinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/IdentityIdentity7linear/linear_model/cigarette_use/weighted_sum/Identity*
T0	*
_output_shapes
:
Ђ
Zlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
≠
\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
≠
\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
н
Tlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicePlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorderZlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1\linear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
ж
Klinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/CastCastTlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
ч
Mlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/UniqueUniqueRlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
М
Wlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupGather5linear/linear_model/cigarette_use/weights/part_0/readMlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*'
_output_shapes
:€€€€€€€€€
П
Flinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparseSparseSegmentSumWlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/embedding_lookupOlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Unique:1Klinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
П
>linear/linear_model/cigarette_use/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Х
8linear/linear_model/cigarette_use/weighted_sum/Reshape_1ReshapePlinear/linear_model/cigarette_use/weighted_sum/SparseFillEmptyRows/SparseToDense>linear/linear_model/cigarette_use/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
Ї
4linear/linear_model/cigarette_use/weighted_sum/ShapeShapeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
М
Blinear/linear_model/cigarette_use/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
О
Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
О
Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
д
<linear/linear_model/cigarette_use/weighted_sum/strided_sliceStridedSlice4linear/linear_model/cigarette_use/weighted_sum/ShapeBlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stackDlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_1Dlinear/linear_model/cigarette_use/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
x
6linear/linear_model/cigarette_use/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
м
4linear/linear_model/cigarette_use/weighted_sum/stackPack6linear/linear_model/cigarette_use/weighted_sum/stack/0<linear/linear_model/cigarette_use/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
ш
3linear/linear_model/cigarette_use/weighted_sum/TileTile8linear/linear_model/cigarette_use/weighted_sum/Reshape_14linear/linear_model/cigarette_use/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
ј
9linear/linear_model/cigarette_use/weighted_sum/zeros_like	ZerosLikeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ґ
.linear/linear_model/cigarette_use/weighted_sumSelect3linear/linear_model/cigarette_use/weighted_sum/Tile9linear/linear_model/cigarette_use/weighted_sum/zeros_likeFlinear/linear_model/cigarette_use/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/cigarette_use/weighted_sum/Cast_1Cast1linear/linear_model/cigarette_use/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Ж
<linear/linear_model/cigarette_use/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Е
;linear/linear_model/cigarette_use/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
£
6linear/linear_model/cigarette_use/weighted_sum/Slice_1Slice5linear/linear_model/cigarette_use/weighted_sum/Cast_1<linear/linear_model/cigarette_use/weighted_sum/Slice_1/begin;linear/linear_model/cigarette_use/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
§
6linear/linear_model/cigarette_use/weighted_sum/Shape_1Shape.linear/linear_model/cigarette_use/weighted_sum*
out_type0*
T0*
_output_shapes
:
Ж
<linear/linear_model/cigarette_use/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
О
;linear/linear_model/cigarette_use/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
§
6linear/linear_model/cigarette_use/weighted_sum/Slice_2Slice6linear/linear_model/cigarette_use/weighted_sum/Shape_1<linear/linear_model/cigarette_use/weighted_sum/Slice_2/begin;linear/linear_model/cigarette_use/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
|
:linear/linear_model/cigarette_use/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
І
5linear/linear_model/cigarette_use/weighted_sum/concatConcatV26linear/linear_model/cigarette_use/weighted_sum/Slice_16linear/linear_model/cigarette_use/weighted_sum/Slice_2:linear/linear_model/cigarette_use/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
к
8linear/linear_model/cigarette_use/weighted_sum/Reshape_2Reshape.linear/linear_model/cigarette_use/weighted_sum5linear/linear_model/cigarette_use/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
|
1linear/linear_model/is_male/to_sparse_input/ShapeShapeDecodeCSV:1*
out_type0*
T0*
_output_shapes
:
Я
0linear/linear_model/is_male/to_sparse_input/CastCast1linear/linear_model/is_male/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
u
4linear/linear_model/is_male/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
µ
4linear/linear_model/is_male/to_sparse_input/NotEqualNotEqualDecodeCSV:14linear/linear_model/is_male/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
Щ
1linear/linear_model/is_male/to_sparse_input/WhereWhere4linear/linear_model/is_male/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
М
9linear/linear_model/is_male/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
¬
3linear/linear_model/is_male/to_sparse_input/ReshapeReshapeDecodeCSV:19linear/linear_model/is_male/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
Р
?linear/linear_model/is_male/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
в
9linear/linear_model/is_male/to_sparse_input/strided_sliceStridedSlice1linear/linear_model/is_male/to_sparse_input/Where?linear/linear_model/is_male/to_sparse_input/strided_slice/stackAlinear/linear_model/is_male/to_sparse_input/strided_slice/stack_1Alinear/linear_model/is_male/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Т
Alinear/linear_model/is_male/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ф
Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ф
Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
о
;linear/linear_model/is_male/to_sparse_input/strided_slice_1StridedSlice1linear/linear_model/is_male/to_sparse_input/WhereAlinear/linear_model/is_male/to_sparse_input/strided_slice_1/stackClinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_1Clinear/linear_model/is_male/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
©
3linear/linear_model/is_male/to_sparse_input/unstackUnpack0linear/linear_model/is_male/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
™
1linear/linear_model/is_male/to_sparse_input/stackPack5linear/linear_model/is_male/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
Ў
/linear/linear_model/is_male/to_sparse_input/MulMul;linear/linear_model/is_male/to_sparse_input/strided_slice_11linear/linear_model/is_male/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Л
Alinear/linear_model/is_male/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
х
/linear/linear_model/is_male/to_sparse_input/SumSum/linear/linear_model/is_male/to_sparse_input/MulAlinear/linear_model/is_male/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
–
/linear/linear_model/is_male/to_sparse_input/AddAdd9linear/linear_model/is_male/to_sparse_input/strided_slice/linear/linear_model/is_male/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
ю
2linear/linear_model/is_male/to_sparse_input/GatherGather3linear/linear_model/is_male/to_sparse_input/Reshape/linear/linear_model/is_male/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Д
0linear/linear_model/is_male/is_male_lookup/ConstConst*
dtype0* 
valueBBTrueBFalse*
_output_shapes
:
q
/linear/linear_model/is_male/is_male_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
x
6linear/linear_model/is_male/is_male_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
x
6linear/linear_model/is_male/is_male_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
В
0linear/linear_model/is_male/is_male_lookup/rangeRange6linear/linear_model/is_male/is_male_lookup/range/start/linear/linear_model/is_male/is_male_lookup/Size6linear/linear_model/is_male/is_male_lookup/range/delta*

Tidx0*
_output_shapes
:
†
2linear/linear_model/is_male/is_male_lookup/ToInt64Cast0linear/linear_model/is_male/is_male_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
Ѕ
5linear/linear_model/is_male/is_male_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ж
;linear/linear_model/is_male/is_male_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
К
@linear/linear_model/is_male/is_male_lookup/hash_table/table_initInitializeTableV25linear/linear_model/is_male/is_male_lookup/hash_table0linear/linear_model/is_male/is_male_lookup/Const2linear/linear_model/is_male/is_male_lookup/ToInt64*

Tkey0*

Tval0	
¶
-linear/linear_model/is_male/hash_table_LookupLookupTableFindV25linear/linear_model/is_male/is_male_lookup/hash_table2linear/linear_model/is_male/to_sparse_input/Gather;linear/linear_model/is_male/is_male_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ф
&linear/linear_model/is_male/Shape/CastCast0linear/linear_model/is_male/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
y
/linear/linear_model/is_male/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
{
1linear/linear_model/is_male/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
{
1linear/linear_model/is_male/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
К
)linear/linear_model/is_male/strided_sliceStridedSlice&linear/linear_model/is_male/Shape/Cast/linear/linear_model/is_male/strided_slice/stack1linear/linear_model/is_male/strided_slice/stack_11linear/linear_model/is_male/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
o
$linear/linear_model/is_male/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
µ
"linear/linear_model/is_male/Cast/xPack)linear/linear_model/is_male/strided_slice$linear/linear_model/is_male/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
А
 linear/linear_model/is_male/CastCast"linear/linear_model/is_male/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
р
)linear/linear_model/is_male/SparseReshapeSparseReshape1linear/linear_model/is_male/to_sparse_input/Where0linear/linear_model/is_male/to_sparse_input/Cast linear/linear_model/is_male/Cast*-
_output_shapes
:€€€€€€€€€:
Ы
2linear/linear_model/is_male/SparseReshape/IdentityIdentity-linear/linear_model/is_male/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
–
<linear/linear_model/is_male/weights/part_0/Initializer/zerosConst*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
valueB*    *
_output_shapes

:
Ё
*linear/linear_model/is_male/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
shared_name 
ґ
1linear/linear_model/is_male/weights/part_0/AssignAssign*linear/linear_model/is_male/weights/part_0<linear/linear_model/is_male/weights/part_0/Initializer/zeros*
validate_shape(*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
use_locking(*
T0*
_output_shapes

:
ѕ
/linear/linear_model/is_male/weights/part_0/readIdentity*linear/linear_model/is_male/weights/part_0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
T0*
_output_shapes

:
~
4linear/linear_model/is_male/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
}
3linear/linear_model/is_male/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Б
.linear/linear_model/is_male/weighted_sum/SliceSlice+linear/linear_model/is_male/SparseReshape:14linear/linear_model/is_male/weighted_sum/Slice/begin3linear/linear_model/is_male/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
x
.linear/linear_model/is_male/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
”
-linear/linear_model/is_male/weighted_sum/ProdProd.linear/linear_model/is_male/weighted_sum/Slice.linear/linear_model/is_male/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
y
7linear/linear_model/is_male/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
о
/linear/linear_model/is_male/weighted_sum/GatherGather+linear/linear_model/is_male/SparseReshape:17linear/linear_model/is_male/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
—
/linear/linear_model/is_male/weighted_sum/Cast/xPack-linear/linear_model/is_male/weighted_sum/Prod/linear/linear_model/is_male/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
€
6linear/linear_model/is_male/weighted_sum/SparseReshapeSparseReshape)linear/linear_model/is_male/SparseReshape+linear/linear_model/is_male/SparseReshape:1/linear/linear_model/is_male/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
≠
?linear/linear_model/is_male/weighted_sum/SparseReshape/IdentityIdentity2linear/linear_model/is_male/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
y
7linear/linear_model/is_male/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
н
5linear/linear_model/is_male/weighted_sum/GreaterEqualGreaterEqual?linear/linear_model/is_male/weighted_sum/SparseReshape/Identity7linear/linear_model/is_male/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Ч
.linear/linear_model/is_male/weighted_sum/WhereWhere5linear/linear_model/is_male/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Й
6linear/linear_model/is_male/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
я
0linear/linear_model/is_male/weighted_sum/ReshapeReshape.linear/linear_model/is_male/weighted_sum/Where6linear/linear_model/is_male/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
Е
1linear/linear_model/is_male/weighted_sum/Gather_1Gather6linear/linear_model/is_male/weighted_sum/SparseReshape0linear/linear_model/is_male/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
К
1linear/linear_model/is_male/weighted_sum/Gather_2Gather?linear/linear_model/is_male/weighted_sum/SparseReshape/Identity0linear/linear_model/is_male/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ь
1linear/linear_model/is_male/weighted_sum/IdentityIdentity8linear/linear_model/is_male/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Д
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ъ
Plinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Щ
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice1linear/linear_model/is_male/weighted_sum/IdentityPlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stackRlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
≈
Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/CastCastJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
”
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/rangeRangeHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/startAlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/CastHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
ћ
Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Cast_1CastBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
£
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Ѓ
Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice1linear/linear_model/is_male/weighted_sum/Gather_1Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackTlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
∞
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffListDiffClinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Cast_1Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Ь
Rlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ю
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ю
Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
°
Llinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice1linear/linear_model/is_male/weighted_sum/IdentityRlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackTlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Tlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ц
Klinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
°
Glinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsLlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/strided_slice_2Klinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ъ
Xlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ъ
Xlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
х
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffGlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ExpandDimsXlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesXlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Ы
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ґ
Dlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ReshapeReshapeElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiffJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
ћ
Glinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeDlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
К
Hlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
п
Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concatConcatV2Dlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ReshapeGlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/zeros_likeHlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
«
Blinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ShapeShapeElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
€
Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/FillFillBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/ShapeBlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
М
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
№
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1ConcatV21linear/linear_model/is_male/weighted_sum/Gather_1Clinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concatJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
М
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
÷
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2ConcatV21linear/linear_model/is_male/weighted_sum/Gather_2Alinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/FillJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
Ё
Jlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderElinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_1Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/concat_21linear/linear_model/is_male/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
©
Elinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/IdentityIdentity1linear/linear_model/is_male/weighted_sum/Identity*
T0	*
_output_shapes
:
•
Tlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
І
Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
І
Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ѕ
Nlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorderTlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stackVlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Vlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Џ
Elinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/CastCastNlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
л
Glinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/UniqueUniqueLlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ф
Qlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/embedding_lookupGather/linear/linear_model/is_male/weights/part_0/readGlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*'
_output_shapes
:€€€€€€€€€
ч
@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparseSparseSegmentSumQlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/embedding_lookupIlinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Unique:1Elinear/linear_model/is_male/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
Й
8linear/linear_model/is_male/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Г
2linear/linear_model/is_male/weighted_sum/Reshape_1ReshapeJlinear/linear_model/is_male/weighted_sum/SparseFillEmptyRows/SparseToDense8linear/linear_model/is_male/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
Ѓ
.linear/linear_model/is_male/weighted_sum/ShapeShape@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Ж
<linear/linear_model/is_male/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
И
>linear/linear_model/is_male/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
И
>linear/linear_model/is_male/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
∆
6linear/linear_model/is_male/weighted_sum/strided_sliceStridedSlice.linear/linear_model/is_male/weighted_sum/Shape<linear/linear_model/is_male/weighted_sum/strided_slice/stack>linear/linear_model/is_male/weighted_sum/strided_slice/stack_1>linear/linear_model/is_male/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
r
0linear/linear_model/is_male/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
Џ
.linear/linear_model/is_male/weighted_sum/stackPack0linear/linear_model/is_male/weighted_sum/stack/06linear/linear_model/is_male/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
ж
-linear/linear_model/is_male/weighted_sum/TileTile2linear/linear_model/is_male/weighted_sum/Reshape_1.linear/linear_model/is_male/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
і
3linear/linear_model/is_male/weighted_sum/zeros_like	ZerosLike@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
К
(linear/linear_model/is_male/weighted_sumSelect-linear/linear_model/is_male/weighted_sum/Tile3linear/linear_model/is_male/weighted_sum/zeros_like@linear/linear_model/is_male/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ш
/linear/linear_model/is_male/weighted_sum/Cast_1Cast+linear/linear_model/is_male/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
А
6linear/linear_model/is_male/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/is_male/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Л
0linear/linear_model/is_male/weighted_sum/Slice_1Slice/linear/linear_model/is_male/weighted_sum/Cast_16linear/linear_model/is_male/weighted_sum/Slice_1/begin5linear/linear_model/is_male/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ш
0linear/linear_model/is_male/weighted_sum/Shape_1Shape(linear/linear_model/is_male/weighted_sum*
out_type0*
T0*
_output_shapes
:
А
6linear/linear_model/is_male/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
И
5linear/linear_model/is_male/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
М
0linear/linear_model/is_male/weighted_sum/Slice_2Slice0linear/linear_model/is_male/weighted_sum/Shape_16linear/linear_model/is_male/weighted_sum/Slice_2/begin5linear/linear_model/is_male/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
v
4linear/linear_model/is_male/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
П
/linear/linear_model/is_male/weighted_sum/concatConcatV20linear/linear_model/is_male/weighted_sum/Slice_10linear/linear_model/is_male/weighted_sum/Slice_24linear/linear_model/is_male/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ў
2linear/linear_model/is_male/weighted_sum/Reshape_2Reshape(linear/linear_model/is_male/weighted_sum/linear/linear_model/is_male/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
Г
8linear/linear_model/mother_married/to_sparse_input/ShapeShapeDecodeCSV:6*
out_type0*
T0*
_output_shapes
:
≠
7linear/linear_model/mother_married/to_sparse_input/CastCast8linear/linear_model/mother_married/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
|
;linear/linear_model/mother_married/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
√
;linear/linear_model/mother_married/to_sparse_input/NotEqualNotEqualDecodeCSV:6;linear/linear_model/mother_married/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
І
8linear/linear_model/mother_married/to_sparse_input/WhereWhere;linear/linear_model/mother_married/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
У
@linear/linear_model/mother_married/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
–
:linear/linear_model/mother_married/to_sparse_input/ReshapeReshapeDecodeCSV:6@linear/linear_model/mother_married/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
Ч
Flinear/linear_model/mother_married/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
Е
@linear/linear_model/mother_married/to_sparse_input/strided_sliceStridedSlice8linear/linear_model/mother_married/to_sparse_input/WhereFlinear/linear_model/mother_married/to_sparse_input/strided_slice/stackHlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_1Hlinear/linear_model/mother_married/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Щ
Hlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ы
Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ы
Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
С
Blinear/linear_model/mother_married/to_sparse_input/strided_slice_1StridedSlice8linear/linear_model/mother_married/to_sparse_input/WhereHlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stackJlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_1Jlinear/linear_model/mother_married/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
Ј
:linear/linear_model/mother_married/to_sparse_input/unstackUnpack7linear/linear_model/mother_married/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
Є
8linear/linear_model/mother_married/to_sparse_input/stackPack<linear/linear_model/mother_married/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
н
6linear/linear_model/mother_married/to_sparse_input/MulMulBlinear/linear_model/mother_married/to_sparse_input/strided_slice_18linear/linear_model/mother_married/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
Т
Hlinear/linear_model/mother_married/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
К
6linear/linear_model/mother_married/to_sparse_input/SumSum6linear/linear_model/mother_married/to_sparse_input/MulHlinear/linear_model/mother_married/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
е
6linear/linear_model/mother_married/to_sparse_input/AddAdd@linear/linear_model/mother_married/to_sparse_input/strided_slice6linear/linear_model/mother_married/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
У
9linear/linear_model/mother_married/to_sparse_input/GatherGather:linear/linear_model/mother_married/to_sparse_input/Reshape6linear/linear_model/mother_married/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Т
>linear/linear_model/mother_married/mother_married_lookup/ConstConst*
dtype0* 
valueBBTrueBFalse*
_output_shapes
:

=linear/linear_model/mother_married/mother_married_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Ж
Dlinear/linear_model/mother_married/mother_married_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
Ж
Dlinear/linear_model/mother_married/mother_married_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ї
>linear/linear_model/mother_married/mother_married_lookup/rangeRangeDlinear/linear_model/mother_married/mother_married_lookup/range/start=linear/linear_model/mother_married/mother_married_lookup/SizeDlinear/linear_model/mother_married/mother_married_lookup/range/delta*

Tidx0*
_output_shapes
:
Љ
@linear/linear_model/mother_married/mother_married_lookup/ToInt64Cast>linear/linear_model/mother_married/mother_married_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
ѕ
Clinear/linear_model/mother_married/mother_married_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
Ф
Ilinear/linear_model/mother_married/mother_married_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
¬
Nlinear/linear_model/mother_married/mother_married_lookup/hash_table/table_initInitializeTableV2Clinear/linear_model/mother_married/mother_married_lookup/hash_table>linear/linear_model/mother_married/mother_married_lookup/Const@linear/linear_model/mother_married/mother_married_lookup/ToInt64*

Tkey0*

Tval0	
–
4linear/linear_model/mother_married/hash_table_LookupLookupTableFindV2Clinear/linear_model/mother_married/mother_married_lookup/hash_table9linear/linear_model/mother_married/to_sparse_input/GatherIlinear/linear_model/mother_married/mother_married_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ґ
-linear/linear_model/mother_married/Shape/CastCast7linear/linear_model/mother_married/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
А
6linear/linear_model/mother_married/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
В
8linear/linear_model/mother_married/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
В
8linear/linear_model/mother_married/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
0linear/linear_model/mother_married/strided_sliceStridedSlice-linear/linear_model/mother_married/Shape/Cast6linear/linear_model/mother_married/strided_slice/stack8linear/linear_model/mother_married/strided_slice/stack_18linear/linear_model/mother_married/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
+linear/linear_model/mother_married/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
 
)linear/linear_model/mother_married/Cast/xPack0linear/linear_model/mother_married/strided_slice+linear/linear_model/mother_married/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
О
'linear/linear_model/mother_married/CastCast)linear/linear_model/mother_married/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
М
0linear/linear_model/mother_married/SparseReshapeSparseReshape8linear/linear_model/mother_married/to_sparse_input/Where7linear/linear_model/mother_married/to_sparse_input/Cast'linear/linear_model/mother_married/Cast*-
_output_shapes
:€€€€€€€€€:
©
9linear/linear_model/mother_married/SparseReshape/IdentityIdentity4linear/linear_model/mother_married/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
ё
Clinear/linear_model/mother_married/weights/part_0/Initializer/zerosConst*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
valueB*    *
_output_shapes

:
л
1linear/linear_model/mother_married/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
shared_name 
“
8linear/linear_model/mother_married/weights/part_0/AssignAssign1linear/linear_model/mother_married/weights/part_0Clinear/linear_model/mother_married/weights/part_0/Initializer/zeros*
validate_shape(*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
use_locking(*
T0*
_output_shapes

:
д
6linear/linear_model/mother_married/weights/part_0/readIdentity1linear/linear_model/mother_married/weights/part_0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
T0*
_output_shapes

:
Е
;linear/linear_model/mother_married/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Д
:linear/linear_model/mother_married/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Э
5linear/linear_model/mother_married/weighted_sum/SliceSlice2linear/linear_model/mother_married/SparseReshape:1;linear/linear_model/mother_married/weighted_sum/Slice/begin:linear/linear_model/mother_married/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

5linear/linear_model/mother_married/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
и
4linear/linear_model/mother_married/weighted_sum/ProdProd5linear/linear_model/mother_married/weighted_sum/Slice5linear/linear_model/mother_married/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
А
>linear/linear_model/mother_married/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
Г
6linear/linear_model/mother_married/weighted_sum/GatherGather2linear/linear_model/mother_married/SparseReshape:1>linear/linear_model/mother_married/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
ж
6linear/linear_model/mother_married/weighted_sum/Cast/xPack4linear/linear_model/mother_married/weighted_sum/Prod6linear/linear_model/mother_married/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
Ы
=linear/linear_model/mother_married/weighted_sum/SparseReshapeSparseReshape0linear/linear_model/mother_married/SparseReshape2linear/linear_model/mother_married/SparseReshape:16linear/linear_model/mother_married/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
ї
Flinear/linear_model/mother_married/weighted_sum/SparseReshape/IdentityIdentity9linear/linear_model/mother_married/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
А
>linear/linear_model/mother_married/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
В
<linear/linear_model/mother_married/weighted_sum/GreaterEqualGreaterEqualFlinear/linear_model/mother_married/weighted_sum/SparseReshape/Identity>linear/linear_model/mother_married/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
•
5linear/linear_model/mother_married/weighted_sum/WhereWhere<linear/linear_model/mother_married/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/mother_married/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
ф
7linear/linear_model/mother_married/weighted_sum/ReshapeReshape5linear/linear_model/mother_married/weighted_sum/Where=linear/linear_model/mother_married/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
Ъ
8linear/linear_model/mother_married/weighted_sum/Gather_1Gather=linear/linear_model/mother_married/weighted_sum/SparseReshape7linear/linear_model/mother_married/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Я
8linear/linear_model/mother_married/weighted_sum/Gather_2GatherFlinear/linear_model/mother_married/weighted_sum/SparseReshape/Identity7linear/linear_model/mother_married/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
™
8linear/linear_model/mother_married/weighted_sum/IdentityIdentity?linear/linear_model/mother_married/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Л
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
°
Wlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Љ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear_model/mother_married/weighted_sum/IdentityWlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stackYlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
”
Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/CastCastQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
п
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/rangeRangeOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/startHlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/CastOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
Џ
Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Cast_1CastIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
™
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
—
Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear_model/mother_married/weighted_sum/Gather_1Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
≈
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffListDiffJlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Cast_1Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
£
Ylinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
•
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
•
[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ƒ
Slinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear_model/mother_married/weighted_sum/IdentityYlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Э
Rlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
ґ
Nlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/strided_slice_2Rlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
°
_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
°
_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Ш
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ExpandDims_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Ґ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ј
Klinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ReshapeReshapeLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiffQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
Џ
Nlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
С
Olinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Л
Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concatConcatV2Klinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ReshapeNlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/zeros_likeOlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
’
Ilinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ShapeShapeLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Ф
Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/FillFillIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/ShapeIlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
У
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ш
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1ConcatV28linear/linear_model/mother_married/weighted_sum/Gather_1Jlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concatQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
У
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
т
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2ConcatV28linear/linear_model/mother_married/weighted_sum/Gather_2Hlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/FillQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
щ
Qlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_1Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/concat_28linear/linear_model/mother_married/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
Ј
Llinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/IdentityIdentity8linear/linear_model/mother_married/weighted_sum/Identity*
T0	*
_output_shapes
:
ђ
[linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ѓ
]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ѓ
]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
т
Ulinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorder[linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1]linear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
и
Llinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/CastCastUlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
щ
Nlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/UniqueUniqueSlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Р
Xlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/embedding_lookupGather6linear/linear_model/mother_married/weights/part_0/readNlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*'
_output_shapes
:€€€€€€€€€
У
Glinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparseSparseSegmentSumXlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/embedding_lookupPlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Unique:1Llinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
Р
?linear/linear_model/mother_married/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ш
9linear/linear_model/mother_married/weighted_sum/Reshape_1ReshapeQlinear/linear_model/mother_married/weighted_sum/SparseFillEmptyRows/SparseToDense?linear/linear_model/mother_married/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
Љ
5linear/linear_model/mother_married/weighted_sum/ShapeShapeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
Н
Clinear/linear_model/mother_married/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
П
Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
й
=linear/linear_model/mother_married/weighted_sum/strided_sliceStridedSlice5linear/linear_model/mother_married/weighted_sum/ShapeClinear/linear_model/mother_married/weighted_sum/strided_slice/stackElinear/linear_model/mother_married/weighted_sum/strided_slice/stack_1Elinear/linear_model/mother_married/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
y
7linear/linear_model/mother_married/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
п
5linear/linear_model/mother_married/weighted_sum/stackPack7linear/linear_model/mother_married/weighted_sum/stack/0=linear/linear_model/mother_married/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
ы
4linear/linear_model/mother_married/weighted_sum/TileTile9linear/linear_model/mother_married/weighted_sum/Reshape_15linear/linear_model/mother_married/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
¬
:linear/linear_model/mother_married/weighted_sum/zeros_like	ZerosLikeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
¶
/linear/linear_model/mother_married/weighted_sumSelect4linear/linear_model/mother_married/weighted_sum/Tile:linear/linear_model/mother_married/weighted_sum/zeros_likeGlinear/linear_model/mother_married/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
¶
6linear/linear_model/mother_married/weighted_sum/Cast_1Cast2linear/linear_model/mother_married/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
З
=linear/linear_model/mother_married/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Ж
<linear/linear_model/mother_married/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
І
7linear/linear_model/mother_married/weighted_sum/Slice_1Slice6linear/linear_model/mother_married/weighted_sum/Cast_1=linear/linear_model/mother_married/weighted_sum/Slice_1/begin<linear/linear_model/mother_married/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
¶
7linear/linear_model/mother_married/weighted_sum/Shape_1Shape/linear/linear_model/mother_married/weighted_sum*
out_type0*
T0*
_output_shapes
:
З
=linear/linear_model/mother_married/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
П
<linear/linear_model/mother_married/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
®
7linear/linear_model/mother_married/weighted_sum/Slice_2Slice7linear/linear_model/mother_married/weighted_sum/Shape_1=linear/linear_model/mother_married/weighted_sum/Slice_2/begin<linear/linear_model/mother_married/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
}
;linear/linear_model/mother_married/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ђ
6linear/linear_model/mother_married/weighted_sum/concatConcatV27linear/linear_model/mother_married/weighted_sum/Slice_17linear/linear_model/mother_married/weighted_sum/Slice_2;linear/linear_model/mother_married/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
н
9linear/linear_model/mother_married/weighted_sum/Reshape_2Reshape/linear/linear_model/mother_married/weighted_sum6linear/linear_model/mother_married/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
А
5linear/linear_model/mother_race/to_sparse_input/ShapeShapeDecodeCSV:3*
out_type0*
T0*
_output_shapes
:
І
4linear/linear_model/mother_race/to_sparse_input/CastCast5linear/linear_model/mother_race/to_sparse_input/Shape*

DstT0	*

SrcT0*
_output_shapes
:
y
8linear/linear_model/mother_race/to_sparse_input/Cast_1/xConst*
dtype0*
valueB B *
_output_shapes
: 
љ
8linear/linear_model/mother_race/to_sparse_input/NotEqualNotEqualDecodeCSV:38linear/linear_model/mother_race/to_sparse_input/Cast_1/x*
T0*'
_output_shapes
:€€€€€€€€€
°
5linear/linear_model/mother_race/to_sparse_input/WhereWhere8linear/linear_model/mother_race/to_sparse_input/NotEqual*'
_output_shapes
:€€€€€€€€€
Р
=linear/linear_model/mother_race/to_sparse_input/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
 
7linear/linear_model/mother_race/to_sparse_input/ReshapeReshapeDecodeCSV:3=linear/linear_model/mother_race/to_sparse_input/Reshape/shape*
Tshape0*
T0*#
_output_shapes
:€€€€€€€€€
Ф
Clinear/linear_model/mother_race/to_sparse_input/strided_slice/stackConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
ц
=linear/linear_model/mother_race/to_sparse_input/strided_sliceStridedSlice5linear/linear_model/mother_race/to_sparse_input/WhereClinear/linear_model/mother_race/to_sparse_input/strided_slice/stackElinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_1Elinear/linear_model/mother_race/to_sparse_input/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Ц
Elinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ш
Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ш
Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
В
?linear/linear_model/mother_race/to_sparse_input/strided_slice_1StridedSlice5linear/linear_model/mother_race/to_sparse_input/WhereElinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stackGlinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_1Glinear/linear_model/mother_race/to_sparse_input/strided_slice_1/stack_2*
new_axis_mask *
Index0*'
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask 
±
7linear/linear_model/mother_race/to_sparse_input/unstackUnpack4linear/linear_model/mother_race/to_sparse_input/Cast*	
num*

axis *
T0	*
_output_shapes
: : 
≤
5linear/linear_model/mother_race/to_sparse_input/stackPack9linear/linear_model/mother_race/to_sparse_input/unstack:1*
_output_shapes
:*

axis *
T0	*
N
д
3linear/linear_model/mother_race/to_sparse_input/MulMul?linear/linear_model/mother_race/to_sparse_input/strided_slice_15linear/linear_model/mother_race/to_sparse_input/stack*
T0	*'
_output_shapes
:€€€€€€€€€
П
Elinear/linear_model/mother_race/to_sparse_input/Sum/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
Б
3linear/linear_model/mother_race/to_sparse_input/SumSum3linear/linear_model/mother_race/to_sparse_input/MulElinear/linear_model/mother_race/to_sparse_input/Sum/reduction_indices*

Tidx0*
T0	*
	keep_dims( *#
_output_shapes
:€€€€€€€€€
№
3linear/linear_model/mother_race/to_sparse_input/AddAdd=linear/linear_model/mother_race/to_sparse_input/strided_slice3linear/linear_model/mother_race/to_sparse_input/Sum*
T0	*#
_output_shapes
:€€€€€€€€€
К
6linear/linear_model/mother_race/to_sparse_input/GatherGather7linear/linear_model/mother_race/to_sparse_input/Reshape3linear/linear_model/mother_race/to_sparse_input/Add*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
ы
8linear/linear_model/mother_race/mother_race_lookup/ConstConst*
dtype0*О
valueДBБBWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese*
_output_shapes
:
y
7linear/linear_model/mother_race/mother_race_lookup/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
А
>linear/linear_model/mother_race/mother_race_lookup/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
А
>linear/linear_model/mother_race/mother_race_lookup/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ґ
8linear/linear_model/mother_race/mother_race_lookup/rangeRange>linear/linear_model/mother_race/mother_race_lookup/range/start7linear/linear_model/mother_race/mother_race_lookup/Size>linear/linear_model/mother_race/mother_race_lookup/range/delta*

Tidx0*
_output_shapes
:
∞
:linear/linear_model/mother_race/mother_race_lookup/ToInt64Cast8linear/linear_model/mother_race/mother_race_lookup/range*

DstT0	*

SrcT0*
_output_shapes
:
…
=linear/linear_model/mother_race/mother_race_lookup/hash_tableHashTableV2*
	container *
	key_dtype0*
_output_shapes
: *
use_node_name_sharing( *
value_dtype0	*
shared_name 
О
Clinear/linear_model/mother_race/mother_race_lookup/hash_table/ConstConst*
dtype0	*
valueB	 R
€€€€€€€€€*
_output_shapes
: 
™
Hlinear/linear_model/mother_race/mother_race_lookup/hash_table/table_initInitializeTableV2=linear/linear_model/mother_race/mother_race_lookup/hash_table8linear/linear_model/mother_race/mother_race_lookup/Const:linear/linear_model/mother_race/mother_race_lookup/ToInt64*

Tkey0*

Tval0	
Њ
1linear/linear_model/mother_race/hash_table_LookupLookupTableFindV2=linear/linear_model/mother_race/mother_race_lookup/hash_table6linear/linear_model/mother_race/to_sparse_input/GatherClinear/linear_model/mother_race/mother_race_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:€€€€€€€€€
Ь
*linear/linear_model/mother_race/Shape/CastCast4linear/linear_model/mother_race/to_sparse_input/Cast*

DstT0*

SrcT0	*
_output_shapes
:
}
3linear/linear_model/mother_race/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:

5linear/linear_model/mother_race/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:

5linear/linear_model/mother_race/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Ю
-linear/linear_model/mother_race/strided_sliceStridedSlice*linear/linear_model/mother_race/Shape/Cast3linear/linear_model/mother_race/strided_slice/stack5linear/linear_model/mother_race/strided_slice/stack_15linear/linear_model/mother_race/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
s
(linear/linear_model/mother_race/Cast/x/1Const*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
Ѕ
&linear/linear_model/mother_race/Cast/xPack-linear/linear_model/mother_race/strided_slice(linear/linear_model/mother_race/Cast/x/1*
_output_shapes
:*

axis *
T0*
N
И
$linear/linear_model/mother_race/CastCast&linear/linear_model/mother_race/Cast/x*

DstT0	*

SrcT0*
_output_shapes
:
А
-linear/linear_model/mother_race/SparseReshapeSparseReshape5linear/linear_model/mother_race/to_sparse_input/Where4linear/linear_model/mother_race/to_sparse_input/Cast$linear/linear_model/mother_race/Cast*-
_output_shapes
:€€€€€€€€€:
£
6linear/linear_model/mother_race/SparseReshape/IdentityIdentity1linear/linear_model/mother_race/hash_table_Lookup*
T0	*#
_output_shapes
:€€€€€€€€€
Ў
@linear/linear_model/mother_race/weights/part_0/Initializer/zerosConst*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
valueB*    *
_output_shapes

:
е
.linear/linear_model/mother_race/weights/part_0
VariableV2*
	container *
_output_shapes

:*
dtype0*
shape
:*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
shared_name 
∆
5linear/linear_model/mother_race/weights/part_0/AssignAssign.linear/linear_model/mother_race/weights/part_0@linear/linear_model/mother_race/weights/part_0/Initializer/zeros*
validate_shape(*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
use_locking(*
T0*
_output_shapes

:
џ
3linear/linear_model/mother_race/weights/part_0/readIdentity.linear/linear_model/mother_race/weights/part_0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
T0*
_output_shapes

:
В
8linear/linear_model/mother_race/weighted_sum/Slice/beginConst*
dtype0*
valueB: *
_output_shapes
:
Б
7linear/linear_model/mother_race/weighted_sum/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
С
2linear/linear_model/mother_race/weighted_sum/SliceSlice/linear/linear_model/mother_race/SparseReshape:18linear/linear_model/mother_race/weighted_sum/Slice/begin7linear/linear_model/mother_race/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:
|
2linear/linear_model/mother_race/weighted_sum/ConstConst*
dtype0*
valueB: *
_output_shapes
:
я
1linear/linear_model/mother_race/weighted_sum/ProdProd2linear/linear_model/mother_race/weighted_sum/Slice2linear/linear_model/mother_race/weighted_sum/Const*

Tidx0*
T0	*
	keep_dims( *
_output_shapes
: 
}
;linear/linear_model/mother_race/weighted_sum/Gather/indicesConst*
dtype0*
value	B :*
_output_shapes
: 
ъ
3linear/linear_model/mother_race/weighted_sum/GatherGather/linear/linear_model/mother_race/SparseReshape:1;linear/linear_model/mother_race/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
Ё
3linear/linear_model/mother_race/weighted_sum/Cast/xPack1linear/linear_model/mother_race/weighted_sum/Prod3linear/linear_model/mother_race/weighted_sum/Gather*
_output_shapes
:*

axis *
T0	*
N
П
:linear/linear_model/mother_race/weighted_sum/SparseReshapeSparseReshape-linear/linear_model/mother_race/SparseReshape/linear/linear_model/mother_race/SparseReshape:13linear/linear_model/mother_race/weighted_sum/Cast/x*-
_output_shapes
:€€€€€€€€€:
µ
Clinear/linear_model/mother_race/weighted_sum/SparseReshape/IdentityIdentity6linear/linear_model/mother_race/SparseReshape/Identity*
T0	*#
_output_shapes
:€€€€€€€€€
}
;linear/linear_model/mother_race/weighted_sum/GreaterEqual/yConst*
dtype0	*
value	B	 R *
_output_shapes
: 
щ
9linear/linear_model/mother_race/weighted_sum/GreaterEqualGreaterEqualClinear/linear_model/mother_race/weighted_sum/SparseReshape/Identity;linear/linear_model/mother_race/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:€€€€€€€€€
Я
2linear/linear_model/mother_race/weighted_sum/WhereWhere9linear/linear_model/mother_race/weighted_sum/GreaterEqual*'
_output_shapes
:€€€€€€€€€
Н
:linear/linear_model/mother_race/weighted_sum/Reshape/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
л
4linear/linear_model/mother_race/weighted_sum/ReshapeReshape2linear/linear_model/mother_race/weighted_sum/Where:linear/linear_model/mother_race/weighted_sum/Reshape/shape*
Tshape0*
T0	*#
_output_shapes
:€€€€€€€€€
С
5linear/linear_model/mother_race/weighted_sum/Gather_1Gather:linear/linear_model/mother_race/weighted_sum/SparseReshape4linear/linear_model/mother_race/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:€€€€€€€€€
Ц
5linear/linear_model/mother_race/weighted_sum/Gather_2GatherClinear/linear_model/mother_race/weighted_sum/SparseReshape/Identity4linear/linear_model/mother_race/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:€€€€€€€€€
§
5linear/linear_model/mother_race/weighted_sum/IdentityIdentity<linear/linear_model/mother_race/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
И
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
value	B	 R *
_output_shapes
: 
Ю
Tlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
≠
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_sliceStridedSlice5linear/linear_model/mother_race/weighted_sum/IdentityTlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stackVlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_1Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ќ
Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/CastCastNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice*

DstT0*

SrcT0	*
_output_shapes
: 
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
г
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/rangeRangeLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/startElinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/CastLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
‘
Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Cast_1CastFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/range*

DstT0	*

SrcT0*#
_output_shapes
:€€€€€€€€€
І
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
valueB"        *
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
¬
Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1StridedSlice5linear/linear_model/mother_race/weighted_sum/Gather_1Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stackXlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_1Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
Љ
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffListDiffGlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Cast_1Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
†
Vlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
valueB: *
_output_shapes
:
Ґ
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Ґ
Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
µ
Plinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2StridedSlice5linear/linear_model/mother_race/weighted_sum/IdentityVlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stackXlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_1Xlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0	*
shrink_axis_mask
Ъ
Olinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
valueB :
€€€€€€€€€*
_output_shapes
: 
≠
Klinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims
ExpandDimsPlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/strided_slice_2Olinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes
:
Ю
\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
value	B
 Z*
_output_shapes
: 
Ю
\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
value	B
 Z *
_output_shapes
: 
Й
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDenseSparseToDenseIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffKlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ExpandDims\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/sparse_values\linear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense/default_value*
validate_indices(*
Tindices0	*
T0
*#
_output_shapes
:€€€€€€€€€
Я
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
Ѓ
Hlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ReshapeReshapeIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiffNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape/shape*
Tshape0*
T0	*'
_output_shapes
:€€€€€€€€€
‘
Klinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/zeros_like	ZerosLikeHlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:€€€€€€€€€
О
Llinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
€
Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concatConcatV2Hlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ReshapeKlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/zeros_likeLlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
ѕ
Flinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ShapeShapeIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ListDiff*
out_type0*
T0	*
_output_shapes
:
Л
Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/FillFillFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/ShapeFlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:€€€€€€€€€
Р
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
м
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1ConcatV25linear/linear_model/mother_race/weighted_sum/Gather_1Glinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concatNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1/axis*'
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
Р
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
ж
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2ConcatV25linear/linear_model/mother_race/weighted_sum/Gather_2Elinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/FillNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_2/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0	*
N
н
Nlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorderSparseReorderIlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_1Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/concat_25linear/linear_model/mother_race/weighted_sum/Identity*
T0	*6
_output_shapes$
":€€€€€€€€€:€€€€€€€€€
±
Ilinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/IdentityIdentity5linear/linear_model/mother_race/weighted_sum/Identity*
T0	*
_output_shapes
:
©
Xlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
valueB"        *
_output_shapes
:
Ђ
Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
valueB"       *
_output_shapes
:
Ђ
Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
valueB"      *
_output_shapes
:
г
Rlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorderXlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stackZlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Zlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
new_axis_mask *
Index0*#
_output_shapes
:€€€€€€€€€*

begin_mask*
ellipsis_mask *
end_mask*
T0	*
shrink_axis_mask
в
Ilinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/CastCastRlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:€€€€€€€€€
у
Klinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/UniqueUniquePlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseReorder:1*
out_idx0*
T0	*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
Ulinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/embedding_lookupGather3linear/linear_model/mother_race/weights/part_0/readKlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*'
_output_shapes
:€€€€€€€€€
З
Dlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparseSparseSegmentSumUlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/embedding_lookupMlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Unique:1Ilinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:€€€€€€€€€
Н
<linear/linear_model/mother_race/weighted_sum/Reshape_1/shapeConst*
dtype0*
valueB"€€€€   *
_output_shapes
:
П
6linear/linear_model/mother_race/weighted_sum/Reshape_1ReshapeNlinear/linear_model/mother_race/weighted_sum/SparseFillEmptyRows/SparseToDense<linear/linear_model/mother_race/weighted_sum/Reshape_1/shape*
Tshape0*
T0
*'
_output_shapes
:€€€€€€€€€
ґ
2linear/linear_model/mother_race/weighted_sum/ShapeShapeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
out_type0*
T0*
_output_shapes
:
К
@linear/linear_model/mother_race/weighted_sum/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
М
Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Џ
:linear/linear_model/mother_race/weighted_sum/strided_sliceStridedSlice2linear/linear_model/mother_race/weighted_sum/Shape@linear/linear_model/mother_race/weighted_sum/strided_slice/stackBlinear/linear_model/mother_race/weighted_sum/strided_slice/stack_1Blinear/linear_model/mother_race/weighted_sum/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
v
4linear/linear_model/mother_race/weighted_sum/stack/0Const*
dtype0*
value	B :*
_output_shapes
: 
ж
2linear/linear_model/mother_race/weighted_sum/stackPack4linear/linear_model/mother_race/weighted_sum/stack/0:linear/linear_model/mother_race/weighted_sum/strided_slice*
_output_shapes
:*

axis *
T0*
N
т
1linear/linear_model/mother_race/weighted_sum/TileTile6linear/linear_model/mother_race/weighted_sum/Reshape_12linear/linear_model/mother_race/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
Љ
7linear/linear_model/mother_race/weighted_sum/zeros_like	ZerosLikeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
Ъ
,linear/linear_model/mother_race/weighted_sumSelect1linear/linear_model/mother_race/weighted_sum/Tile7linear/linear_model/mother_race/weighted_sum/zeros_likeDlinear/linear_model/mother_race/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:€€€€€€€€€
†
3linear/linear_model/mother_race/weighted_sum/Cast_1Cast/linear/linear_model/mother_race/SparseReshape:1*

DstT0*

SrcT0	*
_output_shapes
:
Д
:linear/linear_model/mother_race/weighted_sum/Slice_1/beginConst*
dtype0*
valueB: *
_output_shapes
:
Г
9linear/linear_model/mother_race/weighted_sum/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
Ы
4linear/linear_model/mother_race/weighted_sum/Slice_1Slice3linear/linear_model/mother_race/weighted_sum/Cast_1:linear/linear_model/mother_race/weighted_sum/Slice_1/begin9linear/linear_model/mother_race/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
†
4linear/linear_model/mother_race/weighted_sum/Shape_1Shape,linear/linear_model/mother_race/weighted_sum*
out_type0*
T0*
_output_shapes
:
Д
:linear/linear_model/mother_race/weighted_sum/Slice_2/beginConst*
dtype0*
valueB:*
_output_shapes
:
М
9linear/linear_model/mother_race/weighted_sum/Slice_2/sizeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
Ь
4linear/linear_model/mother_race/weighted_sum/Slice_2Slice4linear/linear_model/mother_race/weighted_sum/Shape_1:linear/linear_model/mother_race/weighted_sum/Slice_2/begin9linear/linear_model/mother_race/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:
z
8linear/linear_model/mother_race/weighted_sum/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Я
3linear/linear_model/mother_race/weighted_sum/concatConcatV24linear/linear_model/mother_race/weighted_sum/Slice_14linear/linear_model/mother_race/weighted_sum/Slice_28linear/linear_model/mother_race/weighted_sum/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
д
6linear/linear_model/mother_race/weighted_sum/Reshape_2Reshape,linear/linear_model/mother_race/weighted_sum3linear/linear_model/mother_race/weighted_sum/concat*
Tshape0*
T0*'
_output_shapes
:€€€€€€€€€
ћ
(linear/linear_model/weighted_sum_no_biasAddN6linear/linear_model/alcohol_use/weighted_sum/Reshape_2Flinear/linear_model/alcohol_use_X_cigarette_use/weighted_sum/Reshape_28linear/linear_model/cigarette_use/weighted_sum/Reshape_22linear/linear_model/is_male/weighted_sum/Reshape_29linear/linear_model/mother_married/weighted_sum/Reshape_26linear/linear_model/mother_race/weighted_sum/Reshape_2*
N*
T0*'
_output_shapes
:€€€€€€€€€
¬
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
valueB*    *
_output_shapes
:
ѕ
'linear/linear_model/bias_weights/part_0
VariableV2*
	container *
_output_shapes
:*
dtype0*
shape:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
shared_name 
¶
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
¬
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
T0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
ј
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
data_formatNHWC*
T0*'
_output_shapes
:€€€€€€€€€
^
linear/zero_fraction/zeroConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Т
linear/zero_fraction/EqualEqual linear/linear_model/weighted_sumlinear/zero_fraction/zero*
T0*'
_output_shapes
:€€€€€€€€€
~
linear/zero_fraction/CastCastlinear/zero_fraction/Equal*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€
k
linear/zero_fraction/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Ц
linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
Р
*linear/linear/fraction_of_zero_values/tagsConst*
dtype0*6
value-B+ B%linear/linear/fraction_of_zero_values*
_output_shapes
: 
Ю
%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
u
linear/linear/activation/tagConst*
dtype0*)
value B Blinear/linear/activation*
_output_shapes
: 
Н
linear/linear/activationHistogramSummarylinear/linear/activation/tag linear/linear_model/weighted_sum*
T0*
_output_shapes
: 
r
addAdddnn/logits/BiasAdd linear/linear_model/weighted_sum*
T0*'
_output_shapes
:€€€€€€€€€
w
"regression_head/predictions/scoresSqueezeadd*
squeeze_dims
*
T0*#
_output_shapes
:€€€€€€€€€
В
$regression_head/predictions/IdentityIdentity"regression_head/predictions/scores*
T0*#
_output_shapes
:€€€€€€€€€
n
%regression_head/mean_squared_loss/subSubadd	DecodeCSV*
T0*'
_output_shapes
:€€€€€€€€€
Д
!regression_head/mean_squared_lossSquare%regression_head/mean_squared_loss/sub*
T0*'
_output_shapes
:€€€€€€€€€
}
,regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
љ
&regression_head/mean_squared_loss/lossMean!regression_head/mean_squared_loss,regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
g
"regression_head/ScalarSummary/tagsConst*
dtype0*
valueB
 Bloss*
_output_shapes
: 
Ы
regression_head/ScalarSummaryScalarSummary"regression_head/ScalarSummary/tags&regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
g
"regression_head/metrics/mean/zerosConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ж
"regression_head/metrics/mean/total
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ь
)regression_head/metrics/mean/total/AssignAssign"regression_head/metrics/mean/total"regression_head/metrics/mean/zeros*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking(*
T0*
_output_shapes
: 
ѓ
'regression_head/metrics/mean/total/readIdentity"regression_head/metrics/mean/total*5
_class+
)'loc:@regression_head/metrics/mean/total*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/zeros_1Const*
dtype0*
valueB
 *    *
_output_shapes
: 
Ж
"regression_head/metrics/mean/count
VariableV2*
dtype0*
shape: *
shared_name *
	container *
_output_shapes
: 
ю
)regression_head/metrics/mean/count/AssignAssign"regression_head/metrics/mean/count$regression_head/metrics/mean/zeros_1*
validate_shape(*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking(*
T0*
_output_shapes
: 
ѓ
'regression_head/metrics/mean/count/readIdentity"regression_head/metrics/mean/count*5
_class+
)'loc:@regression_head/metrics/mean/count*
T0*
_output_shapes
: 
c
!regression_head/metrics/mean/SizeConst*
dtype0*
value	B :*
_output_shapes
: 
Б
&regression_head/metrics/mean/ToFloat_1Cast!regression_head/metrics/mean/Size*

DstT0*

SrcT0*
_output_shapes
: 
e
"regression_head/metrics/mean/ConstConst*
dtype0*
valueB *
_output_shapes
: 
±
 regression_head/metrics/mean/SumSum&regression_head/mean_squared_loss/loss"regression_head/metrics/mean/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
д
&regression_head/metrics/mean/AssignAdd	AssignAdd"regression_head/metrics/mean/total regression_head/metrics/mean/Sum*5
_class+
)'loc:@regression_head/metrics/mean/total*
use_locking( *
T0*
_output_shapes
: 
Х
(regression_head/metrics/mean/AssignAdd_1	AssignAdd"regression_head/metrics/mean/count&regression_head/metrics/mean/ToFloat_1'^regression_head/mean_squared_loss/loss*5
_class+
)'loc:@regression_head/metrics/mean/count*
use_locking( *
T0*
_output_shapes
: 
k
&regression_head/metrics/mean/Greater/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
°
$regression_head/metrics/mean/GreaterGreater'regression_head/metrics/mean/count/read&regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
Ґ
$regression_head/metrics/mean/truedivRealDiv'regression_head/metrics/mean/total/read'regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
i
$regression_head/metrics/mean/value/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
њ
"regression_head/metrics/mean/valueSelect$regression_head/metrics/mean/Greater$regression_head/metrics/mean/truediv$regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/Greater_1/yConst*
dtype0*
valueB
 *    *
_output_shapes
: 
¶
&regression_head/metrics/mean/Greater_1Greater(regression_head/metrics/mean/AssignAdd_1(regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
§
&regression_head/metrics/mean/truediv_1RealDiv&regression_head/metrics/mean/AssignAdd(regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
m
(regression_head/metrics/mean/update_op/eConst*
dtype0*
valueB
 *    *
_output_shapes
: 
Ћ
&regression_head/metrics/mean/update_opSelect&regression_head/metrics/mean/Greater_1&regression_head/metrics/mean/truediv_1(regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
;

group_depsNoOp'^regression_head/metrics/mean/update_op
{
eval_step/Initializer/zerosConst*
dtype0	*
_class
loc:@eval_step*
value	B	 R *
_output_shapes
: 
Л
	eval_step
VariableV2*
	container *
_output_shapes
: *
dtype0	*
shape: *
_class
loc:@eval_step*
shared_name 
™
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
validate_shape(*
_class
loc:@eval_step*
use_locking(*
T0	*
_output_shapes
: 
d
eval_step/readIdentity	eval_step*
_class
loc:@eval_step*
T0	*
_output_shapes
: 
Q
AssignAdd/valueConst*
dtype0	*
value	B	 R*
_output_shapes
: 
Д
	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
_class
loc:@eval_step*
use_locking( *
T0	*
_output_shapes
: 
Б
initNoOp^global_step/Assigna^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign6^linear/linear_model/alcohol_use/weights/part_0/AssignF^linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/Assign8^linear/linear_model/cigarette_use/weights/part_0/Assign2^linear/linear_model/is_male/weights/part_0/Assign9^linear/linear_model/mother_married/weights/part_0/Assign6^linear/linear_model/mother_race/weights/part_0/Assign/^linear/linear_model/bias_weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1
Я
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
љ
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes
: 
Ћ
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
…
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ћ
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
…
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
љ
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
ї
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
з
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitialized.linear/linear_model/alcohol_use/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
_output_shapes
: 
З
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
_output_shapes
: 
м
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized0linear/linear_model/cigarette_use/weights/part_0*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
_output_shapes
: 
а
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized*linear/linear_model/is_male/weights/part_0*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
_output_shapes
: 
о
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized1linear/linear_model/mother_married/weights/part_0*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
_output_shapes
: 
и
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized.linear/linear_model/mother_race/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
_output_shapes
: 
Џ
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
∞
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedmatching_filenames*
dtype0*%
_class
loc:@matching_filenames*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized"input_producer/limit_epochs/epochs*
dtype0	*5
_class+
)'loc:@input_producer/limit_epochs/epochs*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized"regression_head/metrics/mean/total*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/total*
_output_shapes
: 
–
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized"regression_head/metrics/mean/count*
dtype0*5
_class+
)'loc:@regression_head/metrics/mean/count*
_output_shapes
: 
Ю
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized	eval_step*
dtype0	*
_class
loc:@eval_step*
_output_shapes
: 
ќ	
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_19*
_output_shapes
:*

axis *
T0
*
N
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
ц
$report_uninitialized_variables/ConstConst*
dtype0*Э
valueУBРBglobal_stepBYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0B dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B.linear/linear_model/alcohol_use/weights/part_0B>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0B0linear/linear_model/cigarette_use/weights/part_0B*linear/linear_model/is_male/weights/part_0B1linear/linear_model/mother_married/weights/part_0B.linear/linear_model/mother_race/weights/part_0B'linear/linear_model/bias_weights/part_0Bmatching_filenamesB"input_producer/limit_epochs/epochsB"regression_head/metrics/mean/totalB"regression_head/metrics/mean/countB	eval_step*
_output_shapes
:
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Й
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ў
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
М
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
х
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
Н
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
б
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
ѓ
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
_output_shapes
:*

axis *
T0*
N
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ђ
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ћ
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
Tshape0*
T0*
_output_shapes
:
О
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
џ
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
Tshape0*
T0
*
_output_shapes
:
Ъ
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:€€€€€€€€€
ґ
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:€€€€€€€€€
В
2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
g
$report_uninitialized_resources/ConstConst*
dtype0*
valueB *
_output_shapes
: 
M
concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Љ
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*#
_output_shapes
:€€€€€€€€€*

Tidx0*
T0*
N
°
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
њ
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes
: 
Ќ
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
_output_shapes
: 
Ћ
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
_output_shapes
: 
Ќ
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
_output_shapes
: 
Ћ
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
_output_shapes
: 
њ
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/logits/weights/part_0*
dtype0*,
_class"
 loc:@dnn/logits/weights/part_0*
_output_shapes
: 
љ
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/biases/part_0*
dtype0*+
_class!
loc:@dnn/logits/biases/part_0*
_output_shapes
: 
й
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitialized.linear/linear_model/alcohol_use/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
_output_shapes
: 
Й
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
dtype0*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
_output_shapes
: 
о
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized0linear/linear_model/cigarette_use/weights/part_0*
dtype0*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
_output_shapes
: 
в
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized*linear/linear_model/is_male/weights/part_0*
dtype0*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
_output_shapes
: 
р
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized1linear/linear_model/mother_married/weights/part_0*
dtype0*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
_output_shapes
: 
к
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized.linear/linear_model/mother_race/weights/part_0*
dtype0*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
_output_shapes
: 
№
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized'linear/linear_model/bias_weights/part_0*
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
: 
—
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_14*
_output_shapes
:*

axis *
T0
*
N
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
н
&report_uninitialized_variables_1/ConstConst*
dtype0*Т
valueИBЕBglobal_stepBYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0B dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B.linear/linear_model/alcohol_use/weights/part_0B>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0B0linear/linear_model/cigarette_use/weights/part_0B*linear/linear_model/is_male/weights/part_0B1linear/linear_model/mother_married/weights/part_0B.linear/linear_model/mother_race/weights/part_0B'linear/linear_model/bias_weights/part_0*
_output_shapes
:
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Л
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
г
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask*
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
О
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
valueB: *
_output_shapes
:
ы
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Н
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
valueB:*
_output_shapes
:
П
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
П
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
л
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
≥
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
_output_shapes
:*

axis *
T0*
N
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
≥
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
—
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
Tshape0*
T0*
_output_shapes
:
Р
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
valueB:
€€€€€€€€€*
_output_shapes
:
б
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
Tshape0*
T0
*
_output_shapes
:
Ю
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:€€€€€€€€€
Ї
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
squeeze_dims
*
T0	*#
_output_shapes
:€€€€€€€€€
И
4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*
validate_indices(*
Tparams0*
Tindices0	*#
_output_shapes
:€€€€€€€€€
Ѕ
init_2NoOp^matching_filenames/Assign*^input_producer/limit_epochs/epochs/Assign*^regression_head/metrics/mean/total/Assign*^regression_head/metrics/mean/count/Assign^eval_step/Assign
К
init_all_tablesNoOpj^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initI^linear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/table_init[^linear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/table_initA^linear/linear_model/is_male/is_male_lookup/hash_table/table_initO^linear/linear_model/mother_married/mother_married_lookup/hash_table/table_initI^linear/linear_model/mother_race/mother_race_lookup/hash_table/table_init
/
group_deps_2NoOp^init_2^init_all_tables
ђ
Merge/MergeSummaryMergeSummary"input_producer/fraction_of_32_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation%linear/linear/fraction_of_zero_valueslinear/linear/activationregression_head/ScalarSummary*
N
*
_output_shapes
: 
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
Д
save/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_82622d2e5d444cd481224ae9bfb942cb/part*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
value	B :*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
dtype0*
value	B : *
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
э
save/SaveV2/tensor_namesConst*
dtype0*∞
value¶B£Bdnn/hiddenlayer_0/biasesBdnn/hiddenlayer_0/weightsBdnn/hiddenlayer_1/biasesBdnn/hiddenlayer_1/weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBdnn/logits/biasesBdnn/logits/weightsBglobal_stepB'linear/linear_model/alcohol_use/weightsB7linear/linear_model/alcohol_use_X_cigarette_use/weightsB linear/linear_model/bias_weightsB)linear/linear_model/cigarette_use/weightsB#linear/linear_model/is_male/weightsB*linear/linear_model/mother_married/weightsB'linear/linear_model/mother_race/weights*
_output_shapes
:
Ц
save/SaveV2/shape_and_slicesConst*
dtype0*≈
valueїBЄB32 0,32B7 32 0,7:0,32B16 0,16B32 16 0,32:0,16B12 4 0,12:0,4B1 0,1B16 1 0,16:0,1B B3 1 0,3:0,1B9 1 0,9:0,1B1 0,1B3 1 0,3:0,1B2 1 0,2:0,1B2 1 0,2:0,1B12 1 0,12:0,1*
_output_shapes
:
≈
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/read%dnn/hiddenlayer_0/weights/part_0/read$dnn/hiddenlayer_1/biases/part_0/read%dnn/hiddenlayer_1/weights/part_0/read^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readdnn/logits/biases/part_0/readdnn/logits/weights/part_0/readglobal_step3linear/linear_model/alcohol_use/weights/part_0/readClinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read,linear/linear_model/bias_weights/part_0/read5linear/linear_model/cigarette_use/weights/part_0/read/linear/linear_model/is_male/weights/part_0/read6linear/linear_model/mother_married/weights/part_0/read3linear/linear_model/mother_race/weights/part_0/read*
dtypes
2	
С
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
T0*
_output_shapes
: 
Э
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
_output_shapes
:*

axis *
T0*
N
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
|
save/RestoreV2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_0/biases*
_output_shapes
:
o
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueBB32 0,32*
_output_shapes
:
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
»
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
use_locking(*
T0*
_output_shapes
: 

save/RestoreV2_1/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_0/weights*
_output_shapes
:
w
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*"
valueBB7 32 0,7:0,32*
_output_shapes
:
Ц
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
“
save/Assign_1Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_1*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
~
save/RestoreV2_2/tensor_namesConst*
dtype0*-
value$B"Bdnn/hiddenlayer_1/biases*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueBB16 0,16*
_output_shapes
:
Ц
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
ћ
save/Assign_2Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_2*
validate_shape(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
use_locking(*
T0*
_output_shapes
:

save/RestoreV2_3/tensor_namesConst*
dtype0*.
value%B#Bdnn/hiddenlayer_1/weights*
_output_shapes
:
y
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*$
valueBB32 16 0,32:0,16*
_output_shapes
:
Ц
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
“
save/Assign_3Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_3*
validate_shape(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
use_locking(*
T0*
_output_shapes

: 
Є
save/RestoreV2_4/tensor_namesConst*
dtype0*g
value^B\BRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights*
_output_shapes
:
w
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*"
valueBB12 4 0,12:0,4*
_output_shapes
:
Ц
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
ƒ
save/Assign_4AssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0save/RestoreV2_4*
validate_shape(*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
use_locking(*
T0*
_output_shapes

:
w
save/RestoreV2_5/tensor_namesConst*
dtype0*&
valueBBdnn/logits/biases*
_output_shapes
:
o
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:
Ц
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
Њ
save/Assign_5Assigndnn/logits/biases/part_0save/RestoreV2_5*
validate_shape(*+
_class!
loc:@dnn/logits/biases/part_0*
use_locking(*
T0*
_output_shapes
:
x
save/RestoreV2_6/tensor_namesConst*
dtype0*'
valueBBdnn/logits/weights*
_output_shapes
:
w
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*"
valueBB16 1 0,16:0,1*
_output_shapes
:
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
ƒ
save/Assign_6Assigndnn/logits/weights/part_0save/RestoreV2_6*
validate_shape(*,
_class"
 loc:@dnn/logits/weights/part_0*
use_locking(*
T0*
_output_shapes

:
q
save/RestoreV2_7/tensor_namesConst*
dtype0* 
valueBBglobal_step*
_output_shapes
:
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ц
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2	*
_output_shapes
:
†
save/Assign_7Assignglobal_stepsave/RestoreV2_7*
validate_shape(*
_class
loc:@global_step*
use_locking(*
T0	*
_output_shapes
: 
Н
save/RestoreV2_8/tensor_namesConst*
dtype0*<
value3B1B'linear/linear_model/alcohol_use/weights*
_output_shapes
:
u
!save/RestoreV2_8/shape_and_slicesConst*
dtype0* 
valueBB3 1 0,3:0,1*
_output_shapes
:
Ц
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_8Assign.linear/linear_model/alcohol_use/weights/part_0save/RestoreV2_8*
validate_shape(*A
_class7
53loc:@linear/linear_model/alcohol_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Э
save/RestoreV2_9/tensor_namesConst*
dtype0*L
valueCBAB7linear/linear_model/alcohol_use_X_cigarette_use/weights*
_output_shapes
:
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0* 
valueBB9 1 0,9:0,1*
_output_shapes
:
Ц
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
О
save/Assign_9Assign>linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0save/RestoreV2_9*
validate_shape(*Q
_classG
ECloc:@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:	
З
save/RestoreV2_10/tensor_namesConst*
dtype0*5
value,B*B linear/linear_model/bias_weights*
_output_shapes
:
p
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueBB1 0,1*
_output_shapes
:
Щ
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
ё
save/Assign_10Assign'linear/linear_model/bias_weights/part_0save/RestoreV2_10*
validate_shape(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
use_locking(*
T0*
_output_shapes
:
Р
save/RestoreV2_11/tensor_namesConst*
dtype0*>
value5B3B)linear/linear_model/cigarette_use/weights*
_output_shapes
:
v
"save/RestoreV2_11/shape_and_slicesConst*
dtype0* 
valueBB3 1 0,3:0,1*
_output_shapes
:
Щ
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
ф
save/Assign_11Assign0linear/linear_model/cigarette_use/weights/part_0save/RestoreV2_11*
validate_shape(*C
_class9
75loc:@linear/linear_model/cigarette_use/weights/part_0*
use_locking(*
T0*
_output_shapes

:
К
save/RestoreV2_12/tensor_namesConst*
dtype0*8
value/B-B#linear/linear_model/is_male/weights*
_output_shapes
:
v
"save/RestoreV2_12/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:
Щ
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
и
save/Assign_12Assign*linear/linear_model/is_male/weights/part_0save/RestoreV2_12*
validate_shape(*=
_class3
1/loc:@linear/linear_model/is_male/weights/part_0*
use_locking(*
T0*
_output_shapes

:
С
save/RestoreV2_13/tensor_namesConst*
dtype0*?
value6B4B*linear/linear_model/mother_married/weights*
_output_shapes
:
v
"save/RestoreV2_13/shape_and_slicesConst*
dtype0* 
valueBB2 1 0,2:0,1*
_output_shapes
:
Щ
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
ц
save/Assign_13Assign1linear/linear_model/mother_married/weights/part_0save/RestoreV2_13*
validate_shape(*D
_class:
86loc:@linear/linear_model/mother_married/weights/part_0*
use_locking(*
T0*
_output_shapes

:
О
save/RestoreV2_14/tensor_namesConst*
dtype0*<
value3B1B'linear/linear_model/mother_race/weights*
_output_shapes
:
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*"
valueBB12 1 0,12:0,1*
_output_shapes
:
Щ
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
р
save/Assign_14Assign.linear/linear_model/mother_race/weights/part_0save/RestoreV2_14*
validate_shape(*A
_class7
53loc:@linear/linear_model/mother_race/weights/part_0*
use_locking(*
T0*
_output_shapes

:
Н
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14
-
save/restore_allNoOp^save/restore_shard""U
ready_for_local_init_op:
8
6report_uninitialized_variables_1/boolean_mask/Gather:0" 
global_step

global_step:0"Ї
trainable_variablesҐЯ
Г
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights  "
Я
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights   " 
Ш
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases  " 
Я
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights   " 
Ш
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
Г
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights  "
|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
„
0linear/linear_model/alcohol_use/weights/part_0:05linear/linear_model/alcohol_use/weights/part_0/Assign5linear/linear_model/alcohol_use/weights/part_0/read:0"5
'linear/linear_model/alcohol_use/weights  "
Ч
@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0:0Elinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/AssignElinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read:0"E
7linear/linear_model/alcohol_use_X_cigarette_use/weights	  "	
я
2linear/linear_model/cigarette_use/weights/part_0:07linear/linear_model/cigarette_use/weights/part_0/Assign7linear/linear_model/cigarette_use/weights/part_0/read:0"7
)linear/linear_model/cigarette_use/weights  "
«
,linear/linear_model/is_male/weights/part_0:01linear/linear_model/is_male/weights/part_0/Assign1linear/linear_model/is_male/weights/part_0/read:0"1
#linear/linear_model/is_male/weights  "
г
3linear/linear_model/mother_married/weights/part_0:08linear/linear_model/mother_married/weights/part_0/Assign8linear/linear_model/mother_married/weights/part_0/read:0"8
*linear/linear_model/mother_married/weights  "
„
0linear/linear_model/mother_race/weights/part_0:05linear/linear_model/mother_race/weights/part_0/Assign5linear/linear_model/mother_race/weights/part_0/read:0"5
'linear/linear_model/mother_race/weights  "
Є
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights ""!
local_init_op

group_deps_2"й
	variablesџЎ
7
global_step:0global_step/Assignglobal_step/read:0
Г
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights  "
Я
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights   " 
Ш
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases  " 
Я
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights   " 
Ш
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
Г
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights  "
|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
„
0linear/linear_model/alcohol_use/weights/part_0:05linear/linear_model/alcohol_use/weights/part_0/Assign5linear/linear_model/alcohol_use/weights/part_0/read:0"5
'linear/linear_model/alcohol_use/weights  "
Ч
@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0:0Elinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/AssignElinear/linear_model/alcohol_use_X_cigarette_use/weights/part_0/read:0"E
7linear/linear_model/alcohol_use_X_cigarette_use/weights	  "	
я
2linear/linear_model/cigarette_use/weights/part_0:07linear/linear_model/cigarette_use/weights/part_0/Assign7linear/linear_model/cigarette_use/weights/part_0/read:0"7
)linear/linear_model/cigarette_use/weights  "
«
,linear/linear_model/is_male/weights/part_0:01linear/linear_model/is_male/weights/part_0/Assign1linear/linear_model/is_male/weights/part_0/read:0"1
#linear/linear_model/is_male/weights  "
г
3linear/linear_model/mother_married/weights/part_0:08linear/linear_model/mother_married/weights/part_0/Assign8linear/linear_model/mother_married/weights/part_0/read:0"8
*linear/linear_model/mother_married/weights  "
„
0linear/linear_model/mother_race/weights/part_0:05linear/linear_model/mother_race/weights/part_0/Assign5linear/linear_model/mother_race/weights/part_0/read:0"5
'linear/linear_model/mother_race/weights  "
Є
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights ""ѓ
dnnІ
§
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"О
	summariesА
э
$input_producer/fraction_of_32_full:0
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0
'linear/linear/fraction_of_zero_values:0
linear/linear/activation:0
regression_head/ScalarSummary:0"ђ
local_variablesШ
Х
matching_filenames:0
$input_producer/limit_epochs/epochs:0
$regression_head/metrics/mean/total:0
$regression_head/metrics/mean/count:0
eval_step:0"Ж
table_initializerр
н
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init
Hlinear/linear_model/alcohol_use/alcohol_use_lookup/hash_table/table_init
Zlinear/linear_model/alcohol_use_X_cigarette_use/cigarette_use_lookup/hash_table/table_init
@linear/linear_model/is_male/is_male_lookup/hash_table/table_init
Nlinear/linear_model/mother_married/mother_married_lookup/hash_table/table_init
Hlinear/linear_model/mother_race/mother_race_lookup/hash_table/table_init"Ґ
queue_runnersРН
К
input_producer)input_producer/input_producer_EnqueueMany#input_producer/input_producer_Close"%input_producer/input_producer_Close_1*"ц
linearл
и
0linear/linear_model/alcohol_use/weights/part_0:0
@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0:0
2linear/linear_model/cigarette_use/weights/part_0:0
,linear/linear_model/is_male/weights/part_0:0
3linear/linear_model/mother_married/weights/part_0:0
0linear/linear_model/mother_race/weights/part_0:0
)linear/linear_model/bias_weights/part_0:0"J
savers@>
<
save/Const:0save/Identity:0save/restore_all (5 @F8"&

summary_op

Merge/MergeSummary:0"
	eval_step

eval_step:0"
ready_op


concat:0"£
model_variablesП
М
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0
0linear/linear_model/alcohol_use/weights/part_0:0
@linear/linear_model/alcohol_use_X_cigarette_use/weights/part_0:0
2linear/linear_model/cigarette_use/weights/part_0:0
,linear/linear_model/is_male/weights/part_0:0
3linear/linear_model/mother_married/weights/part_0:0
0linear/linear_model/mother_race/weights/part_0:0
)linear/linear_model/bias_weights/part_0:0"
init_op

group_deps_1;
Иt       ЫЎ-	ЮнF{Б÷A*

losshи@aяСu