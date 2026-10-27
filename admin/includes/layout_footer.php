            </main>

            <!-- Modern Corporate Footer -->
            <footer class="admin-footer">
                <div class="footer-left d-flex align-items-center gap-2">
                    <img src="<?= base_url(e(ltrim($cmsLogo ?? 'assets/images/Logo_Four.png', '/'))) ?>" alt="<?= e($cmsCompanyName ?? 'Salam Properties') ?>" style="height:24px;width:auto;object-fit:contain;" onerror="this.src='<?= base_url('assets/images/Logo_Four.png') ?>'">
                    <span>© <?= date('Y') ?> <strong><?= e($cmsCompanyName ?? 'Salam Properties') ?></strong>. All rights reserved.</span>
                </div>
                <div class="footer-right">
                    <span class="text-muted">Enterprise Real Estate Management System v2.0</span>
                </div>
            </footer>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="<?= base_url('assets/vendor/bootstrap.bundle.min.js') ?>"></script>
    <script>
        // Sidebar Toggle for Mobile/Responsive
        const sidebarToggle = document.getElementById('sidebarToggle');
        const adminSidebar = document.getElementById('adminSidebar');
        if (sidebarToggle && adminSidebar) {
            sidebarToggle.addEventListener('click', () => {
                adminSidebar.classList.toggle('show');
            });
        }
    </script>
</body>
</html>
