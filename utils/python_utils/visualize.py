import os
from functools import partial
import open3d as o3d
import numpy as np
import sys
import click

COLOR_SOURCE = [0.0, 0.0, 1.0]
COLOR_TARGET = [0.0, 1.0, 0.0]
COLOR_FRAME = [1.0, 0.0, 0.0]
COLOR_MAP = [0.0, 0.0, 0.0]
COLOR_BACKGROUND = [1.0, 1.0, 1.0]
POINT_SIZE = 4.0


def read_point_cloud(filename):
    if ".bin" in filename:
        pts = np.fromfile(filename, dtype=np.float32)
        pts = pts.reshape((-1, 4))[:, :3]
        pcd = o3d.geometry.PointCloud(o3d.utility.Vector3dVector(pts))
        return pcd
    else:
        return o3d.io.read_point_cloud(filename)


class RegistrationVisualizer:
    def __init__(self):
        self.geometries = []
        self.vis = o3d.visualization.VisualizerWithKeyCallback()
        self.vis.create_window()
        self.render_options = self.vis.get_render_option()
        self.render_options.background_color = np.asarray(COLOR_BACKGROUND)
        self.render_options.point_size = POINT_SIZE
        self.view_control = self.vis.get_view_control()

        self.frame = o3d.geometry.PointCloud()
        # Initialize the default callbacks
        self._register_key_callbacks()
        self.init_viewpoint = True
        self.start_run = False

    def register_key_callback(self, key, callback):
        self.vis.register_key_callback(ord(str(key)), partial(callback))

    def _register_key_callbacks(self):
        self.register_key_callback("N", self.next_frame)
        self.register_key_callback("S", self.start)
        self.register_key_callback("Q", self.quit)

    def next_frame(self, vis):
        self.next_frame = True

    def start(self, vis):
        self.start_run = not self.start_run
        self.next_frame = self.start_run

    def quit(self, vis):
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)

    def update(self):
        reset_bounding_box = self.init_viewpoint and not self.geometries
        self.update_geometries()
        self.vis.clear_geometries()
        for geometry in self.geometries:
            self.vis.add_geometry(
                geometry, reset_bounding_box=reset_bounding_box)
        if reset_bounding_box:
            self.vis.reset_view_point(True)
            self.init_viewpoint = False
        self.vis.poll_events()
        self.vis.update_renderer()

    def update_geometries(self):
        self.geometries = []
        self.geometries.append(self.frame)

    def update_frame(self, points):
        self.frame = points
        self.update()

    def wait_for_user(self):
        while not self.next_frame:
            self.vis.poll_events()
            self.vis.update_renderer()
        if not self.start_run:
            self.next_frame = False


@click.command()
@click.option('-e', default='ply', help='file extension that you want to visualize')
def main(e):
    files = [x for x in os.listdir() if e in x]
    files.sort()
    visualizer = RegistrationVisualizer()
    for x in files:
        pcd = read_point_cloud(x)
        visualizer.update_frame(pcd)
        visualizer.wait_for_user()


if __name__ == '__main__':
    main()
