from puffergrid.grid_object cimport GridObjectId
from puffergrid.grid_env cimport GridEnv
from libcpp.string cimport string

ctypedef unsigned int ActionArg
cdef class ActionHandler:
    cdef GridEnv env
    cdef string _action_name

    cdef void init(self, GridEnv env)

    cdef bint handle_action(
        self,
        unsigned int actor_id,
        GridObjectId actor_object_id,
        ActionArg arg)

    cdef unsigned char max_arg(self)

    cpdef string action_name(self)
