from libcpp.vector cimport vector
from libcpp.string cimport string
from puffergrid.grid_object cimport GridObject

import numpy as np
import gymnasium as gym

obs_np_type = np.uint8

cdef class ObservationEncoder:

    cdef init(self, unsigned int obs_width, unsigned int obs_height):
        self._obs_width = obs_width
        self._obs_height = obs_height

    cdef encode(self, const GridObject *obj, ObsType[:] obs):
        pass

    cdef vector[string] feature_names(self):
        return vector[string]()

    cpdef observation_space(self):
        type_info = np.iinfo(obs_np_type)

        return gym.spaces.Box(
                    low=type_info.min, high=type_info.max,
                    shape=(
                        len(self.feature_names()),
                        self._obs_height, self._obs_width),
            dtype=obs_np_type
        )
