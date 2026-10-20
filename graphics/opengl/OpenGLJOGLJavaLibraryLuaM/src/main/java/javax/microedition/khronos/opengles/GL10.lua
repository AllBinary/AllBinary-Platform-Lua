-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

local GL = require("javax.microedition.khronos.opengles.GL")

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
local GL10 = {}
GL10.__index = GL10
GL10.className = "GL10"
setmetatable(GL10, {__index = GL})


function GL10:glActiveTexture(texture)
    error("abstract method glActiveTexture")
end


function GL10:glAlphaFunc(func, ref)
    error("abstract method glAlphaFunc")
end


function GL10:glBindTexture(target, texture)
    error("abstract method glBindTexture")
end


function GL10:glBlendFunc(sfactor, dfactor)
    error("abstract method glBlendFunc")
end


function GL10:glClear(mask)
    error("abstract method glClear")
end


function GL10:glClearColor(red, green, blue, alpha)
    error("abstract method glClearColor")
end


function GL10:glClearDepthf(depth)
    error("abstract method glClearDepthf")
end


function GL10:glClearStencil(s)
    error("abstract method glClearStencil")
end


function GL10:glClientActiveTexture(texture)
    error("abstract method glClientActiveTexture")
end


function GL10:glColor4f(red, green, blue, alpha)
    error("abstract method glColor4f")
end


function GL10:glColorMask(red, green, blue, alpha)
    error("abstract method glColorMask")
end


function GL10:glColorPointer(size, type, stride, pointer)
    error("abstract method glColorPointer")
end


function GL10:glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)
    error("abstract method glCompressedTexImage2D")
end


function GL10:glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)
    error("abstract method glCompressedTexSubImage2D")
end


function GL10:glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)
    error("abstract method glCopyTexImage2D")
end


function GL10:glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
    error("abstract method glCopyTexSubImage2D")
end


function GL10:glCullFace(mode)
    error("abstract method glCullFace")
end


function GL10:glDeleteTextures(n, textures, offset)
    error("abstract method glDeleteTextures")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glDeleteTextures(n, textures)
    error("abstract method glDeleteTextures")
end


function GL10:glDepthFunc(func)
    error("abstract method glDepthFunc")
end


function GL10:glDepthMask(flag)
    error("abstract method glDepthMask")
end


function GL10:glDepthRangef(zNear, zFar)
    error("abstract method glDepthRangef")
end


function GL10:glDisable(cap)
    error("abstract method glDisable")
end


function GL10:glDisableClientState(array)
    error("abstract method glDisableClientState")
end


function GL10:glDrawArrays(mode, first, count)
    error("abstract method glDrawArrays")
end


function GL10:glDrawElements(mode, count, type, indices)
    error("abstract method glDrawElements")
end


function GL10:glEnable(cap)
    error("abstract method glEnable")
end


function GL10:glEnableClientState(array)
    error("abstract method glEnableClientState")
end


function GL10:glFinish()
    error("abstract method glFinish")
end


function GL10:glFlush()
    error("abstract method glFlush")
end


function GL10:glFogf(pname, param)
    error("abstract method glFogf")
end


