# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN%-bin}"

inherit shell-completion

DESCRIPTION="Customization of kubernetes YAML configurations"
HOMEPAGE="https://github.com/kubernetes-sigs/kustomize"
SRC_URI="https://github.com/kubernetes-sigs/${MY_PN}/releases/download/${MY_PN}%2Fv${PV}/kustomize_v${PV}_linux_amd64.tar.gz"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/${MY_PN}"
QA_PRESTRIPPED="${QA_FLAGS_IGNORED}"

src_compile() {
	./${MY_PN} completion bash > bash-completion.sh
	./${MY_PN} completion zsh > zsh-completion.zsh
}

src_install() {
	dobin ${MY_PN}

	newbashcomp bash-completion.sh ${MY_PN}
	newzshcomp zsh-completion.zsh _${MY_PN}
}
