-- Generated Code Do Not Modify
-- package javax.microedition.khronos.opengles

-- local Buffer = require("java.nio.Buffer")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local IntBuffer = require("java.nio.IntBuffer")
-- local ShortBuffer = require("java.nio.ShortBuffer")
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
local GL11Ext = {}
GL11Ext.__index = GL11Ext
GL11Ext.className = "GL11Ext"
setmetatable(GL11Ext, {__index = GL})


function GL11Ext:glTexParameterfv(target, pname, param, offset)
    error("abstract method glTexParameterfv")
end


function GL11Ext:glCurrentPaletteMatrixOES(matrixpaletteindex)
    error("abstract method glCurrentPaletteMatrixOES")
end


function GL11Ext:glDrawTexfOES(x, y, z, width, height)
    error("abstract method glDrawTexfOES")
end


function GL11Ext:glDrawTexfvOES(coords, offset)
    error("abstract method glDrawTexfvOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glDrawTexfvOES(coords)
    error("abstract method glDrawTexfvOES")
end


function GL11Ext:glDrawTexiOES(x, y, z, width, height)
    error("abstract method glDrawTexiOES")
end


function GL11Ext:glDrawTexivOES(coords, offset)
    error("abstract method glDrawTexivOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glDrawTexivOES(coords)
    error("abstract method glDrawTexivOES")
end


function GL11Ext:glDrawTexsOES(x, y, z, width, height)
    error("abstract method glDrawTexsOES")
end


function GL11Ext:glDrawTexsvOES(coords, offset)
    error("abstract method glDrawTexsvOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glDrawTexsvOES(coords)
    error("abstract method glDrawTexsvOES")
end


function GL11Ext:glDrawTexxOES(x, y, z, width, height)
    error("abstract method glDrawTexxOES")
end


function GL11Ext:glDrawTexxvOES(coords, offset)
    error("abstract method glDrawTexxvOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glDrawTexxvOES(coords)
    error("abstract method glDrawTexxvOES")
end


function GL11Ext:glEnable(cap)
    error("abstract method glEnable")
end


function GL11Ext:glEnableClientState(array)
    error("abstract method glEnableClientState")
end


function GL11Ext:glLoadPaletteFromModelViewMatrixOES()
    error("abstract method glLoadPaletteFromModelViewMatrixOES")
end


function GL11Ext:glMatrixIndexPointerOES(size, type, stride, pointer)
    error("abstract method glMatrixIndexPointerOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glMatrixIndexPointerOES(size, type, stride, offset)
    error("abstract method glMatrixIndexPointerOES")
end


function GL11Ext:glWeightPointerOES(size, type, stride, pointer)
    error("abstract method glWeightPointerOES")
end


-- Java overloaded method: Lua keeps the last definition
function GL11Ext:glWeightPointerOES(size, type, stride, offset)
    error("abstract method glWeightPointerOES")
end

GL11Ext.GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES = 35742
GL11Ext.GL_MATRIX_INDEX_ARRAY_OES = 34884
GL11Ext.GL_MATRIX_INDEX_ARRAY_POINTER_OES = 34889
GL11Ext.GL_MATRIX_INDEX_ARRAY_SIZE_OES = 34886
GL11Ext.GL_MATRIX_INDEX_ARRAY_STRIDE_OES = 34888
GL11Ext.GL_MATRIX_INDEX_ARRAY_TYPE_OES = 34887
GL11Ext.GL_MATRIX_PALETTE_OES = 34880
GL11Ext.GL_MAX_PALETTE_MATRICES_OES = 34882
GL11Ext.GL_MAX_VERTEX_UNITS_OES = 34468
GL11Ext.GL_TEXTURE_CROP_RECT_OES = 35741
GL11Ext.GL_WEIGHT_ARRAY_BUFFER_BINDING_OES = 34974
GL11Ext.GL_WEIGHT_ARRAY_OES = 34477
GL11Ext.GL_WEIGHT_ARRAY_POINTER_OES = 34476
GL11Ext.GL_WEIGHT_ARRAY_SIZE_OES = 34475
GL11Ext.GL_WEIGHT_ARRAY_STRIDE_OES = 34474
GL11Ext.GL_WEIGHT_ARRAY_TYPE_OES = 34473

return GL11Ext

