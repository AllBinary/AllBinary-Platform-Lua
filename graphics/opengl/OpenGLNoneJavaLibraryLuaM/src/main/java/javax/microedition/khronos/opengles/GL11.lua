-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
local GL10 = require("javax.microedition.khronos.opengles.GL10")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local GL11 = {}
GL11.__index = GL11
GL11.className = "GL11"
setmetatable(GL11, {__index = GL10})


function GL11:glBindBuffer(target, buffer)
    error("abstract method glBindBuffer")
end


function GL11:glBufferData(target, size, data, usage)
    error("abstract method glBufferData")
end


function GL11:glBufferSubData(target, offset, size, data)
    error("abstract method glBufferSubData")
end


function GL11:glClipPlanef(plane, equation, offset)
    error("abstract method glClipPlanef")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glClipPlanef(plane, equation)
    error("abstract method glClipPlanef")
end


function GL11:glColor4ub(red, green, blue, alpha)
    error("abstract method glColor4ub")
end


function GL11:glColorPointer(size, type, stride, offset)
    error("abstract method glColorPointer")
end


function GL11:glDeleteBuffers(n, buffers, offset)
    error("abstract method glDeleteBuffers")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glDeleteBuffers(n, buffers)
    error("abstract method glDeleteBuffers")
end


function GL11:glDrawElements(mode, count, type, offset)
    error("abstract method glDrawElements")
end


function GL11:glGenBuffers(n, buffers, offset)
    error("abstract method glGenBuffers")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGenBuffers(n, buffers)
    error("abstract method glGenBuffers")
end