function GL10:glFogfv(pname, params, offset)
    error("abstract method glFogfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glFogfv(pname, params)
    error("abstract method glFogfv")
end


function GL10:glFrontFace(mode)
    error("abstract method glFrontFace")
end


function GL10:glFrustumf(left, right, bottom, top, zNear, zFar)
    error("abstract method glFrustumf")
end


function GL10:glGenTextures(n, textures, offset)
    error("abstract method glGenTextures")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glGenTextures(n, textures)
    error("abstract method glGenTextures")
end


function GL10:glGetError()
    error("abstract method glGetError")
end


function GL10:glGetIntegerv(pname, params, offset)
    error("abstract method glGetIntegerv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glGetIntegerv(pname, params)
    error("abstract method glGetIntegerv")
end


function GL10:glGetString(name)
    error("abstract method glGetString")
end


function GL10:glHint(target, mode)
    error("abstract method glHint")
end


function GL10:glLightModelf(pname, param)
    error("abstract method glLightModelf")
end


function GL10:glLightModelfv(pname, params, offset)
    error("abstract method glLightModelfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glLightModelfv(pname, params)
    error("abstract method glLightModelfv")
end


function GL10:glLightf(light, pname, param)
    error("abstract method glLightf")
end


function GL10:glLightfv(light, pname, params, offset)
    error("abstract method glLightfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glLightfv(light, pname, params)
    error("abstract method glLightfv")
end


function GL10:glLineWidth(width)
    error("abstract method glLineWidth")
end


function GL10:glLoadIdentity()
    error("abstract method glLoadIdentity")
end


function GL10:glLoadMatrixf(m, offset)
    error("abstract method glLoadMatrixf")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glLoadMatrixf(m)
    error("abstract method glLoadMatrixf")
end


function GL10:glLogicOp(opcode)
    error("abstract method glLogicOp")
end


function GL10:glMaterialf(face, pname, param)
    error("abstract method glMaterialf")
end


function GL10:glMaterialfv(face, pname, params, offset)
    error("abstract method glMaterialfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glMaterialfv(face, pname, params)
    error("abstract method glMaterialfv")
end


function GL10:glMatrixMode(mode)
    error("abstract method glMatrixMode")
end


function GL10:glMultMatrixf(m, offset)
    error("abstract method glMultMatrixf")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glMultMatrixf(m)
    error("abstract method glMultMatrixf")
end


function GL10:glMultiTexCoord4f(target, s, t, r, q)
    error("abstract method glMultiTexCoord4f")
end


function GL10:glNormal3f(nx, ny, nz)
    error("abstract method glNormal3f")
end


function GL10:glNormalPointer(type, stride, pointer)
    error("abstract method glNormalPointer")
end


function GL10:glOrthof(left, right, bottom, top, zNear, zFar)
    error("abstract method glOrthof")
end


function GL10:glPixelStorei(pname, param)
    error("abstract method glPixelStorei")
end


function GL10:glPointSize(size)
    error("abstract method glPointSize")
end


function GL10:glPolygonOffset(factor, units)
    error("abstract method glPolygonOffset")
end


function GL10:glPopMatrix()
    error("abstract method glPopMatrix")
end


function GL10:glPushMatrix()
    error("abstract method glPushMatrix")
end


function GL10:glReadPixels(x, y, width, height, format, type, pixels)
    error("abstract method glReadPixels")
end


function GL10:glRotatef(angle, x, y, z)
    error("abstract method glRotatef")
end


function GL10:glRotatex(angle, x, y, z)
    error("abstract method glRotatex")
end


function GL10:glSampleCoverage(value, invert)
    error("abstract method glSampleCoverage")
end


function GL10:glScalef(x, y, z)
    error("abstract method glScalef")
end


function GL10:glScalex(x, y, z)
    error("abstract method glScalex")
end


function GL10:glScissor(x, y, width, height)
    error("abstract method glScissor")
end


function GL10:glShadeModel(mode)
    error("abstract method glShadeModel")
end


function GL10:glStencilFunc(func, ref, mask)
    error("abstract method glStencilFunc")
end


function GL10:glStencilMask(mask)
    error("abstract method glStencilMask")
end


function GL10:glStencilOp(fail, zfail, zpass)
    error("abstract method glStencilOp")
end


function GL10:glTexCoordPointer(size, type, stride, pointer)
    error("abstract method glTexCoordPointer")
end


function GL10:glTexEnvf(target, pname, param)
    error("abstract method glTexEnvf")
end


function GL10:glTexEnvfv(target, pname, params, offset)
    error("abstract method glTexEnvfv")
end


-- Java overloaded method: Lua keeps the last definition
function GL10:glTexEnvfv(target, pname, params)
    error("abstract method glTexEnvfv")
end


function GL10:glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)
    error("abstract method glTexImage2D")
end


function GL10:glTexParameterf(target, pname, param)
    error("abstract method glTexParameterf")
end


function GL10:glTexParameteri(target, pname, param)
    error("abstract method glTexParameteri")
end


function GL10:glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)
    error("abstract method glTexSubImage2D")
end


function GL10:glTranslatef(x, y, z)
    error("abstract method glTranslatef")
end


function GL10:glVertexPointer(size, type, stride, pointer)
    error("abstract method glVertexPointer")
end


function GL10:glViewport(x, y, width, height)
    error("abstract method glViewport")
end


function GL10:glBegin(i)
    error("abstract method glBegin")
end


function GL10:glEnd()
    error("abstract method glEnd")
end


function GL10:glVertex3f(f, f2, f3)
    error("abstract method glVertex3f")
end


function GL10:glPolygonMode(i, i1)
    error("abstract method glPolygonMode")
end

GL10.GL_ADD = 260
GL10.GL_ALIASED_LINE_WIDTH_RANGE = 33902
GL10.GL_ALIASED_POINT_SIZE_RANGE = 33901
GL10.GL_ALPHA = 6406
GL10.GL_ALPHA_BITS = 3413
GL10.GL_ALPHA_TEST = 3008
GL10.GL_ALWAYS = 519
GL10.GL_AMBIENT = 4608
GL10.GL_AMBIENT_AND_DIFFUSE = 5634
GL10.GL_AND = 5377
GL10.GL_AND_INVERTED = 5380
GL10.GL_AND_REVERSE = 5378
GL10.GL_BACK = 1029
GL10.GL_BLEND = 3042
GL10.GL_BLUE_BITS = 3412
GL10.GL_BYTE = 5120
GL10.GL_CCW = 2305
GL10.GL_CLAMP_TO_EDGE = 33071
GL10.GL_CLEAR = 5376
GL10.GL_COLOR_ARRAY = 32886
GL10.GL_COLOR_BUFFER_BIT = 16384
GL10.GL_COLOR_LOGIC_OP = 3058
GL10.GL_COLOR_MATERIAL = 2903
GL10.GL_COMPRESSED_TEXTURE_FORMATS = 34467
GL10.GL_CONSTANT_ATTENUATION = 4615
GL10.GL_COPY = 5379
GL10.GL_COPY_INVERTED = 5388
GL10.GL_CULL_FACE = 2884
GL10.GL_CW = 2304
GL10.GL_DECAL = 8449
GL10.GL_DECR = 7683
GL10.GL_DEPTH_BITS = 3414
GL10.GL_DEPTH_BUFFER_BIT = 256
GL10.GL_DEPTH_TEST = 2929
GL10.GL_DIFFUSE = 4609
GL10.GL_DITHER = 3024
GL10.GL_DONT_CARE = 4352
GL10.GL_DST_ALPHA = 772
GL10.GL_DST_COLOR = 774
GL10.GL_EMISSION = 5632
GL10.GL_EQUAL = 514
GL10.GL_EQUIV = 5385
GL10.GL_EXP = 2048
GL10.GL_EXP2 = 2049
GL10.GL_EXTENSIONS = 7939
GL10.GL_FALSE = 0
GL10.GL_FASTEST = 4353
GL10.GL_FIXED = 5132
GL10.GL_FLAT = 7424
GL10.GL_FLOAT = 5126
GL10.GL_FOG = 2912
GL10.GL_FOG_COLOR = 2918
GL10.GL_FOG_DENSITY = 2914
GL10.GL_FOG_END = 2916
GL10.GL_FOG_HINT = 3156
GL10.GL_FOG_MODE = 2917
GL10.GL_FOG_START = 2915
GL10.GL_FRONT = 1028
GL10.GL_FRONT_AND_BACK = 1032
GL10.GL_GEQUAL = 518
GL10.GL_GREATER = 516
GL10.GL_GREEN_BITS = 3411
GL10.GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES = 35739
GL10.GL_IMPLEMENTATION_COLOR_READ_TYPE_OES = 35738
GL10.GL_INCR = 7682
GL10.GL_INVALID_ENUM = 1280
GL10.GL_INVALID_OPERATION = 1282
GL10.GL_INVALID_VALUE = 1281
GL10.GL_INVERT = 5386
GL10.GL_KEEP = 7680
GL10.GL_LEQUAL = 515
GL10.GL_LESS = 513
GL10.GL_LIGHT_MODEL_AMBIENT = 2899
GL10.GL_LIGHT_MODEL_TWO_SIDE = 2898
GL10.GL_LIGHT0 = 16384
GL10.GL_LIGHT1 = 16385
GL10.GL_LIGHT2 = 16386
GL10.GL_LIGHT3 = 16387
GL10.GL_LIGHT4 = 16388
GL10.GL_LIGHT5 = 16389
GL10.GL_LIGHT6 = 16390
GL10.GL_LIGHT7 = 16391
GL10.GL_LIGHTING = 2896
GL10.GL_LINE_LOOP = 2
GL10.GL_LINE_SMOOTH = 2848
GL10.GL_LINE_SMOOTH_HINT = 3154
GL10.GL_LINE_STRIP = 3
GL10.GL_LINEAR = 9729
GL10.GL_LINEAR_ATTENUATION = 4616
GL10.GL_LINEAR_MIPMAP_LINEAR = 9987
GL10.GL_LINEAR_MIPMAP_NEAREST = 9985
GL10.GL_LINES = 1
GL10.GL_LUMINANCE = 6409
GL10.GL_LUMINANCE_ALPHA = 6410
GL10.GL_MAX_ELEMENTS_INDICES = 33001
GL10.GL_MAX_ELEMENTS_VERTICES = 33000
GL10.GL_MAX_LIGHTS = 3377
GL10.GL_MAX_MODELVIEW_STACK_DEPTH = 3382
GL10.GL_MAX_PROJECTION_STACK_DEPTH = 3384
GL10.GL_MAX_TEXTURE_SIZE = 3379
GL10.GL_MAX_TEXTURE_STACK_DEPTH = 3385
GL10.GL_MAX_TEXTURE_UNITS = 34018
GL10.GL_MAX_VIEWPORT_DIMS = 3386
GL10.GL_MODELVIEW = 5888
GL10.GL_MODULATE = 8448
GL10.GL_MULTISAMPLE = 32925
GL10.GL_NAND = 5390
GL10.GL_NEAREST = 9728
GL10.GL_NEAREST_MIPMAP_LINEAR = 9986
GL10.GL_NEAREST_MIPMAP_NEAREST = 9984
GL10.GL_NEVER = 512
GL10.GL_NICEST = 4354
GL10.GL_NO_ERROR = 0
GL10.GL_NOOP = 5381
GL10.GL_NOR = 5384
GL10.GL_NORMAL_ARRAY = 32885
GL10.GL_NORMALIZE = 2977
GL10.GL_NOTEQUAL = 517
GL10.GL_NUM_COMPRESSED_TEXTURE_FORMATS = 34466
GL10.GL_ONE = 1
GL10.GL_ONE_MINUS_DST_ALPHA = 773
GL10.GL_ONE_MINUS_DST_COLOR = 775
GL10.GL_ONE_MINUS_SRC_ALPHA = 771
GL10.GL_ONE_MINUS_SRC_COLOR = 769
GL10.GL_OR = 5383
GL10.GL_OR_INVERTED = 5389
GL10.GL_OR_REVERSE = 5387
GL10.GL_OUT_OF_MEMORY = 1285
GL10.GL_PACK_ALIGNMENT = 3333
GL10.GL_PALETTE4_R5_G6_B5_OES = 35730
GL10.GL_PALETTE4_RGB5_A1_OES = 35732
GL10.GL_PALETTE4_RGB8_OES = 35728
GL10.GL_PALETTE4_RGBA4_OES = 35731
GL10.GL_PALETTE4_RGBA8_OES = 35729
GL10.GL_PALETTE8_R5_G6_B5_OES = 35735
GL10.GL_PALETTE8_RGB5_A1_OES = 35737
GL10.GL_PALETTE8_RGB8_OES = 35733
GL10.GL_PALETTE8_RGBA4_OES = 35736
GL10.GL_PALETTE8_RGBA8_OES = 35734
GL10.GL_PERSPECTIVE_CORRECTION_HINT = 3152
GL10.GL_POINT_SMOOTH = 2832
GL10.GL_POINT_SMOOTH_HINT = 3153
GL10.GL_POINTS = 0
GL10.GL_POINT_FADE_THRESHOLD_SIZE = 33064
GL10.GL_POINT_SIZE = 2833
GL10.GL_POLYGON_OFFSET_FILL = 32823
GL10.GL_POLYGON_SMOOTH_HINT = 3155
GL10.GL_POSITION = 4611
GL10.GL_PROJECTION = 5889
GL10.GL_QUADRATIC_ATTENUATION = 4617
GL10.GL_RED_BITS = 3410
GL10.GL_RENDERER = 7937
GL10.GL_REPEAT = 10497
GL10.GL_REPLACE = 7681
GL10.GL_RESCALE_NORMAL = 32826
GL10.GL_RGB = 6407
GL10.GL_RGBA = 6408
GL10.GL_SAMPLE_ALPHA_TO_COVERAGE = 32926
GL10.GL_SAMPLE_ALPHA_TO_ONE = 32927
GL10.GL_SAMPLE_COVERAGE = 32928
GL10.GL_SCISSOR_TEST = 3089
GL10.GL_SET = 5391
GL10.GL_SHININESS = 5633
GL10.GL_SHORT = 5122
GL10.GL_SMOOTH = 7425
GL10.GL_SMOOTH_LINE_WIDTH_RANGE = 2850
GL10.GL_SMOOTH_POINT_SIZE_RANGE = 2834
GL10.GL_SPECULAR = 4610
GL10.GL_SPOT_CUTOFF = 4614
GL10.GL_SPOT_DIRECTION = 4612
GL10.GL_SPOT_EXPONENT = 4613
GL10.GL_SRC_ALPHA = 770
GL10.GL_SRC_ALPHA_SATURATE = 776
GL10.GL_SRC_COLOR = 768
GL10.GL_STACK_OVERFLOW = 1283
GL10.GL_STACK_UNDERFLOW = 1284
GL10.GL_STENCIL_BITS = 3415
GL10.GL_STENCIL_BUFFER_BIT = 1024
GL10.GL_STENCIL_TEST = 2960
GL10.GL_SUBPIXEL_BITS = 3408
GL10.GL_TEXTURE = 5890
GL10.GL_TEXTURE_2D = 3553
GL10.GL_TEXTURE_COORD_ARRAY = 32888
GL10.GL_TEXTURE_ENV = 8960
GL10.GL_TEXTURE_ENV_COLOR = 8705
GL10.GL_TEXTURE_ENV_MODE = 8704
GL10.GL_TEXTURE_MAG_FILTER = 10240
GL10.GL_TEXTURE_MIN_FILTER = 10241
GL10.GL_TEXTURE_WRAP_S = 10242
GL10.GL_TEXTURE_WRAP_T = 10243
GL10.GL_TEXTURE0 = 33984
GL10.GL_TEXTURE1 = 33985
GL10.GL_TEXTURE2 = 33986
GL10.GL_TEXTURE3 = 33987
GL10.GL_TEXTURE4 = 33988
GL10.GL_TEXTURE5 = 33989
GL10.GL_TEXTURE6 = 33990
GL10.GL_TEXTURE7 = 33991
GL10.GL_TEXTURE8 = 33992
GL10.GL_TEXTURE9 = 33993
GL10.GL_TEXTURE10 = 33994
GL10.GL_TEXTURE11 = 33995
GL10.GL_TEXTURE12 = 33996
GL10.GL_TEXTURE13 = 33997
GL10.GL_TEXTURE14 = 33998
GL10.GL_TEXTURE15 = 33999
GL10.GL_TEXTURE16 = 34000
GL10.GL_TEXTURE17 = 34001
GL10.GL_TEXTURE18 = 34002
GL10.GL_TEXTURE19 = 34003
GL10.GL_TEXTURE20 = 34004
GL10.GL_TEXTURE21 = 34005
GL10.GL_TEXTURE22 = 34006
GL10.GL_TEXTURE23 = 34007
GL10.GL_TEXTURE24 = 34008
GL10.GL_TEXTURE25 = 34009
GL10.GL_TEXTURE26 = 34010
GL10.GL_TEXTURE27 = 34011
GL10.GL_TEXTURE28 = 34012
GL10.GL_TEXTURE29 = 34013
GL10.GL_TEXTURE30 = 34014
GL10.GL_TEXTURE31 = 34015
GL10.GL_TRIANGLE_FAN = 6
GL10.GL_TRIANGLE_STRIP = 5
GL10.GL_TRIANGLES = 4
GL10.GL_TRUE = 1
GL10.GL_UNPACK_ALIGNMENT = 3317
GL10.GL_UNSIGNED_BYTE = 5121
GL10.GL_UNSIGNED_SHORT = 5123
GL10.GL_UNSIGNED_SHORT_4_4_4_4 = 32819
GL10.GL_UNSIGNED_SHORT_5_5_5_1 = 32820
GL10.GL_UNSIGNED_SHORT_5_6_5 = 33635
GL10.GL_VENDOR = 7936
GL10.GL_VERSION = 7938
GL10.GL_VERTEX_ARRAY = 32884
GL10.GL_XOR = 5382
GL10.GL_ZERO = 0

return GL10