function GL11:glGetBufferParameteriv(target, pname, params, offset)
    error("abstract method glGetBufferParameteriv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetBufferParameteriv(target, pname, params)
    error("abstract method glGetBufferParameteriv")
end


function GL11:glGetClipPlanef(pname, eqn, offset)
    error("abstract method glGetClipPlanef")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetClipPlanef(pname, eqn)
    error("abstract method glGetClipPlanef")
end


function GL11:glGetFloatv(pname, params, offset)
    error("abstract method glGetFloatv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetFloatv(pname, params)
    error("abstract method glGetFloatv")
end


function GL11:glGetLightfv(light, pname, params, offset)
    error("abstract method glGetLightfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetLightfv(light, pname, params)
    error("abstract method glGetLightfv")
end


function GL11:glGetMaterialfv(face, pname, params, offset)
    error("abstract method glGetMaterialfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetMaterialfv(face, pname, params)
    error("abstract method glGetMaterialfv")
end


function GL11:glGetTexEnviv(env, pname, params, offset)
    error("abstract method glGetTexEnviv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetTexEnviv(env, pname, params)
    error("abstract method glGetTexEnviv")
end


function GL11:glGetTexParameterfv(target, pname, params, offset)
    error("abstract method glGetTexParameterfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetTexParameterfv(target, pname, params)
    error("abstract method glGetTexParameterfv")
end


function GL11:glGetTexParameteriv(target, pname, params, offset)
    error("abstract method glGetTexParameteriv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glGetTexParameteriv(target, pname, params)
    error("abstract method glGetTexParameteriv")
end


function GL11:glIsBuffer(buffer)
    error("abstract method glIsBuffer")
end


function GL11:glIsEnabled(cap)
    error("abstract method glIsEnabled")
end


function GL11:glIsTexture(texture)
    error("abstract method glIsTexture")
end


function GL11:glNormalPointer(type, stride, offset)
    error("abstract method glNormalPointer")
end


function GL11:glPointParameterf(pname, param)
    error("abstract method glPointParameterf")
end


function GL11:glPointParameterfv(pname, params, offset)
    error("abstract method glPointParameterfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glPointParameterfv(pname, params)
    error("abstract method glPointParameterfv")
end


function GL11:glTexCoordPointer(size, type, stride, offset)
    error("abstract method glTexCoordPointer")
end


function GL11:glTexEnvi(target, pname, param)
    error("abstract method glTexEnvi")
end


function GL11:glTexEnviv(target, pname, params, offset)
    error("abstract method glTexEnviv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glTexEnviv(target, pname, params)
    error("abstract method glTexEnviv")
end


function GL11:glTexParameterfv(target, pname, params, offset)
    error("abstract method glTexParameterfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glTexParameterfv(target, pname, params)
    error("abstract method glTexParameterfv")
end


function GL11:glTexParameteriv(target, pname, params, offset)
    error("abstract method glTexParameteriv")
end


-- Java overloaded method: Lua keeps the last definition
function GL11:glTexParameteriv(target, pname, params)
    error("abstract method glTexParameteriv")
end


function GL11:glVertexPointer(size, type, stride, offset)
    error("abstract method glVertexPointer")
end

GL11.GL_ACTIVE_TEXTURE = 34016
GL11.GL_ADD_SIGNED = 34164
GL11.GL_ALPHA_SCALE = 3356
GL11.GL_ALPHA_TEST_FUNC = 3009
GL11.GL_ALPHA_TEST_REF = 3010
GL11.GL_ARRAY_BUFFER = 34962
GL11.GL_ARRAY_BUFFER_BINDING = 34964
GL11.GL_BLEND_DST = 3040
GL11.GL_BLEND_SRC = 3041
GL11.GL_BUFFER_ACCESS = 35003
GL11.GL_BUFFER_SIZE = 34660
GL11.GL_BUFFER_USAGE = 34661
GL11.GL_CLIENT_ACTIVE_TEXTURE = 34017
GL11.GL_CLIP_PLANE0 = 12288
GL11.GL_CLIP_PLANE1 = 12289
GL11.GL_CLIP_PLANE2 = 12290
GL11.GL_CLIP_PLANE3 = 12291
GL11.GL_CLIP_PLANE4 = 12292
GL11.GL_CLIP_PLANE5 = 12293
GL11.GL_COLOR_ARRAY_BUFFER_BINDING = 34968
GL11.GL_COLOR_ARRAY_POINTER = 32912
GL11.GL_COLOR_ARRAY_SIZE = 32897
GL11.GL_COLOR_ARRAY_STRIDE = 32899
GL11.GL_COLOR_ARRAY_TYPE = 32898
GL11.GL_COLOR_CLEAR_VALUE = 3106
GL11.GL_COLOR_WRITEMASK = 3107
GL11.GL_COMBINE = 34160
GL11.GL_COMBINE_ALPHA = 34162
GL11.GL_COMBINE_RGB = 34161
GL11.GL_CONSTANT = 34166
GL11.GL_COORD_REPLACE_OES = 34914
GL11.GL_CULL_FACE_MODE = 2885
GL11.GL_CURRENT_COLOR = 2816
GL11.GL_CURRENT_NORMAL = 2818
GL11.GL_CURRENT_TEXTURE_COORDS = 2819
GL11.GL_DEPTH_CLEAR_VALUE = 2931
GL11.GL_DEPTH_FUNC = 2932
GL11.GL_DEPTH_RANGE = 2928
GL11.GL_DEPTH_WRITEMASK = 2930
GL11.GL_DOT3_RGB = 34478
GL11.GL_DOT3_RGBA = 34479
GL11.GL_DYNAMIC_DRAW = 35048
GL11.GL_ELEMENT_ARRAY_BUFFER = 34963
GL11.GL_ELEMENT_ARRAY_BUFFER_BINDING = 34965
GL11.GL_FRONT_FACE = 2886
GL11.GL_GENERATE_MIPMAP = 33169
GL11.GL_GENERATE_MIPMAP_HINT = 33170
GL11.GL_INTERPOLATE = 34165
GL11.GL_LINE_WIDTH = 2849
GL11.GL_LOGIC_OP_MODE = 3056
GL11.GL_MATRIX_MODE = 2976
GL11.GL_MAX_CLIP_PLANES = 3378
GL11.GL_MODELVIEW_MATRIX = 2982
GL11.GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES = 35213
GL11.GL_MODELVIEW_STACK_DEPTH = 2979
GL11.GL_NORMAL_ARRAY_BUFFER_BINDING = 34967
GL11.GL_NORMAL_ARRAY_POINTER = 32911
GL11.GL_NORMAL_ARRAY_STRIDE = 32895
GL11.GL_NORMAL_ARRAY_TYPE = 32894
GL11.GL_OPERAND0_ALPHA = 34200
GL11.GL_OPERAND0_RGB = 34192
GL11.GL_OPERAND1_ALPHA = 34201
GL11.GL_OPERAND1_RGB = 34193
GL11.GL_OPERAND2_ALPHA = 34202
GL11.GL_OPERAND2_RGB = 34194
GL11.GL_POINT_DISTANCE_ATTENUATION = 33065
GL11.GL_POINT_FADE_THRESHOLD_SIZE = 33064
GL11.GL_POINT_SIZE = 2833
GL11.GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES = 35743
GL11.GL_POINT_SIZE_ARRAY_OES = 35740
GL11.GL_POINT_SIZE_ARRAY_POINTER_OES = 35212
GL11.GL_POINT_SIZE_ARRAY_STRIDE_OES = 35211
GL11.GL_POINT_SIZE_ARRAY_TYPE_OES = 35210
GL11.GL_POINT_SIZE_MAX = 33063
GL11.GL_POINT_SIZE_MIN = 33062
GL11.GL_POINT_SPRITE_OES = 34913
GL11.GL_POLYGON_OFFSET_FACTOR = 32824
GL11.GL_POLYGON_OFFSET_UNITS = 10752
GL11.GL_PREVIOUS = 34168
GL11.GL_PRIMARY_COLOR = 34167
GL11.GL_PROJECTION_MATRIX = 2983
GL11.GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES = 35214
GL11.GL_PROJECTION_STACK_DEPTH = 2980
GL11.GL_RGB_SCALE = 34163
GL11.GL_SAMPLE_BUFFERS = 32936
GL11.GL_SAMPLE_COVERAGE_INVERT = 32939
GL11.GL_SAMPLE_COVERAGE_VALUE = 32938
GL11.GL_SAMPLES = 32937
GL11.GL_SCISSOR_BOX = 3088
GL11.GL_SHADE_MODEL = 2900
GL11.GL_SRC0_ALPHA = 34184
GL11.GL_SRC0_RGB = 34176
GL11.GL_SRC1_ALPHA = 34185
GL11.GL_SRC1_RGB = 34177
GL11.GL_SRC2_ALPHA = 34186
GL11.GL_SRC2_RGB = 34178
GL11.GL_STATIC_DRAW = 35044
GL11.GL_STENCIL_CLEAR_VALUE = 2961
GL11.GL_STENCIL_FAIL = 2964
GL11.GL_STENCIL_FUNC = 2962
GL11.GL_STENCIL_PASS_DEPTH_FAIL = 2965
GL11.GL_STENCIL_PASS_DEPTH_PASS = 2966
GL11.GL_STENCIL_REF = 2967
GL11.GL_STENCIL_VALUE_MASK = 2963
GL11.GL_STENCIL_WRITEMASK = 2968
GL11.GL_SUBTRACT = 34023
GL11.GL_TEXTURE_BINDING_2D = 32873
GL11.GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 34970
GL11.GL_TEXTURE_COORD_ARRAY_POINTER = 32914
GL11.GL_TEXTURE_COORD_ARRAY_SIZE = 32904
GL11.GL_TEXTURE_COORD_ARRAY_STRIDE = 32906
GL11.GL_TEXTURE_COORD_ARRAY_TYPE = 32905
GL11.GL_TEXTURE_MATRIX = 2984
GL11.GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES = 35215
GL11.GL_TEXTURE_STACK_DEPTH = 2981
GL11.GL_VERTEX_ARRAY_BUFFER_BINDING = 34966
GL11.GL_VERTEX_ARRAY_POINTER = 32910
GL11.GL_VERTEX_ARRAY_SIZE = 32890
GL11.GL_VERTEX_ARRAY_STRIDE = 32892
GL11.GL_VERTEX_ARRAY_TYPE = 32891
GL11.GL_VIEWPORT = 2978
GL11.GL_WRITE_ONLY = 35001

return GL11

